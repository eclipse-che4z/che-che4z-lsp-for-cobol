/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks.providers;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookAnalysis;
import org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.util.HashMap;
import java.util.Map;

/**
 * Factory for copybook's content providers
 */
@Singleton
public class ContentProviderFactory {

  private final Map<PredefinedCopybooks.CopybookContentType, ContentProvider> instances;

  @Inject
  public ContentProviderFactory(FileSystemService files) {
    this.instances = new HashMap<>();
    instances.put(PredefinedCopybooks.CopybookContentType.FILE, new FileContentProvider(files));
    instances.put(PredefinedCopybooks.CopybookContentType.GENERATED, new LabelsContentProvider());
  }

  /**
   * Get an instance of {@link ContentProvider} bound to the provided {@link PredefinedCopybooks.CopybookContentType}
   *
   * @param contentType the type of the required instance
   * @return a specific extension of the {@link CopybookAnalysis}
   */
  public ContentProvider getInstanceFor(PredefinedCopybooks.CopybookContentType contentType) {
    return instances.get(contentType);
  }
}
