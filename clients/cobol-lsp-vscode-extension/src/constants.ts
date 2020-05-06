import { convertError } from "./services/ZoweError";

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
export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";
export const LANGUAGE_ID = "COBOL";
export const REASON_MSG = "Configuration updated. Ensure your configuration contains correct paths to nested copybooks.";
export const PROCESS_DOWNLOAD_ERROR_MSG = "Some copybooks could not be downloaded. Ensure your configuration contains correct paths to nested copybooks. Missing copybooks: ";
export const PROFILE_NAME_PLACEHOLDER = "<profilename>";
export const NO_PASSWORD_ERROR_MSG = `No password in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const CONN_REFUSED_ERROR_MSG = `Connection to mainframe using Zowe profile ${PROFILE_NAME_PLACEHOLDER} failed.`;
export const INVALID_CREDENTIALS_ERROR_MSG = `Incorrect credentials in Zowe profile ${PROFILE_NAME_PLACEHOLDER}.`;
export const DSN_PLACEHOLDER = "<DSN>";
export const DSN_NOT_FOUND_ERROR_MSG = `Dataset ${DSN_PLACEHOLDER} not found.`;
