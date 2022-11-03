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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.writer;

import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.CobolLine;

import java.util.List;

/**
 * This interface describes a class that should convert a list of COBOL lines to a String for the
 * further processing
 */
public interface CobolLineWriter {

  /**
   * Convert a list of COBOL lines into one string
   *
   * @param lines       - list of lines
   * @param documentUri - uri of the document
   * @return a string representation of the COBOL program
   */
  TextTransformations serialize(List<CobolLine> lines, String documentUri);
}
