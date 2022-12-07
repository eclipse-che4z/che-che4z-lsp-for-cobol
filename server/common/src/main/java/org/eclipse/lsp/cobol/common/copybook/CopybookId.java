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

package org.eclipse.lsp.cobol.common.copybook;

import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;
import lombok.Value;

import java.util.Optional;

/**
 * Copybook universal identifier
 */
public interface CopybookId {
  String COBOL = "COBOL";

  /**
   * Create id from string
   * @param id a string identifier
   * @return an instance of id
   */
  static CopybookId fromString(String id) {
    return new CopybookIdStringImpl(id);
  }

  /**
   * Create old version of copybook id
   * @param name name of copybook
   * @param dialect dialect name
   * @param programUri uri of a program that use the copybook
   * @return an instance of id
   */
  static CopybookId create(String name, String dialect, String programUri) {
    final String id = String.format("%s#%s#%s", name, Optional.ofNullable(dialect)
            .orElse(COBOL), programUri);
    return new CopybookIdStringImpl(id);
  }
}

/**
 * CopybookId implementation with a string id
 */
@Value
@RequiredArgsConstructor
@EqualsAndHashCode
class CopybookIdStringImpl implements CopybookId {
  String id;
}
