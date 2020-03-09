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

package com.ca.lsp.core.cobol.preprocessor.sub.copybook;

import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.google.inject.assistedinject.Assisted;

import java.util.List;

/** A Guice factory to create {@link AnalyseCopybookTask} objects on demand. */
public interface AnalyseCopybookTaskFactory {
  AnalyseCopybookTask create(
      @Assisted("documentUri") String documentUri,
      @Assisted("copybookUsage") CopybookUsage copybookUsage,
      @Assisted("copybookUsageTracker") List<CopybookUsage> copybookUsageTracker,
      @Assisted("textDocumentSyncType") String textDocumentSyncType);
}
