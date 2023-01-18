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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.DocumentMap;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.PreprocessorStack;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.CopybookContentProvider;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

import java.util.List;
import java.util.Map;

/** This interface defines a common API for all the implementation of the copybook analysis logic */
public interface InjectCodeAnalysis {
  /**
   * Inject cobol code to the specified place
   *
   * @param copybookContentProvider the provider that reads an injected code source for injection
   * @param injectedSourceName the name of the injected object
   * @param context the context of the statement
   * @param copySource the context of the copybook name
   * @param config the configuration required for the copybook analysis
   * @param documentUri uri of the current document
   * @param hierarchy copybook hierarchy
   * @param stack processing stack
   * @param copybooksRepository a copybook repository
   * @param nestedMappings mapping data
   * @param documentMap current document map
   * @param errors a collection to accumulate errors
   */
   void injectCode(CopybookContentProvider copybookContentProvider,
                         CopybookName injectedSourceName,
                         ParserRuleContext context,
                         ParserRuleContext copySource,
                         CopybookConfig config,
                         String documentUri,
                         CopybookHierarchy hierarchy,
                         PreprocessorStack stack,
                         CopybooksRepository copybooksRepository,
                         Map<String, DocumentMapping> nestedMappings,
                         DocumentMap documentMap,
                         List<SyntaxError> errors);
}
