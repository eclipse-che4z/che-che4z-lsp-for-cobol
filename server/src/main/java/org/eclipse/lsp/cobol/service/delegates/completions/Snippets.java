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
package org.eclipse.lsp.cobol.service.delegates.completions;

import com.google.inject.Singleton;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

/**
 * This class is a provider for Cobol Snippets
 */
@Singleton
public class Snippets extends CompletionStorage {
  @Override
  protected InputStream getInputStream(List<String> dialectList) {
    return new ByteArrayInputStream(new byte[0]);
  }
}
