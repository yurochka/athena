libName = "libname"
lib = ddGetObj(libName)
newPROCESS = "newprocess"
cells = lib~>cells
foreach( cell cells
  foreach( view cell~>views
    when(
      cv=dbOpenCellViewByType(libName cell~>name view~>name "" "a")
      insts = cv ~> instances
      foreach( inst insts
        newMaster=dbOpenCellViewByType(newPROCESS inst~>cellName inst~>viewName)
        when(newMaster
          inst~>master=newMaster
          dbClose(newMaster)
        ) ;; when
      ) ;; foreach inst 
    ) ;; when
  ) ;; foreach view
) ;; foreach cell
