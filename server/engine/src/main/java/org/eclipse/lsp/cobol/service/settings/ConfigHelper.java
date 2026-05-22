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
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.settings;

import static java.util.stream.Collectors.toList;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Streams;
import com.google.gson.*;
import java.net.URI;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.SqlDecimalComma;
import org.eclipse.lsp.cobol.common.SqlProcessing;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.lsp.DialectItemDTO;

/** Config helper class */
@Slf4j
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
   *
   * @param dialects client dialect registry configuration
   * @return {@link List<DialectRegistryItem>}
   */
  public List<DialectRegistryItem> parseDialectRegistry(List<DialectItemDTO> dialects) {
    return dialects.stream()
        .filter(Objects::nonNull)
        .map(
            o -> {
              URI uri = null;
              if (o.getUri() != null) {
                try {
                  uri = new URI(o.getUri());
                } catch (Exception e) {
                  LOG.warn("Cannot parse dialect registry item {}", o, e);
                  return null;
                }
              }
              return new DialectRegistryItem(
                  o.getName(), o.getProtocolVersion(), uri, o.getDescription(), o.getExtensionId());
            })
        .filter(Objects::nonNull)
        .collect(toList());
  }

  /**
   * Parse SQL Backend client configurations to {@link SQLBackend}
   *
   * @param objects client SQL Backend configuration
   * @return {@link SQLBackend}
   */
  public SQLBackend parseSQLBackend(List<Object> objects) {
    return ConfigHelper.getValueAsString(objects)
        .map(SQLBackend::valueOf)
        .orElse(SQLBackend.DB2_SERVER);
  }

  /**
   * Parse SQL Decimal Comma Allowed configurations to {@link SqlProcessing}
   *
   * @param sqlDecimalCommaAllowed SQL Decimal Comma allowed checkbox state from configuration
   * @return Enabled if checked or Disabled otherwise, Disabled in the case of an invalid state
   */
  public SqlDecimalComma parseSQLDecimalCommaAllowed(JsonElement sqlDecimalCommaAllowed) {
    if (sqlDecimalCommaAllowed.isJsonPrimitive()
        && sqlDecimalCommaAllowed.getAsJsonPrimitive().isBoolean()) {
      return sqlDecimalCommaAllowed.getAsBoolean()
          ? SqlDecimalComma.ENABLED
          : SqlDecimalComma.DISABLED;
    }
    return SqlDecimalComma.DISABLED;
  }

  /**
   * Parse CICS translator client configurations to {@link Boolean}
   *
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
   * Parse SQL Processing Enabled configurations to {@link SqlProcessing}
   *
   * @param options SQL Processing checkbox state from configuration
   * @return Enabled if checked or Disabled otherwise, Enabled in the case of an invalid state
   */
  public SqlProcessing parseSQLProcessingEnabled(JsonElement options) {
    if (options.isJsonPrimitive() && options.getAsJsonPrimitive().isBoolean()) {
      return options.getAsBoolean() ? SqlProcessing.ENABLED : SqlProcessing.DISABLED;
    }
    return SqlProcessing.ENABLED;
  }

  /**
   * Parse Unused variable severity level
   *
   * @param options Configuration option
   * @return SeverityLevel
   */
  public ErrorSeverity parseUnusedVariableSeverity(JsonElement options) {
    if (options.isJsonPrimitive() && options.getAsJsonPrimitive().isString()) {
      try {
        return ErrorSeverity.valueOf(options.getAsString());
      } catch (IllegalArgumentException e) {
      }
    }
    return null;
  }

  /**
   * Parse dialect client configurations to {@link String}
   *
   * @param dialects dialects client configuration
   * @return List of configured dialects
   */
  public List<String> parseDialects(JsonArray dialects) {
    return Streams.stream(dialects)
        .filter(ele -> !(ele instanceof JsonNull))
        .map(JsonElement::getAsString)
        .collect(toList());
  }

  /**
   * Parse subroutine client configurations
   *
   * @param subroutine configured subroutine
   * @return List of configured subroutines
   */
  public List<String> parseSubroutineFolder(JsonElement subroutine) {
    if (subroutine.isJsonArray()) {
      return Streams.stream((JsonArray) subroutine).map(JsonElement::getAsString).collect(toList());
    }
    return ImmutableList.of();
  }

  /**
   * Parse compiler options client configurations
   *
   * @param jsonElements configured compiler options
   * @return List of configured compiler options
   */
  public static List<String> parseCompilerOptions(Object jsonElements) {
    if (jsonElements instanceof JsonArray) {
      return Streams.stream((JsonArray) jsonElements)
          .map(JsonElement::getAsString)
          .collect(toList());
    }
    return ImmutableList.of();
  }
}
