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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.ReplacingService;

import java.util.EnumMap;
import java.util.Map;

/**
 * This factory builds and returns on demand instances of the {@link InjectCodeAnalysis} depending on
 * their {@link AnalysisTypes}
 */
@Singleton
public class InjectCodeAnalysisFactory {
  private final Map<AnalysisTypes, InjectCodeAnalysis> analysisInstances =
      new EnumMap<>(AnalysisTypes.class);

  @Inject
  public InjectCodeAnalysisFactory(
      TextPreprocessor preprocessor,
      MessageService messageService,
      ReplacingService replacingService) {
    analysisInstances.put(
        AnalysisTypes.COPYBOOK,
        new CopybookAnalysis(preprocessor, messageService, replacingService));
    analysisInstances.put(
        AnalysisTypes.PANVALET,
        new PanvaletAnalysis(preprocessor, messageService));
    analysisInstances.put(
        AnalysisTypes.IMPLICIT,
        new InjectCodeImplicitAnalysis(preprocessor, messageService));
  }

  /**
   * Get an instance of {@link InjectCodeAnalysis} bound to the provided {@link AnalysisTypes}
   *
   * @param type the type of the required instance
   * @return a specific extension of the {@link InjectCodeAnalysis}
   */
  public InjectCodeAnalysis getInstanceFor(AnalysisTypes type) {
    return analysisInstances.get(type);
  }

  /** An enumeration of all the supported copybook analysis implementations */
  public enum AnalysisTypes {
    COPYBOOK,
    PANVALET,
    IMPLICIT
  }
}
