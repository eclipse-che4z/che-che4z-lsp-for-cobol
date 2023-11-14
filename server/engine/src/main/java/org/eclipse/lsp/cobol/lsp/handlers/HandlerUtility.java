/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.error.ErrorCode;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;

import java.util.*;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.*;

/**
 * Utility class for LSP handlers
 */
@UtilityClass
@Slf4j
public class HandlerUtility {
  private static final String GIT_FS_URI = "gitfs:/";
  private static final String GIT_URI = "git:/";
  private static final String GITFS_URI_NOT_SUPPORTED = "GITFS URI not supported";

  /**
   * Check if we are interested in the document with provided uri.
   * @param uri - document uri.
   * @return true if we should continue the analysis of the document.
   */
  public boolean isUriSupported(String uri) {
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI) || uri.startsWith(GIT_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
      return false;
    }
    return true;
  }

  /**
   * Converts a list of SyntaxError to LSP Diagnostic map structure
   * @param errors a list of error object
   * @return a converted diagnostic map
   */
  public static Map<String, List<Diagnostic>> convertErrors(List<SyntaxError> errors) {
    Map<String, List<Diagnostic>> result = errors.stream()
        .filter(Objects::nonNull)
        .filter(e -> Objects.nonNull(e.getLocation()))
        .collect(groupingBy(err -> err.getLocation().getLocation().getUri(), mapping(HandlerUtility::toDiagnostic, toList())));
    result.values().forEach(l -> l.sort(Comparator.comparingInt(a -> a.getRange().getStart().getLine())));
    return result;
  }
  private static Diagnostic toDiagnostic(SyntaxError err) {
    Diagnostic diagnostic = new Diagnostic();
    diagnostic.setSeverity(DiagnosticSeverity.forValue(err.getSeverity().ordinal() + 1));
    diagnostic.setSource(err.getErrorSource().getText());
    diagnostic.setMessage(err.getSuggestion());
    diagnostic.setRange(err.getLocation().getLocation().getRange());
    diagnostic.setCode(ofNullable(err.getErrorCode()).map(ErrorCode::getLabel).orElse(null));
    diagnostic.setRelatedInformation(ofNullable(err.getRelatedInformation()).map(Collections::singletonList).orElse(null));
    return diagnostic;
  }

}
