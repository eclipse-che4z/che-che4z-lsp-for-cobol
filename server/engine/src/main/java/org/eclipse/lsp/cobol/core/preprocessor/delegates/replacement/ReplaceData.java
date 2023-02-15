/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Replacement data storage
 */
@Value
@RequiredArgsConstructor
public class ReplaceData {
  List<Pair<String, String>> replacePatterns = new ArrayList<>();
  Map<String, Range> ranges = new HashMap<>();

  public ReplaceData(List<Pair<String, String>> replacePatterns, String url, Range range) {
    this.replacePatterns.addAll(replacePatterns);
    this.ranges.put(url, range);
  }

  /**
   * Get range in specific document by URI
   *
   * @param url a document URI
   * @return the replacement range
   */
  public Range getRange(String url) {
    return ranges.computeIfAbsent(url, u -> new Range());
  }
}
