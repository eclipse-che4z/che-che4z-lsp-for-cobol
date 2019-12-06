# Theia Automation
Automate functional tests running on theia with Selenium Explorer in ZOS, Explorer for Endevor, and COBOL LSP.

#### Prerequisite:
- Windows Environment

#### Procedure:

1) Install Python3 x64

  	<code>http://python.org</code>

2) Install virtualenv module

  	<code>C:\Python3_x64\Scripts\pip3.exe install virtualenv</code>

3) Clone repository

  	<code>C:\WORK>git clone git@github.gwd.broadcom.net:MFD/theia_automation.git</code>
  
4) Create virtual environment

  	<code>cd C:\WORK\theia_automation</code>

  	<code>C:\Python3_x64\python.exe -m virtualenv venv3_x64</code>
  
5) Activate virtual environment

  	<code>venv3_x64\Scripts\activate.bat</code>
  
6) Install required Python modules

  	<code>venv3_x64\Scripts\pip3.exe install -r requirements.txt</code>
  
7) Set PYTHONPATH
  
  	<code>set PYTHONPATH=C:\WORK\theia_automation</code>

8) Optional:
- Set Mainframe credentials:

If you need to run a test suite, which doesn't require Mainframe connection like LSP test suite for local COBOL files (see example below), you don't have to provide Mainframe credentials at all.

* Modify project file inc\cfg\mf_credentials.py by filling it with your mainframe credentials.
* If you leave it as it is (with None as credential values), during test start you will be prompted for credentials with a dialog.

9) Establish and Run Theia environment

- Refer to https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md
    
- For Windows specific:

	- https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md#building-on-windows
	
10) Prepare Theia environment for test suites

:warning: **Warning**:

- In order to run LSP COBOL LOCAL test suite, a workspace should be opened in Theia, and test Cobol files should be put in the root folder of that opened workspace.
- Test Cobol files can be found in test_files\cobol subdirectory of a project.

11) Run Robot tests

After Theia is established and running with zos explorer plugin, run the following robot tests:

- To run all suites
	- <code>venv3_x64\Scripts\python.exe -m robot --outputdir ..\robot_output --debugfile debug.txt robot_suites</code>
	
* * *
:information_source: **Note**:

- Your log and output xml file will contain MF credentials information! You may wish to remove this information before sharing your logs.

##### Procedure:

1) Run robot framework with a slightly modified command:
	
- <code>venv3_x64\Scripts\python.exe -m robot --removekeywords NAME:login.* --outputdir ..\robot_output --debugfile debug.txt robot_suites</code>
	
That will generate log and report without credential information, however xml output will still contain it.
	
2) To remove it from xml, after test suite is completed, run:
	
- <code>venv3_x64\Scripts\python.exe venv3_x64\Lib\site-packages\robot\rebot.py --removekeywords NAME:login.* --log ..\robot_output\log.html --report ..\robot_output\report.html --output ..\robot_output\output.xml ..\robot_output\output.xml</code>

* Example how to run Robot tests for LSP Cobol local files

- To run test in a headless mode (not showing a browser) with Firefox engine:
    
<code>venv\Scripts\python.exe venv\Lib\site-packages\robot\run.py --variable HEADLESS:True -i Rally --outputdir ..\theia_robot_output --debugfile debug.txt robot_suites\lsp\local\firefox_lsp_local.robot</code>

- If you want to see a browser, set variable HEADLESS to False:
    
<code>venv\Scripts\python.exe venv\Lib\site-packages\robot\run.py --variable HEADLESS:**False** -i Rally --outputdir ..\theia_robot_output --debugfile debug.txt robot_suites\lsp\local\firefox_lsp_local.robot</code>

* * *

12) Deactivate virtual environment

<code>venv3_x64\Scripts\deactivate.bat</code>
