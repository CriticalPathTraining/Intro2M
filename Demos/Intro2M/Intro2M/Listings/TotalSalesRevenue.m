let

  Source = Sql.Database("ODYSSEUS", "WingtipSalesDB"),
    
  Invoices = Source{[Item="Invoices"]}[Data],
  
  FilteredRows = Table.SelectRows(Invoices, each [InvoiceDate] >= #datetime(2015, 1, 1, 0, 0, 0) and 
                                                 [InvoiceDate] <  #datetime(2016, 1, 1, 0, 0, 0)),

  RemovedOtherColumns = Table.SelectColumns(FilteredRows,{"InvoiceAmount"}),

  InvoiceAmountList = RemovedOtherColumns[InvoiceAmount],

  CalculatedSum = List.Sum(InvoiceAmountList)

in
  CalculatedSum