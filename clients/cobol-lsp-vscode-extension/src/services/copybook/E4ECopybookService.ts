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
import { getExtensionApi, Utils } from "../util/Utils";

export async function getE4EAPI() {
  return getExtensionApi<E4E>(
    "BroadcomMFD.explorer-for-endevor",
    Utils.validateE4E,
  );
}
