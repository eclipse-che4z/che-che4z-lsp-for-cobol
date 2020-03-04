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

// tslint:disable: no-namespace no-empty
export namespace workspace {
    export const workspaceFolders: [] = [];
    export function getConfiguration() {}
}

export namespace window {
    export let showErrorMessage = () => {};
    export let showInformationMessage = () => {};
}
