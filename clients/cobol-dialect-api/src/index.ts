/*
 * Copyright (c) 2023 Broadcom.
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

import type { __ExtensionV1Api } from "./v1api";
import type { __ExtensionV2Api } from "./v2api";

/**
 * Not intenteded as API for extenders. DO NOT USE in your application!
 *
 * Interface provided by {@link mainExtensionId COBOL Language Support extension}.
 *
 * Imported from the COBOL Language Support extenension for cross type checking.
 *
 */
export interface __ExtensionApi {
  version: string;
  v1: __ExtensionV1Api;
  v2: __ExtensionV2Api;
}

export * from "./v1api";
export * from "./v2api";
export * from "./common";
