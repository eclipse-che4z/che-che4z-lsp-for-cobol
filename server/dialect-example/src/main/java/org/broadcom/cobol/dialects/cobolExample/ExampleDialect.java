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
package org.broadcom.cobol.dialects.cobolExample;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.broadcom.cobol.dialects.cobolExample.nodes.Level100Node;
import org.broadcom.cobol.dialects.cobolExample.nodes.RpcNode;
import org.broadcom.cobol.dialects.cobolExample.nodes.UnsetNode;
import org.broadcom.cobol.dialects.cobolExample.processor.ProcessLevel100Node;
import org.broadcom.cobol.dialects.cobolExample.processor.ProcessRpcNode;
import org.broadcom.cobol.dialects.cobolExample.processor.ProcessUnsetNode;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.action.CodeActionProvider;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.*;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp4j.Range;

@Slf4j
public class ExampleDialect implements CobolDialect {

  public static final String DIALECT_NAME = "example";
  public static final String WATCH_SETTINGS = "myRule.folderWatch";
  public static final String MISSING_INJECTS = "missing injects";
  private final MessageService messageService;
  private final CopybookService copybookService;

  public ExampleDialect(CopybookService copybookService, MessageService messageService) {
    this.messageService = messageService;
    this.copybookService = copybookService;
  }

  /**
   * Gets the name of the dialect
   *
   * @return the name of the dialect
   */
  @Override
  public String getName() {
    return DIALECT_NAME;
  }

  /**
   * Processing the text
   *
   * @param context is a DialectProcessingContext class with all needed data for dialect processing
   * @return the dialect processing result
   */
  @Override
  public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
    ExampleVisitor visitor = new ExampleVisitor(context);
    List<SyntaxError> errors = new ArrayList<>();

    // parse the document text to get parseTree
    ExampleParser.StartRuleContext startRuleContext =
        parseMyRule(
                context.getExtendedDocument().toString(), context.getExtendedDocument().getUri(), errors);

    // Traverse the parse tree to generate dialect specific nodes
    List<Node> nodes = new ArrayList<>(visitor.visitStartRule(startRuleContext));

    // Add nodes returned by extend method. CopNode in this scenario.
    nodes.addAll(context.getDialectNodes());

