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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.Locality;

import javax.annotation.Nullable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * This class represents a document hierarchy level (i.e. the COBOL document or (nested) copybook),
 * using to map the positions from the extended document to the original ones. Index here means the
 * pointer to the current position in the list of the original positions. Shifts is a map of values
 * to increase the index in order to skip some positions.
 */
class DocumentHierarchyLevel {
  private int index;
  private final List<Locality> localities;
  private final Map<Integer, Integer> shifts;

  DocumentHierarchyLevel(@NonNull DocumentMapping documentMapping) {
    index = 0;
    localities = documentMapping.getLocalities();
    shifts = documentMapping.getShifts();
    tryForward();
  }

  /**
   * Get the position by the current index or null if the index is more than the list size.
   *
   * @return the current position or null.
   */
  @Nullable
  public Locality getCurrent() {
    return index < localities.size() ? localities.get(index) : null;
  }

  /**
   * Get the list of position from current to the end of the list inclusive.
   *
   * @return sublist of positions to the end of the list or an empty list.
   */
  @NonNull
  List<Locality> lookahead() {
    int tail = localities.size() - index;
    if (tail < 1) {
      return Collections.emptyList();
    }
    return localities.subList(index, index + tail);
  }

  /** Increase the index by one or by shift if specified */
  void forward() {
    index += shifts.getOrDefault(index, 1);
    tryForward();
  }

  /** Increase the index by shift if specified */
  void tryForward() {
    while (shifts.containsKey(index)) {
      index += shifts.get(index);
    }
  }

  /**
   * Increase the index by the given value.
   *
   * @param length - value to increase the index
   */
  void forceForward(int length) {
    index += length;
  }

  /**
   * Check if this locality is the last in the list
   *
   * @param locality Locality to check
   * @return true if this locality is the last one in the list of localities
   */
  public boolean isLastLocality(Locality locality) {
    return localities.indexOf(locality) == localities.size() - 1;
  }

  /**
   * Returns the last locality in the list
   * @return last locality in the list
   */
  public Locality getLastLocality() {
    return localities.get(localities.size() - 1);
  }
}
