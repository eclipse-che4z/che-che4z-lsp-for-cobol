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
package org.eclipse.lsp.cobol.common.model.tree.variable;

import lombok.Value;

/**
 * The class represents value interval in COBOL. Including its THRU/THROUGH token. Examples: 88 SOME
 * values 4. =} [from: 4, to: null] 88 high-school values are 10 through 12. =} [from: 10, to: 12]
 */
@Value
public class ValueInterval {
  String from;
  String to;
  String thruToken;
}
