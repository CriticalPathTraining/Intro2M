

let

  CustomersTable = 
    #table(type table [FirstName = text, LastName = text], {  
      { "Matt", "Masson" },
      { "Chris", "Webb" },
      { "Reza", "Rad" },
      { "Chuck", "Sterilicious"} 
    }
  )
in 
  CustomersTable

