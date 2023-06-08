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
package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Straightforward mapper
 */
class StraightforwardMapper implements Mapper {

  @Override
  public Location apply(MappedCharacter startCharacter, MappedCharacter endCharacter) {
    Position startPosition = new Position(startCharacter.getOriginalPosition().getLine(), startCharacter.getOriginalPosition().getCharacter());
    Position endPosition = new Position(endCharacter.getOriginalPosition().getLine(), endCharacter.getOriginalPosition().getCharacter());

    Range originalRange = new Range(startPosition, endPosition);
    return new Location(startCharacter.getUri(), originalRange);
  }
}
