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
package com.ca.lsp.core.cobol.params;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.List;

public interface CobolParserParams {

  /** @apiNote https://docs.oracle.com/javase/8/docs/technotes/guides/intl/encoding.doc.html */
  Charset getCharset();

  List<File> getCopyBookDirectories();

  List<String> getCopyBookExtensions();

  List<File> getCopyBookFiles();

  CobolDialect getDialect();

  boolean getIgnoreSyntaxErrors();

  void setCharset(Charset charset);

  void setCopyBookDirectories(List<File> copyBookDirectories);

  void setCopyBookExtensions(List<String> copyBookExtensions);

  void setCopyBookFiles(List<Path> copyBookFiles);

  void setDialect(CobolDialect dialect);

  void setIgnoreSyntaxErrors(boolean ignoreSyntaxErrors);
}
