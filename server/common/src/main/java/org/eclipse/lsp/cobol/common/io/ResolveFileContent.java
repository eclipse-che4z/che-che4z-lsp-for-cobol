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
 */ package org.eclipse.lsp.cobol.common.io;

import java.util.concurrent.CompletableFuture;

/** Interface to resolve content of a URI */
public interface ResolveFileContent {
  /**
   * resolve content of a passed URI
   *
   * @param uri
   * @return a {@link CompletableFuture} of the uri content
   */
  CompletableFuture<String> getFileContent(String uri);
}
