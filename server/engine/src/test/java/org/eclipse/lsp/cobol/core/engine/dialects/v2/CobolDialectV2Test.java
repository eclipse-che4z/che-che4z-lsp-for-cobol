/*
 * Copyright (c) 2026 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.mock;

import com.google.common.collect.ImmutableMap;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.NullSource;
import org.junit.jupiter.params.provider.ValueSource;

/** Tests keywords exposed by Java independent dialects. */
class CobolDialectV2Test {
  @TempDir Path tempDir;

  @Test
  void loadsKeywordsFromFileUri() throws IOException {
    Path keywordsFile =
        Files.createDirectory(tempDir.resolve("dialect with spaces")).resolve("keywords.txt");
    Files.write(
        keywordsFile,
        ("# Dialect keywords\nBIND=First line<br>Second line\n"
                + "FINISH=Description with \\u00A9\n")
            .getBytes(StandardCharsets.ISO_8859_1));

    CobolDialect dialect = createDialect(keywordsFile.toUri());

    assertEquals("dialect", dialect.getName());
    assertEquals(
        ImmutableMap.of("BIND", "First line\r\n\r\nSecond line", "FINISH", "Description with ©"),
        dialect.getKeywords());
  }

  @ParameterizedTest
  @NullSource
  @ValueSource(
      strings = {"", "keywords.txt", "unsupported:///keywords.txt", "file:///keywords.txt?query"})
  void returnsEmptyKeywordsForMissingOrInvalidUri(String uri) {
    CobolDialect dialect = createDialect(uri == null ? null : URI.create(uri));

    assertTrue(dialect.getKeywords().isEmpty());
  }

  @Test
  void returnsEmptyKeywordsForMissingFile() {
    CobolDialect dialect = createDialect(tempDir.resolve("missing.txt").toUri());

    assertTrue(dialect.getKeywords().isEmpty());
  }

  @Test
  void returnsEmptyKeywordsForMalformedFile() throws IOException {
    Path keywordsFile = tempDir.resolve("keywords.txt");
    Files.write(keywordsFile, "BIND=Invalid \\uZZZZ".getBytes(StandardCharsets.ISO_8859_1));

    CobolDialect dialect = createDialect(keywordsFile.toUri());

    assertTrue(dialect.getKeywords().isEmpty());
  }

  private CobolDialect createDialect(URI keywordsUri) {
    return new CobolDialectV2(
        new DialectRegistryItem("dialect", 2, null, "", "extensionId", keywordsUri, null, null),
        mock(DialectProcessingService.class));
  }
}
