# LSP-COBOL #
COBOL service implementing Language Server Protocol

## Project Installation ##

#Error - Lombok dependency could not be solved
* Step 1: Pull the project from GitHub and open it in Eclipse IDE.
* Step 2: In order to fix all the errors regarding Lombok Dependency, go to your folder .m2/repository/org/projectlombok/lombok/1.xx.xx open a cmd and run next command "java -jar lombok-1.xx.xx.jar" (xx is your lombok version)
* Step 3: In the lombok window, press update/install, wait few seconds and close the window.
* Step 4: Go to your Eclipse IDE, restart it.
* Step 5: Update Maven.

## Build project ##

```mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify test-compile```

## Enable socket/pipe communication ##
Our LSP can be spawned using two different byte stream protocols:
- web socket
- named pipes

By default LSP is working with web socket but is possible enable the pipe mode just using the JVM property -DenablePipe=true
Example:
`java -jar -DenablePipe=true <LSP_FAT_JAR_LOCATION>`

