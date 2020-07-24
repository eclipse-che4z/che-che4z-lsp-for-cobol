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

package com.ca.lsp.core.cobol.model;

import com.broadcom.lsp.domain.common.model.Position;
import lombok.Value;

import java.util.List;
import java.util.Map;

@Value
public class DocumentMapping {
  List<Position> positions;
  Map<Integer, Integer> shifts;
}
