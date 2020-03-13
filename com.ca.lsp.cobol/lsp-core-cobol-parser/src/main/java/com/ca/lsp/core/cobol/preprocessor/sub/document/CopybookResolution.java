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

package com.ca.lsp.core.cobol.preprocessor.sub.document;

import com.ca.lsp.core.cobol.model.CopybookModel;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public interface CopybookResolution {

  @Nullable
  CopybookModel resolve(
      @Nullable String copyBookName,
      @Nonnull String documentUri,
      @Nonnull String textDocumentSyncType);
}
