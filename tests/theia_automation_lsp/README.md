# Theia Automation
Automate functional tests running on Theia with Selenium Explorer in z/OS, Explorer for Endevor, and COBOL LSP.

#### Prerequisite:
- Windows Environment 
- Linux Environment 

#### Procedure:

1) Install Python3 x64

  	<code>http://python.org</code>

2) Install the virtualenv module

     Windows:
  	<code>C:\Python3_x64\Scripts\pip3.exe install virtualenv</code>

     Linux: 
        <code>pip3 install virtualenv</code>

3) Clone the repository

      Windows:
  	<code>C:\WORK>git clone https://github.com/eclipse/che-che4z-lsp-for-cobol.git</code>
      
      Linux:
        <code>$HOME/work$ git clone https://github.com/eclipse/che-che4z-lsp-for-cobol.git</code>

4) Create the virtual environment
         
      Windows:

    <code>cd C:\WORK\che-che4z-lsp-for-cobol\tests\theia_automation</code>

  	<code>C:\Python3_x64\python.exe -m virtualenv venv3_x64</code>

      Linux:

      <code>cd $HOME/work/che-che4z-lsp-for-cobol/tests/theia_automation</code>

      <code>python -m virtualenv venv3_x64</code>

5) Activate the virtual environment

      Windows:
  	<code>venv3_x64\Scripts\activate.bat</code>
      
      Linux: 
        <code>source venv3_x64/bin/activate</code>
	
6) Install the required Python modules
 
      Windows:
  	<code>venv3_x64\Scripts\pip3.exe install -r requirements.txt</code>
 
      Linux:
        <code>venv3_x64/bin/pip3 install -r requirements.txt</code>

  
7) Set PYTHONPATH
  
      Windows:
  	<code>set PYTHONPATH=C:\WORK\che-che4z-lsp-for-cobol\theia_automation</code>
	
      Linux:
        <code>export PYTHONPATH=$HOME/work/che-che4z-lsp-for-cobol/theia_automation</code>

8) (Optional) Set mainframe credentials:

* Modify project file inc\cfg\mf_credentials.py by filling it with your mainframe credentials.
* If you leave it as it is (with None as credential values), when you start the test you will be prompted for credentials with a dialog.

**Note**: If you need to run a test suite which doesn't require a mainframe connection, like LSP test suite for local COBOL files (see example below), mainframe credentials are not required.

9) Establish and Run the Theia environment

- Refer to https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md
    
- For Windows specific:

	- https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md#building-on-windows
	
10) Prepare the Theia environment for test suites

:information_source: **Note**:

- In order to run the LSP COBOL LOCAL test suite, open a workspace in Theia, and put the test COBOL files in the root folder of that opened workspace.
 
- The test COBOL files can be found in the test_files\cobol subdirectory of a project.

Basically run Theia <code>yarn start $HOME/work/theia-automation/test_files/cobol</code>

11) Run Robot tests

After Theia is established and running with the z/OS explorer plugin, run the following robot tests:

- To run all suites
  
  Windows:
	<code>venv3_x64\Scripts\python.exe -m robot --outputdir ..\robot_output --debugfile debug.txt robot_suites</code>
       
  Linux:
       <code>venv3_x64/bin/python3 -m robot --outputdir ../robot_output --debugfile debug.txt robot_suites</code>

* * *
:warning: **Warning**:

- The log and output xml file contain MF credential information. You might wish to remove this information before sharing your logs.

##### Procedure:

1) Run the robot framework with a slightly modified command:

Windows:
	
- <code>venv3_x64\Scripts\python.exe -m robot --removekeywords NAME:login.* --outputdir ..\robot_output --debugfile debug.txt robot_suites</code>

Linux:

- <code>venv3_x64/bin/python3 -m robot --removekeywords NAME:login.* --outputdir ../robot_output --debugfile debug.txt robot_suites</code>
	
The command will generate log and report without credential information, however xml output will still contain it.
	
2) To remove credential information from the xml file, after the test suite is completed, run:

Windows:
	
- <code>venv3_x64\Scripts\python.exe venv3_x64\Lib\site-packages\robot\rebot.py --removekeywords NAME:login.* --log ..\robot_output\log.html --report ..\robot_output\report.html --output ..\robot_output\output.xml</code>

Linux: 

- <code>venv3_x64/bin/python venv3_x64/lib/python3.8/site-packages/robot/rebot.py --removekeywords NAME:login.* --log ../robot_output/log.html --report ../robot_output/report.html --output ../robot_output/output.xml</code>

* Example procedure to run Robot tests for LSP Cobol local files

- To run the test in headless mode (not showing a browser) with Firefox engine:
    
Windows: 

<code>venv3_x64\Scripts\python.exe venv3_x64\Lib\site-packages\robot\run.py --variable HEADLESS:True -i Rally --outputdir ..\theia_robot_output --debugfile debug.txt robot_suites\lsp\local\firefox_lsp_local.robot</code>

Linux:

<code>venv3_x64/bin/python3 venv3_x64/bin/robot --variable HEADLESS:True -i Rally --outputdir ../theia_robot_output --debugfile debug.txt robot_suites/lsp/local/firefox_lsp_local.robot</code>

- If you want to see a browser, set the variable HEADLESS to False:
  
Windows:
  
<code>venv\Scripts\python.exe venv\Lib\site-packages\robot\run.py --variable HEADLESS:**False** -i Rally --outputdir ..\theia_robot_output --debugfile debug.txt robot_suites\lsp\local\firefox_lsp_local.robot</code>

Linux:

<code>venv3_x64/bin/python3 venv3_x64/bin/robot --variable HEADLESS:**False** -i Rally --outputdir ../theia_robot_output --debugfile debug.txt robot_suites/lsp/local/firefox_lsp_local.robot</code>

* * *

12) Deactivate the virtual environment

Windows:
<code>venv3_x64\Scripts\deactivate.bat</code>

Linux:
<code>deactivate</code>
