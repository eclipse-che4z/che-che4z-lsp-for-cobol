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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMultimap;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.CobolLexer;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.nodes.DaCoCopyFromNode;
import org.eclipse.lsp.cobol.core.engine.dialects.daco.nodes.DaCoCopyNode;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.engine.symbols.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;
import org.eclipse.lsp.cobol.core.strategy.CobolErrorStrategy;
import org.eclipse.lsp.cobol.core.visitor.ParserListener;
import org.eclipse.lsp.cobol.service.copybooks.CopybookService;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.core.model.ErrorCode.MISSING_COPYBOOK;
import static org.eclipse.lsp.cobol.core.model.ErrorSeverity.ERROR;

/** Handles copy maid logic */
@Slf4j
@RequiredArgsConstructor
public class DaCoMaidProcessor {
  private static final String MAID_WRK_QUALIFIER = "WRK";
  private final Pattern procedureDivisionPattern =
      Pattern.compile(
          "\\s*procedure\\s+division[\\w\\s]*", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern sectionPattern =
      Pattern.compile(
          "^\\s*(?<name>\\w*)\\s+SECTION\\s*\\.\\s*$",
          Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern dataDivisionPattern =
      Pattern.compile("\\s*data\\s+division\\s*\\.", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern dataDescriptionEntryPattern =
      Pattern.compile(
          "^\\s*(?<lvl>\\d+)\\s+(?!copy maid)(?<entryName>\\w+(-\\w+)?)?.*\\..*$",
          Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);

  private final Pattern dataDescriptionEntryWithCopyFromPattern =
      Pattern.compile(
          "^(?<indent>\\s*)(?<lvl>\\d+)\\s+(?!copy maid)(?<entryName>\\w+(-\\w+)?)?.*(?<copyfrom>COPY-FROM)\\s+(?<protoSuffix>\\w+)\\..*$",
          Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern copyMaidPattern =
      Pattern.compile(
          "^(?<indent>\\s*)(?<level>\\d{1,2})?\\s*COPY\\s+MAID\\s+(?<layoutId>[a-zA-Z\\d]*-?[a-zA-Z\\d]{0,3})\\s*(?<layoutUsage>[a-zA-Z]{3,6})?\\s*\\.?$",
          Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final CopybookService copybookService;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;

  private final Set<String> sections = new HashSet<>();

  /**
   * Process MAID copybooks in the source code
   *
   * @param context dialect processing context
   * @param errors a container to propagate errors from dialect processing
   * @return processed text and dialect nodes
   */
  public DialectOutcome process(DialectProcessingContext context, List<SyntaxError> errors) {
    List<Node> dacoNodes = new ArrayList<>();
    DaCoMaidProcessingState state = DaCoMaidProcessingState.START;

    String[] lines = context.getExtendedSource().getText().split("\n", -1);
    String lastSuffix = null;
    sections.clear();
    for (int lineNumber = 0; lineNumber < lines.length; lineNumber++) {
      String line = lines[lineNumber];
      if (procedureDivisionPattern.matcher(line).find()) {
        state = DaCoMaidProcessingState.PROCEDURE_DIVISION;
      }
      if (state == DaCoMaidProcessingState.DATA_DIVISION) {
        Matcher dataEntry = dataDescriptionEntryPattern.matcher(line);
        if (dataEntry.find()) {
          String name = dataEntry.group("entryName");
          int lvl = Integer.parseInt(dataEntry.group("lvl"));
          if (name != null
              && VariableDefinitionUtil.LEVEL_66 != lvl
              && VariableDefinitionUtil.LEVEL_77 != lvl
              && VariableDefinitionUtil.LEVEL_88 != lvl) {
            lastSuffix = DaCoHelper.extractSuffix(name).orElse(lastSuffix);
          }
        }
        Matcher copyFrom = dataDescriptionEntryWithCopyFromPattern.matcher(line);
        if (copyFrom.find()) {
          dacoNodes.add(createCopyFromNode(copyFrom, lineNumber, context));
        }
      } else if (dataDivisionPattern.matcher(line).find()) {
        state = DaCoMaidProcessingState.DATA_DIVISION;
      }
      if (state == DaCoMaidProcessingState.PROCEDURE_DIVISION) {
        Matcher sectionMatcher = sectionPattern.matcher(line);
        if (sectionMatcher.find()) {
          sections.add(sectionMatcher.group("name"));
        }
      }
      collectCopyMaid(line, lineNumber, dacoNodes, lastSuffix, context, errors);
    }

    return new DialectOutcome(dacoNodes, ImmutableMultimap.of(), context);
  }

  private Node createCopyFromNode(
      Matcher copyFrom, int lineNumber, DialectProcessingContext context) {
    String entryName = copyFrom.group("entryName");
    if (!DaCoHelper.extractSuffix(entryName).isPresent()) {
      // TODO: an error
      return null;
    }
    String newSuffix = DaCoHelper.extractSuffix(entryName).get();
    String indent = copyFrom.group("indent");
    String prototypeName =
        entryName.substring(0, entryName.length() - 2) + copyFrom.group("protoSuffix");
    int startChar = copyFrom.start("copyfrom");
    int endChar = copyFrom.end("protoSuffix");
    Range range = new Range(new Position(lineNumber, startChar), new Position(lineNumber, endChar));
    int len = endChar - startChar;
    String newString = String.join("", Collections.nCopies(len, " "));
    context.getExtendedSource().replace(range, newString);

    Locality locality =
        Locality.builder().uri(context.getExtendedSource().getUri()).range(range).build();

    return new DaCoCopyFromNode(
        locality, prototypeName, newSuffix, Integer.parseInt(copyFrom.group("lvl")));
  }

  private void collectCopyMaid(
      String input,
      int lineNumber,
      List<Node> copyMaidNodes,
      String lastSuffix,
      DialectProcessingContext context,
      List<SyntaxError> errors) {
    Matcher matcher = copyMaidPattern.matcher(input);
    if (matcher.find()) {
      String indent = matcher.group("indent");
      int startChar = indent == null ? 0 : matcher.end("indent");
      int endChar = matcher.end();
      int len = endChar - startChar;
      String newString = String.join("", Collections.nCopies(len, CobolDialect.FILLER));
      Range rangeReplace =
          new Range(new Position(lineNumber, startChar), new Position(lineNumber, endChar));
      context.getExtendedSource().replace(rangeReplace, newString);
      String level = matcher.group("level");
      String layoutId = matcher.group("layoutId");
      String layoutUsage = matcher.group("layoutUsage");
      if (level != null) {
        Range range =
            new Range(
                new Position(lineNumber, matcher.start("layoutId")),
                new Position(lineNumber, matcher.end("layoutId")));
        range = context.getExtendedSource().mapLocationUnsafe(range).getRange();
        copyMaidNodes.add(
            createMaidCopybookNode(
                context,
                Integer.parseInt(level),
                layoutId,
                layoutUsage,
                lastSuffix,
                range,
                errors));
      }
    }
  }

  private CopyNode createMaidCopybookNode(
      DialectProcessingContext context,
      int startingLevel,
      String layoutId,
      String layoutUsage,
      String lastSuffix,
      Range range,
      List<SyntaxError> errors) {
    Locality locality =
        Locality.builder().uri(context.getExtendedSource().getUri()).range(range).build();
    DaCoCopyNode cbNode =
        new DaCoCopyNode(
            locality,
            makeCopybookFileName(startingLevel, layoutId, layoutUsage),
            layoutUsage,
            startingLevel,
            lastSuffix);

    CopybookName copybookName =
        new CopybookName(
            makeCopybookFileName(startingLevel, layoutId, layoutUsage), DaCoDialect.NAME);
    CopybookModel copybookModel =
        copybookService.resolve(
            copybookName,
            context.getExtendedSource().getUri(),
            context.getExtendedSource().getUri(),
            context.getCopybookConfig(),
            true);
    if (copybookModel.getContent() != null) {
      Location location =
          new Location(copybookModel.getUri(), new Range(new Position(), new Position()));
      CopyDefinition definition = new CopyDefinition(location, copybookModel.getUri());
      cbNode.setDefinition(definition);
      checkWrkSuffix(cbNode, layoutUsage, errors);
      String suffix = calculateSuffix(layoutUsage, cbNode);
      parseCopybookContent(copybookModel, startingLevel, suffix).forEach(cbNode::addChild);
    } else {
      SyntaxError error =
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.DIALECT)
              .locality(cbNode.getLocality())
              .suggestion(
                  messageService.getMessage(
                      "GrammarPreprocessorListener.errorSuggestion",
                      copybookName.getQualifiedName()))
              .severity(ERROR)
              .errorCode(MISSING_COPYBOOK)
              .build();
      errors.add(error);
      LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    }
    return cbNode;
  }

  private static String calculateSuffix(String layoutUsage, DaCoCopyNode cbNode) {
    if (MAID_WRK_QUALIFIER.equalsIgnoreCase(layoutUsage)) {
      return cbNode.getParentSuffix();
    }
    if (cbNode.getStartingLevel() > 1) {
      return cbNode.getParentSuffix();
    }
    return null;
  }

  private void checkWrkSuffix(DaCoCopyNode node, String layoutUsage, List<SyntaxError> errors) {
    if (MAID_WRK_QUALIFIER.equalsIgnoreCase(layoutUsage) && node.getParentSuffix() == null) {
      SyntaxError error =
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.DIALECT)
              .severity(ErrorSeverity.ERROR)
              .suggestion(
                  messageService.getMessage("GrammarPreprocessorListener.cannotRetrieveMaidSuffix"))
              .locality(node.getLocality())
              .build();
      errors.add(error);
      LOG.debug("Syntax error by reportCannotRetrieveSuffix: {}", error.toString());
    }
  }

  private List<Node> parseCopybookContent(
      CopybookModel copybookModel, int startingLevel, String suffix) {
    if (copybookModel.getContent() == null) {
      return ImmutableList.of();
    }
    CobolLexer lexer = new CobolLexer(CharStreams.fromString(copybookModel.getContent()));
    lexer.removeErrorListeners();
    ParserListener listener = new ParserListener();
    lexer.addErrorListener(listener);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    CobolParser parser = new CobolParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);

    DaCoCopybookVisitor visitor =
        new DaCoCopybookVisitor(copybookModel.getUri(), startingLevel, suffix);
    ParserRuleContext ctx = parser.dataDescriptionEntries();
    return visitor.visit(ctx);
  }

  private static String makeCopybookFileName(
      int startingLevel, String layoutId, String layoutUsage) {
    if (layoutUsage == null || startingLevel > 1) {
      return layoutId;
    }
    return String.format(
        "%s_%s", layoutId.toUpperCase(Locale.ROOT), layoutUsage.toUpperCase(Locale.ROOT));
  }

  public Set<String> getSections() {
    return sections;
  }
}
