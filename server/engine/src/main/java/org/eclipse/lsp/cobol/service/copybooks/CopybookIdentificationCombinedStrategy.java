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

import java.util.LinkedList;
import java.util.List;

/**
 * A CopybookIdentificationService which combines different implementation of {@link
 * CopybookIdentificationService}
 */
@Singleton
public class CopybookIdentificationCombinedStrategy implements CopybookIdentificationService {

  private final List<CopybookIdentificationService> strategies = new LinkedList<>();

  @Inject
  public CopybookIdentificationCombinedStrategy(
      @Named("suffixStrategy") CopybookIdentificationService strategy1,
      @Named("contentStrategy") CopybookIdentificationService strategy2) {
    strategies.add(strategy1);
    strategies.add(strategy2);
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
  public boolean isCopybook(String uri, String text, List<String> config) {
    for (CopybookIdentificationService strategy : strategies) {
      if (strategy.isCopybook(uri, text, config)) {
        return true;
      }
    }
    return false;
  }
}
