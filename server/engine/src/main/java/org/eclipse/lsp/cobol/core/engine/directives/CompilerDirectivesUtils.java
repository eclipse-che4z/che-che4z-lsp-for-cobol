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
package org.eclipse.lsp.cobol.core.engine.directives;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * Compiler directives processing utility class.
 */
@UtilityClass
public class CompilerDirectivesUtils {
  /**
   * Shift the range by startPosition.
   * @param range the original range.
   * @param startPosition the start position.
   * @return a new shifted range object.
   */
  public static Range shiftRange(Range range, Position startPosition) {
    Position start = new Position(range.getStart().getLine() + startPosition.getLine(),
            range.getStart().getCharacter() + startPosition.getCharacter());
    Position end = new Position(range.getEnd().getLine() + startPosition.getLine(),
            range.getEnd().getCharacter() + startPosition.getCharacter());
    return new Range(start, end);
  }
}
