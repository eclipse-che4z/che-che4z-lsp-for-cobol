/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.daco.provider;

import lombok.experimental.UtilityClass;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Generates predefined section content provider that generates content for a copybook
 */
@UtilityClass
public class SectionsGenerator {

  /**
   * Read injected code content
   * @param predefinedSection set of DaCo predefined sessions in a program
   * @param existingSessions set of existing sessions in a program
   * @return an optional copybook model
   */
  public Pair<String, String> generate(List<String> predefinedSection, Set<String> existingSessions) {
    StringBuilder sb = new StringBuilder();
    List<String> missingSections = predefinedSection.stream()
            .filter(s -> !existingSessions.contains(s))
            .collect(Collectors.toList());
    for (String sections : missingSections) {
      sb.append(StringUtils.repeat(' ', 7));
      sb.append(sections);
      sb.append(" SECTION.\r\n");
    }

    return Pair.of("DaCo-PREDEFSECT", sb.toString());
  }
}
