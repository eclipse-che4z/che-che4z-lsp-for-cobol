/*
 * Copyright (c) 2024 Broadcom.
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

import { E4E } from "../../type/e4eApi.d";
import { getExtensionApi } from "../util/Utils";

const nameof = <T>(name: keyof T) => name;
function validateE4E(e4e: any): e4e is E4E {
  return (
    e4e instanceof Object &&
    nameof<E4E>("listElements") in e4e &&
    nameof<E4E>("getElement") in e4e &&
    nameof<E4E>("listMembers") in e4e &&
    nameof<E4E>("getMember") in e4e &&
    nameof<E4E>("isEndevorElement") in e4e &&
    nameof<E4E>("getProfileInfo") in e4e &&
    nameof<E4E>("getConfiguration") in e4e &&
    nameof<E4E>("onDidChangeElement") in e4e
  );
}

export async function getE4EAPI() {
  return getExtensionApi<E4E>("BroadcomMFD.explorer-for-endevor", validateE4E);
}
