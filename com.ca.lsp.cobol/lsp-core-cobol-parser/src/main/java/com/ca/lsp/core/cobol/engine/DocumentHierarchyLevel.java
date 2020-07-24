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

package com.ca.lsp.core.cobol.engine;

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.DocumentMapping;

import java.util.List;
import java.util.Map;

import static java.util.Optional.ofNullable;

public class DocumentHierarchyLevel {
  private int index;
  private List<Position> positions;
  private Map<Integer, Integer> shifts;

  public DocumentHierarchyLevel(DocumentMapping documentMapping) {
    index = 0;
    positions = documentMapping.getPositions();
    shifts = documentMapping.getShifts();
  }

  public Position getCurrent() {
    return positions.get(index);
  }

  public void forward() {
    index += ofNullable(shifts.get(index)).orElse(1);
  }

  public List<Position> lookahead() {
    int tail = positions.size() - index;
    if (tail < 1) return List.of();
    return positions.subList(index, index + tail);
  }

  public void forceForward(int length) {
    index += length;
  }
}
