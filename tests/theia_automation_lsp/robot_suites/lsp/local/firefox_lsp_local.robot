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
Variables        inc/theia/zos_constants.py
Variables        inc/theia/config.py
Library          keywords.general
Library          keywords.monako_editor_wrappers
Library          inc.theia.ui.UI
Resource         keywords/monako.robot

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
${Reference 1}    Move 'Wenceslas Square 846/1' To User-Address.
${Ref Line 1}     35
${Reference 2}    Display "User-Address\ \ :\ "\ User-Address
${Ref Line 2}     43

${Error Line Number}    15
${Error Hint}     Syntax error on 'Program1-id' expected PROGRAM_IDCOBOL Language Support - E

${Semantic Error Line}   40
${Semantic Hint}    Invalid definition for: USER-CITY1COBOL Language Support - I

${Line With Spaces}    35
${Space Hint}   This format is not a FIXED formatCOBOL Language Support - E

${Snippet Line}   41
${Snippet}   ADD id TO id
${Snippet Value 1}   1
${Snippet Value 2}   Str
${Snippet Filled}   ADD 1 TO Str

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

    ${LEFT BAR} =  Get Left Menu Bar Locator
    ${condition} =  Create Condition When Element Shoud Be Clickable     ${LEFT BAR}
    Wait for ${DEFAULT_TIMEOUT} until ${condition}

    Show File Explorer

StopTestCase
    Stop Engine

Open Member Macro
    [Arguments]   ${Node}  ${Member}
    Right Click   ${Node}   ${Member}  ${False}
    Invoke Context Menu Item   Open

*** Test Cases ***
TC152046 Nominal - check syntax Ok message
    [Tags]  TC152046  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that when opening Cobol file with correct syntax there is an appropriate message is shown
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl
    Sleep  2

    ${Message} =  Expect Syntax Ok Message For ${Cobol File 1}
    Close Notification Message  ${Message}
    Sleep  2

    ${Editor} =  Get Editor
    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152048 Cobol file is recognized by LSP
    [Tags]  TC152048  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Cobol file is recognized by LSP - Cobol type is shown in status bar
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl
    Sleep  2

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}
    Focus In  ${Editor}  ${Active Editor}

    See COBOL In Statusbar
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152049 Navigate through definitions
    [Tags]  TC152049  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Check behavior of go to definition action
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl
    Sleep  2

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Definition Occur}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Definition Occur}   ${Definition Str}  ${Active Editor}
    Right Click   ${Element}
    Invoke Context Menu Item   Go to Definition
    Sleep  2

    ${Line Number} =  Get Current Line Number In Widget Zone  ${Editor}   content=${Definition Str}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Definition Defined}
    Sleep   2

    Close Zone If Exists  ${Editor}   editor=${Active Editor}
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152080 Find all references
    [Tags]  TC152080  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that LSP can find all references and navigate by them
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl
    Sleep  2

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Ref Line 0}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Element} =  Click Inside Definition   ${Editor}  ${Ref Line 0}   ${Reference Text}  ${Active Editor}
    Sleep  2

    Click Me   ${Element}
    Call Find All References  ${Editor}
    Sleep  2

    ${References} =  Get Number Of References   ${Editor}  ${Active Editor}
    ${References Str} =  Convert To String    ${References}
    Should Be Equal  ${References Str}  ${References Num}

    ${Line} =  Navigate To Reference  ${Editor}  0  content=${Reference 0}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 0}

    ${Line} =  Navigate To Reference  ${Editor}  1  content=${Reference 1}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  content=${Reference 2}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152047 Error case - file has syntax errors
    [Tags]  TC152047  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that when opening Cobol file with correct syntax there is NO message about correct syntax
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    Sleep  2

    ${Message} =  Expect Syntax Ok Message For ${Cobol File 2}
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
    Sleep  2

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
    Sleep  2

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
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152050 Semantic Errors are also marked in file
    [Tags]  TC152050  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that Semantic Errors are also marked in file
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    Should Contain  ${LINES}  ${Semantic Error Line}
    Mark Lines  ${Editor}  ${LINES}  ${Active Editor}
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152053 Semantic Errors are also have hints
    [Tags]  TC152053  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that semantic errors have detailed hints
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    @{ERROR_LINES} =  Find Lines With Warnings  ${Editor}  ${Active Editor}
    ${LINES} =  Create List  @{ERROR_LINES}
    Log  ${LINES}
    ${Tooltip Text} =  Show Info Tooltip For Line Number  ${Editor}  ${Semantic Error Line}  ${Active Editor}
    Should Be Equal  ${Semantic Hint}  ${Tooltip Text}

    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

