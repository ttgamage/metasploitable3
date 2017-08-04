copy /Y /V C:\vagrant\resources\webgoat\WebGoat.jar C:\WebGoat.jar 
schtasks /Create /TN WebGoat /TR "\"C:\Program Files\Java\jdk1.8.0_141\bin\javaw.exe\" -jar C:\WebGoat.jar -httpPort=9090" /RU SYSTEM /SC ONSTART 
schtasks /Run /TN "WebGoat" /I
