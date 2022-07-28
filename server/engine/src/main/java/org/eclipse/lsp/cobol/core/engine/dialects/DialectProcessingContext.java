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
package org.eclipse.lsp.cobol.core.engine.dialects;

import lombok.*;
import org.eclipse.lsp.cobol.core.engine.mapping.Mappable;
import org.eclipse.lsp.cobol.core.engine.mapping.TextTransformations;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/** Contains all needed data for dialect processing */
@Value
@EqualsAndHashCode(callSuper = true)
@Builder(toBuilder = true)
public class DialectProcessingContext extends Mappable {
  CopybookConfig copybookConfig;
  String programDocumentUri;

  @Getter(AccessLevel.PROTECTED)
  @Setter(AccessLevel.NONE)
  TextTransformations textTransformations;
}
