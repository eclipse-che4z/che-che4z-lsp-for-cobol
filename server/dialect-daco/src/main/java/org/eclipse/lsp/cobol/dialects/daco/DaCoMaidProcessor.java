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
package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.VariableConstants;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.error.ErrorCodes;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.daco.nodes.DaCoCopyFromNode;
import org.eclipse.lsp.cobol.dialects.daco.nodes.DaCoCopyNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

/** Handles copy maid logic */
@Slf4j
@RequiredArgsConstructor
public class DaCoMaidProcessor {
  private static final String MAID_WRK_QUALIFIER = "WRK";
  private final Pattern procedureDivisionPattern =
      Pattern.compile(
          "\\s*procedure\\s+division[\\w\\s]*", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
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
          "^(?<indent>\\s*)(?<level>\\d{1,2})?\\s*COPY\\s+MAID\\s+(?<layoutId>[a-zA-Z\\d]*-?[a-zA-Z\\d]{0,3})\\s*(?<layoutUsage>[a-zA-Z]{3,6})?\\s*\\.?\\s*(?<floatingComment>\\s+\\*\\>\\s?.*)?$",
          Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final CopybookService copybookService;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;

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

    String[] lines = context.getExtendedDocument().toString().split("\n", -1);
    String lastSuffix = null;
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
              && VariableConstants.LEVEL_66 != lvl
              && VariableConstants.LEVEL_77 != lvl
              && VariableConstants.LEVEL_88 != lvl) {
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
      collectCopyMaid(line, lineNumber, dacoNodes, lastSuffix, context, errors);
    }

    return new DialectOutcome(dacoNodes, context);
  }

  private Node createCopyFromNode(
      Matcher copyFrom, int lineNumber, DialectProcessingContext context) {
    String entryName = copyFrom.group("entryName");
    if (!DaCoHelper.extractSuffix(entryName).isPresent()) {
      // TODO: an error
      return null;
    }
    Optional<String> newSuffix = DaCoHelper.extractSuffix(entryName);
    String prototypeName =
        entryName.substring(0, entryName.length() - 2) + copyFrom.group("protoSuffix");
    int startChar = copyFrom.start("copyfrom");
    int endChar = copyFrom.end("protoSuffix") - 1;
    Range range = new Range(new Position(lineNumber, startChar), new Position(lineNumber, endChar));
    int len = endChar - startChar;
    String newString = String.join("", Collections.nCopies(len, " "));
    context.getExtendedDocument().replace(range, newString);

    Location originalLocation = context.getExtendedDocument().mapLocation(range);
    Locality locality =
        Locality.builder().uri(originalLocation.getUri()).range(originalLocation.getRange()).build();

    return new DaCoCopyFromNode(
        locality, prototypeName, newSuffix.orElse(""), Integer.parseInt(copyFrom.group("lvl")));
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
      int startChar = indent == null ? 0 : matcher.end("indent") - 1;
      int endChar = matcher.end();
      int len = endChar - startChar;
      String newString = String.join("", Collections.nCopies(len, CobolDialect.FILLER));
      Range rangeReplace =
          new Range(new Position(lineNumber, startChar), new Position(lineNumber, endChar));
      context.getExtendedDocument().replace(rangeReplace, newString);
      String level = matcher.group("level");
      String layoutId = matcher.group("layoutId");
      String layoutUsage = matcher.group("layoutUsage");
      if (level != null) {
        Range statementRange =
            new Range(
                new Position(lineNumber, matcher.start("level")),
                new Position(lineNumber, matcher.end("layoutId")));
        statementRange = context.getExtendedDocument().mapLocation(statementRange).getRange();

        Range nameRange =
            new Range(
                new Position(lineNumber, matcher.start("layoutId")),
                new Position(lineNumber, matcher.end("layoutId")));
        nameRange = context.getExtendedDocument().mapLocation(nameRange).getRange();
        copyMaidNodes.add(
            createMaidCopybookNode(
                context,
                Integer.parseInt(level),
                layoutId,
                layoutUsage,
                lastSuffix,
                statementRange,
                nameRange,
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
      Range statementRange,
      Range nameRange,
      List<SyntaxError> errors) {
    Locality statementLocality =
        Locality.builder().uri(context.getExtendedDocument().getUri()).range(statementRange).build();

    Locality nameLocality = Locality.builder().uri(context.getExtendedDocument().getUri()).range(nameRange).build();

    CopybookName copybookName =
        new CopybookName(
            makeCopybookFileName(startingLevel, layoutId, layoutUsage), DaCoDialect.NAME);
    ResultWithErrors<CopybookModel> resolvedCopybook = copybookService.resolve(
            copybookName.toCopybookId(context.getExtendedDocument().getUri()),
            copybookName,
            context.getExtendedDocument().getUri(),
            context.getExtendedDocument().getUri(),
            true);
    CopybookModel copybookModel = resolvedCopybook.getResult();

    DaCoCopyNode cbNode =
        new DaCoCopyNode(
            statementLocality,
            nameLocality.toLocation(),
            makeCopybookFileName(startingLevel, layoutId, layoutUsage),
            layoutUsage,
            startingLevel,
            lastSuffix,
            copybookModel.getUri());

    if (copybookModel.getContent() != null) {
      errors.addAll(resolvedCopybook.getErrors());
      checkWrkSuffix(cbNode, layoutUsage, errors);
      String suffix = calculateSuffix(layoutUsage, cbNode);
      parseCopybookContent(copybookModel, startingLevel, suffix)
          .forEach(cbNode::addChild);
    } else {
      SyntaxError error =
          SyntaxError.syntaxError()
              .errorSource(ErrorSource.DIALECT)
              .location(nameLocality.toOriginalLocation())
              .suggestion(
                  messageService.getMessage(
                      "GrammarPreprocessorListener.errorSuggestion",
                      copybookName.getQualifiedName()))
              .severity(ERROR)
              .errorCode(ErrorCodes.MISSING_COPYBOOK)
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
              .location(node.getLocality().toOriginalLocation())
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
    String text = DaCoPreprocessor.run(copybookModel.getContent());

    VariableLexer lexer = new VariableLexer(CharStreams.fromString(text));
    lexer.removeErrorListeners();
    ParserListener listener = new ParserListener();
    lexer.addErrorListener(listener);
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    VariableParser parser = new VariableParser(tokens);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));
    parser.addParseListener(treeListener);

    DaCoCopybookVisitor visitor =
        new DaCoCopybookVisitor(copybookModel.getUri(), startingLevel, suffix, copybookModel.getCopybookId().toString());
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
}
