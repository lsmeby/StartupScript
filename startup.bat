@ECHO off

CHOICE /T 10 /C yYnN /CS /D y /M "Starting default programs in 10 seconds. Press 'y' to start them immediately, or 'n' to cancel."

IF ERRORLEVEL 4 GOTO cancel
IF ERRORLEVEL 3 GOTO cancel
IF ERRORLEVEL 2 GOTO run
IF ERRORLEVEL 1 GOTO run

:run

FOR %%f IN (.\*) DO (
	IF NOT %%f == .\%~nx0 (
		ECHO Starting %%f...
		START "" "%%f"
	)
)

GOTO end

:cancel

ECHO Cancelling program

:end

EXIT
