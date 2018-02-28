section MyGraph;


client_id = "983391cb-5879-4df5-bd59-26b1166fc20f";
client_secret = "mWdoXB0jr7Y+0/G1Hu1UblX1UDQLhWgHXMy7YX8caCY=";
redirect_uri = "https://preview.powerbi.com/views/oauthredirect.html";
token_uri = "https://login.microsoftonline.com/organizations/oauth2/v2.0/token";
authorize_uri = "https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize";
logout_uri = "https://login.microsoftonline.com/logout.srf";

windowWidth = 720;
windowHeight = 1024;

// See https://developer.microsoft.com/en-us/graph/docs/authorization/permission_scopes 
scope_prefix = "https://graph.microsoft.com/";
scopes = {
    "User.ReadWrite",
    "Contacts.Read",
    "User.ReadBasic.All",
    "Calendars.ReadWrite",
    "Mail.ReadWrite",
    "Mail.Send",
    "Contacts.ReadWrite",
    "Files.ReadWrite",
    "Tasks.ReadWrite",
    "People.Read",
    "Notes.ReadWrite.All",
    "Sites.Read.All"
};


[DataSource.Kind="MyGraph", Publish="MyGraph.Publish"]
shared MyGraph.ExecuteQuery = Value.ReplaceType(MyGraph.ExecuteQueryImpl, type function (url as Uri.Type) as any);

MyGraph.ExecuteQueryImpl = (url as text) =>
    let

      // create a record to define HTTP request headers
      RequestHeaders = [ Accept="application/json", 
                         #"OData-MaxVersion"="4.0"],      

      // create a second record which contains the first record
      OptionsRecord = [ Headers=RequestHeaders ],
      
      // pass the second record as parameter to Web.Contents
      Response = Web.Contents(url, OptionsRecord),

      source = Json.Document(Response)
        
    in
        source;


MyGraph = [
    Authentication = [
        OAuth = [
            StartLogin=StartLogin,
            FinishLogin=FinishLogin,
            Refresh=Refresh,
            Logout=Logout
        ]
    ],
    Label = "Custom Connector for the Microsoft Graph API"
];

MyGraph.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { "My MS Graph Data Connector", "Connect to the Microsoft Graph API" },
    SourceImage = MyGraph.Icons,
    SourceTypeImage = MyGraph.Icons
];

MyGraph.Icons = [
    Icon16 = { Extension.Contents("MyGraph16.png"), Extension.Contents("MyGraph20.png"), Extension.Contents("MyGraph24.png"), Extension.Contents("MyGraph32.png") },
    Icon32 = { Extension.Contents("MyGraph32.png"), Extension.Contents("MyGraph40.png"), Extension.Contents("MyGraph48.png"), Extension.Contents("MyGraph64.png") }
];

// build URL with query string for login to Azure AD
StartLogin = (resourceUrl, state, display) =>
    let
        authorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
            client_id = client_id,  
            redirect_uri = redirect_uri,
            state = state,
            scope = GetScopeString(scopes, scope_prefix),
            response_type = "code",
            response_mode = "query",
            login = "login"
        ])
    in
        [
            LoginUri = authorizeUrl,
            CallbackUri = redirect_uri,
            WindowHeight = 720,
            WindowWidth = 1024,
            Context = null
        ];

// prepare data to make HTTP call to obtain access token and refreh token

FinishLogin = (context, callbackUri, state) =>
    let
        // parse the full callbackUri, and extract the Query string
        parts = Uri.Parts(callbackUri)[Query],
        // if the query string contains an "error" field, raise an error
        // otherwise call TokenMethod to exchange our code for an access_token
        result = if (Record.HasFields(parts, {"error", "error_description"})) then 
                    error Error.Record(parts[error], parts[error_description], parts)
                 else
                    TokenMethod("authorization_code", "code", parts[code])
    in
        result;

// Called if access token has expired and a refresh_token is available.
Refresh = (resourceUrl, refresh_token) => TokenMethod("refresh_token", "refresh_token", refresh_token);

Logout = (token) => logout_uri;


// grantType:  Maps to the "grant_type" query parameter.
// tokenField: The name of the query parameter to pass in the code.
// code:       Is the actual code (authorization_code or refresh_token) to send to the service.
TokenMethod = (grantType, tokenField, code) =>
    let
        queryString = [
            client_id = client_id,
            client_secret = client_secret,
            scope = GetScopeString(scopes, scope_prefix),
            grant_type = grantType,
            redirect_uri = redirect_uri
        ],
        queryWithCode = Record.AddField(queryString, tokenField, code),

        tokenResponse = Web.Contents(token_uri, [
            Content = Text.ToBinary(Uri.BuildQueryString(queryWithCode)),
            Headers = [
                #"Content-type" = "application/x-www-form-urlencoded",
                #"Accept" = "application/json"
            ],
            ManualStatusHandling = {400} 
        ]),
        body = Json.Document(tokenResponse),
        result = if (Record.HasFields(body, {"error", "error_description"})) then 
                    error Error.Record(body[error], body[error_description], body)
                 else
                    body
    in
        result;

//
// Helper Functions
//
Value.IfNull = (a, b) => if a <> null then a else b;

GetScopeString = (scopes as list, optional scopePrefix as text) as text =>
    let
        prefix = Value.IfNull(scopePrefix, ""),
        addPrefix = List.Transform(scopes, each prefix & _),
        asText = Text.Combine(addPrefix, " ")
    in
        asText;
