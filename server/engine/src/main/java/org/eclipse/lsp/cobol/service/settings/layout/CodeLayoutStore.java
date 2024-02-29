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
package org.eclipse.lsp.cobol.service.settings.layout;

import com.google.common.collect.Iterables;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.inject.Singleton;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Consumer;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.preprocessor.ProcessingConstants;

/** Stores the Cobol Program layout */
@Slf4j
@Singleton
public class CodeLayoutStore {
  private CobolProgramLayout layout;

  /**
   * updates the store with the passed layout
   *
   * @return void
   */
  public Consumer<? super List<Object>> updateCodeLayout() {
    return layout -> {
      if (Objects.nonNull(layout)) {
        CobolProgramLayout layoutSetting = parseLayout(Iterables.getFirst(layout, null));
        if (layoutSetting != null) this.layout = layoutSetting;
      }
    };
  }

  /**
   * gives the code layout
   *
   * @return a {@link CobolProgramLayout} instance
   */
  public CobolProgramLayout getCodeLayout() {
    return Optional.ofNullable(layout).orElse(new CobolProgramLayout());
  }

  /**
   * Parse cobol program layout passed by the settings
   *
   * @param jsonElements configured cobol layout
   * @return {@link CobolProgramLayout}
   */
  private static CobolProgramLayout parseLayout(Object jsonElements) {
    CobolProgramLayout.CobolProgramLayoutBuilder layoutBuilder = CobolProgramLayout.builder();
    if (jsonElements instanceof JsonObject) {
      JsonObject element = (JsonObject) jsonElements;
      layoutBuilder.sequenceLength(
          Optional.ofNullable(element.get("sequence_length"))
              .map(JsonElement::getAsInt)
              .orElse(ProcessingConstants.SEQUENCE_LENGTH));
      layoutBuilder.indicatorLength(
          Optional.ofNullable(element.get("indicator_length"))
              .map(JsonElement::getAsInt)
              .orElse(ProcessingConstants.INDICATOR_LENGTH));
      layoutBuilder.areaALength(
          Optional.ofNullable(element.get("area_a_length"))
              .map(JsonElement::getAsInt)
              .orElse(ProcessingConstants.AREA_A_LENGTH));
      layoutBuilder.areaBLength(
          Optional.ofNullable(element.get("area_b_length"))
              .map(JsonElement::getAsInt)
              .orElse(ProcessingConstants.AREA_B_LENGTH));
      layoutBuilder.commentAreaLength(
          Optional.ofNullable(element.get("comment_area"))
              .map(JsonElement::getAsInt)
              .orElse(ProcessingConstants.COMMENT_AREA));
      return layoutBuilder.build();
    }
    return null;
  }
}
