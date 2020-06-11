# Copyright (c) 2020 Broadcom.
# The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Broadcom, Inc. - initial API and implementation

*** Settings ***
Documentation    Test suite for Firefox
Library          lib.zos_firefox_engine.ZosFireFoxEngine
Variables        inc/theia/constants.py
Variables        inc/theia/che_constants.py
Variables        inc/theia/zos_constants.py
Variables        inc/theia/config.py
Variables        inc/theia/lsp_constants.py
Library          keywords.general
Library          keywords.monako_editor_wrappers
Library          inc.theia.ui.UI
Resource         keywords/monako.robot
Resource         keywords/login.robot

Suite Setup      SuiteInit
Suite Teardown   SuiteExit
Test Setup       StartTestCase
Test Teardown    StopTestCase

*** Variables ***
${Cobol File 1}  USER1
${Cobol File 2}  USER2

${Definition Str}     100-Print-User.
${Definition Occur}   29
${Definition Defined}   32

${References Num}  3
${Reference Text}  User-Address.
${Reference 0}    01 User-Address.
${Ref Line 0}     21
${Reference 1}    \ \ \ \ \ \ \ \ \ \ \ Move 'Wenceslav Square 846/1' To User-Address.
${Ref Line 1}     35
${Reference 2}    Display "User-Address\ \ :\ "\ User-Address
${Ref Line 2}     43

${Error Line Number}    15
${Error Hint}     Syntax error on 'Program1-id' expected PROGRAM_IDCOBOL Language Support - E

${Semantic Error Line}   40
${Semantic Hint}    Invalid definition for: USER-CITY1COBOL Language Support - I

${Line With Spaces}    35
${Space Hint}   The line doesn't match the fixed formatCOBOL Language Support - E

${Snippet Line}   41
${Snippet}   ADD id TO id
${Snippet Value 1}   1
${Snippet Value 2}   Str
${Snippet Filled}   ADD 1 TO Str

${Cobol with Copybook Nominal 1}  USERC1N1
${Cobol with Copybook Nominal 2}  USERC1N2
${Cobol with Copybook NotFound}  USERC1F
${Cobol with Copybook Recursive}  USERC1R
${Cobol with Copybook Recursive}  USERC1R

${Copybook Nominal 1}  BOOK1N
${Copybook Nominal 2}  BOOK2N
${Copybook Recursive 1}  BOOK1R
${Copybook Recursive 2}  BOOK2R
${Copybook Missing}  BOOK3
${Copybook Missing Src}  BOOK3T

@{Copybook Missing Src Path}  ${COPYBOOK_FOLDER}  ${ZOWE_PROFILE}  ${CPY_DIR_2}  ${Copybook Missing Src}.cpy
@{Copybook Missing Path}  ${COPYBOOK_FOLDER}  ${ZOWE_PROFILE}  ${CPY_DIR_2}  ${Copybook Missing}.cpy

${Copy Line 1}  19
${Copy Line 2}  20

${References Line 1}  42
${References Line 2}  51
${Invalid Definition Line}  52
${Copybook Reference 1}  6
${Copy References Num}  3

${Copybook Referense Str 1}  User-Phone-Mobile.
${Copybook Link Str 1}  User-Phone-Mobile
${Copy Reference Line 1}  Move 777987654 To User-Phone-Mobile.
${Copy Reference Line 2}  Display "User-Phone-M\ \ : " User-Phone-Mobile.
${Copybook Definition Str 1}  05 User-Phone-Mobile PIC 9(6).
${Copybook Definition Defined 1}  6

${Copybook Not Found Hint}  BOOK3: Copybook not foundCOBOL Language Support - E(MISSING_COPYBOOK)
${Copybook Recursive Error Hint}  Recursive copybook declaration for: BOOK1RCOBOL Language Support - E
${Copybook Semantic Hint}  Invalid definition for: USER-PHONE-MOBILE1COBOL Language Support - I


