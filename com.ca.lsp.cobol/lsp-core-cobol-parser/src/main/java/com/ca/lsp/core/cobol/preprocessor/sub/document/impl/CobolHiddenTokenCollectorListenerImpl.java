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
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import org.antlr.v4.runtime.BufferedTokenStream;
import org.antlr.v4.runtime.tree.TerminalNode;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorBaseListener;
import com.ca.lsp.core.cobol.preprocessor.sub.util.TokenUtils;

/**
 * ANTLR listener, which collects visible as well as hidden tokens for a given
 * parse tree in a string buffer.
 */
public class CobolHiddenTokenCollectorListenerImpl extends CobolPreprocessorBaseListener {

	boolean firstTerminal = true;

	private final StringBuilder outputBuffer = new StringBuilder();

	private final BufferedTokenStream tokens;

	public CobolHiddenTokenCollectorListenerImpl(final BufferedTokenStream tokens) {
		this.tokens = tokens;
	}

	public String read() {
		return outputBuffer.toString();
	}

	@Override
	public void visitTerminal(final TerminalNode node) {
		if (!firstTerminal) {
			final int tokPos = node.getSourceInterval().a;
			outputBuffer.append(TokenUtils.getHiddenTokensToLeft(tokPos, tokens));
		}

		if (!TokenUtils.isEOF(node)) {
			final String text = node.getText();
			outputBuffer.append(text);
		}

		firstTerminal = false;
	}
}