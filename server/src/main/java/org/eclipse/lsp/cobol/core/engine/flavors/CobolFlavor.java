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
package org.eclipse.lsp.cobol.core.engine.flavors;

import org.eclipse.lsp.cobol.core.model.ResultWithErrors;

/** A COBOL flavor */
@FunctionalInterface
public interface CobolFlavor {
  /**
   * Processing the text
   *
   * @param uri document URI
   * @param text document text
   * @return the flavor processing result
   */
  ResultWithErrors<FlavorOutcome> processText(String uri, String text);
}