*** Keywords ***
SuiteInit
    Set Log Level  TRACE
    Log  Init

    Set Url    ${THEIA_URL}
    ${URL} =  Get Url
    Set Suite Variable  ${URL}
    Log   Url: ${URL}

    Set Mode  ${HEADLESS}
    ${HEADLESS} =  Get Mode
    Set Suite Variable  ${HEADLESS}
    Log  Heasless: ${HEADLESS}

    CheShare  &{CHE_CREDENTIALS}
    ${CREDENTIALS} =  CheRequest  ${CHE_CREDENTIALS}[password]

    Log  ${CREDENTIALS}

    ${CHE_CREDENTIALS} =  CheUpdate  ${CREDENTIALS}
    CheShare  &{CHE_CREDENTIALS}

    ${SELF} =  Get Me
    Set Suite Variable  ${SELF}

    Prepare Dump Engine

SuiteExit
    Log  Exit
    Final Clean

StartTestCase
    Start Engine   ${HEADLESS}
    Get Content

    ${Title} =  Get Title
    Log  ${Title}
    ${Login Required} =  Wait For Login Form If Any

    Log  ${CHE_CREDENTIALS}

    Run Keyword If  ${Login Required} is True  Login To CHE  ${CHE_CREDENTIALS}
    Run Keyword If  ${Login Required} is True  Wait For Workspace Is Running

    ${Title} =  Get Title
    Log  ${Title}

    Wait For Theia Loaded

    # Below line is a workaround of theia bug when it asked to load setting json file
    Close Dialog

    ${LEFT BAR} =  Get Left Menu Bar Locator
    ${condition} =  Create Condition When Element Shoud Be Clickable     ${LEFT BAR}
    Wait for ${DEFAULT_TIMEOUT} until ${condition}

    Show File Explorer
    ${Editor} =  Get Editor

    Run Keyword If  ${Login Required} is True  Wait For Tab With Title  ${Editor}  Eclipse Che

    Delete Copybook File

StopTestCase
    Delete Copybook File
    Stop Engine

Delete Copybook File
    ${Explorer Title Node} =  Find File Explorer Panel
    Navigate All the Way Up
    ${File Node} =  Navigate To Element Path  ${Copybook Missing Path}  ${False}
    ${IS_DIR} =  Is Directory  ${File Node}
    Run Keyword If  ${IS_DIR} is ${False}   Delete File Macro   ${Copybook Missing Path}

Open Member Macro
    [Arguments]   ${Node}  ${Member}
#    Right Click   ${Node}   ${Member}  ${False}
#    Invoke Context Menu Item   Open
    Click Me  ${Node}  ${Member}

Copy File Node
    [Arguments]  ${File Node}  ${File Name}

    Click Me   ${File Node}   ${File Name}

    ${Editor} =  Get Editor
    ${Tab} =  Wait For Tab With Title  ${Editor}  ${File Name}

    ${Active Editor} =  Get Active Editor  ${Editor}
    Focus In  ${Editor}  ${Active Editor}

    Select All
    Copy To Clipboard
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Create/Paste File
    [Arguments]  ${File Name}  ${Directory Node}
    Right Click Me   ${Directory Node}
    Sleep  1
    Invoke Context Menu Item  New File

    Enter In Dialog   ${File Name}   New File
    ${Editor} =  Get Editor
    ${Tab} =  Wait For Tab With Title  ${Editor}  ${File Name}
    ${Active Editor} =  Get Active Editor  ${Editor}
    Focus In  ${Editor}  ${Active Editor}
    Paste From Clipboard
    Save File
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Copy File Macro
    [Arguments]  ${Source File Path}   ${Target Directory Path}  ${Target File Name}

    ${Copy Element Node} =  Navigate To Element Path  ${Source File Path}  ${True}
    Copy File Node  ${Copy Element Node}  @{Source File Path}[-1]
    ${Target Directory Node} =  Navigate To Element Path  ${Target Directory Path}  ${False}
    Create/Paste File  ${Target File Name}  ${Target Directory Node}

