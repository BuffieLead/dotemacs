@ECHO off
::
:: PlantUML Execute
:: 

set PLANTUML_PATH=C:\usr\share\plantuml
SET GRAPHVIZ_DOT=C:\usr\share\Graphviz\2.38\bin\dot.exe
set PATH=C:\usr\share\java\bin;%PLANTUML_PATH%

SET CONFIG_FILE="%PLANTUML_PATH%\config.txt"
SET PLANTUML_JAR="%PLANTUML_PATH%\plantuml.jar"

java -jar %PLANTUML_JAR% -Djava. -config %CONFIG_FILE% -charset UTF-8 %*



