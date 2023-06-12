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

/**
 * Handle insert mapping situations
 */
class InsertMapper implements Mapper {
  @Override
  public Location apply(MappedCharacter startCharacter, MappedCharacter endCharacter) {
    if (startCharacter != null && !startCharacter.getUri().equals(endCharacter.getUri()) && startCharacter.getOriginalPosition() != null) {
      Location location = endCharacter.getInitialLocationMap().get(startCharacter.getUri());
      if (location != null) {
        return new Location(startCharacter.getUri(), new Range(startCharacter.getOriginalPosition(), location.getRange().getEnd()));
      }
      return new Location(startCharacter.getUri(), new Range(startCharacter.getOriginalPosition(), startCharacter.getOriginalPosition()));
    }
    return null;
  }
}
