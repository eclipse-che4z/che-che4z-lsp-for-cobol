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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement;

import lombok.Value;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.model.Locality;

/**
 * Provides replacement functionality
 */
@Value
public class ReplacementContext {
  Pair<String, String> replacement;
  Locality locality;
}
