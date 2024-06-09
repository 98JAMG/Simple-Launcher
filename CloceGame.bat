::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJG6L5kkjIBREcCWwEUrpMpozxNvHxumIrF4hV+4wa4rk3bWDJa4a6UqE
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
::cxY6rQJ7JhzQF1fEqQJhZksaHFLSaTnuSOREvLCb
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbD3qU+dIprmju7Ln
::ZQ05rAF9IAHYFVzEqQIRe1t3QAuROUy7C7B8
::eg0/rx1wNQPfEVWB+kM9LVsJDCXRfEi2CaYZz+n26oo=
::fBEirQZwNQPfEVWB+kM9LVsJDCXRfEi2CaYZqM/64u/n
::cRolqwZ3JBvQF1fEqQIRe1t3QAuROUy7C7Bc6vG7xcuqhS0=
::dhA7uBVwLU+EWH6W4VI/aB9RDCCHL2qoFLoQ5Oe7zviKox5dd/c9ee8=
::YQ03rBFzNR3SWATE02YRezg0
::dhAmsQZ3MwfNWATE1BBgek8UaxaXLGT6ArBczO3o7viVrUERW6IeaoLaifStNeISig==
::ZQ0/vhVqMQ3MEVWAtB9weVUEAlTUbD7oUvtNsLyjjw==
::Zg8zqx1/OA3MEVWAtB9weVUEAlTUbD7oUvtNsLyjjw==
::dhA7pRFwIByZRRmJ9UY1aBJaDCeXPmra
::Zh4grVQjdCuDJG6L5kkjIBREcCWwEUrpMpozxNvHzPiGoUYOaONsRIzX07GANNw0zmS3VqkB129Um8MJHid7ch24ayg1pGsMs3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
SetLocal EnableDelayedExpansion
:llamando_exe
SET paramsFile=parametros.ini
SET armaPATH=clientFolder
FOR /f "tokens=1,2 delims==" %%a in ('type %paramsFile%^| findstr /i /b /c:"%armaPATH%"') do (
    SET arma3Folder=%%b
)
:comprobando_exe
cd "%arma3Folder%"
IF not exist arma3_x64.exe (
    msg %username% "no se encontro %arma3Folder%\arma3_x64.exe"
    EXIT
)
:comprobando_proceso
tasklist | findstr /i "arma3_x64.exe" >nul
IF %errorlevel% EQU 0 (
    :matando_proceso
    taskkill.exe /F /T /IM arma3_x64.exe
) ELSE (
    msg %username% "arma3_x64.exe no se esta ejecutando"
    EXIT
)