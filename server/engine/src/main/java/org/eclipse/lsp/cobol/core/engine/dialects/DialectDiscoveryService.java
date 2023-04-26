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

import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;

import java.net.URI;
import java.util.List;

/**
 * Discover cobol dialects registered in the system
 */
public interface DialectDiscoveryService extends DialectExecuteCommandCapabilityService {
  /**
   * Load cobol dialects
   * @param copybookService a copybook service
   * @param messageService a message service
   * @return a list of loaded dialects
   */
  List<CobolDialect> loadDialects(CopybookService copybookService, MessageService messageService);

  /**
   * Load cobol dialects from the given path
   * @param uri is a URI to the dialect's jar file
   * @param copybookService a copybook service
   * @param messageService a message service
   * @return a list of loaded dialects
   */
  List<CobolDialect> loadDialects(URI uri, CopybookService copybookService, MessageService messageService);
}
