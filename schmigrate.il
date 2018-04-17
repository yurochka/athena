libName = "libname"
lib = ddGetObj(libName)
newProcess = "newprocess"
cells = lib~>cells
foreach( cell cells
  foreach( view cell~>views
    when( (substring(view~>name 1 9)=="schematic")
      cv = dbOpenCellViewByType(libName cell~>name view~>name "" "a")
      insts = cv ~> instances
      foreach( inst insts
        newMaster = dbOpenCellViewByType(newProcess inst~>cellName inst~>viewName)
        when( newMaster
          inst~>master = newMaster
          dbClose(newMaster)
        ) ;; when
      ) ;; foreach inst 
    ) ;; when
  ) ;; foreach view
) ;; foreach cell
