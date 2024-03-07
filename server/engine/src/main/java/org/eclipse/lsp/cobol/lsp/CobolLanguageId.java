/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.lsp;

import java.util.*;
import java.util.stream.Collectors;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;

/** Enum of supported Cobol language id's */
public enum CobolLanguageId {
  COBOL("cobol", new CobolProgramLayout(6, 1, 4, 61, 8)),
  HP_COBOL("hpcobol", new CobolProgramLayout(0, 1, 4, 127, 0));

  private final CobolProgramLayout layout;
  private final String id;
  public static final Map<String, CobolLanguageId> MAPPER =
      Arrays.stream(CobolLanguageId.values())
          .collect(Collectors.toMap(CobolLanguageId::getId, id -> id));

  CobolLanguageId(String id, CobolProgramLayout layout) {
    this.id = id;
    this.layout = layout;
  }

  public CobolProgramLayout getLayout() {
    return layout;
  }

  public String getId() {
    return id;
  }
}
