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
Documentation    Keywords which provide login to MF or CHE
Variables        inc/theia/constants.py
Library          keywords.general
Library          Dialogs
Variables        inc/cfg/che_credentials.py

*** Keywords ***
MFShare
    [Arguments]  &{MF_CREDENTIALS}
    Set Suite Variable    &{MF_CREDENTIALS}

Get Mainframe Credentials
    ${Default Login} =  Get Login Name
    ${username} =  Get Value From User  Input PMFKEY to login to Mainframe  ${Default Login}
    ${password} =  Get Value From User  Input ${username} password to login to Mainframe   hidden=yes
    ${CREDENTIALS} =  Create Dictionary  username=${username}   password=${password}
    Return From Keyword   &{CREDENTIALS}

MFRequest
    [Arguments]  ${PASSWORD}
    ${CREDENTIALS} =  Run Keyword If  "${PASSWORD}" == ""  Get Mainframe Credentials
    Return From Keyword   ${CREDENTIALS}

MFUpdate
    [Arguments]  ${CREDENTIALS}
    ${MF_CREDENTIALS} =  Set Variable If  ${CREDENTIALS} is not ${None}  ${CREDENTIALS}  &{MF_CREDENTIALS}
    Return From Keyword  ${MF_CREDENTIALS}

Enter Credentials In Form
    [Arguments]  ${FORM}  ${USERNAME}  ${PASSWORD}
    Enter Credentials  ${FORM}  ${USERNAME}  ${PASSWORD}

Enter Value In Input
    [Arguments]  ${Value}  ${Element}  ${Overwrite}=True
    Enter Value In Element  ${SELF}  ${Value}  ${Element}  ${Overwrite}

CheShare
    [Arguments]  &{CHE_CREDENTIALS}
    Set Suite Variable    &{CHE_CREDENTIALS}

Get CHE Credentials
    Log  ${CHE_CREDENTIALS}
    ${Default Login} =   Set Variable   ${CHE_CREDENTIALS}[username]
    ${Str} =  Convert To String  ${Default Login}
    ${Default Login} =  Set Variable If  '${Str}'=="''"    Get Login Name   ${Default Login}
    Log  ${Default Login}

    ${username} =  Get Value From User  Input Che User Name  ${Default Login}
    ${password} =  Get Value From User  Input ${username} password to login to Che   hidden=yes
    ${CREDENTIALS} =  Create Dictionary  username=${username}   password=${password}
    Return From Keyword   &{CREDENTIALS}

CheRequest
    [Arguments]  ${PASSWORD}
    ${CREDENTIALS} =  Run Keyword If  "${PASSWORD}" == ""  Get CHE Credentials
    Return From Keyword   ${CREDENTIALS}

CheUpdate
    [Arguments]  ${CREDENTIALS}
    ${CHE_CREDENTIALS} =  Set Variable If  ${CREDENTIALS} is not ${None}  ${CREDENTIALS}  &{CHE_CREDENTIALS}
    Return From Keyword  ${CHE_CREDENTIALS}

Login To CHE
    [Arguments]  ${CREDENTIALS}
    Log  Login To CHE

    Log  ${CREDENTIALS}

    ${Element} =  Get Che Username Element  ${SELF}
    Fill Form Value  ${SELF}  ${Element}  &{CREDENTIALS}[username]

    ${Element} =  Get Che Password Element  ${SELF}
    Fill Form Value  ${SELF}  ${Element}  &{CREDENTIALS}[password]

    Submit Che Form  ${SELF}
