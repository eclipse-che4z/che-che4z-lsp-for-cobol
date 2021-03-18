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

package org.eclipse.lsp.cobol.service;

import lombok.Value;
import org.eclipse.lsp4j.Location;

import java.util.*;

/**
 * Analysis result for Extended Api call
 */
@Value
public class ExtendedApiResult {
  Map<String, List<Location>> paragraphDefinitions;
  Map<String, List<Location>> paragraphUsages;
  Map<String, List<Location>> paragraphRange;
  Map<String, List<Location>> sectionDefinitions;
  Map<String, List<Location>> sectionUsages;
  Map<String, List<Location>> sectionRange;
}
