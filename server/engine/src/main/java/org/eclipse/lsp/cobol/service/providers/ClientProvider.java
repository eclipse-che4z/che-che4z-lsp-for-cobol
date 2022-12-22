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

package org.eclipse.lsp.cobol.service.providers;

import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import com.google.inject.Provider;
import com.google.inject.Singleton;
import lombok.NonNull;

@Singleton
public class ClientProvider implements Provider<CobolLanguageClient> {
  private CobolLanguageClient client;

  public void setClient(@NonNull CobolLanguageClient client) {
    this.client = client;
  }

  @Override
  public CobolLanguageClient get() {
    return client;
  }
}
