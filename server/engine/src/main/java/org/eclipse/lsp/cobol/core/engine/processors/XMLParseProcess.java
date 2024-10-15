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
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.common.processor.CompilerDirectiveName;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;
import org.eclipse.lsp.cobol.core.model.VariableUsageUtils;
import org.eclipse.lsp.cobol.common.model.tree.XMLParseNode;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

/** Apply all the validation for the XML Parse statement and return found errors. */
public class XMLParseProcess implements Processor<XMLParseNode> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  // TODO: remove undetermined once effective data type calculation is corrected
  public static final ImmutableList<EffectiveDataType> ALPHANUMERIC_DATA_TYPES =
      ImmutableList.of(
          EffectiveDataType.STRING, EffectiveDataType.INTEGER, EffectiveDataType.UNDETERMINED);
  public static final ImmutableList<String> CODED_CHARSET_FOR_XML_DOC =
      ImmutableList.of("1200",
          "1208", "1047", "1140", "37", "1141", "273", "1142", "277", "1143", "278", "1144", "280",
          "1145", "284", "1146", "285", "1147", "297", "1148", "500", "1149", "871");

  public XMLParseProcess(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(XMLParseNode xmlParseNode, ProcessingContext processingContext) {
    List<String> xmlParseCompilerDirectiveOptions = getXmlParseCompilerDirectiveOptions(processingContext);

    boolean isXmlss = isXmlssCompilerOptionEnabled(xmlParseCompilerDirectiveOptions);

    List<VariableNode> identifier1Definitions = getVariableDefinition(xmlParseNode, xmlParseNode.getIdentifier1());
    if (identifier1Definitions.isEmpty()) {
      return;
    }

    semanticCheckForAlphanumericNode(
        xmlParseNode,
        processingContext,
        MessageTemplate.of(
            "xmlParse.identifier1.dataType", xmlParseNode.getIdentifier1().getName()),
        identifier1Definitions,
        xmlParseNode.getIdentifier1().getLocality().toOriginalLocation());

    boolean isNational = isIdentifier1UsageNational(identifier1Definitions);

    semanticCheckForEncoding(xmlParseNode, processingContext, isXmlss, isNational);

    semanticCheckForReturnNational(xmlParseNode, processingContext, isXmlss);

    semanticCheckForValidatePhase(xmlParseNode, processingContext, isXmlss);

    if (Objects.nonNull(xmlParseNode.getIdentifier2())) {
      semanticCheckForAlphanumericNode(
          xmlParseNode,
          xmlParseNode.getIdentifier2(),
          processingContext,
          MessageTemplate.of(
              "xmlParse.identifier2.dataType", xmlParseNode.getIdentifier2().getName()));
    }
  }

  private boolean isIdentifier1UsageNational(List<VariableNode> identifier1Definitions) {
    boolean isNational;
    if (identifier1Definitions.get(0) instanceof ElementaryNode) {
      ElementaryNode foundDefinitionNode = (ElementaryNode) identifier1Definitions.get(0);
      isNational = foundDefinitionNode.getUsageFormat() == UsageFormat.NATIONAL;
    } else {
      isNational =
          ((GroupItemNode) identifier1Definitions.get(0)).getUsageFormat() == UsageFormat.NATIONAL;
    }
    return isNational;
  }

  private boolean isXmlssCompilerOptionEnabled(List<String> xmlParseCompilerDirectiveOptions) {
    return !xmlParseCompilerDirectiveOptions.isEmpty()
        && xmlParseCompilerDirectiveOptions
            .get(xmlParseCompilerDirectiveOptions.size() - 1)
            .equals("XMLSS");
  }

  private List<VariableNode> getVariableDefinition(
      XMLParseNode xmlParseNode, VariableNameAndLocality identifier) {
    if (Objects.nonNull(identifier)) {
      List<VariableUsageNode> variableUsageNodeForIdentifier =
          VariableUsageUtils.getVariableUsageNode(xmlParseNode, identifier);
      if (variableUsageNodeForIdentifier.isEmpty()) {
        return Collections.emptyList();
      }
      return VariableUsageUtils.getDefinitionNode(symbolAccumulatorService, xmlParseNode, variableUsageNodeForIdentifier);
    }
    return Collections.emptyList();
  }

  private void semanticCheckForAlphanumericNode(
      XMLParseNode xmlParseNode,
      VariableNameAndLocality identifier,
      ProcessingContext ctx,
      MessageTemplate messageTemplate) {
    List<VariableNode> identifierDefinitions = getVariableDefinition(xmlParseNode, identifier);
    if (identifierDefinitions.isEmpty()) {
      return;
    }

    semanticCheckForAlphanumericNode(
        xmlParseNode,
        ctx,
        messageTemplate,
        identifierDefinitions,
        xmlParseNode.getIdentifier2().getLocality().toOriginalLocation());
  }

  private void semanticCheckForAlphanumericNode(
      XMLParseNode xmlParseNode,
      ProcessingContext ctx,
      MessageTemplate messageTemplate,
      List<VariableNode> identifierDefinitions,
      OriginalLocation location) {
    if (identifierDefinitions.get(0) instanceof EffectiveData) {
      EffectiveData dataDefinition = (EffectiveData) identifierDefinitions.get(0);
      if (!ALPHANUMERIC_DATA_TYPES.contains(dataDefinition.getEffectiveDataType())) {
        addErrorForNotAlphanumericData(xmlParseNode, ctx, location, messageTemplate);
      }
    } else if (identifierDefinitions.get(0) instanceof GroupItemNode) {
      boolean isAlphanumeric =
          identifierDefinitions
              .get(0)
              .getDepthFirstStream()
              .filter(ElementaryNode.class::isInstance)
              .map(ElementaryNode.class::cast)
              .allMatch(node -> ALPHANUMERIC_DATA_TYPES.contains(node.getEffectiveDataType()));
      if (!isAlphanumeric) {
        addErrorForNotAlphanumericData(xmlParseNode, ctx, location, messageTemplate);
      }
    }
  }

  private void addErrorForNotAlphanumericData(
      XMLParseNode xmlParseNode,
      ProcessingContext ctx,
      OriginalLocation location,
      MessageTemplate messageTemplate) {
    String name = xmlParseNode.getIdentifier1().getName();
    ctx.getErrors()
        .add(
            SyntaxError.syntaxError()
                .errorSource(ErrorSource.PARSING)
                .severity(ErrorSeverity.ERROR)
                .location(location)
                .messageTemplate(messageTemplate)
                .build());
  }

  private void semanticCheckForValidatePhase(
      XMLParseNode xmlParseNode, ProcessingContext processingContext, boolean isXmlss) {
    if (Objects.nonNull(xmlParseNode.getXmlValidatingContext()) && !isXmlss) {
      processingContext
          .getErrors()
          .add(
              SyntaxError.syntaxError()
                  .errorSource(ErrorSource.PARSING)
                  .severity(ErrorSeverity.HINT)
                  .location(xmlParseNode.getXmlValidatingContext().getLocality().toOriginalLocation())
                  .messageTemplate(
                      MessageTemplate.of(
                          "xmlParse.validating.phrase"))
                  .build());
    }
  }

  private void semanticCheckForReturnNational(
      XMLParseNode xmlParseNode, ProcessingContext processingContext, boolean isXmlss) {
    if (Objects.nonNull(xmlParseNode.getXmlNationalContext())) {
      if (!isXmlss) {
        processingContext
            .getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.HINT)
                    .location(
                        xmlParseNode.getXmlNationalContext().getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlParse.returnNational.phrase"))
                    .build());
      }
    }
      if (Objects.nonNull(xmlParseNode.getEncodingLocality())) {
        if (!CODED_CHARSET_FOR_XML_DOC.contains(xmlParseNode.getEncodingLocality().getName())) {
          processingContext
              .getErrors()
              .add(
                  SyntaxError.syntaxError()
                      .errorSource(ErrorSource.PARSING)
                      .severity(ErrorSeverity.HINT)
                      .location(
                          xmlParseNode.getEncodingLocality().getLocality().toOriginalLocation())
                      .messageTemplate(MessageTemplate.of("xmlParse.unsupported.ccid"))
                      .build());
        }
      }
  }

  private void semanticCheckForEncoding(
      XMLParseNode xmlParseNode,
      ProcessingContext processingContext,
      boolean isXmlss,
      boolean isNational) {
    if (Objects.nonNull(xmlParseNode.getEncodingLocality())) {
      if (!isXmlss) {
        processingContext
            .getErrors()
            .add(
                SyntaxError.syntaxError()
                    .errorSource(ErrorSource.PARSING)
                    .severity(ErrorSeverity.HINT)
                    .location(xmlParseNode.getEncodingLocality().getLocality().toOriginalLocation())
                    .messageTemplate(
                        MessageTemplate.of(
                            "xmlParse.encoding.phrase"))
                    .build());
      }
      if (isNational) {
        // encoding ccid must be 1200 for a national item
        if (!xmlParseNode.getEncodingLocality().getName().equals("1200")) {
          addErrorForNotAlphanumericData(
              xmlParseNode,
              processingContext,
              xmlParseNode.getEncodingLocality().getLocality().toOriginalLocation(),
              MessageTemplate.of("xmlParse.ccid.nationalItem"));
        }
      }
    }
  }

  private List<String> getXmlParseCompilerDirectiveOptions(ProcessingContext processingContext) {
    return processingContext.getCompilerDirectiveContext()
            .filterDirectiveList(ImmutableList.of(CompilerDirectiveName.XMLPARSE))
              .orElse(CompilerDirectiveName.XMLPARSE.defaultValue())
            .getValue();

  }
}
