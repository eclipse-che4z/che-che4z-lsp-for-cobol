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
export const SETTINGS_SECTION: string = "broadcom-cobol-lsp.cpy-manager";

export const PATHS_LOCAL_KEY = "paths.local";
export const PATHS_ZOWE = "paths.dsn";
export const C4Z_FOLDER: string = ".c4z";
export const COPYBOOKS_FOLDER: string = ".copybooks";
export const GITIGNORE_FILE: string = ".gitignore";
export const LANGUAGE_ID = "COBOL";
export const REASON_MSG = "Configuration updated. Ensure your configuration contains correct paths to nested copybooks.";
export const PROCESS_DOWNLOAD_ERROR_MSG = "Some copybooks could not be located. Ensure your configuration contains correct paths to copybooks, including nested copybooks. Missing copybooks: ";
export const PROFILE_NAME_PLACEHOLDER = "<profilename>";
export const SEGMENT_PLACEHOLDER = "<segment>";
export const NO_PASSWORD_ERROR_MSG = `No password in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const CONN_REFUSED_ERROR_MSG = `Connection to mainframe using Zowe profile ${PROFILE_NAME_PLACEHOLDER} failed.`;
export const INVALID_CREDENTIALS_ERROR_MSG = `Incorrect credentials in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const DSN_PLACEHOLDER = "<DSN>";
export const DSN_NOT_FOUND_ERROR_MSG = `Dataset ${DSN_PLACEHOLDER} not found.`;

// DATASET PATH RELATED CONSTANTS
export const DSN_MUSTBE_NOT_EMPTY = "Dataset name segment must not be empty.";
export const DSN_NOMORE_8CHARS = "Dataset name segment can't be more than 8 characters.";
export const DSN_START_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} starts with a prohibited character.`;
export const DSN_CONTAINS_PROHIBITED_CHAR = `Dataset name segment: ${SEGMENT_PLACEHOLDER} contains a prohibited character.`;

// QUICK FIX CONSTANTS
export const QUICKFIX_GOTOSETTINGS = "Open settings";
