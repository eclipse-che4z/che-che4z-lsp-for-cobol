/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import { MessageService } from "../../../engine/services/MessageService";

export function createMessageService() {
  return new MessageService({
    "validation.layout_identifier": "Invalid layout identifier",
    "validation.missing.layout_usage":
      "Layout usage is not specified. Explicit usage (e.g. OTP) is recommended for correct resolution and readability",
    "validation.copy_from.retrieve.suffix": "Cannot retrieve suffix",
    "validation.copy_from.noMatchingVariable": "Source for {0} not found",
    "copybook.not_found": "{0}: Copybook not found",
  });
}
