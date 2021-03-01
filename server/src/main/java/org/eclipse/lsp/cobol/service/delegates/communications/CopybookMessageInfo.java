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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.delegates.communications;

/**
 * This enum represent a set of messages regarding copybooks that could be consumed by the {@link
 * Communications} class
 */
public enum CopybookMessageInfo {
  COPYBOOK_FOLDER_MISS("Copybook folder not defined"),
  NO_SETTINGS("Settings information has not been provided"),
  NO_DATASET_IN_SETTINGS("Dataset list has not been provided");

  private String message;

  CopybookMessageInfo(String message) {
    this.message = message;
  }

  public String getMessage() {
    return message;
  }
}
