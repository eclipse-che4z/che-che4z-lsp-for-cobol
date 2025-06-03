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
package org.eclipse.lsp.cobol.lsp.jrpc;

import com.google.gson.JsonObject;
import java.util.concurrent.CompletableFuture;
import lombok.NonNull;
import org.eclipse.lsp4j.jsonrpc.services.JsonNotification;
import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;

/** Java independent COBOL dialect server API * */
public interface DialectServerApi {
  /**
   * Process the copybook
   *
   * @param json is a request json object
   * @return copybook content and uri object
   */
  @JsonRequest("dialect/resolveCopybook")
  CompletableFuture<CopybookResolutionResult> resolveCopybook(@NonNull JsonObject json);

  /**
   * Change the document fragment with given location to the provided text
   *
   * @param json is a notification json object
   */
  @JsonNotification("dialect/insertCopybook")
  void insertCopybook(@NonNull JsonObject json);

  /**
   * Finish dialect processing
   *
   * @param json is a notification json object
   */
  @JsonNotification("dialect/finish")
  void finish(@NonNull JsonObject json);
}
