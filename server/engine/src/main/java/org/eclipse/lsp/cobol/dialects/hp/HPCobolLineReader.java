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
package org.eclipse.lsp.cobol.dialects.hp;

import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.*;
import static org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum.NORMAL;

import com.google.common.collect.ImmutableMap;
import java.util.*;
import java.util.regex.Pattern;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.model.CobolLineTypeEnum;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.reader.CobolLineReader;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutUtil;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity based on HP tandem
 * code layout; analyzes and processes line indicators. This implementation checks if the lines
 * match the given format and raises an error if not. It also puts the entire compiler directive
 * text (excluding the sequence area if present) to prevent possible cutting off the line beginning.
 */
@Slf4j
class HPCobolLineReader extends CobolLineReader {
  private final CodeLayoutStore layoutStore;

  HPCobolLineReader(MessageService messageService, CodeLayoutStore layoutStore) {
    super(messageService);
    this.layoutStore = layoutStore;
  }

  private static final Pattern COMPILER_DIRECTIVE_LINE =
      Pattern.compile("(?i)(.{0,6} +|\\s*+)(?<directives>(CBL|PROCESS) .+)");

  private static final Map<String, CobolLineTypeEnum> INDICATORS =
      new ImmutableMap.Builder<String, CobolLineTypeEnum>()
          .put("*", COMMENT)
          .put("/", COMMENT)
          .put("d", DEBUG)
          .put("D", DEBUG)
          .put("-", CONTINUATION)
          .put("?", COMPILER_DIRECTIVE)
          .put(" ", NORMAL)
          .put("", NORMAL)
          .build();

  @Override
  protected Pattern getCompilerDirectives() {
    return COMPILER_DIRECTIVE_LINE;
  }

  @Override
  protected Map<String, CobolLineTypeEnum> getIndicator() {
    return INDICATORS;
  }

  @Override
  protected CobolProgramLayout getLayout() {
    return layoutStore
        .getCodeLayout()
        .map(layout -> CodeLayoutUtil.mergeLayout(CobolLanguageId.HP_COBOL.getLayout(), layout))
        .orElse(CobolLanguageId.HP_COBOL.getLayout());
  }
}
