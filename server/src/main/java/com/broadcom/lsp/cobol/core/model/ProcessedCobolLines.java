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

package com.broadcom.lsp.cobol.core.model;

import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.List;

/***
 * This is a model to hold preprocessed List of {@link CobolLine}'s and a map which represents any modification in the
 * original List of {@link CobolLine}.
 *
 * positionCorrectionMap attribute holds mapping between the modified new position in document to the actual
 * {@link CobolLine} in the document
 *
 */
@AllArgsConstructor
@Getter
public class ProcessedCobolLines {
  private List<CobolLine> cobolLines;

  // contains mapping between the modified new line in document as per preprocessing to the actual
  // {@link CobolLine} in the document.
  private Multimap<Integer, CobolLine> positionCorrectionMap;
}
