/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.common.model.tree.variable;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.utils.UsageFormatUtils;

import java.util.Objects;
import java.util.regex.Pattern;

/**
 * This enum class represents all effective data type for {@link ElementaryNode}. The order of this
 * enum must be maintained.
 */
public enum EffectiveDataType {
  STRING {
    @Override
    boolean checkDataType(ElementaryNode node) {
      return StringUtils.containsAny(node.getPicClause(), "A", "a", "X", "x");
    }
  },
  REAL {
    @Override
    boolean checkDataType(ElementaryNode node) {
      if (isNodeWithUsageFormatAndNoPicClause(node))
        return UsageFormatUtils.numericDatatypeUsageFormat.contains(node.getUsageFormat());
      return EXTERNAL_FLOATING_POINT_PATTERN.matcher(node.getPicClause()).matches()
          || StringUtils.containsAny(node.getPicClause(), "V", "v", "E", "e")
          || node.getPicClause().matches("(?i)S?P");
    }
  },
  INTEGER {
    @Override
    boolean checkDataType(ElementaryNode node) {
      if (isNodeWithUsageFormatAndNoPicClause(node))
        return UsageFormatUtils.numericDatatypeUsageFormat.contains(node.getUsageFormat());
      String formattedPicClause = node.getPicClause();
      if (StringUtils.startsWithIgnoreCase(node.getPicClause(), "PIC"))
        formattedPicClause = StringUtils.stripStart(node.getPicClause().toUpperCase(), "PIC");
      return INTEGER_PATTERN.matcher(formattedPicClause.trim()).matches();
    }
  },
  UNDETERMINED {
    @Override
    boolean checkDataType(ElementaryNode node) {
      return true;
    }
  };

  private static final Pattern INTEGER_PATTERN = Pattern.compile("(?i)S?9+(\\(\\d\\d*\\))?");
  private static final Pattern EXTERNAL_FLOATING_POINT_PATTERN =
      Pattern.compile("(?i)([+\\-])?[9V.]+E[+-]99");

  private static boolean isNodeWithUsageFormatAndNoPicClause(ElementaryNode node) {
    return Objects.isNull(node.getPicClause()) && Objects.nonNull(node.getUsageFormat());
  }

  abstract boolean checkDataType(ElementaryNode node);
}
