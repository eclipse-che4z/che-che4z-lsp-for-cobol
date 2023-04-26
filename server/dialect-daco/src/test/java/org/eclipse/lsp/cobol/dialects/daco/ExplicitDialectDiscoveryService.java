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
package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectDiscoveryService;
import org.eclipse.lsp.cobol.dialects.idms.IdmsDialect;

import java.net.URI;
import java.util.List;

/**
 * Explicit dialect discovery service
 */
public class ExplicitDialectDiscoveryService implements DialectDiscoveryService {
  @Override
  public List<CobolDialect> loadDialects(CopybookService copybookService, MessageService messageService) {
    return ImmutableList.of(new IdmsDialect(copybookService, messageService), new DaCoDialect(copybookService, messageService));
  }

  @Override
  public List<CobolDialect> loadDialects(URI uri, CopybookService copybookService, MessageService messageService) {
    return ImmutableList.of();
  }

  @Override
  public void registerExecuteCommandCapabilities(List<String> capabilities, String id) {}

  @Override
  public void unregisterExecuteCommandCapabilities(String id) {}

  @Override
  public void registerDialectCodeActionProviders(List<CodeActionProvider> providers) {}
}
