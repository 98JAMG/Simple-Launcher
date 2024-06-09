::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJG6L5kkjIBREcCWwEUrpMpozxNvHxumIrF4hR/Y+apvk3bWDJa4a6UqE
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRmj0GNjCyR+bSmlXA==
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHF3SajnuSOVEuLGb
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbDLqUOdIprijv7Pn
::ZQ05rAF9IAHYFVzEqQIRe1tnWAWQKEy7C7B8
::eg0/rx1wNQPfEVWB+kM9LVsJDCXRfFiuB6cIz+n26oo=
::fBEirQZwNQPfEVWB+kM9LVsJDCXRfFiuB6cIz+n26oo=
::cRolqwZ3JBvQF1fEqQIRe1tnWAWQKEy7C7Bc6vG7xcuqhS0=
::dhA7uBVwLU+EWH6W4VI/aB9RDCCHL2qoFLoQ5Oe7zviKox5dd/c9ee8=
::YQ03rBFzNR3SWATE02YRezg0
::dhAmsQZ3MwfNWATE1BBgek8UaxaXLGT6ArBczO3o7viVrUERW6IeaoLaifStNeISig==
::ZQ0/vhVqMQ3MEVWAtB9weVUEAlTbbD3oUvtMsLiijw==
::Zg8zqx1/OA3MEVWAtB9weVUEAlTbbD3oUvtMsLiijw==
::dhA7pRFwIByZRRmJ9UY1aBJaDCeXPmra
::Zh4grVQjdCuDJG6L5kkjIBREcCWwEUrpMpozxNvHzPiGoUYOaONsRIzX07GANNw0zmS3VqkB129Um8MJHidrahO5eig1pGsMs3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
SetLocal EnableDelayedExpansion

title "Simple Launcher by JAMG"
@rem v1.0.090624.0809

:default_vars
SET paramsFile=parametros.ini
SET launcherPATH=%~dp0
SET steamEmu=na

:leyendo_parametros
FOR /f "delims=" %%a in (%paramsFile%) DO (
    SET linea=%%a
    IF "!linea:~0,1!"=="[" (
        endlocal
    ) ELSE (
        FOR /f "tokens=1,2 delims==" %%b in ("!linea!") DO (
            SET nombre=%%b
            SET valor=%%c
            SET !nombre!=!valor!
        )
    )
)

:comprobaciones
IF "%clientFolder%" EQU "" (
    msg %username% "no se a definido la ruta de la carpeta de Arma3"
    EXIT
)
IF "%userName%" EQU "" (
    SET userName=%username%
    msg %username% "No hay un nombre de usuario definido. Se establecio el nombre de usuario como %username%"
)
IF %modListMode% EQU "" (
    SET modListMode=0
    msg %username% "modListMode no esta definido y se a establecido en 0"
)
IF "%launcherLogs%" EQU "" (
    SET launcherLogs=0
)
IF not exist %clientFolder% (
    msg %username% "no se encontro %clientFolder%"
    EXIT
)
IF not exist %clientFolder%\arma3_x64.exe (
    msg %username% "no se encontro arma3_x64.exe en %clientFolder%"
    EXIT
)

IF exist %clientFolder%\steam_settings (
:comprobando_nombre_de_usuario
    FOR /f "tokens=*" %%a IN (%clientFolder%\steam_settings\settings/account_name.txt) DO (
        IF %%a==%userName% (
            GOTO comprobando_idioma_de_steam
        ) ELSE (
            CD "%clientFolder%\steam_settings\settings"
            echo %userName%> account_name.txt
            CD "%launcherPATH%"
        )
    )
:comprobando_idioma_de_steam
    FOR /f "tokens=*" %%a IN (%clientFolder%\steam_settings\settings/language.txt) DO (
        IF %%a==spanish (
            GOTO automatizacion_de_la_lista_de_mods_por_carpetas
        ) ELSE (
            CD "%clientFolder%\steam_settings\settings"
            echo spanish> language.txt
            CD "%launcherPATH%"
        )
    )
    SET steamEmu=si
) ELSE (
    SET steamEmu=no
)

