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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysis;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;

import java.util.HashMap;
import java.util.Map;

/**
 * Factory for copybook's content providers
 */
@Singleton
public class ContentProviderFactory {

  /** Enumeration of predefined copybook content types */
  public enum InjectCodeContentType {
    FILE,
    GENERATED,
    RESOLVE_COPYBOOK
  }

  private final Map<InjectCodeContentType, ContentProvider> instances;

  @Inject
  public ContentProviderFactory(FileSystemService files, CopybookService copybookService) {
    this.instances = new HashMap<>();
    instances.put(InjectCodeContentType.FILE, new FileContentProvider(files));
    instances.put(InjectCodeContentType.GENERATED, new LabelsContentProvider());
    instances.put(InjectCodeContentType.RESOLVE_COPYBOOK, new CopybookContentProvider(copybookService));
  }

  /**
   * Get an instance of {@link ContentProvider} bound to the provided {@link InjectCodeContentType}
   *
   * @param contentType the type of the required instance
   * @return a specific extension of the {@link InjectCodeAnalysis}
   */
  public ContentProvider getInstanceFor(InjectCodeContentType contentType) {
    return instances.get(contentType);
  }
}
