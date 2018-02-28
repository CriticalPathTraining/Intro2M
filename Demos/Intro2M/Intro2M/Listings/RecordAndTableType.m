

let

  CustomerRecordType = type [FirstName = text, LastName = text],
  
  CustomerTableType = type table CustomerRecordType,

  CustomersTable = 
    #table(CustomerTableType, {  
      { "Matt", "Masson" },
      { "Chris", "Webb" },
      { "Reza", "Rad" },
      { "Chuck", "Sterilicious"} 
    }
  )
in 
  CustomersTable





