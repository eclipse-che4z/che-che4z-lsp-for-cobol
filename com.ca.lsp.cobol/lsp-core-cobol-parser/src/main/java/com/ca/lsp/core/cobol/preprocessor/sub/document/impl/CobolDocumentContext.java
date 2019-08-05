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
package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;


import java.util.Arrays;
import java.util.List;

import org.antlr.v4.runtime.BufferedTokenStream;

import com.ca.lsp.core.cobol.parser.CobolPreprocessorParser.ReplaceClauseContext;


/**
 * A replacement context that defines, which replaceables should be replaced by
 * which replacements.
 */
public class CobolDocumentContext {

	private CobolReplacementMapping[] currentReplaceableReplacements;

	private StringBuilder outputBuffer = new StringBuilder();

	public String read() {
		return outputBuffer.toString();
	}

	/**
	 * Replaces replaceables with replacements.
	 */
	public void replaceReplaceablesByReplacements(final BufferedTokenStream tokens) {
		if (currentReplaceableReplacements != null) {
			Arrays.sort(currentReplaceableReplacements);

			for (final CobolReplacementMapping replaceableReplacement : currentReplaceableReplacements) {
				final String currentOutput = outputBuffer.toString();
				final String replacedOutput = replaceableReplacement.replace(currentOutput, tokens);

				outputBuffer = new StringBuilder();
				outputBuffer.append(replacedOutput);
			}
		}
	}

	public void storeReplaceablesAndReplacements(final List<ReplaceClauseContext> replaceClauses) {
		if (replaceClauses == null) {
			currentReplaceableReplacements = null;
		} else {
			final int length = replaceClauses.size();
			currentReplaceableReplacements = new CobolReplacementMapping[length];

			int i = 0;

			for (final ReplaceClauseContext replaceClause : replaceClauses) {
				final CobolReplacementMapping replaceableReplacement = new CobolReplacementMapping();

				replaceableReplacement.setReplaceable(replaceClause.replaceable());
				replaceableReplacement.setReplacement(replaceClause.replacement());

				currentReplaceableReplacements[i] = replaceableReplacement;
				i++;
			}
		}
	}

	public void write(final String text) {
		outputBuffer.append(text);
	}
}
