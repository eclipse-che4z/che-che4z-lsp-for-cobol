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
export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";
export const LANGUAGE_ID = "COBOL";
export const REASON_MSG = "Configuration updated. Ensure your configuration contains correct paths to nested copybooks.";
export const PROCESS_DOWNLOAD_ERROR_MSG = "Some copybooks could not be downloaded. Ensure your configuration contains correct paths to nested copybooks. Missing copybooks: ";
