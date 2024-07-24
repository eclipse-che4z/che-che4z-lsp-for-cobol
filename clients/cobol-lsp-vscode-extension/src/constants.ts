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
export const SETTINGS_CPY_LOCAL_PATH: string =
  "cobol-lsp.cpy-manager.paths-local";
export const SETTINGS_CPY_EXTENSIONS: string =
  "cobol-lsp.cpy-manager.copybook-extensions";
export const SETTINGS_CPY_FILE_ENCODING: string =
  "cobol-lsp.cpy-manager.copybook-file-encoding";
export const SETTINGS_SQL_BACKEND: string = "cobol-lsp.target-sql-backend";
export const SETTINGS_DIALECT = "cobol-lsp.dialects";
export const SETTINGS_COMPILE_OPTIONS = "cobol-lsp.compiler.options";
export const SETTINGS_SUBROUTINE_LOCAL_KEY =
  "cobol-lsp.subroutine-manager.paths-local";
export const SETTINGS_TAB_CONFIG: string = "cobol-lsp.smart-tab";

export const SERVER_PORT = "cobol-lsp.server.port";
export const SERVER_RUNTIME = "cobol-lsp.serverRuntime";
export const DIALECT_LIBS = "cobol-lsp.dialect.libs";
export const PATHS_LOCAL_KEY = "paths-local";
export const PATHS_DSN = "paths-dsn";
export const PATHS_USS = "paths-uss";
export const COBOL_PRGM_LAYOUT = "cobol-lsp.cobol.program.layout";
export const C4Z_FOLDER: string = ".c4z";
export const COPYBOOKS_FOLDER: string = "copybooks";
export const GITIGNORE_FILE: string = ".gitignore";
export const LANGUAGE_ID = "cobol";
export const EXP_LANGUAGE_ID = "expcobol";
export const HP_LANGUAGE_ID = "hpcobol";
export const PROFILE_NAME_PLACEHOLDER = "<profilename>";
export const DOWNLOAD_QUEUE_LOCKED_ERROR_MSG = `Invalid credentials for profile: ${PROFILE_NAME_PLACEHOLDER}. Copybook retrieval is blocked. Ensure the profile contains correct credentials.`;
export const UNLOCK_DOWNLOAD_QUEUE_MSG = "Unblock and retry";
export const INVALID_CREDENTIALS_ERROR_MSG = `Incorrect credentials in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const PROVIDE_PROFILE_MSG =
  "Please specify a valid Zowe Explorer profile to download copybooks from the mainframe.";
export const SEGMENT_PLACEHOLDER = "<segment>";
export const DSN_MUSTBE_NOT_EMPTY = "Dataset name segment must not be empty.";
export const DSN_NOMORE_8CHARS =
  "Dataset name segment can't be more than 8 characters.";
export const DSN_START_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} starts with a prohibited character.`;
export const DSN_CONTAINS_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} contains a prohibited character.`;
export const QUICKFIX_GOTOSETTINGS = "Open settings";
export const QUICKFIX_UPDATE_DIALECTSSETTINGS = "Update dialects";
export const QUICKFIX_UPDATE_SERVER_TO_JAVA = "Update serverRuntime";
export const COBOL_CBL_EXT = ".CBL";
export const COBOL_COB_EXT = ".COB";
export const COBOL_COBOL_EXT = ".COBOL";
export const COBOL_EXT_ARRAY = [COBOL_CBL_EXT, COBOL_COB_EXT, COBOL_COBOL_EXT];
export const COPYBOOK_CPY_EXT = ".CPY";
export const COPYBOOK_EXTENSIONS = "copybook-extensions";
export const COPYBOOK_EXT_ARRAY = [COPYBOOK_CPY_EXT];
export const EXTENSION_ID = "broadcommfd.cobol-language-support";
export const TELEMETRY_DEFAULT_CONTENT = "INVALID_INSTRUMENTATION_KEY";
export const ZOWE_EXT_MISSING_MSG =
  "Zowe Explorer version 1.15.0 or higher is required to download copybooks from the mainframe.";
export const INSTALL_ZOWE = "Install Zowe Explorer";
export const DEFAULT_DIALECT = "COBOL";
export const CLEARING_COPYBOOK_CACHE = "Clearing downloaded copybook cache";
export const COPYBOOK_CACHE_CLEARED_INFO = "Downloaded copybooks removed";
export const ZOWE_FOLDER: string = "zowe";
export const FAIL_CREATE_COPYBOOK_FOLDER_MSG = `Failed to create copybook internal folder`;
export const FAIL_CREATE_GLOBAL_STORAGE_MSG = `Failed to create extension global storage folder`;
export const E4E_SCHEME: string = "ndvr";
export const OUTPUT_MSG_SEARCH_LOCATION = "Looking for location => ";
export const E4E_FOLDER: string = "e4e";
export const DATASET = "dataset";
export const ENVIRONMENT = "environment";
export const USE_MAP = "MAP";
export const SETTINGS_CPY_NDVR_DEPENDENCIES = "endevor-dependencies";
export const ENDEVOR_PROCESSOR = "ENDEVOR_PROCESSOR";
export const E4E_INCOMPATIBLE = "E4E interface is not compatible";

export enum PUNCH_CARD {
  SEQUENCE_AREA_END_POS = 6,
  INDICATOR_AREA = 7,
  AREA_A_END_POS = 11,
  AREA_B_END_POS = 72,
  IDENTIFICATION_AREA_END_POS = 80,
}