Delete File Macro
    [Arguments]   ${File Path}  ${Is File Exist}=${True}

    ${Explorer Title Node} =  Find File Explorer Panel

    Navigate All the Way Up
    ${File Node} =  Navigate To Element Path  ${File Path}  ${Is File Exist}

    Right Click Me   ${File Node}   ${File Path}[-1]
    Sleep  1
    Invoke Context Menu Item  Delete

    Answer Ok To Dialog  Delete File

Modify User Preferences With Datasets and Zowe Profile Macro
    # Damn, this doen't work in Headless Mode!
    Open Preferences

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  Preferences
    Wait For Sub Tab With Title   ${Editor}  User

    Focus In User Preferences  ${Editor}

    Clear Clipboard

    Select All
    Copy To Clipboard

    Sleep  2

    ${User Settings} =  Get From Clipboard
    Log  ${User Settings}

    ${New User Settings} =  Modify User Preferences  ${User Settings}  ${USER_COPYBOOK_PREFERENCES}

    Log  ${New User Settings}

    Get To Clipboard  ${New User Settings}
    Focus In User Preferences  ${Editor}
    Select All
    Paste From Clipboard
    Save File

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Navigate To Element Path
    [Arguments]  ${Element Path}  ${Is File Exist}=${True}

    ${File Explorer} =  Find File Explorer Panel
    ${From Element} =  Set Variable  ${File Explorer}
    ${Element} =  Set Variable  ${None}

    ${Last Element} =  Set Variable  ${Element Path}[-1]
    Log  ${Last Element}

    FOR  ${subpath}  IN  @{Element Path}
       Log  ${subpath}
       Exit For Loop If  '${subpath}' == '${Last Element}'
       ${Element} =  Inside File Explorer Navigate Down To ${subpath} From ${From Element}
       ${IS_DIR} =  Is Directory  ${Element}
       Exit For Loop If  ${IS_DIR} == ${FALSE}
       Expand Directory Node  ${Element}
       ${From Element} =  Set Variable  ${Element}
    END

    Return From Keyword If  ${Is File Exist} == ${False}  ${Element}

    ${Element Node} =  Inside File Explorer Navigate Down To ${subpath} From ${From Element}
    Return From Keyword  ${Element Node}


