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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.CobolPreprocessor;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysis;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProvider;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.util.PreprocessorStringUtils;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.analysis.InjectCodeAnalysisFactory.AnalysisTypes.*;
import static org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.providers.ContentProviderFactory.InjectContentType.*;

/**
 * Contains injectors that needs to be applied to different cobol program sections
 */
@Singleton
public class InjectService {
  private final InjectCodeAnalysisFactory analysisFactory;
  private final ContentProviderFactory contentProviderFactory;
  private final Multimap<String, Pair<String, String>> implicitCode;

  @Inject
  public InjectService(InjectCodeAnalysisFactory analysisFactory, ContentProviderFactory contentProviderFactory) {
    this.analysisFactory = analysisFactory;
    this.contentProviderFactory = contentProviderFactory;
    this.implicitCode = LinkedListMultimap.create();
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.LinkageSectionContext ctx) {
    List<InjectDescriptor> descriptors = new LinkedList<>(getDialectDescriptors(retrieveSectionName(ctx)));

    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(IMPLICIT);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(FILE);
    descriptors.add(new InjectDescriptor("DFHEIBLC", analysis, contentProvider));
    return descriptors;
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.ProcedureDivisionContext ctx) {
    return getDialectDescriptors(retrieveSectionName(ctx));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  @SuppressWarnings("unused")
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.WorkingStorageSectionContext ctx) {
    List<InjectDescriptor> descriptors = new LinkedList<>(getDialectDescriptors(retrieveSectionName(ctx)));

    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(IMPLICIT);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(FILE);
    descriptors.add((new InjectDescriptor("SPECIALREGISTERS", analysis, contentProvider)));
    return descriptors;
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.PlusplusIncludeStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(PANVALET);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.CopyStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(COPYBOOK);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  /**
   * Returns list of injectors that needs to be applied after the parsing context
   * @param ctx the parsing context
   * @return list of injectors
   */
  public List<InjectDescriptor> getInjectors(CobolPreprocessor.IncludeStatementContext ctx) {
    InjectCodeAnalysis analysis = analysisFactory.getInstanceFor(COPYBOOK);
    ContentProvider contentProvider = contentProviderFactory.getInstanceFor(RESOLVE_COPYBOOK);
    return ImmutableList.of(new InjectDescriptor(retrieveCopybookName(ctx.copySource()), analysis, contentProvider));
  }

  /**
   * Overrides current implicit code map
   * @param implicitCode container, containing implicit code for injection
   */
  public void setImplicitCode(Multimap<String, Pair<String, String>> implicitCode) {
    this.implicitCode.clear();
    this.implicitCode.putAll(implicitCode);
  }

  private String retrieveCopybookName(ParserRuleContext ctx) {
    return PreprocessorStringUtils.trimQuotes(ctx.getText().toUpperCase());
  }

  private String retrieveSectionName(ParserRuleContext ctx) {
    return ctx.getStart().getText().toUpperCase();
  }

  private List<InjectDescriptor> getDialectDescriptors(String sectionName) {
    Collection<Pair<String, String>> codeToInject = implicitCode.get(sectionName);
    if (codeToInject == null) {
      return ImmutableList.of();
    }
    return codeToInject.stream()
        .map(p -> {
          String name = p.getKey();
          String code = p.getValue();
          InjectCodeAnalysis injectCodeAnalysis = analysisFactory.getInstanceFor(IMPLICIT);
          ContentProvider contentProvider = (copybookConfig, copybookName, programDocumentUri, documentUri) ->
              Optional.of(new CopybookModel(copybookName, ImplicitCodeUtils.createFullUrl(copybookName.getQualifiedName()), code));
          return new InjectDescriptor(name, injectCodeAnalysis, contentProvider);
        })
        .collect(Collectors.toList());
  }
}
