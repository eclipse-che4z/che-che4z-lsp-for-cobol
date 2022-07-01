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
package org.eclipse.lsp.cobol.core.model;

import lombok.Builder;
import lombok.Data;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This value class is used to describe the position of syntax or semantic element in the workspace.
 * URI and range define the file in the workspace, and the position range inside it.
 *
 * <p>Copybook id points to a specific copybook entry this position belongs to. Used in raising the
 * syntax errors from copybooks to the COBOL file.
 *
 * <p>Token describes the element at the position. It is used while mapping the positions from the
 * extended document to the original ones.
 *
 * <p>Recognizer is a class where this positions extracted. Used for debug purposes.
 *
 * <p>Warning: LSP lines and position are 0-based, and ANTLR ones are 1-based. Keep it in mind while
 * creating a range for a locality.
 */
@Data
@Builder(toBuilder = true)
public class Locality {
  @Builder.Default private String uri = "";
  @Builder.Default private Range range = new Range(new Position(0, 0), new Position(0, 0));
  @Builder.Default private String copybookId = null;
  @Builder.Default private String token = null;
  @Builder.Default private Class recognizer = Object.class;

  /**
   * Convert this Locality instance to Location using its URI and Range
   *
   * @return a Location from this locality
   */
  public Location toLocation() {
    return new Location(uri, range);
  }
}
