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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;

import java.util.List;

/**
 * A CopybookIdentificationService which combines different implementation of {@link
 * CopybookIdentificationService}
 */
@Singleton
public class CopybookIdentificationCombinedStrategy implements CopybookIdentificationService {

  private final CopybookIdentificationService service1;
  private final CopybookIdentificationService service2;

  @Inject
  public CopybookIdentificationCombinedStrategy(
      @Named("suffixStrategy") CopybookIdentificationService service1,
      @Named("contentStrategy") CopybookIdentificationService service2) {
    this.service1 = service1;
    this.service2 = service2;
  }

  /**
   * Identifies a copybook
   *
   * @param uri of the document
   * @param text of the document
   * @param config is a config
   * @return True if it's a copybook. False otherwise
   */
  @Override
  public boolean isCopybook(String uri, String text, List<String> config)
      throws UndeterminedDocumentException {
    try {
      return service1.isCopybook(uri, text, config);
    } catch (UndeterminedDocumentException ex) {
      return service2.isCopybook(uri, text, config);
    }
  }
}
