/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.ibm;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.SubroutineService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.dialects.CobolProgramLayout;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.statements.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.model.tree.variables.ConditionDataNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.FileDescriptionNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.RenameItemNode;
import org.eclipse.lsp.cobol.common.pipeline.Stage;
import org.eclipse.lsp.cobol.common.pipeline.StageResult;
import org.eclipse.lsp.cobol.common.processor.*;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectService;
import org.eclipse.lsp.cobol.core.engine.processor.AstProcessor;
import org.eclipse.lsp.cobol.core.engine.processors.*;
import org.eclipse.lsp.cobol.core.engine.processors.implicit.ImplicitVariablesProcessor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulator;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.core.visitor.CobolVisitor;
import org.eclipse.lsp.cobol.service.settings.CachingConfigurationService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutUtil;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Transform Tree Stage */
@RequiredArgsConstructor
public class TransformTreeStage
    implements Stage<AnalysisContext, ProcessingResult, ParserStageResult> {

  protected final SymbolsRepository symbolsRepository;
  protected final MessageService messageService;
  protected final SubroutineService subroutineService;
  protected final CachingConfigurationService cachingConfigurationService;
  protected final DialectService dialectService;
  protected final AstProcessor astProcessor;
  protected final CodeLayoutStore layoutStore;
  private static final Pattern JAVA_CALLABLE_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-CALLABLE)(?:\\s+(.+))?\\s*$");
  private static final Pattern JAVA_SHAREABLE_ON_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-SHAREABLE\\s+ON)(?:\\s+(.+))?\\s*$");
  private static final Pattern JAVA_SHAREABLE_OFF_PATTERN =
      Pattern.compile("(?i)\\s*(>>)(\\s*)(JAVA-SHAREABLE\\s+OFF)(?:\\s+(.+))?\\s*$");

  @Override
  public StageResult<ProcessingResult> run(
      AnalysisContext context, StageResult<ParserStageResult> prevStageResult) {
    // Transform parsed tree to AST
    // We expect only the root node here
    RootNode rootNode =
        (RootNode)
            transformAST(
                    context,
                    context.getCopybooksRepository(),
                    prevStageResult.getData().getTokens(),
                    prevStageResult.getData().getTree())
                .get(0);
    processCobolJavaInteroperabilityDirectives(
        context, prevStageResult.getData().getTokens(), rootNode);
    SymbolAccumulator symbolAccumulator = new SymbolAccumulator();
    processSyntaxTree(context.getConfig(), symbolAccumulator, context, rootNode);

    Map<String, SymbolTable> programSymbols = symbolAccumulator.getProgramSymbols();
    symbolsRepository.updateSymbols(programSymbols);
    return new StageResult<>(new ProcessingResult(programSymbols, rootNode));
  }

  @Override
  public String getName() {
    return "Transform tree";
  }

  private void addDialectsNode(AnalysisContext context, Node rootNode) {
    for (Node dialectNode : context.getDialectNodes()) {
      Optional<Node> nodeByPosition =
          RangeUtils.findNodeByPosition(
              rootNode,
              dialectNode.getLocality().getUri(),
              dialectNode.getLocality().getRange().getStart());
      addChild(nodeByPosition.orElse(rootNode), dialectNode);
    }
  }

  private void addChild(Node node, Node dialectNode) {
    int targetIndex = node.getChildren().size();
    String cpyUrl = null;
    boolean cpyFound = false;
    if (dialectNode.getNodeType() == NodeType.COPY) {
      cpyUrl = ((CopyNode) dialectNode).getUri();
    }
    List<Node> children = node.getChildren();
    for (int i = 0; i < children.size(); i++) {
      Node child = children.get(i);
      String childUri = child.getLocality().getUri();
      if (childUri.equals(dialectNode.getLocality().getUri())) {
        int childLine = child.getLocality().getRange().getStart().getLine();
        if (childLine < dialectNode.getLocality().getRange().getStart().getLine()) {
          targetIndex = i + 1;
        } else {
          if (!cpyFound) {
            targetIndex = i;
          }
          break;
        }
      } else if (Objects.equals(childUri, cpyUrl)) {
        if (!cpyFound) {
          targetIndex = i;
          cpyFound = true;
        }
      }
    }
    dialectNode.setParent(node);
    children.add(targetIndex, dialectNode);
  }

  private void addCopyNodes(AnalysisContext context, Node rootNode) {
    for (Map.Entry<String, Location> copybook :
        context.getCopybooksRepository().getUsages().entries()) {
      String name = copybook.getKey();
      Range range = copybook.getValue().getRange();
      Locality statementLocality =
          Locality.builder().range(range).uri(copybook.getValue().getUri()).build();
      String copybookUri =
          context.getCopybooksRepository().getDefinitions().get(name).stream()
              .findFirst()
              .orElse(null);
      rootNode.addChild(new CopyNode(statementLocality, copybook.getValue(), name, copybookUri));
    }
  }

  protected List<Node> transformAST(
      AnalysisContext ctx,
      CopybooksRepository copybooksRepository,
      CommonTokenStream tokens,
      CobolParser.StartRuleContext tree) {
    CobolProgramLayout cobolProgramLayout =
        layoutStore
            .getCodeLayout()
            .map(lay -> CodeLayoutUtil.mergeLayout(ctx.getLanguageId().getLayout(), lay))
            .orElse(ctx.getLanguageId().getLayout());
    CobolVisitor visitor =
        new CobolVisitor(
            copybooksRepository,
            tokens,
            ctx.getExtendedDocument(),
            messageService,
            subroutineService,
            cachingConfigurationService,
            cobolProgramLayout);
    List<Node> syntaxTree = visitor.visit(tree);
    shapeSectionsAndParagraphs(syntaxTree.get(0));
    ctx.getAccumulatedErrors().addAll(visitor.getErrors());
    return syntaxTree;
  }

  private void shapeSectionsAndParagraphs(Node parent) {
    LinkedList<Node> stack = new LinkedList<>();
    List<Node> children = new ArrayList<>();
    for (Node node : parent.getChildren()) {
      if (!node.getChildren().isEmpty()) {
        shapeSectionsAndParagraphs(node);
      }
      if (node.getNodeType() == NodeType.PROCEDURE_SECTION
          && !(node instanceof DeclarativeProcedureSectionNode)) {
        handleSection(stack, node);
        children.add(node);
        continue;
      }
      if (node.getNodeType() == NodeType.PARAGRAPH) {
        handleParagraph(children, stack, node);
        continue;
      }

      if (!stack.isEmpty()) {
        CodeBlockDefinitionNode n = (CodeBlockDefinitionNode) stack.peek();
        n.addChild(node);
      } else {
        children.add(node);
      }
    }
    parent.getChildren().clear();
    children.forEach(c -> c.setParent(parent));
    parent.getChildren().addAll(children);
  }

  private void handleSection(LinkedList<Node> stack, Node node) {
    if (stack.isEmpty()) {
      stack.push(node);
      return;
    }
    if (stack.peek().getNodeType() == NodeType.PROCEDURE_SECTION) {
      stack.pop();
      stack.push(node);
      return;
    }
    if (stack.peek().getNodeType() == NodeType.PARAGRAPH) {
      stack.pop();
      stack.pop();
      stack.push(node);
    }
  }

  private static void handleParagraph(List<Node> siblings, LinkedList<Node> stack, Node node) {
    if (stack.isEmpty()) {
      ParagraphsNode paragraphsNode = new ParagraphsNode(node.getLocality());
      stack.push(paragraphsNode);
      siblings.add(paragraphsNode);
      paragraphsNode.addChild(node);
      stack.push(node);
      return;
    }
    if (stack.peek().getNodeType().equals(NodeType.PROCEDURE_SECTION)) {
      Node section = stack.peek();
      ParagraphsNode paragraphsNode = new ParagraphsNode(node.getLocality());
      stack.push(paragraphsNode);
      section.addChild(paragraphsNode);
      paragraphsNode.addChild(node);
      stack.push(node);
      return;
    }
    if (stack.peek().getNodeType() == NodeType.PARAGRAPH) {
      stack.pop();
      stack.peek().addChild(node);
      stack.push(node);
    }
  }

  private void processSyntaxTree(
      AnalysisConfig analysisConfig,
      SymbolAccumulator symbolAccumulator,
      AnalysisContext ctx,
      Node rootNode) {
    addCopyNodes(ctx, rootNode);
    addDialectsNode(ctx, rootNode);

    ProcessingContext processingContext =
        new ProcessingContext(
            new ArrayList<>(),
            symbolAccumulator,
            getCompilerDirectiveContext(analysisConfig),
            ctx.getConfig().getDialectsSettings());
    registerProcessors(analysisConfig, processingContext, symbolAccumulator, ctx.getLanguageId());
    ctx.getAccumulatedErrors()
        .addAll(astProcessor.processSyntaxTree(analysisConfig, processingContext, ctx, rootNode));
  }

  private CompilerDirectiveContext getCompilerDirectiveContext(AnalysisConfig analysisConfig) {
    CompilerDirectiveContext compilerDirectiveContext = new CompilerDirectiveContext();
    analysisConfig.getCompilerOptions().stream()
        .map(this::getCompilerDirective)
        .forEach(opts -> opts.ifPresent(compilerDirectiveContext::updateDirectiveOptions));
    return compilerDirectiveContext;
  }

  private Optional<CompilerDirectiveOption> getCompilerDirective(String compilerOptions) {
    return Arrays.stream(CompilerDirectiveName.values())
        .map(val -> val.getDirectiveOption(compilerOptions))
        .filter(Optional::isPresent)
        .map(Optional::get)
        .findFirst();
  }

  private void registerProcessors(
      AnalysisConfig analysisConfig,
      ProcessingContext ctx,
      SymbolAccumulator symbolAccumulator,
      CobolLanguageId languageId) {
    // Phase TRANSFORMATION
    ProcessingPhase t = ProcessingPhase.TRANSFORMATION;
    ctx.register(t, ProgramIdNode.class, new ProgramIdProcess());
    ctx.register(t, SectionNode.class, new SectionNodeProcessor(symbolAccumulator));
    ctx.register(t, FileEntryNode.class, new FileEntryProcess());
    ctx.register(t, FileDescriptionNode.class, new FileDescriptionProcess(symbolAccumulator));
    ctx.register(t, RootNode.class, new RootNodeUpdateCopyNodesByPositionInTree());
    ctx.register(t, ProcedureDivisionReturningNode.class, new ProcedureDivisionReturningProcess());

    // Phase DEFINITION
    ProcessingPhase d = ProcessingPhase.DEFINITION;
    ctx.register(d, ProgramNode.class, new FunctionNodeProcess(symbolAccumulator));
    ctx.register(d, SectionNameNode.class, new SectionNameRegister(symbolAccumulator));
    ctx.register(d, ParagraphNameNode.class, new ParagraphNameRegister(symbolAccumulator));

    // Phase POST DEFINITION
    ctx.register(
        ProcessingPhase.POST_DEFINITION, SectionNode.class, new ImplicitVariablesProcessor());
    ctx.register(
        ProcessingPhase.POST_DEFINITION,
        FunctionDeclaration.class,
        new ProgramRepositoryEnricher(symbolAccumulator));

    // Phase PRE USAGE
    ctx.register(
        ProcessingPhase.PRE_USAGE,
        QualifiedReferenceNode.class,
        new FunctionUsageReferenceEnricher(symbolAccumulator));

    // Phase USAGE
    ProcessingPhase u = ProcessingPhase.USAGE;
    ctx.register(u, CodeBlockUsageNode.class, new CodeBlockUsage(symbolAccumulator));
    ctx.register(
        u,
        QualifiedReferenceNode.class,
        new QualifiedReferenceUpdateVariableUsage(symbolAccumulator));
    ctx.register(u, FunctionReference.class, new FunctionReferenceProcessor(symbolAccumulator));

    // ENRICHMENT
    ProcessingPhase e = ProcessingPhase.ENRICHMENT;
    ctx.register(e, SectionNameNode.class, new SectionNameNodeEnricher(symbolAccumulator));
    ctx.register(e, ParagraphNameNode.class, new ParagraphNameNodeEnricher(symbolAccumulator));
    ctx.register(e, CodeBlockUsageNode.class, new CodeBlockUsageNodeEnricher(symbolAccumulator));
    ctx.register(e, FunctionReference.class, new FunctionReferenceEnricher(symbolAccumulator));
    ctx.register(e, ProgramIdNode.class, new ProgramIdEnricher(symbolAccumulator));
    ctx.register(e, ExitPerformNode.class, new ExitPerformEnricher());

    // Phase VALIDATION
    ProcessingPhase v = ProcessingPhase.VALIDATION;
    VariableWithLevelCheck variableWithLevelCheck =
        new VariableWithLevelCheck(CodeLayoutUtil.getProgramLayout(languageId, layoutStore));
    ctx.register(v, ConditionDataNameNode.class, variableWithLevelCheck);
    ctx.register(v, ElementaryItemNode.class, variableWithLevelCheck);
    ctx.register(v, GroupItemNode.class, variableWithLevelCheck);
    ctx.register(v, MultiTableDataNameNode.class, variableWithLevelCheck);
    ctx.register(v, RenameItemNode.class, variableWithLevelCheck);
    ctx.register(v, StandAloneDataItemNode.class, variableWithLevelCheck);
    ctx.register(v, TableDataNameNode.class, variableWithLevelCheck);

    VariableNameCheck variableNameCheck = new VariableNameCheck();
    ctx.register(v, ConditionDataNameNode.class, variableNameCheck);
    ctx.register(v, ElementaryItemNode.class, variableNameCheck);
    ctx.register(v, GroupItemNode.class, variableNameCheck);
    ctx.register(v, MultiTableDataNameNode.class, variableNameCheck);
    ctx.register(v, RenameItemNode.class, variableNameCheck);
    ctx.register(v, StandAloneDataItemNode.class, variableNameCheck);
    ctx.register(v, TableDataNameNode.class, variableNameCheck);

    ctx.register(v, StatementNode.class, new StatementValidate());

    ctx.register(v, ElementaryNode.class, new ElementaryNodeCheck());

    ctx.register(v, GroupItemNode.class, new GroupItemCheck());
    ctx.register(v, RemarksNode.class, new ObsoleteNodeCheck());
    ctx.register(v, StandAloneDataItemNode.class, new StandAloneDataItemCheck());
    ctx.register(v, ProcedureDivisionNode.class, new FunctionReturningClauseCheck());
    ctx.register(v, ProgramEndNode.class, new ProgramEndCheck());
    ctx.register(v, JsonParseNode.class, new JsonParseProcess(symbolAccumulator));
    ctx.register(v, JsonGenerateNode.class, new JsonGenerateProcess(symbolAccumulator));
    ctx.register(v, XMLParseNode.class, new XMLParseProcess(symbolAccumulator));
    ctx.register(v, FileOperationStatementNode.class, new FileOperationProcess());
    ctx.register(v, XmlGenerateNode.class, new XmlGenerateProcess(symbolAccumulator));
    ctx.register(v, FunctionDeclaration.class, new FunctionDeclarationValidator());
    ctx.register(v, ExitPerformNode.class, new ExitPerformValidator());

    ctx.register(v, ProcedureDivisionUsingNode.class, new LinkageArgumentsOriginCheck());
    ctx.register(v, ProcedureDivisionReturningNode.class, new LinkageArgumentsOriginCheck());
    // Implicit Dialects
    dialectService.getActiveImplicitDialects(analysisConfig).stream()
        .map(CobolDialect::getProcessors)
        .flatMap(List::stream)
        .forEach(ctx::register);

    // Dialects
    List<ProcessorDescription> pds = dialectService.getProcessors(analysisConfig.getDialects());
    pds.forEach(ctx::register);
  }

  private void processCobolJavaInteroperabilityDirectives(
      AnalysisContext context, CommonTokenStream tokenStream, RootNode rootNode) {
    List<Token> compilerLineTokens =
        tokenStream.getTokens().stream()
            .filter(
                token ->
                    token.getType() == CobolLexer.COMPILERLINE
                        || token.getType() == CobolLexer.IDENTIFICATION
                        || token.getType() == CobolLexer.DATA
                        || token.getType() == CobolLexer.WORKING_STORAGE
                        || token.getType() == CobolLexer.PROCEDURE)
            .collect(Collectors.toList());

    validateJavaInteroperabilityDirectives(context, compilerLineTokens, rootNode);
  }

  private void validateJavaInteroperabilityDirectives(
      AnalysisContext analysisContext, List<Token> compilerLineTokens, RootNode rootNode) {
    DirectiveValidationState state = new DirectiveValidationState();

    for (Token token : compilerLineTokens) {
      updateStateForToken(state, token);

      if (token.getType() == CobolLexer.COMPILERLINE) {
        validateCompilerDirective(analysisContext, token, state, rootNode);
      }
    }
  }

  private void updateStateForToken(DirectiveValidationState state, Token token) {
    switch (token.getType()) {
      case CobolLexer.IDENTIFICATION:
        state.currentSection = "IDENTIFICATION";
        break;
      case CobolLexer.DATA:
        state.currentSection = "DATA";
        break;
      case CobolLexer.WORKING_STORAGE:
        state.currentSection = "WORKING-STORAGE";
        break;
      case CobolLexer.PROCEDURE:
        state.currentSection = "PROCEDURE";
        break;
      default:
    }
  }

  private void validateCompilerDirective(
      AnalysisContext analysisContext,
      Token token,
      DirectiveValidationState state,
      RootNode rootNode) {
    String tokenText = token.getText();

    Matcher callableMatcher = JAVA_CALLABLE_PATTERN.matcher(tokenText);
    if (callableMatcher.matches()) {
      if (validateNestedProgramRestriction(analysisContext, token, tokenText, rootNode)) {
        validateDirective(
            analysisContext,
            token,
            callableMatcher,
            state.currentSection.equals("DATA") || state.currentSection.equals("WORKING-STORAGE"),
            "compilerDirective.validation.dataSection");
      }
      return;
    }

    Matcher shareableOnMatcher = JAVA_SHAREABLE_ON_PATTERN.matcher(tokenText);
    if (shareableOnMatcher.matches()) {
      if (validateNestedProgramRestriction(analysisContext, token, tokenText, rootNode)) {
        state.isJavaShareableOn = true;
        validateDirective(
            analysisContext,
            token,
            shareableOnMatcher,
            state.currentSection.equals("WORKING-STORAGE"),
            "compilerDirective.validation.workingSection");
      }
      return;
    }

    Matcher shareableOffMatcher = JAVA_SHAREABLE_OFF_PATTERN.matcher(tokenText);
    if (shareableOffMatcher.matches()) {
      if (validateNestedProgramRestriction(analysisContext, token, tokenText, rootNode)) {
        if (!state.isJavaShareableOn) {
          createError(
              analysisContext,
              token,
              callOffsetForToken(tokenText),
              messageService.getMessage(
                  "compilerDirective.validation.javaShareableOff",
                  tokenText.replaceAll(">>\\s?", "")));
        } else {
          state.isJavaShareableOn = false;
        }

        validateDirective(
            analysisContext,
            token,
            shareableOffMatcher,
            state.currentSection.equals("WORKING-STORAGE"),
            "compilerDirective.validation.workingSection");
      }
    }
  }

  private boolean validateNestedProgramRestriction(
      AnalysisContext analysisContext, Token token, String tokenText, RootNode rootNode) {

    List<ProgramNode> programs = rootNode.findPrograms();

    Position tokenPosition = new Position(token.getLine() - 1, token.getCharPositionInLine());
    for (ProgramNode program : programs) {
      if (isNestedProgram(program) && isPositionWithinNode(tokenPosition, program)) {
        createError(
            analysisContext,
            token,
            callOffsetForToken(tokenText),
            messageService.getMessage(
                "compilerDirective.validation.nestedProgram", tokenText.replaceAll(">>\\s?", "")));
        return false;
      }
    }
    return true;
  }

  private boolean isNestedProgram(ProgramNode program) {
    Node parent = program.getParent();
    while (parent != null) {
      if (parent instanceof ProgramNode) {
        return true;
      }
      parent = parent.getParent();
    }
    return false;
  }

  private boolean isPositionWithinNode(Position position, Node node) {
    if (node.getLocality() == null || node.getLocality().getRange() == null) {
      return false;
    }
    Range nodeRange = node.getLocality().getRange();
    Range positionRange = new Range(position, position);
    return RangeUtils.isInside(positionRange, nodeRange);
  }

  private static class DirectiveValidationState {
    boolean isJavaShareableOn = false;
    String currentSection = "";
  }

  private void validateDirective(
      AnalysisContext analysisContext,
      Token token,
      Matcher matcher,
      boolean isValidPosition,
      String positionErrorKey) {
    String spaces = matcher.group(2);
    String extraText =
        matcher.groupCount() >= 4 && matcher.group(4) != null ? matcher.group(4).trim() : "";

    if (spaces.length() > 1) {
      int offset = token.getText().indexOf(">>") + 2 + spaces.length();
      createError(
          analysisContext,
          token,
          offset,
          messageService.getMessage("compilerDirective.invalid", matcher.group(3).trim()));
      return;
    }

    if (!isValidPosition) {
      createError(
          analysisContext,
          token,
          callOffsetForToken(token.getText()),
          messageService.getMessage(positionErrorKey, token.getText().replaceAll(">>\\s?", "")));
    }

    if (!extraText.isEmpty()) {
      String tokenText = token.getText();
      int extraTextStartPos = tokenText.lastIndexOf(extraText);
      createError(
          analysisContext,
          token,
          extraTextStartPos,
          messageService.getMessage("compilerOption.invalid", extraText));
    }
  }

  private int callOffsetForToken(String tokenText) {
    return tokenText.startsWith(">> ") ? 3 : 2;
  }

  private void createError(
      AnalysisContext analysisContext, Token token, int startOffset, String message) {
    Range range =
        new Range(
            new Position(token.getLine() - 1, token.getCharPositionInLine() + startOffset),
            new Position(
                token.getLine() - 1, token.getCharPositionInLine() + token.getText().length()));
    Location location = analysisContext.getExtendedDocument().mapLocation(range);

    throwException(analysisContext, locationToLocality(analysisContext, location), message);
  }

  private Locality locationToLocality(AnalysisContext analysisContext, Location location) {
    Locality.LocalityBuilder builder =
        Locality.builder().range(location.getRange()).uri(location.getUri());
    if (analysisContext.getCopybooksRepository() != null) {
      builder.copybookId(
          analysisContext.getCopybooksRepository().getCopybookIdByUri(location.getUri()));
    }
    return builder.build();
  }

  private void throwException(
      AnalysisContext analysisContext, @NonNull Locality locality, String message) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(message)
            .severity(ErrorSeverity.ERROR)
            .build();

    if (!analysisContext.getAccumulatedErrors().contains(error)) {
      analysisContext.getAccumulatedErrors().add(error);
    }
  }
}
