

let
    // create REST URI for OData source
    Source = "http://subliminalsystems.com/api/Customers?" & 
              "?$select=CustomerId,FirstName,LastName,City,State,Zipcode,Gender,BirthDate" & 
              "&filter=(CustomerId+le+10)",
    
    // create options record for calling Web.Contents
    OptionsRecord =  [Headers=[Accept="application/json;odata=nometadata",
                               #"OData-MaxVersion"="4.0"]],   

    // call Web.Content to make call across network
    WebContents = Web.Contents(Source, OptionsRecord),
    
    // deal with JSON dataset return by Web.Contents
    JsonDocument = Json.Document(WebContents),
    RecordList = Record.ToTable(JsonDocument){1}[Value],
    Table = Table.FromList(RecordList, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    ColumnsToExpand = {"CustomerId", "FirstName", "LastName", "City", "State", "Zipcode", "Gender", "BirthDate"},
    ExpandedColumns = Table.ExpandRecordColumn(Table, "Column1", ColumnsToExpand, ColumnsToExpand),
    ParsedDate = Table.TransformColumns(ExpandedColumns,{{"BirthDate", each Date.From(DateTimeZone.From(_)), type date}}),
    ChangedType = Table.TransformColumnTypes(ParsedDate,{
                        {"CustomerId", Int64.Type}, {"Gender", type text}, {"Zipcode", type text}, {"State", type text}, 
                        {"City", type text}, {"LastName", type text}, {"FirstName", type text}})

in     
  ChangedType 