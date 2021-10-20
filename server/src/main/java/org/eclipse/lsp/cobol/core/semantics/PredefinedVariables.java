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
package org.eclipse.lsp.cobol.core.semantics;

import lombok.experimental.UtilityClass;

import java.util.ArrayList;
import java.util.List;

/** This class contains list of predefined variable names. */
@UtilityClass
public class PredefinedVariables {
  public static final String PREDEFINED = "predefined";

  /**
   * Get a list of predefined variable names.
   *
   * @return the list with names
   */
  public List<String> getPredefinedVariablesNames() {
    List<String> result = new ArrayList<>();

    // XML special registers
    result.add("XML-CODE");
    result.add("XML-EVENT");
    result.add("XML-NAMESPACE");
    result.add("XML-NNAMESPACE");
    result.add("XML-NAMESPACE-PREFIX");
    result.add("XML-NNAMESPACE-PREFIX");
    result.add("XML-NTEXT");
    result.add("XML-TEXT");

    // JNI special register
    result.add("JNIENVPTR");

    // JSON special registers
    result.add("JSON-CODE");
    result.add("JSON-STATUS");

    return result;
  }
}
