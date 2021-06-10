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

package org.eclipse.lsp.cobol.jrpc;

import com.google.gson.JsonObject;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp4j.jsonrpc.services.JsonRequest;
import org.eclipse.lsp4j.jsonrpc.services.JsonSegment;

import java.util.concurrent.CompletableFuture;


/**
 * This interface describes endpoints for extended API
 */
@JsonSegment("extended")
public interface ExtendedApi {
  /**
   * Processes client request
   * @param json represents the request object in the json format
   * @return Future object with retrieved analysis result
  */
  @JsonRequest
  CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json);
}
