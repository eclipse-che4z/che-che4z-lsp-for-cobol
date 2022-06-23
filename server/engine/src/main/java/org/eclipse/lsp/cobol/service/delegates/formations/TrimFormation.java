/*
 * Copyright (c) 2020 Broadcom.
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
package org.eclipse.lsp.cobol.service.delegates.formations;

import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.TextEdit;

import lombok.NonNull;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class TrimFormation implements Formation {

  private static final Pattern RTRIM = Pattern.compile("\\s+$");

  private static String rtrim(String s) {
    return RTRIM.matcher(s).replaceAll("");
  }

  @Override
  public List<TextEdit> format(@NonNull List<CobolDocumentModel.Line> lines) {
    List<TextEdit> formattedText = new ArrayList<>();
    for (CobolDocumentModel.Line line : lines) {
      String newText = rtrim(line.getText());
      formattedText.add(addNewTextEditLine(line, newText));
    }
    return formattedText;
  }

  private static TextEdit addNewTextEditLine(CobolDocumentModel.Line line, String text) {
    return new TextEdit(addNewRange(line), text);
  }

  private static Range addNewRange(CobolDocumentModel.Line line) {
    return new Range(
        new Position(line.getNumber(), 0), new Position(line.getNumber(), line.getText().length()));
  }
}
