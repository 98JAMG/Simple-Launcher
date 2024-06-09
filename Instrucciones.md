<< Grupo de Desarrollo Arma3 Cuba >>
Simple launcher by JAMG

+ parametros.ini >> configuracion de parametros
  - userName >> nombre de usuario
  
  - serverIP >> ip del servidor
  
  - serverPort >> puerto del servidor
  
  - serverPassword >> contraseña del servidor
  
  - modListMode >> modo en el que se le pasara el listado de mods al cliente
	=0 >> modo manual (los mods cargados mediante este modo deben estar dentro de la carpeta del cliente y en caso de usar otro modo de carga diferente a este los mods aqui especificados se agregaran al parametro -mod junto con los cargados en el modo seleccionado)  
	=1 >> modo preset (en este modo los mods deben estar dentro de la carpeta creada dentro de modPreset , leer instrucciones de modPreset)
	=2 >> modo manifiesto (en este modo deven crear un listado en un archivo .txt que contenga los nombres de los mods uno debajo del otro sin dejar espacios ni poner ; despues de estos , los mods deven coincidir con los que esten en la carpeta de mods)
  
  - modList >> listado de mods que se cargara cuando modListMode=0 y deben escribirse separados por ; todos menos el ultimo ejemplo: modList=@CBA;@ACE3;@RHSAFRF;@RHSUSAF
  
  - modPreset >> nombre de la carpeta donde estaran los mods que se cargaran cuando modListMode=1
  
  - modManifiest nombre del manifiesto.txt donde estara el listado de mods que se cargaran cuando modListMode=2
    -! en los modos de carga 1 y 2 tambien seran incluidos los mods establecidos en el parametro modList
  
  - exe >> nombre del ejecutable.exe del cliente
  
  - clientFolder >> ruta absoluta a la carpeta del cliente
  
  - modsFolder >> ruta absoluta a la carpeta de los mods
  
  - clientParams >> parametros del cliente
  
  - gameLogs >> crea un archivo de registro
    =0 desactivado >> no se crea el archivo de log
	=1 modo simple >> se crea un resumen de los parametros establecidos
	=2 modo extendido >> igual al modo 1 pero mas legible

------------------------------------------------------------------------------
                             STARTUP PARAMS
------------------------------------------------------------------------------
adapter           d3dNoMultiCB            maxVRAM            preprocDefine
autoinit          debug                   mod                port
autotest          debugClassExtension     name               posX
bandwidthAlg      disableServerThread     netlog             posY
bepath            doNothing               noCB               profiles
beta              enableHT                noFilePatching     ranking
buldozer          exThreads               noFreezeCheck      server
cfg               filePatching            noLand             serverMod
checkSignature    host                    noLogs             setupHost
client            hugepages               noPause            showScriptErrors
command           init                    noPauseAudio       skipIntro
config            ip                      noSound            unit
connect           language                noSplash           window
cpuCount          loadMissionToMemory     par                world
crashDiag         malloc                  password           worldCfg
d3dNoLock         maxMem                  pid