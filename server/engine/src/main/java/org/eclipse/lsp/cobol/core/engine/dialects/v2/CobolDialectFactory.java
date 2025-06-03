/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects.v2;

import static org.eclipse.lsp.cobol.common.dialects.CobolDialect.*;

import com.google.inject.Inject;
import java.util.Optional;
import javax.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.DialectRegistryItem;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectDiscoveryService;

/** CobolDialect factory * */
@Slf4j
@Singleton
public class CobolDialectFactory {
  private final DialectDiscoveryService discoveryService;
  private final CopybookService copybookService;
  private final MessageService messageService;
  private final DialectProcessingManager dialectProcessingManager;

  @Inject
  public CobolDialectFactory(
      DialectProcessingManager dialectProcessingManager,
      DialectDiscoveryService discoveryService,
      CopybookService copybookService,
      MessageService messageService) {
    this.dialectProcessingManager = dialectProcessingManager;
    this.discoveryService = discoveryService;
    this.copybookService = copybookService;
    this.messageService = messageService;
  }

  /**
   * Created COBOL dialect based on the dialect registry item
   *
   * @param registryItem - Dialect Registry item
   * @return a new COBOL dialect object
   */
  public Optional<CobolDialect> create(DialectRegistryItem registryItem) {
    if (registryItem.getProtocolVersion() == COBOL_DIALECT_JAVA_VERSION) {
      return discoveryService
          .loadDialects(registryItem.getUri(), copybookService, messageService)
          .stream()
          .filter(d -> d.getName().equals(registryItem.getName()))
          .findFirst();
    }

    if (registryItem.getProtocolVersion() == COBOL_DIALECT_MODERN_VERSION) {
      return Optional.of(new CobolDialectV2(registryItem.getName(), dialectProcessingManager));
    }

    LOG.warn("Dialect {} was not found, skipped", registryItem.getName());
    return Optional.empty();
  }
}
