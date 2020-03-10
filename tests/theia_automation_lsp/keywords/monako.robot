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
Scroll ${Editor} The Way ${direction} For Line ${line number} Is Visible In ${active editor}
    ${Line Number Element}  Scroll Editor For Line Number  ${Editor}  ${direction}  ${line number}  ${active editor}
    Return From Keyword     ${Line Number Element}
