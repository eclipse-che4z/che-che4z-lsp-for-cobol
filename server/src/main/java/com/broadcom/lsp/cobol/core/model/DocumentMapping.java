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

import lombok.Value;

import java.util.List;
import java.util.Map;

/**
 * This value class represents an original position mapping for the document. It stores the list of
 * {@link Locality} pointing to the positions of the original tokens of the document, and shifts
 * produced by extracting some statements from the document. Those shifts mean the number of
 * positions that should be skipped while building a full mapping of the extended document.
 */
@Value
public class DocumentMapping {
  List<Locality> localities;
  Map<Integer, Integer> shifts;
}
