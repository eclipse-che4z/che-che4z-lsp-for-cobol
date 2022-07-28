/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
export const SETTINGS_CPY_SECTION: string = "cobol-lsp.cpy-manager";

export const SERVER_PORT = "cobol-lsp.server.port";
export const IS_NATIVE_BUILD = "cobol-lsp.enableNativeBuild";
export const PATHS_LOCAL_KEY = "paths-local";
export const PATHS_ZOWE = "paths-dsn";
export const PATHS_USS = "paths-uss";
export const SETTINGS_SUBROUTINE_LOCAL_KEY = "cobol-lsp.subroutine-manager.paths-local";
export const C4Z_FOLDER: string = ".c4z";
export const COPYBOOKS_FOLDER: string = ".copybooks";
export const GITIGNORE_FILE: string = ".gitignore";
export const LANGUAGE_ID = "COBOL";
export const PROFILE_NAME_PLACEHOLDER = "<profilename>";
export const DOWNLOAD_QUEUE_LOCKED_ERROR_MSG = `Invalid credentials for profile: ${PROFILE_NAME_PLACEHOLDER}. Copybook retrieval is blocked. Ensure the profile contains correct credentials.`;
export const UNLOCK_DOWNLOAD_QUEUE_MSG = "Unblock and retry";
export const INVALID_CREDENTIALS_ERROR_MSG = `Incorrect credentials in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const PROCESS_DOWNLOAD_ERROR_MSG = "Some copybooks could not be located. Ensure your configuration contains correct paths to copybooks, including nested copybooks. Missing copybooks: ";
export const PROVIDE_PROFILE_MSG = "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe.";
export const SEGMENT_PLACEHOLDER = "<segment>";
export const DSN_MUSTBE_NOT_EMPTY = "Dataset name segment must not be empty.";
export const DSN_NOMORE_8CHARS = "Dataset name segment can't be more than 8 characters.";
export const DSN_START_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} starts with a prohibited character.`;
export const DSN_CONTAINS_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} contains a prohibited character.`;
export const QUICKFIX_GOTOSETTINGS = "Open settings";
export const COBOL_CBL_EXT = ".CBL";
export const COBOL_COB_EXT = ".COB";
export const COBOL_COBOL_EXT = ".COBOL";
export const COBOL_EXT_ARRAY = [COBOL_CBL_EXT, COBOL_COB_EXT, COBOL_COBOL_EXT];
export const COPYBOOK_CPY_EXT = ".CPY";
export const COPYBOOK_EXT_ARRAY = [COPYBOOK_CPY_EXT];
export const EXTENSION_ID = "broadcommfd.cobol-language-support";
export const TELEMETRY_DEFAULT_CONTENT = "INVALID_INSTRUMENTATION_KEY";
export const ZOWE_EXT_MISSING_MSG = "Zowe Explorer version 1.15.0 or higher is required to download copybooks from the mainframe.";
export const INSTALL_ZOWE = "Install Zowe Explorer";

export enum PUNCH_CARD {
    SEQUENCE_AREA_END_POS = 6,
    INDICATOR_AREA = 7,
    AREA_A_END_POS = 11
}
