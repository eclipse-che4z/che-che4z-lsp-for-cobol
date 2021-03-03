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

package org.eclipse.lsp.cobol.domain.event.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.eclipse.lsp4j.jsonrpc.validation.NonNull;

/**
 * This class represents a client event object that client sends to the server
 * to retrieve analysis result
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AnalysisResultEvent {
  @NonNull
  private String uri;
}
