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
import org.eclipse.lsp4j.Range;

import java.util.Optional;

/**
 * Provides mapping functionality in case of replacement applied
 */
class ReplaceMapper implements Mapper {

  @Override
  public Location apply(MappedCharacter startCharacter, MappedCharacter endCharacter) {
    if (!startCharacter.getUri().equals(endCharacter.getUri())) {
      endCharacter = startCharacter;
    }

    if (startCharacter.getOriginalPosition() == null || endCharacter.getOriginalPosition() == null) {
      if (startCharacter.getInstantLocation() == null && endCharacter.getInstantLocation() == null) {
        throw new RuntimeException("Cannot find original position");
      }
      if (endCharacter.getOriginalPosition() != null) {
        Range calculatedRange = new Range(startCharacter.getInstantLocation().getRange().getStart(), endCharacter.getOriginalPosition());
        return new Location(startCharacter.getUri(), calculatedRange);
      } else if (startCharacter.getOriginalPosition() != null) {
        Range calculatedRange = new Range(startCharacter.getOriginalPosition(), endCharacter.getInstantLocation().getRange().getEnd());
        return new Location(startCharacter.getUri(), calculatedRange);
      }
      return Optional.ofNullable(startCharacter.getInstantLocation()).orElse(endCharacter.getInstantLocation());
    }
    return null;
  }
}
