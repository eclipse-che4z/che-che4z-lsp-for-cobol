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
package org.eclipse.lsp.cobol.service;

import org.eclipse.lsp.cobol.core.model.tree.EmbeddedCodeNode;

import java.util.List;
import java.util.Set;

/** This interface handles the request for configurations from the client settings */
public interface Configuration {
  /** Updates all the configurations from the client Settings  */
  void updateConfigurationFromSettings();

  /**
   * Get the SQLBackend type
   *
   * @return SQLBackend
   */
  SQLBackend getSqlBackend();

  /**
   * Get the Features Set
   *
   * @return features
   */
  Set<EmbeddedCodeNode.Language> getFeatures();

  /**
   * Get the list of Flavors
   *
   * @return List<String></String>
   */
  List<String> getFlavors();
}
