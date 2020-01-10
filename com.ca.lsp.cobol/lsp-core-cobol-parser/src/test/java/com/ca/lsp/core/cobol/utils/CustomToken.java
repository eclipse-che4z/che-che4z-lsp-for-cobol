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
 */

package com.ca.lsp.core.cobol.utils;

import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.TokenSource;
import org.antlr.v4.runtime.WritableToken;

@AllArgsConstructor
public class CustomToken implements WritableToken {

  protected int line;
  protected int charPositionInLine = -1;
  protected String text;
  protected int start;
  protected int stop;

  @Override
  public void setText(String s) {}

  @Override
  public void setType(int i) {}

  @Override
  public void setLine(int i) {}

  @Override
  public void setCharPositionInLine(int i) {}

  @Override
  public void setChannel(int i) {}

  @Override
  public void setTokenIndex(int i) {}

  @Override
  public String getText() {
    return this.text;
  }

  @Override
  public int getType() {
    return 0;
  }

  @Override
  public int getLine() {
    return this.line;
  }

  @Override
  public int getCharPositionInLine() {
    return this.charPositionInLine;
  }

  @Override
  public int getChannel() {
    return 0;
  }

  @Override
  public int getTokenIndex() {
    return 0;
  }

  @Override
  public int getStartIndex() {
    return this.start;
  }

  @Override
  public int getStopIndex() {
    return this.stop;
  }

  @Override
  public TokenSource getTokenSource() {
    return null;
  }

  @Override
  public CharStream getInputStream() {
    return null;
  }
}
