/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.flavors;

import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.List;

/**
 * The result of flavor processing
 */
@Value
public class FlavorOutcome {
  String text;
  List<Node> flavorNodes;
}
