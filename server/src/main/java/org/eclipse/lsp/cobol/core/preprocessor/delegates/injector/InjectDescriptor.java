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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector;

import lombok.Value;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysis;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProvider;

/**
 * Contains necessary information for injecting the copybook to a cobol document
 */
@Value
public class InjectDescriptor {
  String injectedSourceName;
  InjectCodeAnalysis injectCodeAnalysis;
  ContentProvider contentProvider;
}
