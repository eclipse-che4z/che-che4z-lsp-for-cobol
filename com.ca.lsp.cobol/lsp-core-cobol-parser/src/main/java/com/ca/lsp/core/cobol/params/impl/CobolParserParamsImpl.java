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
package com.ca.lsp.core.cobol.params.impl;

import com.ca.lsp.core.cobol.params.CobolDialect;
import com.ca.lsp.core.cobol.params.CobolParserParams;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.file.Path;
import java.util.List;
import java.util.stream.Collectors;

public class CobolParserParamsImpl implements CobolParserParams {

  protected Charset charset = Charset.defaultCharset();

  protected List<File> copyBookDirectories;

  protected List<String> copyBookExtensions;

  protected List<File> copyBookFiles;

  protected CobolDialect dialect;

  protected boolean ignoreSyntaxErrors;

  @Override
  public Charset getCharset() {
    return charset;
  }

  @Override
  public List<File> getCopyBookDirectories() {
    return copyBookDirectories;
  }

  @Override
  public List<String> getCopyBookExtensions() {
    return copyBookExtensions;
  }

  @Override
  public List<File> getCopyBookFiles() {
    return copyBookFiles;
  }

  @Override
  public CobolDialect getDialect() {
    return dialect;
  }

  @Override
  public boolean getIgnoreSyntaxErrors() {
    return ignoreSyntaxErrors;
  }

  @Override
  public void setCharset(final Charset charset) {
    this.charset = charset;
  }

  @Override
  public void setCopyBookDirectories(final List<File> copyBookDirectories) {
    this.copyBookDirectories = copyBookDirectories;
  }

  @Override
  public void setCopyBookExtensions(final List<String> copyBookExtensions) {
    this.copyBookExtensions = copyBookExtensions;
  }

  @Override
  public void setCopyBookFiles(final List<Path> copyBookFiles) {
    this.copyBookFiles = copyBookFiles.stream().map(Path::toFile).collect(Collectors.toList());
  }

  @Override
  public void setDialect(final CobolDialect dialect) {
    this.dialect = dialect;
  }

  @Override
  public void setIgnoreSyntaxErrors(final boolean ignoreSyntaxErrors) {
    this.ignoreSyntaxErrors = ignoreSyntaxErrors;
  }
}
