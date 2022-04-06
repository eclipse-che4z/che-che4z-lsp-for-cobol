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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingService;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;

import java.util.EnumMap;
import java.util.Map;

/**
 * This factory builds and returns on demand instances of the {@link CopybookAnalysis} depending on
 * their {@link AnalysisTypes}
 */
@Singleton
public class CopybookAnalysisFactory {
  private final Map<AnalysisTypes, AbstractCopybookAnalysis> analysisInstances =
      new EnumMap<>(AnalysisTypes.class);

  @Inject
  public CopybookAnalysisFactory(
      TextPreprocessor preprocessor,
      CopybookService copybookService,
      MessageService messageService,
      ReplacingService replacingService) {
    analysisInstances.put(
        AnalysisTypes.COBOL,
        new CobolAnalysis(preprocessor, copybookService, messageService, replacingService));
    analysisInstances.put(
        AnalysisTypes.DIALECT,
        new DialectCopybookAnalysis(preprocessor, copybookService, messageService));
    analysisInstances.put(
        AnalysisTypes.SKIPPING,
        new SkippingAnalysis(preprocessor, copybookService, messageService));
    analysisInstances.put(
        AnalysisTypes.PANVALET,
        new PanvaletAnalysis(preprocessor, copybookService, messageService));
    analysisInstances.put(
        AnalysisTypes.PREDEFINED,
        new PredefinedCopybookAnalysis(preprocessor, copybookService, messageService));
  }

  /**
   * Get an instance of {@link CopybookAnalysis} bound to the provided {@link AnalysisTypes}
   *
   * @param type the type of the required instance
   * @return a specific extension of the {@link CopybookAnalysis}
   */
  public CopybookAnalysis getInstanceFor(AnalysisTypes type) {
    return analysisInstances.get(type);
  }

  /** An enumeration of all the supported copybook analysis implementations */
  public enum AnalysisTypes {
    COBOL,
    DIALECT,
    SKIPPING,
    PANVALET,
    PREDEFINED
  }
}