    // Add error encountered while visiting the parser. To be reported to COBOL LS engine.
    errors.addAll(visitor.getErrors());
    return new ResultWithErrors<>(new DialectOutcome(nodes, context), errors);
  }

  private ExampleParser.StartRuleContext parseMyRule(
      String text, String programDocumentUri, List<SyntaxError> errors) {
    ExampleLexer lexer = new ExampleLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ExampleParser parser = new ExampleParser(tokens);
    DialectParserListener listener = new DialectParserListener(programDocumentUri);
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new CobolErrorStrategy(messageService));

    ExampleParser.StartRuleContext result = parser.startRule();
    errors.addAll(listener.getErrors());
    return result;
  }

  /**
   * This implementation is specific to copybooks.
   * Use this when an external source content needs to be injected into a document before analysis.
   *
   * @param context data related to dialect processing
   * @return a list of syntax errors
   */
  @Override
  public List<SyntaxError> extend(DialectProcessingContext context) {
    // We have 2 implementation of ExampleParserBaseVisitor. We use InjectRuleVisitor implementation here, as
    // extending the document is only related to copybooks, inject statement in this example.
    // Here,  only concern is to get all the copyNodes and not to process the entire text.
    InjectRuleVisitor injectRuleVisitor = new InjectRuleVisitor(context);
    List<SyntaxError> errors = new ArrayList<>();

    // parse the document and get a ParseTree
    ExampleParser.StartRuleContext startRuleContext =
        parseMyRule(
            context.getExtendedDocument().toString(), context.getExtendedDocument().getUri(), errors);

    // Visit the parseTree to get Nodes as per the visitor's implementation.
    List<CopyNode> nodes = new ArrayList<>(injectRuleVisitor.visitStartRule(startRuleContext));
    nodes.forEach(
        node -> {
          String currentUri = context.getExtendedDocument().getCurrentText().getUri();

          // inject copybooks
          injectCopybook(
              context, errors, node, context.getProgramDocumentUri(), currentUri);
        });
    return errors;
  }

  private void injectCopybook(
      DialectProcessingContext ctx,
      List<SyntaxError> errors,
      CopyNode node,
      String programDocumentUri,
      String currentUri) {
    CopybookName copybookName = new CopybookName(node.getName(), ExampleDialect.DIALECT_NAME);
    CopybookModel copybookModel =
            copybookService.resolve(
                copybookName.toCopybookId(programDocumentUri),
                copybookName,
                programDocumentUri,
                currentUri,
                true).getResult();

    if (copybookModel.getUri() == null || copybookModel.getContent() == null) {
      errors.add(
          SyntaxError.syntaxError()
              .severity(ErrorSeverity.ERROR)
              .errorCode(() -> MISSING_INJECTS)
              .suggestion("Couldn't resolve the passed copybooks")
              .errorSource(ErrorSource.COPYBOOK)
              .location(node.getLocality().toOriginalLocation())
              .build());
      return;
    }
    Range range =
        ctx.getExtendedDocument().mapLocation(node.getLocality().getRange()).getRange();
    node.getLocality().setRange(range);

    range = ctx.getExtendedDocument().mapLocation(node.getNameLocation().getRange()).getRange();
    node.getNameLocation().setRange(range);

    // insert the copybook content.
    ExtendedDocument copybookDocument = new ExtendedDocument(copybookModel.getContent(), copybookModel.getUri());
    ctx.getExtendedDocument().insertCopybook(node.getLocality().getRange(), copybookDocument.getCurrentText());

    // It is important to note that node has a wrong URI here.This node was created inside InjectRuleVisitor,
    // with URI as program URI. But copyNode URI should point to resolved copybook path.
    // So, we create a new CopyNode and return here, alternatively
    // we could have created a custom object to hold copyNode information (inside InjectRuleVisitor) and
    // would have created a fresh CopyNode here with all correct information here after we resolved the copybook.
    CopyNode copyNode = new CopyNode(node.getLocality(), node.getNameLocation(),
            copybookModel.getCopybookName().getDisplayName(), ExampleDialect.DIALECT_NAME, copybookModel.getUri());
    ctx.getDialectNodes().add(copyNode);
  }

  /**
   * Return a list of processor descriptors.
   * These Processors help in custom checks on top of already existing ones provided by COBOL LS.
   *
   * @return a list of processor descriptors for the dialect
   */
  @Override
  public List<ProcessorDescription> getProcessors() {
    return ImmutableList.of(
        new ProcessorDescription(
            Level100Node.class,               // Processor for Level100, this needs to insert variable nodes
            ProcessingPhase.POST_DEFINITION,  // So, choose POST DEFINITION. So, that it won't impact the validation
            new ProcessLevel100Node(messageService)),
        new ProcessorDescription(
            RpcNode.class, ProcessingPhase.VALIDATION, new ProcessRpcNode(messageService)), // Processor of RPC Node
        new ProcessorDescription(
            UnsetNode.class, ProcessingPhase.VALIDATION, new ProcessUnsetNode(messageService))); // Processor for UnsetNode
  }

  /**
   * Define a order for dialect execution
   *
   * @return set of dialect processors, that should follow this one
   */
  @Override
  public Set<String> runBefore() {
    return CobolDialect.super.runBefore();
  }

  /**
   * Returns dialect keywords map where key is a keyword and a value is a description
   *
   * @return key/value map with keywords and descriptions
   */
  @Override
  public Map<String, String> getKeywords() {
    Properties props = new Properties();
    try {
      props.load(ExampleDialect.class.getClassLoader().getResourceAsStream("KeywordsMyRule.txt"));
      return props.entrySet().stream()
              .collect(
                      Collectors.toMap(
                              entry -> entry.getKey().toString(),
                              entry -> processDescription(entry.getValue().toString())));
    } catch (NullPointerException | IOException e) {
      LOG.error("Unable to load the Keywords file {}: {}", "KeywordsMyRule", e.getMessage());
    }
    return ImmutableMap.of();
  }

  /**
   * Replace line break tags with actual line breaks
   *
   * @param desc - raw description retrieved from storage
   * @return the description properly split in lines
   */
  private String processDescription(String desc) {
    return desc.replace("<br>", "\r\n\r\n");
  }

  /**
   * Return a list of settings sections for dialect.
   *
   * @return a list of settings sections
   */
  @Override
  public List<String> getSettingsSections() {
    return ImmutableList.of();
  }

  /**
   * Return a list of settings sections that hold dialect folders
   *
   * @return a list of settings sections
   */
  @Override
  public List<String> getWatchingFolderSettings() {
    return ImmutableList.of();
  }

  /**
   * Return a list of dialect specific server execute command capabilities.
   *
   * <p>These capabilities correspond to workspace/executeCommand request which is sent from the
   * client to the server to trigger command execution on the server.
   *
   * @return a list of server execute command capabilities
   */
  @Override
  public List<String> getDialectExecuteCommandCapabilities() {
    return ImmutableList.of(FindInjectsCommand.TITLE);
  }

  /**
   * Return a list of handlers for the dialect specific server execute command capabilities.
   *
   * <p>These handlers handle custom request which are registered via workspace/executeCommand
   *
   * @return a list of {@link CodeActionProvider}
   */
  @Override
  public List<CodeActionProvider> getDialectCodeActionProviders() {
    return ImmutableList.of(new FindInjectsCommand());
  }
}
