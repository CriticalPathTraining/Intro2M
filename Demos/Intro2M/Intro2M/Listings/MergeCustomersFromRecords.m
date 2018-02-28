let

  CustomerTableType = type table [FirstName = text, LastName = text],
  
  CustomerTableStarter = #table(CustomerTableType, {}),

  CustomerData = Table.FromRecords({
    [ FirstName="Matt", LastName="Masson"],
    [ FirstName="Chris", LastName="Webb"],
    [ FirstName="Reza", LastName="Rad"],
    [ FirstName="Chuck", LastName="Sterling"]
  }),

 
  CustomerTable = Table.Combine({CustomerTableStarter, CustomerData})

in 
  CustomerTable