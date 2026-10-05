/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult;

import java.util.List;
import lombok.Value;
import org.eclipse.lsp4j.Location;

/** Variable definition with its usages */
@Value
public class VariableDto {
  String name;
  Location definition;
  List<Location> usages;
}
