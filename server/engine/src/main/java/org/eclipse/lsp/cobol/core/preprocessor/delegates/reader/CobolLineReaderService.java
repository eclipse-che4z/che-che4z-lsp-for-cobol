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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.reader;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import java.util.List;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.CobolLine;
import org.eclipse.lsp.cobol.lsp.CobolLanguageId;

/** This service returns a {@link CobolLineReader} based on the languageId */
@Singleton
public class CobolLineReaderService {
  private final CobolLineReader hpCobolLineReader;
  private final CobolLineReader cobolLineReader;

  @Inject
  public CobolLineReaderService(
      @Named("hpcobol") CobolLineReader hpCobolLineReader,
      @Named("cobol") CobolLineReader cobolLineReader) {
    this.hpCobolLineReader = hpCobolLineReader;
    this.cobolLineReader = cobolLineReader;
  }

  /**
   * gives {@link CobolLineReader} based on languageID
   *
   * @param languageId
   * @return {@link CobolLineReader}
   */
  public CobolLineReader getCobolLineReader(CobolLanguageId languageId) {
    if (languageId == CobolLanguageId.HP_COBOL) return hpCobolLineReader;
    else return cobolLineReader;
  }

  /**
   * Convert String with COBOL code into CobolLines based on the cobol languageID(dialect)
   * that are used further in the parsing.
   *
   * @param uri - URI of the currently open document
   * @param lines - a String to be converted into CobolLine list
   * @param languageId
   * @return List of COBOL lines with a list of errors if found, or an empty list
   */
  public ResultWithErrors<List<CobolLine>> processLines(@NonNull String uri, @NonNull String lines, CobolLanguageId languageId) {
    return getCobolLineReader(languageId).processLines(uri, lines);
  }
}
