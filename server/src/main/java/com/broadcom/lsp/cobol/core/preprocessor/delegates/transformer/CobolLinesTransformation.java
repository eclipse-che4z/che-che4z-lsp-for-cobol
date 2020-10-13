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
package com.broadcom.lsp.cobol.core.preprocessor.delegates.transformer;

import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;

import java.util.List;

/**
 * Performs transformation operations on the given CobolLines. Requires FormatListener to raise or
 * manage format errors that may appear.
 */
public interface CobolLinesTransformation {

  ResultWithErrors<List<CobolLine>> transformLines(String documentURI, List<CobolLine> lines);
}
