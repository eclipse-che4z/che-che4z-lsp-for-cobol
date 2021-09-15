/*
 * Copyright (c) 2021 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service;

import lombok.Value;

/**
 * This dto class is used to hold config data for copybook like: copybook procassing mode, and which
 * backend database server is planned to be used
 */
@Value
public class CopybookConfig {
  CopybookProcessingMode copybookProcessingMode;
  SQLBackend sqlBackend;
}
