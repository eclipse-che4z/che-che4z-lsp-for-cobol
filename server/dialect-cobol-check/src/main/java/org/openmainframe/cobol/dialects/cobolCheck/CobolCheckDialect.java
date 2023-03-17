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
package org.openmainframe.cobol.dialects.cobolCheck;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectOutcome;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.processor.ProcessorDescription;
import org.eclipse.lsp.cobol.common.utils.KeywordsUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Process the text according to the CUT rules */
public class CobolCheckDialect implements CobolDialect {
    public static final String NAME = "COBOL-CHECK";
    private final MessageService messageService;
    private final CopybookService copybookService;

    public CobolCheckDialect(CopybookService copybookService, MessageService messageService) {
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
        return NAME;
    }

    /**
     * Processing the text
     *
     * @param context is a DialectProcessingContext class with all needed data for dialect processing
     * @return the dialect processing result
     */
    @Override
    public ResultWithErrors<DialectOutcome> processText(DialectProcessingContext context) {
        CutVisitor visitor = new CutVisitor(context);
        List<SyntaxError> errors = new ArrayList<>();
        CutParser.StartRuleContext startRuleContext = parseCut(context.getExtendedSource().getText(),
                context.getExtendedSource().getUri(), errors);
        List<Node> nodes = new ArrayList<>(visitor.visitStartRule(startRuleContext));
        errors.addAll(visitor.getErrors());
        return new ResultWithErrors<>(new DialectOutcome(nodes, context), errors);
    }

    /**
     * Get document extension data from dialect. This data should be added to an argument.
     *
     * @param context data related to dialect processing
     * @return a list of syntax errors
     */
    @Override
    public List<SyntaxError> extend(DialectProcessingContext context) {
        return ImmutableList.of();
    }

    /**
     * Return a list of processor descriptors.
     *
     * @return a list of processor descriptors for the dialect
     */
    @Override
    public List<ProcessorDescription> getProcessors() {
        return CobolDialect.super.getProcessors();
    }

    /**
     * Returns dialect keywords map where key is a keyword and a value is a description
     *
     * @return key/value map with keywords and descriptions
     */
    @Override
    public Map<String, String> getKeywords() {
        return KeywordsUtils.getKeywords("KeywordsIdms.txt");
    }


    /**
     * Return a list of settings sections that hold dialect folders
     *
     * @return a list of settings sections
     */
    //TODO: check the what folders need to be watched for cobol check
    @Override
    public List<String> getWatchingFolderSettings() {
        return CobolDialect.super.getWatchingFolderSettings();
    }

    private CutParser.StartRuleContext parseCut(
            String text, String programDocumentUri, List<SyntaxError> errors) {
        CutLexer lexer = new CutLexer(CharStreams.fromString(text));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CutParser parser = new CutParser(tokens);
        DialectParserListener listener = new DialectParserListener(programDocumentUri);
        lexer.removeErrorListeners();
        lexer.addErrorListener(listener);
        parser.removeErrorListeners();
        parser.addErrorListener(listener);
        parser.setErrorHandler(new CobolErrorStrategy(messageService));

        CutParser.StartRuleContext result = parser.startRule();
        errors.addAll(listener.getErrors());
        return result;
    }
}
