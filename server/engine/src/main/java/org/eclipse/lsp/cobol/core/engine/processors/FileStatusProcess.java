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
package org.eclipse.lsp.cobol.core.engine.processors;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.FileStatusNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.ElementaryNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

/** Process FileStatus Node */
public class FileStatusProcess implements Processor<FileStatusNode> {
  private static final ImmutableList<SectionType> SECTION_ALLOWED_FOR_STATUS_VARIABLES =
      ImmutableList.of(SectionType.WORKING_STORAGE, SectionType.LOCAL_STORAGE, SectionType.LINKAGE);

  private static final Pattern DATATYPE_FORMAT =
      Pattern.compile(
          "(?<dataType>[\\w|\\d]+)(\\((?<byteLength>\\d+)\\))?", Pattern.CASE_INSENSITIVE);
  private static final Pattern ALPHANUMREIC_DATATYPE_REGEX = Pattern.compile("(((V|E|S|CR|DB)?9)|x)+", Pattern.CASE_INSENSITIVE);


  private final SymbolAccumulatorService symbolAccumulatorService;

  public FileStatusProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(FileStatusNode fileStatusNode, ProcessingContext processingContext) {
    Optional<Node> programNode = fileStatusNode.getNearestParentByType(NodeType.PROGRAM);
    if (!programNode.isPresent()) return;

    List<VariableUsageNode> statusVariables =
        fileStatusNode
            .getDepthFirstStream()
            .filter(VariableUsageNode.class::isInstance)
            .map(VariableUsageNode.class::cast)
            .collect(Collectors.toList());

    for (VariableUsageNode statusVariable : statusVariables) {
      List<VariableNode> definitionNode =
          VariableUsageUtils.getDefinitionNode(
              symbolAccumulatorService, fileStatusNode, Collections.singletonList(statusVariable));

      if (!definitionNode.isEmpty()) {
        validateFileStatusSection(processingContext, statusVariable, definitionNode);
        validateFileStatusIsTwoCharAlphanumeric(processingContext, statusVariable, definitionNode);
      }
    }
  }

  private void validateFileStatusIsTwoCharAlphanumeric(
      ProcessingContext processingContext,
      VariableUsageNode statusVariable,
      List<VariableNode> definitionNode) {
    if (definitionNode.get(0) instanceof VariableWithLevelNode) {
      VariableWithLevelNode statusDefinitionNode = (VariableWithLevelNode) definitionNode.get(0);
      List<String> picClauses = getPicClause(statusDefinitionNode);

      if (picClauses.isEmpty()) {
        addDataSizeError(processingContext, statusVariable);
      }
      try {
        int charLength = getCharLength(picClauses);
        if (charLength > 2) {
          addDataSizeError(processingContext, statusVariable);
        }
      } catch (UnsupportedOperationException ex) {
        addDataDataTypeError(processingContext, statusVariable);
      }
    } else {
      addDataSizeError(processingContext, statusVariable);
    }
  }

  private List<String> getPicClause(VariableWithLevelNode statusDefinitionNode) {
    List<String> picClauses =
        statusDefinitionNode.getChildren().stream()
            .filter(ElementaryNode.class::isInstance)
            .map(ElementaryNode.class::cast)
            .map(ElementaryNode::getPicClause)
            .map(formatPicClause())
            .collect(Collectors.toList());
    if (statusDefinitionNode instanceof ElementaryNode) {
      picClauses.add(
          formatPicClause().apply(((ElementaryNode) statusDefinitionNode).getPicClause()));
    }
    return picClauses;
  }

  private int getCharLength(List<String> picClauses) throws UnsupportedOperationException {
    int charCount = 0;
    for (String picClause : picClauses) {
      Matcher matcher = DATATYPE_FORMAT.matcher(picClause);
      if (matcher.find()) {
        String dataType = matcher.group("dataType");
        String byteLength = matcher.group("byteLength");
        if (Objects.nonNull(dataType)) {
          Matcher alphaNumericMatcher = ALPHANUMREIC_DATATYPE_REGEX.matcher(dataType);
          boolean isAlphanumeric = !alphaNumericMatcher.matches() || picClauses.size() != 1 || dataType.matches("(?i)([X9])+");
          if (!isAlphanumeric) {
            throw new UnsupportedOperationException("passed clause is not alhpanumeric");
          }
          int dataLength = alphaNumericMatcher.end() == 1 ? 1 : alphaNumericMatcher.end() - 1;
          int effectiveCharLength =
                  Objects.isNull(byteLength)
                          ? dataLength
                          : dataLength + Integer.parseInt(byteLength) - 1;
          charCount = charCount + effectiveCharLength;
        }
      }
    }
    return charCount;
  }

  private Function<String, String> formatPicClause() {
    return str -> str.trim().replace("\\s", "").toUpperCase();
  }

  private void addDataSizeError(
      ProcessingContext processingContext, VariableUsageNode statusVariable) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.ERROR)
                .location(statusVariable.getLocality().toOriginalLocation())
                .messageTemplate(
                    MessageTemplate.of("fileStatus.charLimit", statusVariable.getName()))
                .build());
  }

  private void addDataDataTypeError(
      ProcessingContext processingContext, VariableUsageNode statusVariable) {
    processingContext
        .getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.ERROR)
                .location(statusVariable.getLocality().toOriginalLocation())
                .messageTemplate(
                    MessageTemplate.of("fileStatus.allowedDataType", statusVariable.getName()))
                .build());
  }

  private void validateFileStatusSection(
      ProcessingContext processingContext,
      VariableUsageNode statusVariable,
      List<VariableNode> definitionNode) {
    VariableNode variableDefinitionNode = definitionNode.get(0);
    Boolean isStatusDefinedInCorrectSection =
        variableDefinitionNode
            .getNearestParentByType(NodeType.SECTION)
            .map(SectionNode.class::cast)
            .map(f -> SECTION_ALLOWED_FOR_STATUS_VARIABLES.contains(f.getSectionType()))
            .orElse(false);
    if (!isStatusDefinedInCorrectSection) {
      processingContext
          .getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.ERROR)
                  .location(statusVariable.getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of("fileStatus.allowedSection", statusVariable.getName()))
                  .build());
    }
  }
}
