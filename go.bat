:: PngCrush optimisation
FOR /r %~dp0 %%c in (*.png) DO (
	SET n="%%~pc%%~nc-min.png"
	%~dp0\utils\pngcrush.exe -brute "%%c" "%%n"
	
	IF %%~zn GTR %%~zc (
		:: new file has larger filesize than existing file so just delete it
		DEL "%%n"
	) ELSE (
		:: new file has smaller filesize than existing file delete existing file and rename new file to original name
		MOVE /y "%%n" "%%c"
	)
)

:: JpegTran optimisation
FOR /r %~dp0 %%c in (*.jpg) DO (
	SET n="%%~pc%%~nc-min.jpg"
	%~dp0\utils\jpegtran.exe -optimize "%%c" "%%n"
	
	IF %%~zn GTR %%~zc (
		:: new file has larger filesize than existing file so just delete it
		DEL "%%n"
	) ELSE (
		:: new file has smaller filesize than existing file delete existing file and rename new file to original name
		MOVE /y "%%n" "%%c"
	)
)