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
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.CopybookModel;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil;
import org.eclipse.lsp.cobol.core.model.CopybookName;
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

/**
 * Handles copy maid logic
 */
@Slf4j
@RequiredArgsConstructor
public class DaCoMaidProcessor {
  private static final String MAID_WRK_QUALIFIER = "WRK";
  private final Pattern procedureDivisionPattern = Pattern.compile("\\s*procedure\\s+division[\\w\\s]*", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern sectionPattern = Pattern.compile("^\\s*(?<name>\\w*)\\s+SECTION\\s*\\.\\s*$", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern dataDivisionPattern = Pattern.compile("\\s*data\\s+division\\s*\\.", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern dataDescriptionEntryPattern = Pattern.compile("^\\s*(?<lvl>\\d+)\\s+(?!copy maid)(?<entryName>[\\w]+(-\\w+)?)?.*\\..*$", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final Pattern copyMaidPattern = Pattern.compile("^(?<indent>\\s*)(?<level>\\d{1,2})?\\s*COPY\\s+MAID\\s+(?<layoutId>[a-zA-Z0-9]*[-]?[a-zA-Z0-9]{0,3})\\s*(?<layoutUsage>[a-zA-Z]{3,6})?\\s*\\.?$", Pattern.MULTILINE | Pattern.CASE_INSENSITIVE);
  private final CopybookService copybookService;
  private final ParseTreeListener treeListener;
  private final MessageService messageService;

  private final Set<String> sections = new HashSet<>();

  /**
   * Process MAID copybooks in the source code
   * @param input source code
   * @param context dialect processing context
   * @param errors a container to propagate errors from dialect processing
   * @return processed text and dialect nodes
   */
  public DialectOutcome process(String input, DialectProcessingContext context, List<SyntaxError> errors) {
    List<Node> copyMaidNodes = new ArrayList<>();
    DaCoMaidProcessingState state = DaCoMaidProcessingState.START;

    String[] lines = input.split("\n");
    String lastSuffix = null;
    sections.clear();
    for (int i = 0; i < lines.length; i++) {
      String line = lines[i];
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
            lastSuffix = DaCoHelper.extractSuffix(name);
          }
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
      lines[i] = collectCopyMaid(line, i, copyMaidNodes, lastSuffix, context, errors);
    }
    input = String.join("\n", lines);

    return new DialectOutcome(input, copyMaidNodes, ImmutableMultimap.of());
  }

  private String collectCopyMaid(String input, int lineNumber, List<Node> copyMaidNodes, String lastSuffix, DialectProcessingContext context, List<SyntaxError> errors) {
    Matcher matcher = copyMaidPattern.matcher(input);

    if (matcher.find()) {
      StringBuffer sb = new StringBuffer();
      String indent = matcher.group("indent");
      int startChar = indent == null ? 0 : matcher.end("indent");
      int endChar = matcher.end(matcher.groupCount() - 1);
      int len = endChar - startChar;
      matcher.appendReplacement(sb, (indent == null ? "" : indent)
              + String.join("", Collections.nCopies(len, CobolDialect.FILLER)));
      String level = matcher.group("level");
      String layoutId = matcher.group("layoutId");
      String layoutUsage = matcher.group("layoutUsage");
      if (level != null) {
        Range range = new Range(new Position(lineNumber, matcher.start("layoutId")), new Position(lineNumber, matcher.end("layoutId")));
        copyMaidNodes.add(
                createMaidCopybookNode(context, Integer.parseInt(level), layoutId, layoutUsage, lastSuffix, range, errors)
        );
      }
      matcher.appendTail(sb);
      return sb.toString();
    }
    return input;
  }


  private CopyNode createMaidCopybookNode(DialectProcessingContext context, int startingLevel, String layoutId, String layoutUsage, String lastSuffix, Range range, List<SyntaxError> errors) {
    Locality locality = Locality.builder()
            .uri(context.getTextTransformations().getUri())
            .range(range)
            .build();
    DaCoCopyNode cbNode = new DaCoCopyNode(locality, makeCopybookFileName(layoutId, layoutUsage), layoutUsage, lastSuffix);

    CopybookName copybookName = new CopybookName(makeCopybookFileName(layoutId, layoutUsage), DaCoDialect.NAME);
    CopybookModel copybookModel = copybookService.resolve(copybookName,
            context.getTextTransformations().getUri(),
            context.getTextTransformations().getUri(),
            context.getCopybookConfig(),
            true);
    if (copybookModel.getContent() != null) {
      Location location = new Location(copybookModel.getUri(), new Range(new Position(), new Position()));
      CopyDefinition definition = new CopyDefinition(location, copybookModel.getUri());
      cbNode.setDefinition(definition);
      checkWrkSuffix(cbNode, layoutUsage, errors);
      parseCopybookContent(copybookModel, startingLevel, MAID_WRK_QUALIFIER.equalsIgnoreCase(layoutUsage) ? cbNode.getParentSuffix() : null)
              .forEach(cbNode::addChild);
    } else {
      SyntaxError error = SyntaxError.syntaxError()
              .locality(cbNode.getLocality())
              .suggestion(messageService.getMessage("GrammarPreprocessorListener.errorSuggestion", copybookName.getQualifiedName()))
              .severity(ERROR)
              .errorCode(MISSING_COPYBOOK)
              .build();
      errors.add(error);
      LOG.debug("Syntax error by reportMissingCopybooks: {}", error.toString());
    }
    return cbNode;
  }

  private void checkWrkSuffix(DaCoCopyNode node, String layoutUsage, List<SyntaxError> errors) {
    if (MAID_WRK_QUALIFIER.equalsIgnoreCase(layoutUsage) && node.getParentSuffix() == null) {
      SyntaxError error =
              SyntaxError.syntaxError()
                      .severity(ErrorSeverity.ERROR)
                      .suggestion(
                              messageService.getMessage("GrammarPreprocessorListener.cannotRetrieveMaidSuffix"))
                      .locality(node.getLocality())
                      .build();
      errors.add(error);
      LOG.debug("Syntax error by reportCannotRetrieveSuffix: {}", error.toString());
    }
  }

  private List<Node> parseCopybookContent(CopybookModel copybookModel, int startingLevel, String suffix) {
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

    DaCoCopybookVisitor visitor = new DaCoCopybookVisitor(copybookModel.getUri(), startingLevel, suffix);
    ParserRuleContext ctx = parser.dataDescriptionEntries();
    return visitor.visit(ctx);
  }

  private static String makeCopybookFileName(String layoutId, String layoutUsage) {
    if (layoutUsage == null) {
      return layoutId;
    }
    return String.format("%s_%s", layoutId.toUpperCase(Locale.ROOT), layoutUsage.toUpperCase(Locale.ROOT));
  }

  public Set<String> getSections() {
    return sections;
  }
}
