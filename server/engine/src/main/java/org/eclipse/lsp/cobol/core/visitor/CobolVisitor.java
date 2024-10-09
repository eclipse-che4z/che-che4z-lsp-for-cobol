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

package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.*;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToBooleanStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetToOnOffStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.SetUpDownByStatement;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode.Builder;
import org.eclipse.lsp.cobol.common.model.variables.DivisionType;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors.CobolDataDivisionVisitor;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors.CobolIdentificationDivisionVisitor;
import org.eclipse.lsp.cobol.dialects.ibm.experimental.visitors.CobolProcedureDivisionVisitor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.slf4j.Logger;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.Lexer.HIDDEN;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;
import static org.eclipse.lsp.cobol.common.VariableConstants.*;
import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.core.visitor.MappingUtils.retrieveLocality;
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.*;

/**
 * This extension of {@link CobolParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link CobolParser}. It requires a semantic context with defined
 * elements to add the usages or throw a warning on an invalid definition. If there is a misspelled
 * keyword, the visitor finds it and throws a warning.
 */
public class CobolVisitor extends CobolParserBaseVisitor<List<Node>> {
  private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(CobolVisitor.class);
  protected final List<SyntaxError> errors = new ArrayList<>();
  protected final CopybooksRepository copybooks;
  protected final CommonTokenStream tokenStream;
  protected final ExtendedDocument extendedDocument;
  protected final MessageService messageService;
  protected final SubroutineService subroutineService;
  protected final CobolProgramLayout programLayout;

  protected Map<String, FileControlEntryContext> fileControls = null;
  private final Map<String, SubroutineDefinition> subroutineDefinitionMap = new HashMap<>();
  protected final CachingConfigurationService cachingConfigurationService;

  private final TextExtractionState text;

  public CobolVisitor(
          @NonNull CopybooksRepository copybooks,
          @NonNull CommonTokenStream tokenStream,
          @NonNull ExtendedDocument extendedDocument,
          MessageService messageService,
          SubroutineService subroutineService,
          CachingConfigurationService cachingConfigurationService,
          CobolProgramLayout programLayout) {
    this.copybooks = copybooks;
    this.tokenStream = tokenStream;
    this.extendedDocument = extendedDocument;
    this.messageService = messageService;
    this.subroutineService = subroutineService;
    this.cachingConfigurationService = cachingConfigurationService;
    this.programLayout = programLayout;
    this.text = new TextExtractionState(extendedDocument);
  }

  @Override
  public List<Node> visitStartRule(StartRuleContext ctx) {
    // we can skip the other nodes, but not the root
    try {
      return ImmutableList.of(
            retrieveLocality(ctx, extendedDocument, copybooks)
                    .map(RootNode::new)
                    .map(
                            rootNode -> {
                              visitChildren(ctx).forEach(rootNode::addChild);
                              return rootNode;
                            })
                    .orElseGet(
                            () -> {
                              LOG.warn("The root node for syntax tree was not constructed");
                              return new RootNode();
                            }));
    } finally {
      text.flush();
    }
  }

