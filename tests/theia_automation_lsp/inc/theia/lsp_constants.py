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

LSP_COBOL_SYNTAX_OK_TEMPLATE = "No syntax errors detected in {0}_{1}.cbl"
LSP_COBOL_MEMBER_SYNTAX_OK_TEMPLATE = "No syntax errors detected in {0}.cbl"
TAB_TITLE_TEMPLATE = "{0}_{1}.cbl"

SAVE_DIALOG_TEMPLATE = "Do you want to save the changes you made to {0}?"

COPYBOOK_FOLDER = ".copybooks"
ZOWE_PROFILE = "zowe-profile-1"

CPY_DIR_1 = "DATA.SET.PATH1"
CPY_DIR_2 = "DATA.SET.PATH2"

USER_COPYBOOK_PREFERENCES = {
    "broadcom-cobol-lsp.cpy-manager.paths": [CPY_DIR_1, CPY_DIR_2],
    "broadcom-cobol-lsp.cpy-manager.profiles": ZOWE_PROFILE
}
