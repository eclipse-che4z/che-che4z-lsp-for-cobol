/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.copybook.impl;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.io.FileUtils;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.LiteralContext;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.LiteralCopyBookFinder;
import com.ca.lsp.core.cobol.preprocessor.sub.util.PreprocessorStringUtils;

public class LiteralCopyBookFinderImpl implements LiteralCopyBookFinder {

  @Override
  public File findCopyBook(final CobolParserParams params, final LiteralContext ctx) {
    if (params.getCopyBookFiles() != null) {
      for (final File copyBookFile : params.getCopyBookFiles()) {
        if (isMatchingCopyBook(copyBookFile, null, ctx)) {
          return copyBookFile;
        }
      }
    }

    if (params.getCopyBookDirectories() != null) {
      for (final File copyBookDirectory : params.getCopyBookDirectories()) {
        final File validCopyBook = findCopyBookInDirectory(copyBookDirectory, ctx);

        if (validCopyBook != null) {
          return validCopyBook;
        }
      }
    }

    return null;
  }

  protected File findCopyBookInDirectory(final File copyBooksDirectory, final LiteralContext ctx) {
    for (final File copyBookCandidate : FileUtils.listFiles(copyBooksDirectory, null, true)) {
      if (isMatchingCopyBook(copyBookCandidate, copyBooksDirectory, ctx)) {
        return copyBookCandidate;
      }
    }

    return null;
  }

  protected boolean isMatchingCopyBook(
      final File copyBookCandidate, final File cobolCopyDir, final LiteralContext ctx) {
    final String copyBookIdentifier =
        PreprocessorStringUtils.trimQuotes(ctx.getText()).replace("\\", "/");
    final boolean result;

    if (cobolCopyDir == null) {
      result = isMatchingCopyBookRelative(copyBookCandidate, copyBookIdentifier);
    } else {
      result = isMatchingCopyBookAbsolute(copyBookCandidate, cobolCopyDir, copyBookIdentifier);
    }

    return result;
  }

  protected boolean isMatchingCopyBookAbsolute(
      final File copyBookCandidate, final File cobolCopyDir, final String copyBookIdentifier) {
    final Path copyBookCandidateAbsolutePath =
        Paths.get(copyBookCandidate.getAbsolutePath()).normalize();
    final Path copyBookIdentifierAbsolutePath =
        Paths.get(cobolCopyDir.getAbsolutePath(), copyBookIdentifier).normalize();
    return copyBookIdentifierAbsolutePath
        .toString()
        .equalsIgnoreCase(copyBookCandidateAbsolutePath.toString());
  }

  protected boolean isMatchingCopyBookRelative(
      final File copyBookCandidate, final String copyBookIdentifier) {
    final Path copyBookCandidateAbsolutePath =
        Paths.get(copyBookCandidate.getAbsolutePath()).normalize();
    final Path copyBookIdentifierRelativePath;

    if (copyBookIdentifier.startsWith("/")
        || copyBookIdentifier.startsWith("./")
        || copyBookIdentifier.startsWith("\\")
        || copyBookIdentifier.startsWith(".\\")) {
      copyBookIdentifierRelativePath = Paths.get(copyBookIdentifier).normalize();
    } else {
      copyBookIdentifierRelativePath = Paths.get(File.separator + copyBookIdentifier).normalize();
    }

    return copyBookCandidateAbsolutePath
        .toString()
        .toLowerCase()
        .endsWith(copyBookIdentifierRelativePath.toString().toLowerCase());
  }
}
