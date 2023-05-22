package org.broadcom.cobol.dialects.cobolExample.processor;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.ERROR;

import java.util.Objects;
import java.util.Optional;
import org.broadcom.cobol.dialects.cobolExample.nodes.RpcNode;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp4j.Range;

public class ProcessRpcNode implements Processor<RpcNode> {
  private final MessageService messageService;

  public ProcessRpcNode(MessageService messageService) {
    this.messageService = messageService;
  }

  @Override
  public void accept(RpcNode rpcNode, ProcessingContext processingContext) {
    // identifier1 and identifier2 should not overlap
    Optional<VariableUsageNode> first = getVariableUsageNode(rpcNode, rpcNode.getIdentifier1());
    Optional<VariableUsageNode> second = getVariableUsageNode(rpcNode, rpcNode.getIdentifier2());

    Range identifier2DefinitionRange = null;
    if (!first.isPresent() || !second.isPresent()) {
      processingContext.getErrors().add(SyntaxError.syntaxError().errorSource(ErrorSource.DIALECT)
              .location(rpcNode.getIdentifier1().getLocality().toOriginalLocation())
              .suggestion(messageService.getMessage("identifier1 mandatory for RPC MSG PARSE statement"))
              .severity(ERROR)
              .build());
    } else {
      if (first.get().getDefinitions().isEmpty() || second.get().getDefinitions().isEmpty()) {
        return;
      }
      identifier2DefinitionRange = second.get().getDefinitions().get(0).getRange();

      boolean isIden1InsideIden2 =
          RangeUtils.isInside(
              first.get().getDefinitions().get(0).getRange(), identifier2DefinitionRange);
      boolean isIden2InsideIden1 =
          RangeUtils.isInside(
              identifier2DefinitionRange, first.get().getDefinitions().get(0).getRange());
      if (isIden1InsideIden2 || isIden2InsideIden1) {
        processingContext.getErrors().add(SyntaxError.syntaxError().errorSource(ErrorSource.DIALECT)
                .location(rpcNode.getIdentifier1().getLocality().toOriginalLocation())
                .suggestion(messageService.getMessage("myRule.rpc.ide1_iden2.mismatch"))
                .severity(ERROR)
                .build());
      }
    }

    // identifier4 should exist for identifier5 and identifier6 to exist
    if (Objects.nonNull(rpcNode.getIdentifier5()) || Objects.nonNull(rpcNode.getIdentifier6())) {
      if (Objects.isNull(rpcNode.getIdentifier4())) {
        ofNullable(rpcNode.getIdentifier6()).ifPresent(iden ->
                processingContext.getErrors().add(SyntaxError.syntaxError().errorSource(ErrorSource.DIALECT)
                        .location(iden.getLocality().toOriginalLocation())
                        .suggestion(messageService.getMessage("myRule.iden4.mandatory.iden5"))
                        .severity(ERROR)
                        .build()));
        ofNullable(rpcNode.getIdentifier6()).ifPresent(iden ->
                processingContext.getErrors().add(SyntaxError.syntaxError().errorSource(ErrorSource.DIALECT)
                        .location(iden.getLocality().toOriginalLocation())
                        .suggestion(messageService.getMessage("myRule.iden4.mandatory.iden6"))
                        .severity(ERROR)
                        .build()));
      }
    }

    // identifier3/4/5/6 must be one of its subordinate of identifier2
    checkSubordinatesIdentifier2(rpcNode, rpcNode.getIdentifier3(), identifier2DefinitionRange, processingContext);
    checkSubordinatesIdentifier2(rpcNode, rpcNode.getIdentifier4(), identifier2DefinitionRange, processingContext);
    checkSubordinatesIdentifier2(rpcNode, rpcNode.getIdentifier5(), identifier2DefinitionRange, processingContext);
    checkSubordinatesIdentifier2(rpcNode, rpcNode.getIdentifier6(), identifier2DefinitionRange, processingContext);
  }

  private void checkSubordinatesIdentifier2(
          RpcNode rpcNode, VariableNameAndLocality identifier, Range identifier2DefinitionRange, ProcessingContext processingContext) {
    ofNullable(identifier)
        .ifPresent(
            iden -> {
              Optional<VariableUsageNode> variableUsageNode = getVariableUsageNode(rpcNode, iden);
              if (!variableUsageNode.isPresent() || variableUsageNode.get().getDefinitions().isEmpty()) return;
              Range identifier1 = variableUsageNode.get().getDefinitions().get(0).getRange();
              if (!RangeUtils.isInside(identifier1, identifier2DefinitionRange)) {
                processingContext.getErrors().add(SyntaxError.syntaxError().errorSource(ErrorSource.DIALECT)
                        .location(iden.getLocality().toOriginalLocation())
                        .suggestion(messageService.getMessage("muRule.rpc.iden2.mandatory"))
                        .severity(ERROR)
                        .build());
              }
            });
  }

  private Optional<VariableUsageNode> getVariableUsageNode(
      RpcNode rpcNode, VariableNameAndLocality identifier) {
    return rpcNode
        .getDepthFirstStream()
        .filter(VariableUsageNode.class::isInstance)
        .map(VariableUsageNode.class::cast)
        .filter(
            node ->
                node.getName().equals(identifier.getName())
                    && node.getLocality().equals(identifier.getLocality()))
        .findFirst();
  }
}
