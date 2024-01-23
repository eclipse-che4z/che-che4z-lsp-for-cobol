/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.common.dialects;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import java.util.*;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.CompilerDirectiveNode;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;

/** A COBOL dialect */
public interface CobolDialect {
  String FILLER = "\u200B";
  /**
   * Gets the name of the dialect
   * @return the name of the dialect
   */
  String getName();

  /**
   * Processing the text
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  default ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    return new ResultWithErrors<>(new DialectOutcome(context), ImmutableList.of());
  }

  /**
   * Get document extension data from dialect. This data should be added to an argument.
   *
   * @param context data related to dialect processing
   * @return a list of syntax errors
   */
  default List<SyntaxError> extend(DialectProcessingContext context) {
    return ImmutableList.of();
  }

  /**
   * Return a list of processor descriptors.
   *
   * @return a list of processor descriptors for the dialect
   */
  default List<ProcessorDescription> getProcessors() {
    return Collections.emptyList();
  }

  /**
   * Define a order for dialect execution
   *
   * @return set of dialect processors, that should follow this one
   */
  default Set<String> runBefore() {
    return ImmutableSet.of();
  }

  /**
   * Returns dialect keywords map where key is a keyword and a value is a description
   *
   * @return key/value map with keywords and descriptions
   */
  default Map<String, String> getKeywords() {
    return ImmutableMap.of();
  }

  /**
   * Return a list of settings sections for dialect.
   *
   * @return a list of settings sections
   */
  default List<String> getSettingsSections() {
    return ImmutableList.of();
  }

  /**
   * Return a list of settings sections that hold dialect folders
   *
   * @return a list of settings sections
   */
  default List<String> getWatchingFolderSettings() {
    return ImmutableList.of();
  }

  /**
   * Return a list of dialect specific server execute command capabilities.
   *
   * <p>These capabilities correspond to workspace/executeCommand request which is sent from the
   * client to the server to trigger command execution on the server.
   *
   * @return a list of server execute command capabilities
   */
  default List<String> getDialectExecuteCommandCapabilities() {
    return ImmutableList.of();
  }

  /**
   * Return a list of handlers for the dialect specific server execute command capabilities.
   *
   * <p>These handlers handle custom request which are registered via workspace/executeCommand
   *
   * @return a list of {@link CodeActionProvider}
   */
  default List<CodeActionProvider> getDialectCodeActionProviders() {
    return ImmutableList.of();
  }

  /**
   * Returns a list of predefined dialect specific copybook model. These predefined copybooks could
   * be used like a regular copybook
   * @param ctx is a {@link AnalysisConfig} class with all configurations
   * @return a list of {@link CopybookModel}
   */
  default List<CopybookModel> getPredefinedCopybook(AnalysisConfig ctx) {
    return ImmutableList.of();
  }

  /**
   * Returns the list of {@link CompilerDirectiveNode} specific to the dialect
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return a list of {@link CompilerDirectiveNode}
   */
  default List<CompilerDirectiveNode> getCompilerDirectives(DialectProcessingContext context) {
    return ImmutableList.of();
  }
}