*** Test Cases ***
TC152046 Nominal - check syntax Ok message
    [Tags]  TC152046  COBOL_LOCAL  LSP  FireFox  Rally  NEED_UPDATE
    [Documentation]  Checks that when opening Cobol file with correct syntax there is an appropriate message is shown
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Message} =  Get Syntax Ok Message For ${Cobol File 1}
    Close Notification Message  ${Message}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152048 Cobol file is recognized by LSP
    [Tags]  TC152048  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Cobol file is recognized by LSP - Cobol type is shown in status bar
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}
    Focus In  ${Editor}  ${Active Editor}

    See COBOL In Statusbar

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152049 Navigate through definitions
    [Tags]  TC152049  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Check behavior of go to definition action
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Definition Occur}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Definition Occur}   ${Definition Str}  ${Active Editor}
    Right Click   ${Element}
    Sleep  1
    Invoke Context Menu Item   Go to Definition
    Sleep  2

    ${Line Number} =  Get Current Line Number In Widget Zone  ${Editor}   content=${Definition Str}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Definition Defined}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152080 Find all references from the word begin
    [Tags]  TC152080  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that LSP can find all references and navigate by them
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Ref Line 0}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Element} =  Click Inside Definition   ${Editor}  ${Ref Line 0}   ${Reference Text}  ${Active Editor}

    Click Me   ${Element}

    Send Ctrl Left

    Call Find All References  ${Editor}

    ${ROWS} =  Get Widget Zone Rows  ${Editor}  ${Active Editor}
    ${Found Number Of References} =  Get Length  ${ROWS}
    ${Found Number Of References Str} =  Convert To String    ${Found Number Of References}
    Should Be Equal  ${References Num}  ${Found Number Of References Str}

    ${Line} =  Navigate To Reference  ${Editor}  0  list_rows=${ROWS}  content=${Reference 0}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 0}

    ${Line} =  Navigate To Reference  ${Editor}  1  list_rows=${ROWS}  content=${Reference 1}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  list_rows=${ROWS}  content=${Reference 2}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152080 Find all references from the word middle
    [Tags]  TC152080  COBOL_LOCAL  LSP  FireFox  Rally  DEFECT_OPEN  DE465817
    [Documentation]  Checks that LSP can find all references and navigate by them
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Ref Line 0}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Element} =  Click Inside Definition   ${Editor}  ${Ref Line 0}   ${Reference Text}  ${Active Editor}

    Click Me   ${Element}

    Call Find All References  ${Editor}

    ${ROWS} =  Get Widget Zone Rows  ${Editor}  ${Active Editor}
    ${Found Number Of References} =  Get Length  ${ROWS}
    ${Found Number Of References Str} =  Convert To String    ${Found Number Of References}
    Should Be Equal  ${References Num}  ${Found Number Of References Str}

    ${Line} =  Navigate To Reference  ${Editor}  0  list_rows=${ROWS}  content=${Reference 0}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 0}

    ${Line} =  Navigate To Reference  ${Editor}  1  list_rows=${ROWS}  content=${Reference 1}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  list_rows=${ROWS}  content=${Reference 2}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152047 Error case - file has syntax errors
    [Tags]  TC152047  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that when opening Cobol file with correct syntax there is NO message about correct syntax
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl

    ${Message} =  Get Syntax Ok Message For ${Cobol File 2}
    Notification Message Not Expected   ${Message}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152052 Syntax Errors are marked in file
    [Tags]  TC152052  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that error lines are marked in a file
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}