TC152054 Auto format of right trailing spaces
    [Tags]  TC152054  COBOL_LOCAL  LSP  FireFox  Rally
    [Documentation]  Checks that auto format removed sight trailing spaces
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Line With Spaces}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}
    Sleep  1

    ${Content Before} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}
    Append Spaces To Line  ${Editor}  ${Line}
    Sleep  1
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  ${Line With Spaces}  ${Active Editor}
    Should Be Equal   ${Space Hint}   ${Tooltip Text}

    Sleep  1

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
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 2}.cbl
    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 2}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Semantic Error Line}
    Add New Line  ${Editor}
    Call Auto Complete   ${Editor}
    ${Suggest Widget} =  Wait For Autocomplete Suggest  ${Editor}
    Choose From Suggestion   ${Editor}   ${Suggest Widget}  ${Snippet}
    Sleep  1
    ${snippet values} =  Create List    ${Snippet Value 1}  ${Snippet Value 2}
    Fill Snippets With  ${Editor}   ${snippet values}
    ${Content} =  Get Line Content  ${Editor}  ${Snippet Line}  trim=${True}  editor=${Active Editor}
    Should Be Equal  ${Content}   ${Snippet Filled}
    Sleep  1

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Check correct Local Cobol File - Full Scenario
    [Tags]    DEBUG  Simple  COBOL_LOCAL  LSP
    [Documentation]  adds connection, filter, navigates to a specific dataset, open cobol file for editing
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 1}.cbl From ${Explorer Title Node}
    Sleep  2

    Open Member Macro  ${Element}  ${Cobol File 1}.cbl
    Sleep  2

    ${Message} =  Expect Syntax Ok Message For ${Cobol File 1}
    Close Notification Message  ${Message}

    ${Editor} =  Get Editor
    Wait For Tab With Title  ${Editor}  ${Cobol File 1}.cbl
    ${Active Editor} =  Get Active Editor  ${Editor}

    Focus In  ${Editor}  ${Active Editor}
    See COBOL In Statusbar
    Sleep  2

    ${Int Line} =  Convert To Integer   ${Definition Occur}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Definition Occur}   ${Definition Str}  ${Active Editor}
    Right Click   ${Element}
    Invoke Context Menu Item   Go to Definition
    Sleep  2

    ${Line Number} =  Get Current Line Number In Widget Zone  ${Editor}   content=${Definition Str}  editor=${Active Editor}

    Should Be Equal  ${Line Number}  ${Definition Defined}
    Sleep   2

    Close Zone If Exists  ${Editor}   editor=${Active Editor}
    Sleep  2

    ${Int Line} =  Convert To Integer   ${Ref Line 0}
    ${Line To See} =  Set Variable  ${Int Line - 1}
    Scroll ${Editor} The Way Up For Line ${Line To See} Is Visible In ${Active Editor}

    ${Element} =  Click Inside Definition   ${Editor}  ${Ref Line 0}   Stringlen  ${Active Editor}
    Sleep  2

    Click Me   ${Element}
    Call Find All References  ${Editor}
    Sleep  2

    ${References} =  Get Number Of References   ${Editor}  ${Active Editor}
    ${References Str} =  Convert To String    ${References}
    Should Be Equal  ${References Str}  ${References Num}

    ${Line} =  Navigate To Reference  ${Editor}  0  content=${Reference 0}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 0}

    ${Line} =  Navigate To Reference  ${Editor}  1  content=${Reference 1}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 1}

    ${Line} =  Navigate To Reference  ${Editor}  2  content=${Reference 2}   editor=${Active Editor}
    Should Be Equal  ${Line}  ${Ref Line 2}

    Close Zone If Exists  ${Editor}   editor=${Active Editor}
    Sleep  2

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}

Check incorrect Local Cobol File - Full Scenario
    [Tags]    DEBUG  Simple  COBOL_LOCAL_ERR  SYNTAX_ERROR  LSP
    [Documentation]  adds connection, filter, navigates to a specific dataset, open cobol file for editing
    ${Explorer Title Node} =  Find File Explorer Panel
    ${Top File Element} =  Find First Element In Files Explorer
    ${Element} =  Inside File Explorer Navigate Down To ${Cobol File 2}.cbl From ${Explorer Title Node}
    Sleep  2

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

    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  @{LINES}[0]  ${Active Editor}
    Should Be Equal  @{LINES}[0]   ${Error Line Number}
    Should Be Equal  ${Error Hint}  ${Tooltip Text}

    Sleep  1

    ${Int Line} =  Convert To Integer   ${Semantic Error Line}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    # Sleep  2
    ${Tooltip Text} =  Show Info Tooltip For Line Number  ${Editor}  ${Semantic Error Line}  ${Active Editor}
    Should Be Equal  ${Semantic Hint}  ${Tooltip Text}
    # Sleep  2
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
    Sleep  1

    ${Int Line} =  Convert To Integer   ${Line With Spaces}
    ${Line To See} =  Set Variable  ${Int Line + 1}
    Scroll ${Editor} The Way Down For Line ${Line To See} Is Visible In ${Active Editor}
    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}
    Sleep  1

    ${Content Before} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}
    Append Spaces To Line  ${Editor}  ${Line}
    Sleep  1
    ${Tooltip Text} =  Show Error Tooltip For Line Number  ${Editor}  ${Line With Spaces}  ${Active Editor}
    Should Be Equal   ${Space Hint}   ${Tooltip Text}
    Sleep  1

    ${Line} =   Select Line  ${Editor}  ${Line With Spaces}
    Right Click  ${Line}
    Invoke Context Menu Item   Format Document
    Sleep  1
    ${Content After} =  Get Line Content  ${Editor}  ${Line With Spaces}  editor=${Active Editor}

    Should Be Equal    ${Content Before}   ${Content After}

    Scroll ${Editor} The Way Up For Line 1 Is Visible In ${Active Editor}
    Sleep  1

    ${Active Tab} =  Get Active Tab  ${Editor}
    Close Tab  ${Editor}  ${Active Tab}
