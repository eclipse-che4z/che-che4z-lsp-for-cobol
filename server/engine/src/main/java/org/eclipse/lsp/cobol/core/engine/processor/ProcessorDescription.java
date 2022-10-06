/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processor;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.eclipse.lsp.cobol.core.model.tree.Node;

/**
 * AST Processor descriptor class
 */
@Data
@AllArgsConstructor
public class ProcessorDescription {
    Class<? extends Node> nodeClass;
    ProcessingPhase phase;
    Processor<? extends Node> processor;
}