TC152051 Syntax Errors have more detailed hints
    [Tags]  TC152051  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that error lines have detailed hints
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  @{LINES}[0]  ${Active Editor}
    Should Be Equal  @{LINES}[0]   ${Error Line Number}
    Should Be Equal  ${Error Hint}  ${Tooltip Text}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152050 Semantic Errors also marked in file
    [Tags]  TC152050  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that Semantic Errors also marked in file
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Should Contain  ${LINES}  ${Semantic Error Line}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152053 Semantic Errors also have hints
    [Tags]  TC152053  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that semantic errors have detailed hints
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Info Tooltip For Line Number  ${Editor}  ${Semantic Error Line}  ${Active Editor}
    Should Be Equal  ${Semantic Hint}  ${Tooltip Text}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152054 Auto format of right trailing spaces
    [Tags]  TC152054  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that auto format removed sight trailing spaces
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Line With Spaces}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}

    ${Content Before} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}
    Append Spaces To Line  ${Editor}  ${Line}
    Sleep  1
    ${Active Editor} =  Get Active Editor  ${Editor}
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  ${Line With Spaces}  editor=${Active Editor}
    Should Be Equal   ${Space Hint}   ${Tooltip Text}

    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}
    Right Click  ${Line}
    Invoke Context Menu Item   Format Document
    Sleep  1
    ${Content After} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}

    Should Be Equal    ${Content Before}   ${Content After}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152058 Autocomplete functionality with snippets navigation
    [Tags]  TC152058  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Check auto complete functionality, also with navigation by snippets
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Semantic Error Line}
    Add New Line  ${Editor}
    Call Auto Complete   ${Editor}
    ${Suggest Widget} =  Wait For Autocomplete Suggest  ${Editor}
    Choose From Suggestion   ${Editor}   ${Suggest Widget}  ${Snippet}
    Sleep  1
    ${snippet values} =  Create List    ${Snippet Value 1}  ${Snippet Value 2}
    Fill Snippets With  ${Editor}   ${snippet values}

    ${Active Editor} =  Get Active Editor  ${Editor}
    ${Content} =  Get Line Content  ${Editor}  ${Snippet Line}  trim=${True}  editor=${Active Editor}
    Should Be Equal  ${Content}   ${Snippet Filled}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Check correct Local Cobol File - Full Scenario
    [Tags]    DEBUG  Simple  COBOL_LOCAL  LSP
    [Documentation]  adds connection, filter, navigates to a specific dataset, open cobol file for editing
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl

    ${Message} =  Get Syntax Ok Message For ${Cobol File 1}
    Close Notification Message  ${Message}

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    Focus In  ${Editor}  ${Active Editor}
    See COBOL In Statusbar

    ${Int Line} =  Convert To Integer   ${Definition Occur}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Definition Occur}   ${Definition Str}  ${Active Editor}
    Right Click   ${Element}
    Invoke Context Menu Item   Go to Definition
    Sleep  2

    ${Line Number} =  Get Current Line Number In Widget Zone  ${Editor}   content=${Definition Str}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Definition Defined}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Int Line} =  Convert To Integer   ${Ref Line 0}
    ${Line To See} =  Evaluate  ${Int Line} - 1
    Scroll ${Editor} The Way Up For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Ref Line 0}   Stringlen  ${Active Editor}

    Click Me   ${Element}

    Send Ctrl Left

    Call Find All References  ${Editor}

    ${ROWS} =  Get Widget Zone Rows  ${Editor}  ${Active Editor}
    ${Found Number Of References} =  Get Length  ${ROWS}
    ${Found Number Of References Str} =  Convert To String    ${Found Number Of References}
    Should Be Equal  ${References Num}  ${Found Number Of References Str}

    ${Line} =  Navigate To Reference  ${Editor}  0  list_rows=${ROWS}  content=${Reference 0}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 0}

    ${Line} =  Navigate To Reference  ${Editor}  1  list_rows=${ROWS}  content=${Reference 1}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  list_rows=${ROWS}  content=${Reference 2}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Check incorrect Local Cobol File - Full Scenario
    [Tags]    DEBUG  Simple  COBOL_LOCAL_ERR  SYNTAX_ERROR  LSP
    [Documentation]  adds connection, filter, navigates to a specific dataset, open cobol file for editing
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    Focus In  ${Editor}  ${Active Editor}

    See COBOL In Statusbar

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Sleep  1

    ${Active Editor} =  Get Active Editor  ${Editor}
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  @{LINES}[0]  ${Active Editor}
    Should Be Equal  @{LINES}[0]   ${Error Line Number}
    Should Be Equal  ${Error Hint}  ${Tooltip Text}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Tooltip Text} =  Show Info Tooltip For Line Number  ${Editor}  ${Semantic Error Line}  ${Active Editor}
    Should Be Equal  ${Semantic Hint}  ${Tooltip Text}
    ${Line} =   Select Line  ${Editor}  ${Semantic Error Line}
    Add New Line  ${Editor}
    Sleep  1

    Call Auto Complete   ${Editor}
    ${Suggest Widget} =  Wait For Autocomplete Suggest  ${Editor}
    Choose From Suggestion   ${Editor}   ${Suggest Widget}  ${Snippet}
    Sleep  1
    ${snippet values} =  Create List    ${Snippet Value 1}  ${Snippet Value 2}
    Fill Snippets With  ${Editor}   ${snippet values}
    ${Content} =  Get Line Content  ${Editor}  ${Snippet Line}  trim=${True}  editor=${Active Editor}
    Should Be Equal  ${Content}   ${Snippet Filled}

    ${Int Line} =  Convert To Integer   ${Line With Spaces}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}

    ${Content Before} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}
    Append Spaces To Line  ${Editor}  ${Line}
    Sleep  1
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  ${Line With Spaces}  ${Active Editor}
    Should Be Equal   ${Space Hint}   ${Tooltip Text}

    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}
    Right Click  ${Line}
    Invoke Context Menu Item   Format Document
    Sleep  1
    ${Content After} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}

    Should Be Equal    ${Content Before}   ${Content After}

    Scroll ${Editor} The Way Up For Line 1 Is Visible In ${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

# Copybooks

TC174655 Copybook - Nominal
    [Tags]  TC174655  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  NEED_UPDATE
    [Documentation]  Checks that when opening Cobol file with correct reference to copybook,
         ...  there is syntax ok message shown

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 1}.cbl

    ${Message} =  Get Syntax Ok Message For ${Cobol with Copybook Nominal 1}
    Close Notification Message  ${Message}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174657 Copybook - not exist: no syntax ok message
    [Tags]  TC174657  COBOL_LOCAL  LSP  FireFox  Rally  Copybook
    [Documentation]  Checks that when opening Cobol file which refers to non-existent copybook,
         ...   syntax ok message does not appear and copybook is underlined

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl

    ${Message} =  Get Syntax Ok Message For ${Cobol with Copybook NotFound}
    Notification Message Not Expected   ${Message}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174956 Copybook - not exist: error underlined
    [Tags]  TC174956  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that error lines are marked in a file

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook NotFound}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Copy Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True  @{Lines}[0] == ${Copy Line 1}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174658 Copybook - not exist: detailed hint
    [Tags]  TC174658  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that error lines for missing copybook have detailed hints

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook NotFound}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Copy Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  @{LINES}[0]  ${Active Editor}
    Should Be Equal  ${Copybook Not Found Hint}  ${Tooltip Text}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174916 Copybook - recursive error
    [Tags]  TC174916  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that when opening Cobol file which recursively refers to copybooks,
        ...  copybook is underlined with an error

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Recursive}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Recursive}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Recursive}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Copy Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True   @{LINES}[0] == ${Copy Line 1}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174917 Copybook - recursive detailed hint
    [Tags]  TC174917  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that when opening Cobol file which recursively refers to copybooks,
        ...  have detailed error hint

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Recursive}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Recursive}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Recursive}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  @{LINES}[0]  ${Active Editor}
    Should Be Equal  ${Copybook Recursive Error Hint}  ${Tooltip Text}

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174932 Copybook - invalid definition
    [Tags]  TC174932  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that when opening Cobol file which uses invalid definition from copybook,
       ...   this definition is underlined as a semantic error

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Nominal 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Invalid Definition Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Should Contain  ${LINES}  ${Invalid Definition Line}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174933 Copybook - invalid definition hint
    [Tags]  TC174933  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that when opening Cobol file which uses invalid definition from copybook,
       ...   has detailed hint on mouse hover

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 2}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Nominal 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Invalid Definition Line}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Info Tooltip For Line Number  ${Editor}  ${Semantic Error Line}  ${Active Editor}
    Should Be Equal  ${Copybook Semantic Hint}  ${Tooltip Text}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174918 Copybook - peek definition
    [Tags]  TC174918  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that Peek Definition functionality works in theia in cobol file via context menu

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Nominal 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${References Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${References Line 1}   ${Copybook Referense Str 1}  ${Active Editor}
    Right Click   ${Element}
    Invoke Context Menu Item   Go to Definition
    Sleep  1

    Wait For Tab With Title  ${Editor}  ${Copybook Nominal 2}.cpy
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Line Number} =  Get Current Line Number  ${Editor}   content=${Copybook Definition Str 1}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Copybook Definition Defined 1}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174930 Copybook - Ctrl+Click on definition
    [Tags]  TC174930  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that Peek Definition functionality works in theia in cobol file via Ctrl+Click

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Nominal 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${References Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${References Line 1}   ${Copybook Referense Str 1}  ${Active Editor}
    Control Click  ${Editor}  ${Element}

    Wait For Tab With Title  ${Editor}  ${Copybook Nominal 2}.cpy
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Line Number} =  Get Current Line Number  ${Editor}   content=${Copybook Definition Str 1}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Copybook Definition Defined 1}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174931 Copybook - peek references
    [Tags]  TC174931  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that LSP can find all references (also in copybooks) and navigate by them

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook Nominal 1}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook Nominal 1}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook Nominal 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${References Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${References Line 1}   ${Copybook Referense Str 1}  ${Active Editor}
    Click Me   ${Element}

    Call Find All References  ${Editor}

    Expand References Tree  ${Editor}  ${Active Editor}

    ${ROWS} =  Get Widget Zone Rows  ${Editor}  ${Active Editor}

    ${Found Number Of References} =  Get Length  ${ROWS}
    ${Found Number Of References Str} =  Convert To String    ${Found Number Of References}
    Should Be Equal  ${Copy References Num}  ${Found Number Of References Str}

    ${Line} =  Navigate To Reference  ${Editor}  0  list_rows=${ROWS}  content=${Copybook Definition Str 1}  editor=${Active Editor}
    Should Be Equal  ${Line}  ${Copybook Reference 1}

    ${Line} =  Navigate To Reference  ${Editor}  1  list_rows=${ROWS}  content=${Copy Reference Line 1}  editor=${Active Editor}
    Should Be Equal  ${Line}  ${References Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  list_rows=${ROWS}  content=${Copy Reference Line 2}  editor=${Active Editor}
    Should Be Equal  ${Line}  ${References Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC174952 Copybook - not exist, but dynamically appears
    [Tags]  TC174952  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that LSP can dynamically detect appearance of copybook and rescan cobol file on the fly

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook NotFound}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    Navigate All The Way Up
    ${Element} =  Inside File Explorer Navigate Down To ${COPYBOOK_FOLDER} From ${Explorer Title Node}
    Expand Directory Node  ${Element}

    ${Int Line} =  Convert To Integer   ${Copy Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True  @{Lines}[0] == ${Copy Line 1}

    Copy File Macro    ${Copybook Missing Src Path}   ${Copybook Missing Path}   ${Copybook Missing}.cpy

    Navigate All The Way Up
    ${Element} =  Inside File Explorer Navigate Down To ${Copybook Missing}.cpy From ${Explorer Title Node}
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}
    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl

    ${Active Editor} =  Get Active Editor  ${Editor}
    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  editor=${Active Editor}  error_should_exist=${False}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Should Be Empty  ${LINES}

    Delete File Macro   ${Copybook Missing Path}

    @{ERROR_LINES} =  Find Lines With Errors  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True  @{Lines}[0] == ${Copy Line 1}

TC174953 Copybook - definition not exist, but dynamically appears
    [Tags]  TC174953  COBOL_LOCAL  LSP  FireFox  Rally  Copybook  DEFECT_OPEN  DE465210
    [Documentation]  Checks that LSP can dynamically detect definitions from an appeared
        ...   copybook and rescan cobol file on the fly

    # Modify User Preferences With Datasets and Zowe Profile Macro
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}

    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook NotFound}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    Navigate All The Way Up
    ${Element} =  Inside File Explorer Navigate Down To ${COPYBOOK_FOLDER} From ${Explorer Title Node}
    Expand Directory Node  ${Element}

    ${Int Line} =  Convert To Integer   ${References Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True  @{Lines}[0] == ${References Line 1}

    Copy File Macro  ${Copybook Missing Src Path}   ${Copybook Missing Path}   ${Copybook Missing}.cpy

    Navigate All The Way Up
    ${Element} =  Inside File Explorer Navigate Down To ${Copybook Missing}.cpy From ${Explorer Title Node}
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol with Copybook NotFound}.cbl From ${Explorer Title Node}
    Open Member Macro  ${Element}  ${Cobol with Copybook NotFound}.cbl

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol with Copybook NotFound}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${References Line 1}
    ${Line To See} =  Evaluate  ${Int Line} + 1
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  editor=${Active Editor}  error_should_exist=${False}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Should Be Empty  ${LINES}

    Delete File Macro   ${Copybook Missing Path}

    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Should Be True  @{Lines}[0] == ${References Line 1}
