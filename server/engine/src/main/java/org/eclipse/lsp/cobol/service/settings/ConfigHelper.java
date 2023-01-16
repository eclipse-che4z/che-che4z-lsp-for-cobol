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
package org.eclipse.lsp.cobol.service.settings;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Streams;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonPrimitive;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.EmbeddedLanguage;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;

import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static java.util.stream.Collectors.toList;

/**
 * Config helper class
 */
@UtilityClass
public class ConfigHelper {

  /**
   * Get config data as optional string
   *
   * @param data config response
   * @return optional string value
   */
  public Optional<String> getValueAsString(List<Object> data) {
    if (data == null || data.isEmpty()) return Optional.empty();
    Object obj = data.get(0);
    if (!(obj instanceof JsonPrimitive)) return Optional.empty();

    return Optional.of(((JsonPrimitive) obj).getAsString()).filter(it -> !it.isEmpty());
  }

  /**
   * Parse dialect registry client configurations to {@link List<DialectRegistryItem>}
   * @param jsonArray client dialect registry configuration
   * @return {@link List<DialectRegistryItem>}
   */
  public List<DialectRegistryItem> parseDialectRegistry(JsonArray jsonArray) {
    return Streams.stream(jsonArray)
            .map(JsonElement::getAsJsonObject)
            .filter(Objects::nonNull)
            .map(o -> new DialectRegistryItem(
                    o.get("name").getAsString(),
                    o.get("path").getAsString(),
                    o.get("description").getAsString(),
                    o.get("extensionId").getAsString())
            ).collect(toList());
  }

  /**
   * Parse SQL Backend client configurations to {@link SQLBackend}
   * @param objects client SQL Backend configuration
   * @return {@link SQLBackend}
   */
  public SQLBackend parseSQLBackend(List<Object> objects) {
    return ConfigHelper.getValueAsString(objects)
            .map(SQLBackend::valueOf)
            .orElse(SQLBackend.DB2_SERVER);
  }

  /**
   * Parse CICS translator client configurations to {@link Boolean}
   * @param options CICS translator client configuration
   * @return True if checked or false
   */
  public boolean parseCicsTranslatorOption(JsonElement options) {
    if (options instanceof JsonNull) {
      return false;
    } else {
      return options.getAsBoolean();
    }
  }

  /**
   * Parse dialect client configurations to {@link String}
   * @param dialects dialects client configuration
   * @return List of configured dialects
   */
  public List<String> parseDialects(JsonArray dialects) {
    return Streams.stream(dialects).map(JsonElement::getAsString).collect(toList());
  }

  /**
   *  Parse embedded language client configurations
   * @param features configured embedded language
   * @return {@link List<EmbeddedLanguage>}
   */
  public List<EmbeddedLanguage> parseFeatures(JsonElement features) {
    if (features.isJsonArray() && features.getAsJsonArray().size() > 0) {
      return Streams.stream((JsonArray) features)
              .map(JsonElement::getAsString)
              .map(EmbeddedLanguage::valueOf)
              .collect(toList());
    }
    return Arrays.asList(EmbeddedLanguage.values());
  }

  /**
   * Parse subroutine client configurations
   * @param subroutine configured subroutine
   * @return List of configured subroutines
   */
  public List<String> parseSubroutineFolder(JsonElement subroutine) {
    if (subroutine.isJsonArray()) {
      return Streams.stream((JsonArray) subroutine).map(JsonElement::getAsString).collect(toList());
    }
    return ImmutableList.of();
  }
}
