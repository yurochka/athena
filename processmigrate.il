libName = "libname"
lib = ddGetObj(libName)
oldProcess = "oldprocess"
newProcess = "newprocess"
cells = lib~>cells
foreach( cell cells
  foreach( view cell~>views
    when( cv = dbOpenCellViewByType(libName cell~>name view~>name "" "a")
      insts = cv ~> instances
      foreach( inst insts
        when( (inst~>libName==oldProcess)
          newMaster = dbOpenCellViewByType(newProcess inst~>cellName inst~>viewName)
          when( newMaster
            inst~>master = newMaster
            dbClose(newMaster)
          ) ;; when
        ) ;; when
      ) ;; foreach inst 
    ) ;; when
  ) ;; foreach view
) ;; foreach cell