:automatizacion_de_la_lista_de_mods_por_carpetas
IF %modListMode%==1 (
	IF "%modPreset%" EQU "" (
		msg %username% "modListMode=1 esta habilitado y modPreset no esta definido. Establezca ( modPreset=nombre de la carpeta dentro de %launcherPATH%\modPreset donde se encuentran los mods que van a ser cargados )"
		EXIT
	)
    IF "%modsFolder%" EQU "" (
		msg %username% "modListMode=1 esta habilitado y modsFolder no esta definido. Establezca ( modsFolder=ruta absoluta a la carpeta de mods )"
		EXIT
	)
    IF not exist %modsFolder% (
        msg %username% "No se encontro %modsFolder%"
		EXIT
    )
    :creando_listado_automatico_de_mods_por_carpetas
    IF not exist %launcherPATH%modPreset (
        mkdir modPreset
    )
    FOR /f "delims=" %%a IN ('dir /ad /b %launcherPATH%modPreset\%modPreset%') DO (
        SET ruta=%launcherPATH%modPreset\%modPreset%\%%a
        IF not defined modList (
            SET modList=!ruta!
        ) ELSE (
            SET modList=!modList!;!ruta!
        )
    )
)

:automatizacion_de_la_lista_de_mods_por_manifiesto
IF %modListMode%==2 (
    IF "%modManifiest%" EQU "" (
	    msg %username% "modListMode=2 esta habilitado y modManifiest no esta definido. Establezca ( modManifiest=nombre de archivo.txt donde se encuentra el listado de mods a ser cargados )"
		EXIT
	)
    IF not exist %launcherPATH%Manifiestos\%modManifiest%.txt (
        msg %username% "modListMode=2 pero no se encontro %modManifiest%.txt dentro de la carpeta de manifiestos"
        GOTO iniciando_exe
    )
    :creando_listado_automatico_de_mods_por_listado.txt
    IF not exist %launcherPATH%Manifiestos (
        mkdir Manifiestos
    )
    FOR /f "tokens=*" %%a IN (%launcherPATH%Manifiestos/%modManifiest%.txt) DO (
        SET modPATH=%modsFolder%\%%a
        IF not defined modList (
            SET modList=!modPATH!
        ) ELSE (
            SET modList=!modList!;!modPATH!
        )
    )
)

:iniciando_exe
start %clientFolder%\arma3_x64.exe -name=%username% -port=%serverPort% -connect=%serverIP% -password=%serverPassword% %clientParams% "-mod=%modList%"

:logs
IF %launcherLogs%==1 (
    IF not exist Logs (
        mkdir Logs
    )
    CD "%launcherPATH%Logs"
    echo ==========================[%DATE% %TIME%]==============================>> simple_launcher.log
    echo == CLIENTPATH   %clientFolder%\arma3_x64.exe>> simple_launcher.log
    echo == LAUNCHERPATH %launcherPATH%StartGame.exe>> simple_launcher.log
    echo == start arma3_x64.exe -name=%username% -port=%serverPort% -connect=%serverIP% -password=%serverPassword% %clientParams% -mod=%modList%>> simple_launcher.log
    echo == modListMode=%modListMode%  modPreset=%modPreset%  modManifiest=%modManifiest% GoldbergSteamEmulator=%steamEmu%>> simple_launcher.log
    echo.>> simple_launcher.log
)
IF %launcherLogs%==2 (
    IF not exist Logs (
        mkdir Logs
    )
    CD "%launcherPATH%Logs"
    echo ==========================[%DATE% %TIME%]==============================>> simple_launcher.log
    echo == CLIENTPATH   %clientFolder%\arma3_x64.exe>> simple_launcher.log
    echo == LAUNCHERPATH %launcherPATH%StartGame.exe>> simple_launcher.log
    echo == PARAMS       -name=%username% -port=%serverPort% -connect=%serverIP% -password=%serverPassword%>> simple_launcher.log
    echo == CLIENTPARAMS %clientParams%>> simple_launcher.log
	echo == modListMode=%modListMode%  modPreset=%modPreset%  modManifiest=%modManifiest% GoldbergSteamEmulator=%steamEmu%>> simple_launcher.log
    echo == MODS         %modList%>> simple_launcher.log
    echo ================================================================================>> simple_launcher.log
    echo.>> simple_launcher.log
)
EXIT