  @Override
  public List<Node> visitIdentificationDivision(IdentificationDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
            ctx, location -> new DivisionNode(location, DivisionType.IDENTIFICATION_DIVISION));
  }

  @Override
  public List<Node> visitProgramIdParagraph(ProgramIdParagraphContext ctx) {
    List<Node> result = new ArrayList<>();
    ofNullable(ctx.programName())
        .map(RuleContext::getText)
        .map(StringUtils::trimQuotes)
        .ifPresent(
            name -> retrieveLocality(ctx, extendedDocument, copybooks)
                .ifPresent(locality -> result.add(new ProgramIdNode(locality, name, ProgramSubtype.Program))));
    return result;
  }

  private List<Node> makeFunctionReferenceNodes(FunctionNameContext fnCtx) {
    if (fnCtx == null)
      return ImmutableList.of();

    String name = fnCtx.getText();

    return retrieveLocality(fnCtx, extendedDocument, copybooks)
        .map(l -> new FunctionReference(l, name))
        .map(Node.class::cast)
        .map(n -> ImmutableList.of(n))
        .orElse(ImmutableList.of());
  }

  @Override
  public List<Node> visitFunctionReference(FunctionReferenceContext ctx) {
    return makeFunctionReferenceNodes(ctx.functionName());
  }

  @Override
  public List<Node> visitFunctionIdParagraph(FunctionIdParagraphContext ctx) {
    List<Node> result = new ArrayList<>();
    ofNullable(ctx.programName())
        .map(RuleContext::getText)
        .map(StringUtils::trimQuotes)
        .ifPresent(
            name -> retrieveLocality(ctx, extendedDocument, copybooks)
                .ifPresent(locality -> result.add(new ProgramIdNode(locality, name, ProgramSubtype.Function))));
    return result;
  }

  @Override
  public List<Node> visitProcedureDivision(ProcedureDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
        ctx, location -> new ProcedureDivisionNode(location,
            retrieveLocality(ctx.dot_fs(), extendedDocument, copybooks)
                .map(x -> location.toBuilder().range(new Range(location.getRange().getStart(), x.getRange().getEnd()))
                    .build())));
  }

  @Override
  public List<Node> visitEnvironmentDivision(EnvironmentDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(
            ctx, location -> new DivisionNode(location, DivisionType.ENVIRONMENT_DIVISION));
  }

  @Override
  public List<Node> visitDataDivision(DataDivisionContext ctx) {
    areaAWarning(ctx.getStart());
    return addTreeNode(ctx, location -> new DivisionNode(location, DivisionType.DATA_DIVISION));
  }

  @Override
  public List<Node> visitDataDivisionSection(DataDivisionSectionContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitEnvironmentDivisionBody(EnvironmentDivisionBodyContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitProcedureSectionHeader(ProcedureSectionHeaderContext ctx) {
    areaAWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitWorkingStorageSection(WorkingStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.WORKING_STORAGE));
  }

  private Position extractLastPosition(FunctionDetailsContext ctx) {
    if (ctx == null)
      return null;
    List<IdentificationDivisionBodyContext> idDetails = ctx.identificationDivisionBody();
    if (!idDetails.isEmpty())
      return extractEndPosition(idDetails.get(idDetails.size() - 1));
    if (ctx.functionIdParagraph() != null)
      return extractEndPosition(ctx.functionIdParagraph());
    return null;
  }

  private Position extractIdentificationEndPosition(ProgramDetailsContext ctx) {
    if (ctx == null)
      return null;
    List<IdentificationDivisionBodyContext> idDetails = ctx.identificationDivisionBody();
    if (!idDetails.isEmpty())
      return extractEndPosition(idDetails.get(idDetails.size() - 1));
    if (ctx.programIdParagraph() != null)
      return extractEndPosition(ctx.programIdParagraph());
    return null;
  }

  private Position extractEndPosition(ParserRuleContext ctx) {
    if (ctx == null)
      return null;
    return getLocality(ctx.getStop()).map(x -> x.getRange().getEnd()).orElse(null);
  }

  private Node replaceRangeEnd(Node n, Position p) {
    if (p == null)
      return n;
    Locality l = n.getLocality();
    n.setLocality(l.toBuilder().range(new Range(l.getRange().getStart(), p)).build());
    return n;
  }

  private List<Node> adjustIdentificationDivision(List<Node> pgmNodes, Position lastPos) {
    if (pgmNodes.size() != 1)
      return pgmNodes;
    Node pgm = pgmNodes.get(0);
    Optional<Node> identification = pgm.getChildren().stream()
      .filter(n -> n instanceof DivisionNode && ((DivisionNode) n).getDivisionType() == DivisionType.IDENTIFICATION_DIVISION)
      .findFirst();
    Optional<Node> pgmNode = pgm.getChildren().stream().filter(n -> n instanceof ProgramIdNode).findFirst();

    if (!identification.isPresent())
      return pgmNodes;

    replaceRangeEnd(identification.get(), lastPos);

    if (pgmNode.isPresent()) {
      pgm.removeChild(pgmNode.get());
      identification.get().addChildAt(0, pgmNode.get());
    }

    return pgmNodes;
  }

  @Override
  public List<Node> visitProgramOrFunctionUnit(ProgramOrFunctionUnitContext ctx) {
    fileControls = new HashMap<>();
    text.reset();

    FunctionDetailsContext funcCtx = ctx.functionDetails();

    if (funcCtx != null)
      return adjustIdentificationDivision(
          addTreeNode(ctx, (l) -> new ProgramNode(l, ProgramSubtype.Function, ctx.getStart().getTokenIndex())),
          extractLastPosition(funcCtx));
    else
      return adjustIdentificationDivision(
          addTreeNode(ctx, (l) -> new ProgramNode(l, ProgramSubtype.Program, ctx.getStart().getTokenIndex())),
          extractIdentificationEndPosition(ctx.programDetails()));
  }

  @Override
  public List<Node> visitNestedProgramUnit(NestedProgramUnitContext ctx) {
    fileControls = new HashMap<>();
    text.reset();
    return adjustIdentificationDivision(
        addTreeNode(ctx, (l) -> new ProgramNode(l, ProgramSubtype.Program, ctx.getStart().getTokenIndex())),
        extractIdentificationEndPosition(ctx.programDetails()));
  }

  @Override
  public List<Node> visitProcedureSection(ProcedureSectionContext ctx) {
    throwWarning(ctx.getStart());

    String name = ctx.getStart().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx,
                                    locality ->
                                            new ProcedureSectionNode(locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitParagraph(ParagraphContext ctx) {
    areaAWarning(ctx.getStart());

    String name = ctx.paragraphDefinitionName().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx, locality -> new ParagraphNode(locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitSectionOrParagraph(SectionOrParagraphContext ctx) {
    if (isSection(ctx)) {
      throwWarning(ctx.getStart());
      return getLocality(ctx.getStart())
              .map(def -> addTreeNode(ctx, locality -> createSectionWithNameNode(locality, ctx, def)))
              .orElseGet(() -> visitChildren(ctx));
    } else {
      areaAWarning(ctx.getStart());
      return getLocality(ctx.getStart())
              .map(def -> addTreeNode(ctx, locality -> createParagraphWithNameNode(locality, ctx, def)))
              .orElseGet(() -> visitChildren(ctx));
    }
  }

  private ParagraphNode createParagraphWithNameNode(Locality locality, SectionOrParagraphContext ctx, Locality def) {
    String name = ctx.getStart().getText().toUpperCase();
    ParagraphNode paragraphNode = new ParagraphNode(locality, name, getIntervalText(ctx), def);
    text.update(paragraphNode, ctx.getStart());
    text.update(ctx.getStop());
    getLocality(ctx.getStart()).ifPresent(l -> paragraphNode.addChild(new ParagraphNameNode(l, name)));
    return paragraphNode;
  }

  private ProcedureSectionNode createSectionWithNameNode(Locality locality, SectionOrParagraphContext ctx, Locality def) {
    String name = ctx.getStart().getText().toUpperCase();
    ProcedureSectionNode section = new ProcedureSectionNode(locality, name, getIntervalText(ctx), def);
    text.update(section, ctx.getStart());
    text.update(ctx.getStop());
    getLocality(ctx.getStart()).ifPresent(l -> section.addChild(new SectionNameNode(l, name)));
    return section;
  }

  private boolean isSection(SectionOrParagraphContext ctx) {
    return ctx.SECTION() != null;
  }

  @Override
  public List<Node> visitFileDescriptionEntry(FileDescriptionEntryContext ctx) {
    if (ctx.fileDescriptionEntryClauses() == null) {
      return ImmutableList.of();
    }
    areaAWarning(ctx.getStart());
    String fileControlClause = "";
    String fileName = getName(ctx.fileDescriptionEntryClauses().cobolWord());
    if (fileControls.containsKey(fileName)) {
      FileControlEntryContext fileControlEntryContext = fileControls.remove(fileName);
      fileControlClause = getIntervalText(fileControlEntryContext.fileControlClauses());
    }

    return addTreeNode(
            VariableDefinitionNode.builder()
                    .level(LEVEL_FD_SD)
                    .variableNameAndLocality(
                            extractNameAndLocality(ctx.fileDescriptionEntryClauses().cobolWord()))
                    .statementLocality(
                            retrieveLocality(ctx.fileDescriptionEntryClauses().cobolWord(), extendedDocument, copybooks)
                                    .orElse(null))
                    .fileDescriptor(getIntervalText(ctx.fileDescriptionEntryClauses()))
                    .fileControlClause(fileControlClause)
                    .isSortDescription(Objects.nonNull(ctx.fileDescriptionEntryClauses().SD()))
                    .isExternal(isFDExternal(ctx))
                    .global(isFieldDescriptionEntryGlobal(ctx))
                    .build(),
            visitChildren(ctx));
  }

  private boolean isFDExternal(FileDescriptionEntryContext ctx) {
    return Objects.nonNull(ctx.fileDescriptionEntryClauses())
            && ctx.fileDescriptionEntryClauses()
            .fileDescriptionEntryClause()
            .stream()
            .map(FileDescriptionEntryClauseContext::externalClause)
            .anyMatch(Objects::nonNull);
  }

  private boolean isFieldDescriptionEntryGlobal(FileDescriptionEntryContext ctx) {
    return !ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause().isEmpty()
            && Objects.nonNull(
            ctx.fileDescriptionEntryClauses().fileDescriptionEntryClause(0).globalClause())
            && !ctx.fileDescriptionEntryClauses()
            .fileDescriptionEntryClause(0)
            .globalClause()
            .isEmpty();
  }

  @Override
  public List<Node> visitXmlParseStatement(XmlParseStatementContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.qualifiedDataName().getText(), retrieveLocality(ctx.qualifiedDataName(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality xmlValidatingContext = ofNullable(ctx.xmlValidating())
            .map(c -> new VariableNameAndLocality(c.getText(), retrieveLocality(c, extendedDocument, copybooks).orElse(null)))
            .orElse(null);

    VariableNameAndLocality xmlNationalContext = ofNullable(ctx.xmlNational())
            .map(c -> new VariableNameAndLocality(c.getText(), retrieveLocality(c, extendedDocument, copybooks).orElse(null)))
            .orElse(null);

    VariableNameAndLocality identifier2 = ofNullable(ctx.xmlValidating())
            .map(XmlValidatingContext::qualifiedDataName)
            .map(qualCtx -> new VariableNameAndLocality(qualCtx.getText(),
                    retrieveLocality(qualCtx, extendedDocument, copybooks).orElse(null)))
            .orElse(null);

    VariableNameAndLocality encodingLocality = ofNullable(ctx.xmlEncoding()).map(ctx2 ->
                    new VariableNameAndLocality(ctx2.integerLiteral().getText(), retrieveLocality(ctx2, extendedDocument, copybooks).orElse(null)))
            .orElse(null);

    ProcedureName procName = parseProcedureName(Optional.ofNullable(ctx.xmlProcessinProcedure())
            .map(XmlProcessinProcedureContext::procedureName)
            .orElse(null));

    ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
            .map(ThroughContext::procedureName)
            .orElse(null));

    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx.getParent(), extendedDocument, copybooks)
            .map(constructNode(locality ->
                    new XMLParseNode(
                            locality,
                            identifier1,
                            identifier2,
                            encodingLocality,
                            xmlValidatingContext,
                            xmlNationalContext,
                            procName,
                            thru), children))
            .orElse(children);
  }

  @Override
  public List<Node> visitOnExceptionClause(CobolParser.OnExceptionClauseContext ctx) {
    return addTreeNode(ctx, OnExceptionNode::new);
  }

  @Override
  public List<Node> visitNotOnExceptionClause(CobolParser.NotOnExceptionClauseContext ctx) {
    return addTreeNode(ctx, OnNotExceptionNode::new);
  }

  @Override
  public List<Node> visitUseStatement(CobolParser.UseStatementContext ctx) {
    return ctx.useDebugClause() != null
            ?
            addTreeNode(ctx, l -> new UseForDebuggingNode(l, null))
            :
            addTreeNode(ctx, UseNode::new);
  }

  /**
   * In this method, first condition is checking if there is any other element present on the same
   * line as DECLARATIVES token and throws an error if the condition is true; In the PROCEDURE
   * DIVISION, each of the keywords DECLARATIVES and END DECLARATIVES must begin in Area A and be
   * followed immediately by a separator period; no other text can appear on the same line. After
   * the keywords END DECLARATIVES, no text can appear before the following section header.
   */
  @Override
  public List<Node> visitProcedureDeclaratives(ProcedureDeclarativesContext ctx) {
    Token firstDeclarative = ctx.getStart();
    int firstDeclLine = firstDeclarative.getLine();

    if (!ctx.procedureDeclarative().isEmpty()) {
      Token declarativeBody = ctx.procedureDeclarative(0).getStart();
      if (declarativeBody.getType() == EOF) {
        // Error will be reported by parser
        return Collections.emptyList();
      }
      if (firstDeclLine == declarativeBody.getLine()) {
        getLocality(declarativeBody)
                .ifPresent(
                        locality ->
                                throwException(
                                        declarativeBody.getText(),
                                        locality,
                                        messageService.getMessage("CobolVisitor.declarativeSameMsg")));
      }
    }

    areaAWarning(firstDeclarative);

    ofNullable(ctx.END()).map(TerminalNode::getSymbol).ifPresent(this::areaAWarning);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitProcedureDeclarative(CobolParser.ProcedureDeclarativeContext ctx) {
    String name = ctx.getStart().getText().toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    def ->
                            addTreeNode(
                                    ctx,
                                    locality ->
                                            new DeclarativeProcedureSectionNode(
                                                    locality, name, getIntervalText(ctx), def)))
            .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitXmlGenerate(XmlGenerateContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.xmlGenIdentifier1().getText(), retrieveLocality(ctx.xmlGenIdentifier1(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality identifier2 = new VariableNameAndLocality(
            ctx.xmlGenIdentifier2().getText(), retrieveLocality(ctx.xmlGenIdentifier2(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality identifier3 = ofNullable(ctx.xmlGenIdentifier3()).map(iden3 -> new VariableNameAndLocality(
            iden3.getText(), retrieveLocality(iden3, extendedDocument, copybooks).orElse(null))).orElse(null);

    VariableNameAndLocality identifier4 = ofNullable(ctx.xmlGenIdentifier4()).map(iden4 -> new VariableNameAndLocality(
            iden4.getText(), retrieveLocality(iden4, extendedDocument, copybooks).orElse(null))).orElse(null);

    VariableNameAndLocality identifier5 = ofNullable(ctx.xmlGenIdentifier5()).map(iden5 -> new VariableNameAndLocality(
            iden5.getText(), retrieveLocality(iden5, extendedDocument, copybooks).orElse(null))).orElse(null);

    List<VariableNameAndLocality> identifier6 = ctx.xmlGenIdentifier6().isEmpty()
            ? null
            : ctx.xmlGenIdentifier6().stream()
            .map(iden6 -> new VariableNameAndLocality(iden6.getText(), retrieveLocality(iden6, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier7 = ctx.xmlGenIdentifier7().isEmpty()
            ? null
            : ctx.xmlGenIdentifier7().stream()
            .map(iden7 -> new VariableNameAndLocality(iden7.getText(), retrieveLocality(iden7, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier8 = ctx.xmlGenIdentifier6().isEmpty()
            ? null
            : ctx.xmlGenIdentifier8().stream()
            .map(iden8 -> new VariableNameAndLocality(iden8.getText(), retrieveLocality(iden8, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    return addTreeNode(
            ctx,
            locality ->
                    new XmlGenerateNode(
                            locality,
                            identifier1,
                            identifier2,
                            identifier3,
                            identifier4,
                            identifier5,
                            identifier6,
                            identifier7,
                            identifier8
                    ));

  }

  @Override
  public List<Node> visitEndProgramStatement(EndProgramStatementContext ctx) {
    areaAWarning(ctx.getStart());
    return ofNullable(ctx.programName())
            .map(ParserRuleContext::getStart)
            .map(Token::getText)
            .map(StringUtils::trimQuotes)
            .map(id -> addTreeNode(ctx.programName(), locality -> new ProgramEndNode(locality, id)))
            .orElse(ImmutableList.of());
  }

  @Override
  public List<Node> visitEndFunctionStatement(EndFunctionStatementContext ctx) {
    areaAWarning(ctx.getStart());
    return ofNullable(ctx.programName())
            .map(ParserRuleContext::getStart)
            .map(Token::getText)
            .map(StringUtils::trimQuotes)
            .map(id -> addTreeNode(ctx.programName(), locality -> new ProgramEndNode(locality, id)))
            .orElse(ImmutableList.of());
  }

  @Override
  public List<Node> visitConfigurationSection(ConfigurationSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.CONFIGURATION));
  }

  @Override
  public List<Node> visitInputOutputSection(InputOutputSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.INPUT_OUTPUT));
  }

  @Override
  public List<Node> visitFileControlEntry(FileControlEntryContext ctx) {
    String filename = VisitorHelper.getName(ctx.selectClause().fileName());
    if (org.apache.commons.lang3.StringUtils.isNotBlank(filename)) {
      String fileControlClause = getIntervalText(ctx.fileControlClauses());
      checkFileControlUniqueness(ctx, filename);
      return addTreeNode(ctx, locality -> new FileEntryNode(locality, filename, fileControlClause));
    }
    return addTreeNode(ctx, locality -> new FileEntryNode(locality, filename, ""));
  }

  @Override
  public List<Node> visitJsonParse(JsonParseContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.jsonIdentifier1().getText(), retrieveLocality(ctx.jsonIdentifier1(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality identifier2 = new VariableNameAndLocality(
            ctx.jsonIdentifier2().getText(), retrieveLocality(ctx.jsonIdentifier2(), extendedDocument, copybooks).orElse(null));

    List<VariableNameAndLocality> identifier3 = ctx.jsonIdentifier3().isEmpty()
            ? null
            : ctx.jsonIdentifier3().stream()
            .map(iden3 -> new VariableNameAndLocality(iden3.getText(), retrieveLocality(iden3, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier4 = ctx.jsonIdentifier4().isEmpty()
            ? null
            : ctx.jsonIdentifier4().stream()
            .map(iden4 -> new VariableNameAndLocality(iden4.getText(), retrieveLocality(iden4, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier5 =
            ctx.json_parse_phrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().stream()
                    .map(Json_parse_phrase1Context::jsonIdentifier5)
                    .filter(Objects::nonNull)
                    .map(idctx -> new VariableNameAndLocality(idctx.getText(), retrieveLocality(idctx, extendedDocument, copybooks).orElse(null)))
                    .collect(Collectors.toList());

    List<VariableNameAndLocality> conditionName =
            ctx.json_parse_phrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().get(0).callUsingPhrase1().isEmpty()
                    ? null
                    : ctx.json_parse_phrase1().get(0).callUsingPhrase1().jsonConditionName().stream()
                    .map(
                            context ->
                                    new VariableNameAndLocality(
                                            context.getText(), retrieveLocality(context, extendedDocument, copybooks).orElse(null)))
                    .collect(toList());

    boolean isOmitted = Objects.nonNull(ctx.OMITTED()) && !ctx.OMITTED().isEmpty();

    return addTreeNode(
            ctx,
            locality ->
                    new JsonParseNode(
                            locality,
                            identifier1,
                            identifier2,
                            identifier3,
                            identifier4,
                            identifier5,
                            conditionName,
                            isOmitted));
  }

  @Override
  public List<Node> visitJsonGenerate(JsonGenerateContext ctx) {
    VariableNameAndLocality identifier1 = new VariableNameAndLocality(
            ctx.jsonGenIdentifier1().getText(), retrieveLocality(ctx.jsonGenIdentifier1(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality identifier2 = new VariableNameAndLocality(
            ctx.jsonGenIdentifier2().getText(), retrieveLocality(ctx.jsonGenIdentifier2(), extendedDocument, copybooks).orElse(null));

    VariableNameAndLocality identifier3 = Optional.ofNullable(ctx.jsonGenIdentifier3())
            .map(iden3 -> new VariableNameAndLocality(iden3.getText(), retrieveLocality(iden3, extendedDocument, copybooks).orElse(null)))
            .orElse(null);

    List<VariableNameAndLocality> identifier4 = ctx.jsonGenIdentifier4().isEmpty()
            ? null
            : ctx.jsonGenIdentifier4().stream()
            .map(iden4 -> new VariableNameAndLocality(iden4.getText(), retrieveLocality(iden4, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<VariableNameAndLocality> identifier5 = ctx.jsonGenIdentifier5().isEmpty()
            ? null
            : ctx.jsonGenIdentifier5().stream()
            .map(iden5 -> new VariableNameAndLocality(iden5.getText(), retrieveLocality(iden5, extendedDocument, copybooks).orElse(null)))
            .collect(Collectors.toList());

    List<JsonGenerateNode.JsonGenPhase> phases = ctx.json_gen_phrase1().isEmpty()
            ? null
            : ctx.json_gen_phrase1().stream()
            .filter(idctx -> Objects.nonNull(idctx.jsonGenIdentifier6()))
            .map(idctx -> new JsonGenerateNode.JsonGenPhase(
                    new VariableNameAndLocality(idctx.jsonGenIdentifier6().getText(),
                            retrieveLocality(idctx.jsonGenIdentifier6(), extendedDocument, copybooks).orElse(null)),
                    Objects.nonNull(idctx.jsonGenConditionName()) ? new VariableNameAndLocality(idctx.jsonGenConditionName().getText(),
                            retrieveLocality(idctx.jsonGenConditionName(), extendedDocument, copybooks).orElse(null)) : null
            ))
            .collect(Collectors.toList());

    return addTreeNode(
            ctx,
            locality ->
                    new JsonGenerateNode(
                            locality,
                            identifier1,
                            identifier2,
                            identifier3,
                            identifier4,
                            identifier5,
                            phases));
  }

  private void checkFileControlUniqueness(FileControlEntryContext ctx, String filename) {
    getLocality(ctx.selectClause().fileName().getStart())
            .ifPresent(
                    locality -> {
                      if (fileControls.containsKey(filename.toUpperCase())) {
                        SyntaxError error =
                                SyntaxError.syntaxError()
                                        .errorSource(ErrorSource.PARSING)
                                        .suggestion(
                                                messageService.getMessage("CobolVisitor.duplicateFileName", filename))
                                        .severity(ErrorSeverity.ERROR)
                                        .location(locality.toOriginalLocation())
                                        .build();
                        errors.add(error);
                        LOG.debug("Syntax error by CobolVisitor#visitSelectClause: {}", error);
                      } else {
                        fileControls.put(filename.toUpperCase(), ctx);
                      }
                    });
  }

  @Override
  public List<Node> visitFileSection(FileSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.FILE));
  }

  @Override
  public List<Node> visitLinkageSection(LinkageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LINKAGE));
  }

  @Override
  public List<Node> visitLocalStorageSection(LocalStorageSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.LOCAL_STORAGE));
  }

  @Override
  public List<Node> visitSectionName(SectionNameContext ctx) {
    return addTreeNode(
            ctx, locality -> new SectionNameNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitStatement(StatementContext ctx) {
    areaBWarning(ctx);
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  protected boolean expectedInAriaA(ParserRuleContext ctx) {
    // https://www.ibm.com/docs/en/cobol-zos/6.4?topic=format-area
    //    Certain items must begin in Area A:
    //    Division headers

    if (ctx instanceof IdentificationDivisionContext) {
      return true;
    }
    if (ctx instanceof EnvironmentDivisionContext) {
      return true;
    }
    if (ctx instanceof DataDivisionContext) {
      return true;
    }
    if (ctx instanceof ProcedureDeclarativeContext) {
      return true;
    }
    //    Section headers
    //    Paragraph headers or paragraph names
    //    Level indicators or level-numbers (01 and 77)
    //    DECLARATIVES and END DECLARATIVES
    //    End program, end class, and end method markers
    return false;
  }

  @Override
  public List<Node> visitIfThen(IfThenContext ctx) {
    throwWarning(ctx.getStart());
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIfElse(IfElseContext ctx) {
    throwWarning(ctx.getStart());
    return addTreeNode(ctx, IfElseNode::new);
  }

  @Override
  public List<Node> visitOpenInputStatement(OpenInputStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (OpenInputContext openInputContext : ctx.openInput()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(openInputContext.fileName().getText().toUpperCase(),
                      retrieveLocality(openInputContext.fileName(), extendedDocument, copybooks).orElse(null));
      nodes.addAll(addTreeNode(ctx, locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.INPUT)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenOutputStatement(OpenOutputStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (OpenOutputContext openOutputContext : ctx.openOutput()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(openOutputContext.fileName().getText().toUpperCase(),
                      retrieveLocality(openOutputContext.fileName(), extendedDocument, copybooks).orElse(null));
      nodes.addAll(addTreeNode(openOutputContext,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.OUTPUT)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenIOStatement(OpenIOStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (FileNameContext fileNameContext : ctx.fileName()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(fileNameContext.getText().toUpperCase(),
                      retrieveLocality(fileNameContext, extendedDocument, copybooks).orElse(null));
      nodes.addAll(addTreeNode(ctx,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.I_O)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitOpenExtendStatement(OpenExtendStatementContext ctx) {
    List<Node> nodes = new ArrayList<>();
    for (FileNameContext fileNameContext : ctx.fileName()) {
      VariableNameAndLocality fileNameLocality =
              new VariableNameAndLocality(fileNameContext.getText().toUpperCase(),
                      retrieveLocality(fileNameContext, extendedDocument, copybooks).orElse(null));
      nodes.addAll(addTreeNode(ctx,
              locality -> new OpenStatementNode(locality, fileNameLocality, FileOperationKind.EXTEND)));
    }
    return nodes;
  }

  @Override
  public List<Node> visitReadStatement(ReadStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.readFilenameClause().fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.readFilenameClause().fileName(), extendedDocument, copybooks).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.READ_STATEMENT));
  }

  @Override
  public List<Node> visitWriteStatement(WriteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.writeStatementClause().recordName().getText().toUpperCase(),
                    retrieveLocality(ctx.writeStatementClause().recordName(), extendedDocument, copybooks).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.WRITE_STATEMENT));
  }

  @Override
  public List<Node> visitRewriteStatement(RewriteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.recordName().getText().toUpperCase(),
                    retrieveLocality(ctx.recordName(), extendedDocument, copybooks).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.REWRITE_STATEMENT));
  }

  @Override
  public List<Node> visitDeleteStatement(DeleteStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.deleteFilenameClause().fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.deleteFilenameClause().fileName(), extendedDocument, copybooks).orElseGet(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.DELETE_STATEMENT));
  }

  @Override
  public List<Node> visitStartStatement(StartStatementContext ctx) {
    VariableNameAndLocality fileNameLocality =
            new VariableNameAndLocality(ctx.fileName().getText().toUpperCase(),
                    retrieveLocality(ctx.fileName(), extendedDocument, copybooks).orElse(null));
    return addTreeNode(ctx, locality -> new FileOperationStatementNode(locality, fileNameLocality, NodeType.START_STATEMENT));
  }

  @Override
  public List<Node> visitPerformInlineStatement(PerformInlineStatementContext ctx) {
    return addTreeNode(ctx, PerformNode::new);
  }

  @Override
  public List<Node> visitPerformProcedureStatement(PerformProcedureStatementContext ctx) {
    final ProcedureName targetName = parseProcedureName(ctx.procedureName());
    final ProcedureName thruName = parseProcedureName(Optional.ofNullable(ctx.through())
            .map(ThroughContext::procedureName)
            .orElse(null));

    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx.getParent().getParent(), extendedDocument, copybooks)
            .map(constructNode(locality -> new PerformNode(locality, targetName, thruName), children))
            .orElse(children);
  }

  @Override
  public List<Node> visitSentence(SentenceContext ctx) {
    throwWarning(ctx.getStart());
    text.update(ctx.getStop());
    return addTreeNode(ctx, SentenceNode::new);
  }

  @Override
  public List<Node> visitEvaluateWhenOther(EvaluateWhenOtherContext ctx) {
    throwWarning(ctx.getStart());
    return addTreeNode(ctx, EvaluateWhenOtherNode::new);
  }

  @Override
  public List<Node> visitParagraphName(ParagraphNameContext ctx) {
    return addTreeNode(
            ctx, locality -> new CodeBlockUsageNode(locality, VisitorHelper.getName(ctx)));
  }

  @Override
  public List<Node> visitRemarksParagraph(RemarksParagraphContext ctx) {
    return addTreeNode(ctx, RemarksNode::new);
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1(DataDescriptionEntryFormat1Context ctx) {
    return addTreeNode(
            VariableDefinitionNode.builder()
                    .level(getLevel(ctx.levelNumber().LEVEL_NUMBER()))
                    .levelLocality(getLevelLocality(ctx.levelNumber().LEVEL_NUMBER()))
                    .statementLocality(retrieveLocality(ctx, extendedDocument, copybooks).orElse(null))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .global(!ctx.dataGlobalClause().isEmpty())
                    .picClauses(retrievePicTextsOld(ctx.dataPictureClause()))
                    .valueClauses(retrieveValues(ctx.dataValueClause()))
                    .usageClauses(retrieveUsageFormatOld(ctx.dataUsageClause()))
                    .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
                    .redefinesClauses(
                            ctx.dataRedefinesClause().stream()
                                    .map(DataRedefinesClauseContext::dataName)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
                    .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
                    .signClause(!ctx.dataSignClause().isEmpty())
                    .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
                    .isJustified(!ctx.dataJustifiedClause().isEmpty())
                    .isUnBounded(
                            !ctx.dataOccursClause().isEmpty()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo()).isPresent()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo().UNBOUNDED())
                                    .isPresent())
                    .build(),
            visitChildren(ctx));
  }

  @Override
  public List<Node> visitEnvironmentSwitchNameClause(EnvironmentSwitchNameClauseContext ctx) {
    Locality locality =
            getLocality(
                    Optional.<ParserRuleContext>ofNullable(ctx.mnemonicName()).orElse(ctx).getStart())
                    .orElse(null);
    String name = ofNullable(ctx.mnemonicName()).map(RuleContext::getText).orElse(FILLER_NAME);
    String systemName = ctx.environmentName().getText();
    return addTreeNode(
            VariableDefinitionNode.builder()
                    .statementLocality(locality)
                    .variableNameAndLocality(new VariableNameAndLocality(name, locality))
                    .systemName(systemName)
                    .build(),
            visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat2(DataDescriptionEntryFormat2Context ctx) {
    Builder builder =
            VariableDefinitionNode.builder()
                    .level(LEVEL_66)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_66()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveLocality(ctx, extendedDocument, copybooks).orElse(null));
    ofNullable(ctx.dataRenamesClause())
            .map(
                    dataRenamesClauseContext ->
                            dataRenamesClauseContext.qualifiedVariableDataName().dataName().stream()
                                    .map(DataNameContext.class::cast)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
            .ifPresent(builder::renamesClause);
    ofNullable(ctx.dataRenamesClause())
            .map(DataRenamesClauseContext::thruDataName)
            .map(
                    thruDataNameContext ->
                            thruDataNameContext.qualifiedVariableDataName().dataName().stream()
                                    .map(DataNameContext.class::cast)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
            .ifPresent(builder::renamesThruClause);
    return addTreeNode(builder.build(), visitChildren(ctx));
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat3(DataDescriptionEntryFormat3Context ctx) {
    return ofNullable(ctx.dataValueClause())
            .map(DataValueClauseContext::valueIsToken)
            .map(
                    valueToken ->
                            addTreeNode(
                                    VariableDefinitionNode.builder()
                                            .level(LEVEL_88)
                                            .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_88()))
                                            .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                                            .statementLocality(retrieveLocality(ctx, extendedDocument, copybooks).orElse(null))
                                            .valueClauses(retrieveValues(ImmutableList.of(ctx.dataValueClause())))
                                            .valueToken(retrieveValueTokenOld(valueToken))
                                            .build(),
                                    visitChildren(ctx)))
            .orElse(ImmutableList.of());
  }

  @Override
  public List<Node> visitDataDescriptionEntryFormat1Level77(
          DataDescriptionEntryFormat1Level77Context ctx) {
    return addTreeNode(
            VariableDefinitionNode.builder()
                    .level(LEVEL_77)
                    .levelLocality(getLevelLocality(ctx.LEVEL_NUMBER_77()))
                    .variableNameAndLocality(extractNameAndLocality(ctx.entryName()))
                    .statementLocality(retrieveLocality(ctx, extendedDocument, copybooks).orElse(null))
                    .global(!ctx.dataGlobalClause().isEmpty())
                    .picClauses(retrievePicTextsOld(ctx.dataPictureClause()))
                    .valueClauses(retrieveValues(ctx.dataValueClause()))
                    .usageClauses(retrieveUsageFormatOld(ctx.dataUsageClause()))
                    .occursClauses(retrieveOccursValues(ctx.dataOccursClause()))
                    .redefinesClauses(
                            ctx.dataRedefinesClause().stream()
                                    .map(DataRedefinesClauseContext::dataName)
                                    .map(this::extractNameAndLocality)
                                    .collect(toList()))
                    .blankWhenZero(!ctx.dataBlankWhenZeroClause().isEmpty())
                    .signClause(!ctx.dataSignClause().isEmpty())
                    .isJustified(!ctx.dataJustifiedClause().isEmpty())
                    .isDynamicLength(!ctx.dataDynamicLengthClause().isEmpty())
                    .isUnBounded(
                            !ctx.dataOccursClause().isEmpty()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo()).isPresent()
                                    && ofNullable(ctx.dataOccursClause().get(0).dataOccursTo().UNBOUNDED())
                                    .isPresent())
                    .build(),
            visitChildren(ctx));
  }

  @Override
  public List<Node> visitSetUpDownByStatement(SetUpDownByStatementContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    List<Node> sendingField =
            ofNullable(ctx.sendingField()).map(this::visit).orElseGet(ImmutableList::of);
    List<Node> children = new ArrayList<>();
    children.addAll(receivingField);
    children.addAll(sendingField);
    if (sendingField.size() != 1) return children;
    SetUpDownByStatement statement =
            new SetUpDownByStatement(
                    retrieveLocality(ctx, extendedDocument, copybooks).orElse(null),
                    receivingField,
                    sendingField.get(0));
    return addTreeNode(statement, children);
  }

  @Override
  public List<Node> visitSetToOnOff(SetToOnOffContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    SetToOnOffStatement statement =
            new SetToOnOffStatement(retrieveLocality(ctx, extendedDocument, copybooks).orElse(null), receivingField);
    return addTreeNode(statement, receivingField);
  }

  @Override
  public List<Node> visitSetToBoolean(SetToBooleanContext ctx) {
    List<Node> receivingField =
            ctx.receivingField().stream().map(this::visit).flatMap(List::stream).collect(toList());
    SetToBooleanStatement statement =
            new SetToBooleanStatement(
                    retrieveLocality(ctx, extendedDocument, copybooks).orElse(null), receivingField);
    return addTreeNode(statement, receivingField);
  }

  @Override
  public List<Node> visitLiteral(LiteralContext ctx) {
    return addTreeNode(ctx, locality -> new LiteralNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitQualifiedDataName(QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(VariableUsageNameContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality, isVariableDefinitionMandatory(ctx)));
  }

  private boolean isVariableDefinitionMandatory(VariableUsageNameContext ctx) {
    Boolean isDataRecordClause = ofNullable(ctx.getParent())
            .map(ParserRuleContext::getParent)
            .map(DataRecordsClauseContext.class::isInstance)
            .orElse(false);
    return !isDataRecordClause;
  }

  @Override
  public List<Node> visitFileName(FileNameContext ctx) {
    return addTreeNode(
            ctx,
            locality -> {
              QualifiedReferenceNode reference = new QualifiedReferenceNode(locality);
              VariableUsageNode usage = new VariableUsageNode(getName(ctx), locality);
              reference.addChild(usage);
              return reference;
            });
  }

  @Override
  public List<Node> visitCallStatement(CallStatementContext ctx) {
    return addTreeNode(ctx, SubroutineNode::new);
  }

  @Override
  public List<Node> visitGoToStatement(GoToStatementContext ctx) {
    return addTreeNode(
            ctx,
            locality ->
                    new GoToNode(
                            locality,
                            ctx.procedureName().stream()
                                    .map(ProcedureNameContext::paragraphName)
                                    .map(ParserRuleContext::getText)
                                    .collect(toList())));
  }

  @Override
  public List<Node> visitExitStatement(ExitStatementContext ctx) {
    if (ctx.PROGRAM() != null) {
      return addTreeNode(ctx, StopNode::new);
    }
    if (ctx.SECTION() != null) {
      return addTreeNode(ctx, ExitSectionNode::new);
    }
    if (ctx.PARAGRAPH() != null) {
      return addTreeNode(ctx, ExitParagraphNode::new);
    }
    return addTreeNode(ctx, ExitNode::new);
  }

  @Override
  public List<Node> visitGobackStatement(GobackStatementContext ctx) {
    return addTreeNode(ctx, GoBackNode::new);
  }

  @Override
  public List<Node> visitStopStatement(StopStatementContext ctx) {
    return addTreeNode(ctx, StopNode::new);
  }

  @Override
  public List<Node> visitEvaluateStatement(EvaluateStatementContext ctx) {
    return addTreeNode(ctx, EvaluateNode::new);
  }

  @Override
  public List<Node> visitEvaluateWhen(EvaluateWhenContext ctx) {
    return addTreeNode(ctx, EvaluateWhenNode::new);
  }

  @Override
  public List<Node> visitIfStatement(IfStatementContext ctx) {
    return addTreeNode(ctx, IfNode::new);
  }

  @Override
  public List<Node> visitParagraphs(ParagraphsContext ctx) {
    return addTreeNode(ctx, ParagraphsNode::new);
  }

  @Override
  public List<Node> visitProcedureDivisionBody(ProcedureDivisionBodyContext ctx) {

    ParserRuleContext context = new ParserRuleContext();
    context.start = ctx.getParent().start;
    context.stop = ctx.stop;
    List<Node> children = visitChildren(ctx);
    try {
      return retrieveLocality(context, extendedDocument, copybooks)
              .map(constructNode(ProcedureDivisionBodyNode::new, children))
              .orElse(children);
    } finally {
      text.update(ctx.getStop());
      text.flush();
    }
  }

  @Override
  public List<Node> visitProcedureDivisionGivingClause(ProcedureDivisionGivingClauseContext ctx) {
    DataNameContext dt = ctx.dataName();
    Optional<Locality> locality = retrieveLocality(ctx, extendedDocument, copybooks);
    if (dt == null || !locality.isPresent()) return ImmutableList.of();
    VariableNameAndLocality nameAndLocality = extractNameAndLocality(dt);
    ProcedureDivisionReturningNode returningNode = new ProcedureDivisionReturningNode(locality.get(), nameAndLocality);
    VariableUsageNode variableUsageNode = new VariableUsageNode(nameAndLocality.getName(), nameAndLocality.getLocality());
    QualifiedReferenceNode qualifiedReferenceNode = new QualifiedReferenceNode(nameAndLocality.getLocality());
    qualifiedReferenceNode.addChild(variableUsageNode);
    returningNode.addChild(qualifiedReferenceNode);
    return ImmutableList.of(returningNode);
  }

  @Override
  public List<Node> visitParagraphDefinitionName(ParagraphDefinitionNameContext ctx) {
    return addTreeNode(ctx, locality -> new ParagraphNameNode(locality, ctx.getText()));
  }

  @Override
  public List<Node> visitConstantName(ConstantNameContext ctx) {
    String subroutineName = StringUtils.trimQuotes(ctx.getText()).toUpperCase();
    return getLocality(ctx.getStart())
            .map(
                    locality -> {
                      if (cachingConfigurationService.getSubroutineDirectories().size() > 0
                              && !subroutineService.getUri(subroutineName).isPresent()) {
                        reportSubroutineNotDefined(subroutineName, locality);
                      }
                      subroutineDefinitionMap.putIfAbsent(
                              subroutineName,
                              new SubroutineDefinition(
                                      getSubroutineLocation(
                                              new ImmutablePair<>(
                                                      subroutineName, subroutineService.getUri(subroutineName)))
                                              .stream()
                                              .findFirst()
                                              .orElseGet(
                                                      () ->
                                                              new Location(
                                                                      ImplicitCodeUtils.createSubroutineLocation(), new Range())),
                                      subroutineName));
                      SubroutineNameNode usage = new SubroutineNameNode(locality, subroutineName);
                      SubroutineDefinition foundDefinition = subroutineDefinitionMap.get(subroutineName);
                      foundDefinition.addUsages(usage);
                      usage.setDefinition(foundDefinition);
                      return ImmutableList.of((Node) usage);
                    })
            .orElseGet(ImmutableList::of);
  }

  // NOTE: CobolVisitor is not managed by Guice DI, so can't use annotation here.
  @Override
  public List<Node> visitChildren(RuleNode node) {
    checkInterruption();
    if (node.getClass().getEnclosingClass() == CobolIdentificationDivisionParser.class) {
      CobolIdentificationDivisionVisitor cobolIdentificationDivisionVisitor = new CobolIdentificationDivisionVisitor(extendedDocument, copybooks);
      List<Node> nodes = cobolIdentificationDivisionVisitor.visit(node);
      errors.addAll(cobolIdentificationDivisionVisitor.getErrors());
      return nodes;
    }
    if (node.getClass().getEnclosingClass() == CobolDataDivisionParser.class) {
      CobolDataDivisionVisitor cobolDataDivisionVisitor = new CobolDataDivisionVisitor(extendedDocument, copybooks, messageService, fileControls);
      List<Node> nodes = cobolDataDivisionVisitor.visit(node);
      errors.addAll(cobolDataDivisionVisitor.getErrors());
      return nodes;
    }
    if (node.getClass().getEnclosingClass() == CobolProcedureDivisionParser.class) {
      CobolProcedureDivisionVisitor cobolProcedureDivisionVisitor = new CobolProcedureDivisionVisitor(
              copybooks,
              tokenStream,
              extendedDocument,
              messageService,
              subroutineService,
              cachingConfigurationService,
              programLayout
      );
      List<Node> nodes = cobolProcedureDivisionVisitor.visit(node);
      errors.addAll(cobolProcedureDivisionVisitor.getErrors());
      return nodes;
    }
    return super.visitChildren(node);
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    List<Node> result = new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling
   * {@link #visitChildren} on {@code ctx}.</p>
   *
   * @param ctx
   */
  @Override
  public List<Node> visitAtEndPhrase(AtEndPhraseContext ctx) {
    return addTreeNode(ctx, AtEndNode::new);
  }

  @Override
  public List<Node> visitSortStatement(CobolParser.SortStatementContext ctx) {
    boolean ascending;
    String key;
    if (ctx.sortOnKeyClause() != null) {
      ascending = ctx.sortOnKeyClause().stream()
              .map(s -> s.ASCENDING() != null)
              .filter(b -> b)
              .findAny()
              .orElse(false);

      key = ctx.sortOnKeyClause().stream()
              .map(SortOnKeyClauseContext::KEY)
              .filter(Objects::nonNull)
              .map(ParseTree::getText)
              .findFirst()
              .orElse("");
    } else {
      ascending = false;
      key = "";
    }

    return addTreeNode(ctx, locality -> new SortNode(locality, ascending, key));
  }

  @Override
  public List<Node> visitMergeStatement(CobolParser.MergeStatementContext ctx) {
    boolean ascending;
    String key;
    if (ctx.mergeOnKeyClause() != null) {
      ascending = ctx.mergeOnKeyClause().stream()
              .map(s -> s.ASCENDING() != null)
              .filter(b -> b)
              .findAny()
              .orElse(false);

      key = ctx.mergeOnKeyClause().stream()
              .map(MergeOnKeyClauseContext::KEY)
              .filter(Objects::nonNull)
              .map(ParseTree::getText)
              .findFirst()
              .orElse("");
    } else {
      ascending = false;
      key = "";
    }

    return addTreeNode(ctx, locality -> new MergeNode(locality, ascending, key));
  }

  @Override
  public List<Node> visitInputProcedurePhrase(CobolParser.InputProcedurePhraseContext ctx) {
    final ProcedureName procName = parseProcedureName(ctx.procedureName());
    final ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
            .map(ThroughContext::procedureName)
            .orElse(null));

    Locality locality = retrieveLocality(ctx, extendedDocument, copybooks).orElse(null);
    InputNode node = new InputNode(locality);
    node.setTarget(procName);
    node.setThru(thru);

    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  @Override
  public List<Node> visitOutputProcedurePhrase(CobolParser.OutputProcedurePhraseContext ctx) {
    final ProcedureName procName = parseProcedureName(ctx.procedureName());
    final ProcedureName thru = parseProcedureName(Optional.ofNullable(ctx.through())
            .map(ThroughContext::procedureName)
            .orElse(null));

    Locality locality = retrieveLocality(ctx, extendedDocument, copybooks).orElse(null);
    OutputNode node = new OutputNode(locality);
    node.setTarget(procName);
    node.setThru(thru);

    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  @Override
  public List<Node> visitAlterStatement(CobolParser.AlterStatementContext ctx) {
    if (ctx.alterProceedTo() != null && !ctx.alterProceedTo().isEmpty()) {
      List<Node> result = new ArrayList<>();
      for (CobolParser.AlterProceedToContext alter: ctx.alterProceedTo()) {
        if (alter.procedureName() != null && alter.procedureName().size() == 2) {
          CobolParser.ProcedureNameContext from = alter.procedureName(0);
          CobolParser.ProcedureNameContext to = alter.procedureName(1);

          String name = Optional.ofNullable(from.paragraphName()).map(RuleContext::getText).orElse(null);
          String inSection = Optional.ofNullable(from.inSection())
                  .map(InSectionContext::sectionName)
                  .map(RuleContext::getText).orElse(null);
          ProcedureName alterFrom = new ProcedureName(name, inSection);

          name = Optional.ofNullable(to.paragraphName()).map(RuleContext::getText).orElse(null);
          inSection = Optional.ofNullable(to.inSection())
                  .map(InSectionContext::sectionName)
                  .map(RuleContext::getText).orElse(null);
          ProcedureName alterTo = new ProcedureName(name, inSection);

          Locality locality = retrieveLocality(ctx, extendedDocument, copybooks).orElse(null);
          AlterNode node = new AlterNode(locality, alterFrom, alterTo);
          visitChildren(ctx).forEach(node::addChild);
          result.add(node);
        }
      }
      return result;
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitAcceptStatement(CobolParser.AcceptStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitAddStatement(CobolParser.AddStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitAllocateStatement(CobolParser.AllocateStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitCancelStatement(CobolParser.CancelStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitCloseStatement(CobolParser.CloseStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitComputeStatement(CobolParser.ComputeStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitContinueStatement(CobolParser.ContinueStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitDisableStatement(CobolParser.DisableStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitDisplayStatement(CobolParser.DisplayStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitDivideStatement(CobolParser.DivideStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitEnableStatement(CobolParser.EnableStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitEntryStatement(CobolParser.EntryStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitExhibitStatement(CobolParser.ExhibitStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitFreeStatement(CobolParser.FreeStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitGenerateStatement(CobolParser.GenerateStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitInitializeStatement(CobolParser.InitializeStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitInitiateStatement(CobolParser.InitiateStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitInspectStatement(CobolParser.InspectStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitMoveStatement(CobolParser.MoveStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitMultiplyStatement(CobolParser.MultiplyStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitOpenStatement(CobolParser.OpenStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitPurgeStatement(CobolParser.PurgeStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitReadyResetTraceStatement(CobolParser.ReadyResetTraceStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitReceiveStatement(CobolParser.ReceiveStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitReleaseStatement(CobolParser.ReleaseStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitReturnStatement(CobolParser.ReturnStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitSearchStatement(CobolParser.SearchStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitSendStatement(CobolParser.SendStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitServiceStatement(ServiceStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitSetStatement(CobolParser.SetStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitStringStatement(CobolParser.StringStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitSubtractStatement(CobolParser.SubtractStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitTerminateStatement(CobolParser.TerminateStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitUnstringStatement(CobolParser.UnstringStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  @Override
  public List<Node> visitJsonStatement(CobolParser.JsonStatementContext ctx) {
    return addTreeNode(ctx, StatementNode::new);
  }

  private ProcedureName parseProcedureName(CobolParser.ProcedureNameContext procedureNameContext) {
    if (procedureNameContext == null) {
      return null;
    }
    final String sectionName =
            procedureNameContext.inSection() != null
                    ? procedureNameContext.inSection().sectionName().getText()
                    : null;
    final String targetName = procedureNameContext.paragraphName().getText();
    return new ProcedureName(targetName, sectionName);
  }

  private void throwException(String wrongToken, @NonNull Locality locality, String message) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .location(locality.toOriginalLocation())
                    .suggestion(message + wrongToken)
                    .severity(ErrorSeverity.WARNING)
                    .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
    if (!errors.contains(error) && !wrongToken.contains(CobolDialect.FILLER)) {
      errors.add(error);
    }
  }

  private Location getLocation(Token childToken) {
    return extendedDocument.mapLocation(buildTokenRange(childToken));
  }

  private Optional<Locality> getLocality(Token childToken) {
    return ofNullable(locationToLocality(getLocation(childToken)));
  }

  private void reportSubroutineNotDefined(String name, Locality locality) {
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .suggestion(messageService.getMessage("CobolVisitor.subroutineNotFound", name))
                    .severity(ErrorSeverity.INFO)
                    .location(getIntervalPosition(locality, locality).toOriginalLocation())
                    .build();
    LOG.debug("Syntax error by CobolVisitor#reportSubroutineNotDefined: {}", error);
    errors.add(error);
  }

  protected void throwWarning(Token token) {
    String tokenText = token.getText().toUpperCase();
    if (MisspelledKeywordDistance.KEYWORDS.getSuggestions().contains(tokenText)) return;
    MisspelledKeywordDistance.calculateDistance(tokenText)
            .ifPresent(
                    correctWord ->
                            getLocality(token)
                                    .ifPresent(locality -> reportMisspelledKeyword(correctWord, locality)));
  }

  private void reportMisspelledKeyword(String suggestion, Locality locality) {
    if (locality == null) return;
    SyntaxError error =
            SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .suggestion(messageService.getMessage("CobolVisitor.misspelledWord", suggestion))
                    .severity(ErrorSeverity.WARNING)
                    .location(locality.toOriginalLocation())
                    .build();
    LOG.debug("Syntax error by CobolVisitor#reportMisspelledKeyword: {}", error);
    errors.add(error);
  }

  private void areaAWarning(Token token) {
    // skip area A check for cics and sql block
    final int tokenType = token.getType();
    if (tokenType == EOF || tokenType == IDENTIFIER && startsWithIcase(token.getText(), "EXEC")) {
      return;
    }
    final int areaBStartIndex = programLayout.getSequenceLength()
        + programLayout.getIndicatorLength()
        + programLayout.getAreaALength() - 1;

    final Location tokenLoc = getLocation(token);
    if (tokenLoc.getRange().getStart().getCharacter() <= areaBStartIndex)
      return;
    throwException(
        token.getText(),
        locationToLocality(tokenLoc),
        messageService.getMessage("CobolVisitor.AreaAWarningMsg"));
  }

  private static boolean startsWithIcase(String s, String b) {
    if (s.length() < b.length())
      return false;

    return s.substring(0, b.length()).compareToIgnoreCase(b) == 0;
  }

  protected void areaBWarning(ParserRuleContext ctx) {
    final int start = ctx.getStart().getTokenIndex();
    int stop = ctx.getStop().getTokenIndex();
    if (start < 0 || stop < 0)
      return;
    if (stop >= tokenStream.size())
      stop = tokenStream.size() - 1;

    for (int i = start; i <= stop; ++i) {
      Token t = tokenStream.get(i);
      if (t.getChannel() == HIDDEN)
        continue;
      Location l = getLocation(t);
      if (!startsInAreaA(l.getRange()))
        continue;
      throwException(
          t.getText(),
          locationToLocality(l),
          messageService.getMessage("CobolVisitor.AreaBWarningMsg"));
    }
  }

  private boolean startsInAreaA(Range r) {
    final int charPosition = r.getStart().getCharacter();
    final int areaBStartIndex = programLayout.getSequenceLength() + programLayout.getIndicatorLength() + programLayout.getAreaALength();
    return charPosition > programLayout.getSequenceLength() && charPosition < areaBStartIndex;
  }

  private static Collection<Location> getSubroutineLocation(
          ImmutablePair<String, Optional<String>> subroutinePair) {
    return subroutinePair
            .getValue()
            .map(it -> new Location(it, new Range(new Position(), new Position())))
            .map(Collections::singletonList)
            .orElse(emptyList());
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    List<Node> children = visitChildren(ctx);
    return retrieveLocality(ctx, extendedDocument, copybooks)
            .map(constructNode(nodeConstructor, children))
            .orElse(children);
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    if (node.getLocality() == null) return children;
    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  // TODO: Add check that name does not present in the predefined variables list (? - to check)
  private VariableNameAndLocality extractNameAndLocality(EntryNameContext context) {
    if (context == null || context.dataName() == null) return null;
    return extractNameAndLocality(context.dataName());
  }

  private VariableNameAndLocality extractNameAndLocality(DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolWordContext context) {
    return new VariableNameAndLocality(
            getName(context), retrieveLocality(context, extendedDocument, copybooks).orElse(null));
  }


  private List<OccursClause> retrieveOccursValues(List<DataOccursClauseContext> contexts) {
    // TODO: Process OCCURS DEPENDING ON
    return contexts.stream()
            .map(this::toOccursClause)
            .filter(Optional::isPresent)
            .map(Optional::get)
            .collect(toList());
  }

  private Optional<OccursClause> toOccursClause(DataOccursClauseContext ctx) {
    return ofNullable(VisitorHelper.getIntegerOld(ctx.integerLiteral()))
            .map(
                    intLit ->
                            new OccursClause(
                                    intLit, retrieveOccursToValueOld(ctx).orElse(null),
                                    Optional.ofNullable(ctx.dataOccursTo()).map(DataOccursToContext::UNBOUNDED).isPresent(),
                                    retrieveIndexNames(ctx)));
  }

  private List<VariableNameAndLocality> retrieveIndexNames(DataOccursClauseContext ctx) {
    return ofNullable(ctx.indexName()).orElseGet(ImmutableList::of).stream()
            .map(IndexNameContext::cobolWord)
            .map(this::extractNameAndLocality)
            .collect(toList());
  }

  private List<ValueClause> retrieveValues(List<DataValueClauseContext> clauses) {
    return clauses.stream().map(this::retrieveValue).collect(toList());
  }

  private ValueClause retrieveValue(DataValueClauseContext context) {
    return new ValueClause(
            retrieveValueIntervalsOld(context.dataValueClauseLiteral().dataValueInterval()),
            getLocality(context.getStart()).orElse(null));
  }

  private Locality getLevelLocality(TerminalNode terminalNode) {
    try {
      Location location = extendedDocument.mapLocation(buildTokenRange(terminalNode.getSymbol()));
      return locationToLocality(location);
    } catch (IllegalStateException e) {
      LOG.debug("Node: {} with range: {} has issue with the mapping", terminalNode, buildTokenRange(terminalNode.getSymbol()));
      throw e;
    }
  }

  private Locality locationToLocality(Location location) {
    return Locality.builder()
            .range(location.getRange())
            .uri(location.getUri())
            .copybookId(copybooks.getCopybookIdByUri(location.getUri()))
            .build();
  }

  public List<SyntaxError> getErrors() {
    return this.errors;
  }

  private static final class TextExtractionState {
    private final ExtendedDocument extendedDocument;
    private ParagraphNode lastParagraphNode = null;
    private ProcedureSectionNode lastSectionNode = null;
    private Token firstSectionToken = null;
    private Token firstParagraphToken = null;
    private Token lastSentenseToken = null;
    private Position lastSentensePosition = null;

      private TextExtractionState(ExtendedDocument extendedDocument) {
          this.extendedDocument = extendedDocument;
      }

      void update(ProcedureSectionNode section, Token firstToken) {
      if (lastParagraphNode != null) {
        lastParagraphNode.getLocality().getRange().setEnd(lastSentensePosition);
        lastParagraphNode.setText(extendedDocument.getBaseText(lastParagraphNode.getLocality()));
        lastParagraphNode = null;
        firstParagraphToken = null;
      }
      if (lastSectionNode != null) {
        lastSectionNode.getLocality().getRange().setEnd(lastSentensePosition);
        lastSectionNode.setText(extendedDocument.getBaseText(lastSectionNode.getLocality()));
      }
      firstSectionToken = firstToken;
      lastSectionNode = section;
    }

    void update(ParagraphNode paragraphNode, Token firstToken) {
      if (lastParagraphNode != null) {
        lastParagraphNode.getLocality().getRange().setEnd(lastSentensePosition);
        lastParagraphNode.setText(extendedDocument.getBaseText(lastParagraphNode.getLocality()));
      }
      lastParagraphNode = paragraphNode;
      firstParagraphToken = firstToken;
    }

    void update(Token lastToken) {
      lastSentenseToken = lastToken;
      lastSentensePosition = extendedDocument.mapLocation(constructRange(lastSentenseToken))
              .getRange().getEnd();
    }

    void reset() {
      lastParagraphNode = null;
      lastSectionNode = null;
      firstSectionToken = null;
      firstParagraphToken = null;
      lastSentenseToken = null;
      lastSentensePosition = null;
    }
    void flush() {
      if (lastParagraphNode != null) {
        lastParagraphNode.getLocality().getRange().setEnd(lastSentensePosition);
        lastParagraphNode.setText(extendedDocument.getBaseText(lastParagraphNode.getLocality()));
      }
      if (lastSectionNode != null) {
        lastSectionNode.getLocality().getRange().setEnd(lastSentensePosition);
        lastSectionNode.setText(extendedDocument.getBaseText(lastSectionNode.getLocality()));
      }
    }
  }
}
