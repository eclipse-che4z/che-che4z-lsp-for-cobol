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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.cleaner;

/**
 * This component is a part of preprocessor that eliminates the non-processable tokens from the
 * text.
 */
public interface CobolDocumentCleaner {
  /**
   * Remove the tokens that are not going to be processed from the text
   *
   * @param documentUri - the URI of the currently processing document
   * @param text - text to be cleaned
   * @return cleaned up text
   */
  String cleanDocument(String documentUri, String text);
}
