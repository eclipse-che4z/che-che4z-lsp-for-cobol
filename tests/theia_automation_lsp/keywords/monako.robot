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
Library          keywords.monako_editor_wrappers

*** Keywords ***
Scroll ${Editor} The Way ${direction} For Line ${line number} Is Visible In ${Active Editor}
    ${Line Number Element} =  Scroll Editor For Line Number  ${Editor}  ${direction}  ${line number}  ${Active Editor}
    Return From Keyword     ${Line Number Element}

Remove All ${Editor} Breakpoints
    Remove All Breakpoints  ${Editor}

Set ${Editor} Breakpoint At Line ${line number} in ${Active Editor}
    Set Breakpoint At Line Editor  ${Editor}  ${line number}  editor=${Active Editor}

Find ${Editor} Breakpoints In ${Active Editor}
    @{Lines with breakpoints} =  Find Breakpoint Lines  ${Editor}  editor=${Active Editor}
    Return From Keyword   ${Lines with breakpoints}
