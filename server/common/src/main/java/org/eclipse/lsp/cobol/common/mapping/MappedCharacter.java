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

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;

import java.util.HashMap;
import java.util.Map;

/**
 * Mapped character class with original position information
 */
@Getter
@Setter
@AllArgsConstructor
public class MappedCharacter {
  private char character;
  private Position originalPosition;
  private String uri;
  private ExtendedTextLine parent;
  private Location instantLocation;
  private Map<String, Location> initialLocationMap;

  MappedCharacter shadowCopy() {
    return new MappedCharacter(character, originalPosition, uri, parent, instantLocation, initialLocationMap);
  }

  Map<String, Location> getOrCreateInitialLocationMap() {
    if (initialLocationMap == null)
      initialLocationMap = new HashMap<>();
    return initialLocationMap;
  }
}
