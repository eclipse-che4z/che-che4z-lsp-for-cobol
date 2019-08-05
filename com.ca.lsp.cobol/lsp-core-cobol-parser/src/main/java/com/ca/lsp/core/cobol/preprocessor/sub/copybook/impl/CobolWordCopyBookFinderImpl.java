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

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.CobolWordContext;
import com.ca.lsp.core.cobol.preprocessor.sub.copybook.CobolWordCopyBookFinder;

public class CobolWordCopyBookFinderImpl implements CobolWordCopyBookFinder {

  @Override
  public File findCopyBook(final CobolParserParams params, final CobolWordContext ctx) {
    if (params.getCopyBookFiles() != null) {
      for (final File copyBookFile : params.getCopyBookFiles()) {
        if (isMatchingCopyBook(copyBookFile, params, ctx)) {
          return copyBookFile;
        }
      }
    }

    if (params.getCopyBookDirectories() != null) {
      for (final File copyBookDirectory : params.getCopyBookDirectories()) {
        final File validCopyBook = findCopyBookInDirectory(copyBookDirectory, params, ctx);

        if (validCopyBook != null) {
          return validCopyBook;
        }
      }
    }

    return null;
  }

  protected File findCopyBookInDirectory(
      final File copyBooksDirectory, final CobolParserParams params, final CobolWordContext ctx) {
    for (final File copyBookCandidate : copyBooksDirectory.listFiles()) {
      if (isMatchingCopyBook(copyBookCandidate, params, ctx)) {
        return copyBookCandidate;
      }
    }

    return null;
  }

  protected boolean isMatchingCopyBook(
      final File copyBookCandidate, final CobolParserParams params, final CobolWordContext ctx) {
    final String copyBookIdentifier = ctx.getText();

    if (params.getCopyBookExtensions() != null) {
      for (final String copyBookExtension : params.getCopyBookExtensions()) {
        if (isMatchingCopyBookWithExtension(
            copyBookCandidate, copyBookIdentifier, copyBookExtension)) {
          return true;
        }
      }

      return false;
    } else {
      return isMatchingCopyBookWithoutExtension(copyBookCandidate, copyBookIdentifier);
    }
  }

  protected boolean isMatchingCopyBookWithExtension(
      final File copyBookCandidate,
      final String copyBookIdentifier,
      final String copyBookExtension) {
    final String copyBookFilename =
        StringUtils.isBlank(copyBookExtension)
            ? copyBookIdentifier
            : copyBookIdentifier + "." + copyBookExtension;
    final String copyBookCandidateName = copyBookCandidate.getName();
    return copyBookFilename.equalsIgnoreCase(copyBookCandidateName);
  }

  protected boolean isMatchingCopyBookWithoutExtension(
      final File copyBookCandidate, final String copyBookIdentifier) {
    final String copyBookCandidateBaseName = FilenameUtils.getBaseName(copyBookCandidate.getName());
    return copyBookCandidateBaseName.equalsIgnoreCase(copyBookIdentifier);
  }
}
