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
package org.eclipse.lsp.cobol.common.dialects;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMultimap;
import com.google.common.collect.Multimap;
import lombok.AllArgsConstructor;
import lombok.Value;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.model.tree.Node;

import java.util.List;

/**
 * The result of dialect processing
 */
@Value
@AllArgsConstructor
public class DialectOutcome {
  List<Node> dialectNodes;
  Multimap<String, Pair<String, String>> implicitCode;
  DialectProcessingContext context;

  public DialectOutcome(DialectProcessingContext context) {
    this.context = context;
    this.dialectNodes = ImmutableList.of();
    this.implicitCode = ImmutableMultimap.of();
  }
}
