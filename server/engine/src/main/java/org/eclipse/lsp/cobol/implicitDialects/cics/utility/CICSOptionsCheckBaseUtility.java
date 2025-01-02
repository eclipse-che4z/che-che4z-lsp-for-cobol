/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.ArrayUtils;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Common facilities for checking CICS parser options
 */
@Slf4j
public abstract class CICSOptionsCheckBaseUtility {

    private final DialectProcessingContext context;

    private final List<SyntaxError> errors;

    private final Map<Integer, ErrorSeverity> baseDuplicateOptions =
            new HashMap<Integer, ErrorSeverity>() {
                {
                    put(CICSLexer.ASIS, ErrorSeverity.WARNING);
                    put(CICSLexer.BUFFER, ErrorSeverity.WARNING);
                    put(CICSLexer.LEAVEKB, ErrorSeverity.WARNING);
                    put(CICSLexer.NOTRUNCATE, ErrorSeverity.WARNING);
                    put(CICSLexer.NOQUEUE, ErrorSeverity.WARNING);
                    // handle response options
                    put(CICSLexer.RESP, ErrorSeverity.ERROR);
                    put(CICSLexer.RESP2, ErrorSeverity.ERROR);
                    put(CICSLexer.WAIT, ErrorSeverity.ERROR);
                    put(CICSLexer.NOHANDLE, ErrorSeverity.ERROR);
                }
            };

    private final Map<Integer, String> baseDuplicateRulesOptions = new HashMap<Integer, String>() {
        {
            put(CICSParser.RULE_cics_into, "INTO or SET");
        }
    };

    public CICSOptionsCheckBaseUtility(
            DialectProcessingContext context,
            List<SyntaxError> errors,
            Map<Integer, ErrorSeverity> duplicateOptions) {
        this.context = context;
        this.errors = errors;
        this.baseDuplicateOptions.putAll(duplicateOptions);
    }

    public CICSOptionsCheckBaseUtility(
            DialectProcessingContext context,
            List<SyntaxError> errors,
            Map<Integer, ErrorSeverity> duplicateOptions,
            Map<Integer, String> duplicateRulesOptions) {
        this.context = context;
        this.errors = errors;
        this.baseDuplicateOptions.putAll(duplicateOptions);
        this.baseDuplicateRulesOptions.putAll(duplicateRulesOptions);
    }

    /**
     * General entrypoint to check CICS rule options
     *
     * @param ctx ParserRuleContext subclass containging options
     * @param <E> A subclass of ParserRuleContext
     */
    public abstract <E extends ParserRuleContext> void checkOptions(E ctx);

    /**
     * Helper method to collect analysis errors if the rule context does not contain mandatory options
     *
     * @param rules   Generic list of rules to check. Will either be a collection of ParserRuleContext
     *                or TerminalNode
     * @param ctx     Context to extrapolate locality against
     * @param options Options checked to insert into error message
     * @return true if mandatory option found
     */
    protected boolean checkHasMandatoryOptions(List<?> rules, ParserRuleContext ctx, String options) {
        if (rules.isEmpty()) {
            throwException(
                    ErrorSeverity.ERROR,
                    VisitorUtility.constructLocality(ctx, context),
                    "Missing required option: ",
                    options);
            return false;
        }
        return true;
    }

    /**
     * @param requiredContext - The rule that is required
     * @param optionalContext - The rule that is optional
     * @param ctx             - The overall context.
     * @param options         - String of the element that is required.
     */
    protected <E extends ParseTree> void checkPrerequisiteIsMet(List<E> requiredContext, List<E> optionalContext, ParserRuleContext ctx, String options) {
        checkPrerequisiteIsMet(isNodePresent(requiredContext), isNodePresent(optionalContext), ctx, options);
    }

    protected <E extends ParseTree> void checkPrerequisiteIsMet(E requiredContext, List<E> optionalContext, ParserRuleContext ctx, String options) {
        checkPrerequisiteIsMet(isNodePresent(requiredContext), isNodePresent(optionalContext), ctx, options);
    }

    protected <E extends ParseTree> void checkPrerequisiteIsMet(List<E> requiredContext, E optionalContext, ParserRuleContext ctx, String options) {
        checkPrerequisiteIsMet(isNodePresent(requiredContext), isNodePresent(optionalContext), ctx, options);
    }

    protected <E extends ParseTree> void checkPrerequisiteIsMet(E requiredContext, E optionalContext, ParserRuleContext ctx, String options) {
        checkPrerequisiteIsMet(isNodePresent(requiredContext), isNodePresent(optionalContext), ctx, options);
    }

    private <E extends ParseTree> Boolean isNodePresent(E node) {
        return node != null;
    }

    private <E extends ParseTree> boolean isNodePresent(List<E> node) {
        if (node == null || node.isEmpty()) {
            return false;
        }

        for (E e : node) {
            if (e != null) {
                return true;
            }
        }
        return false;
    }

    private void checkPrerequisiteIsMet(Boolean isRequiredContextPresent, Boolean isOptionalContextPresent, ParserRuleContext ctx, String options) {
        if (!isRequiredContextPresent && isOptionalContextPresent) {
            throwException(
                    ErrorSeverity.ERROR,
                    VisitorUtility.constructLocality(ctx, context),
                    "Missing required option for: ",
                    options);
        }
    }

    /**
     * Helper method to collect analysis errors if the rule context contains illegal options
     *
     * @param rules   Generic list of rules to check. Will either be a collection of ParserRuleContext
     *                or TerminalNode
     * @param options Options checked to insert into error message
     */
    protected <E extends ParseTree> void checkHasIllegalOptions(List<E> rules, String options) {
        if (!rules.isEmpty()) {
            rules.forEach(
                    error ->
                            throwException(
                                    ErrorSeverity.ERROR, getLocality(error), "Invalid option provided: ", options));
        }
    }

    /**
     * Helper function to check and see if more than one rule was visited out of a set provided.
     *
     * @param options Options checked to insert into error message
     * @param rules   Generic list of rules to check. Will be a collection of ParserRuleContext and/or TerminalNode objects.
     * @param <E>     Generic type to allow cross-rule context collection.
     */
    @SafeVarargs
    protected final <E> void checkMutuallyExclusiveOptions(String options, E... rules) {
        if (rules.length <= 1) {
            return;
        }

        int rulesSeen = 0;
        boolean isRuleList = false;

        for (E rule : rules) {
            isRuleList = false;
            if (rule == null) {
                continue;
            }

            if (ParserRuleContext.class.isAssignableFrom(rule.getClass()) || TerminalNode.class.isAssignableFrom(rule.getClass())) {
                rulesSeen++;
            } else if (List.class.isAssignableFrom(rule.getClass())) {
                if (((List<?>) rule).isEmpty()) {
                    continue;
                }

                rulesSeen++;
                isRuleList = true;
            }

            if (rulesSeen > 1) {
                throwException(ErrorSeverity.ERROR, getLocality(isRuleList ? ((List<?>) rule).get(0) : rule), "Options \"" + options + "\" are mutually exclusive.", "");
                break;
            }
        }
    }

    /**
     * Iterates over the provided response handlers, extracts what is provided, and validates there is
     * not RESP2 without RESP
     *
     * @param ruleHandlers Response handlers from parser rule
     */
    protected void checkResponseHandlers(CICSParser.Cics_handle_responseContext ruleHandlers) {
        boolean respFound = false;
        List<TerminalNode> respTwoResponseHandlers = new ArrayList<>();
        if (ruleHandlers.cics_inline_handle_exception() != null) {
            List<CICSParser.Cics_respContext> rules =
                    ruleHandlers.cics_inline_handle_exception().cics_resp();
            for (CICSParser.Cics_respContext rule : rules) {
                if (rule.RESP() != null) respFound = true;
                if (rule.RESP2() != null) respTwoResponseHandlers.add(rule.RESP2());
            }
        }
        if (!respFound) {
            checkHasIllegalOptions(respTwoResponseHandlers, "RESP2");
        }
    }

    /**
     * Gets the locality of an element passed as a generic type. Only supports ParserRuleContext and
     * TerminalNode.
     *
     * @param rule Rule to construct locality for
     * @param <E>  Generic locality source type
     * @return The locality of the rule
     */
    private <E> Locality getLocality(E rule) {
        if (ParserRuleContext.class.isAssignableFrom(rule.getClass()))
            return VisitorUtility.constructLocality((ParserRuleContext) rule, context);
        else return VisitorUtility.constructLocality((TerminalNode) rule, context);
    }

    private void throwException(
            ErrorSeverity errorSeverity, @NonNull Locality locality, String message, String wrongToken) {
        SyntaxError error =
                SyntaxError.syntaxError()
                        .errorSource(ErrorSource.PARSING)
                        .location(locality.toOriginalLocation())
                        .suggestion(message + wrongToken)
                        .severity(errorSeverity)
                        .build();

        LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
        if (!errors.contains(error)) {
            errors.add(error);
        }
    }

    /**
     * Checks context passed as parameter for duplicate options by traversing the Parse Tree. Also
     * iterates over the response handler by calling checkResponseHandler(), if the
     * Cics_handle_response context is found, to ensure there is not a RESP2 option provided without a
     * RESP option
     *
     * @param ctx              ParserRuleContext To evaluate
     * @param duplicateOptions Custom duplicate options to evaluate against
     */
    private void checkDuplicateEntries(
            ParserRuleContext ctx, Set<Integer> entries, Map<Integer, ErrorSeverity> duplicateOptions) {
        List<TerminalNode> children = new ArrayList<>();
        getAllTokenChildren(ctx, children, true);
        children.forEach(
                child -> {
                    int option = child.getSymbol().getType();
                    if (duplicateOptions.containsKey(option)) {
                        if (!entries.add(option)) {
                            throwException(
                                    duplicateOptions.get(option),
                                    getLocality(child),
                                    "Excessive options provided for: ",
                                    child.getSymbol().getText());
                        }
                    }
                });
    }

    private void processDuplicateRules(ParserRuleContext ctx, Map<Integer, String> subruleOptions) {
        Set<Integer> seenRules = new HashSet<>();
        for (ParserRuleContext child : ctx.getRuleContexts(ParserRuleContext.class)) {
            int ruleId = child.getRuleIndex();
            String name = subruleOptions.get(ruleId);
            if (name == null) continue;
            if (seenRules.add(ruleId)) continue;
            throwException(ErrorSeverity.ERROR, getLocality(child), "Options \"" + name + "\" cannot be used more than once in a given command.", "");
        }
    }

    /**
     * Client accessible entrypoint to check for duplicates.
     *
     * @param ctx Higher order context as ParserRuleContext to traverse for duplicates
     */
    protected void checkDuplicates(ParserRuleContext ctx) {
        checkDuplicates(ctx, null);
    }

    /**
     * Additional check duplicates method that can utilize custom duplicate error severity options not
     * used for the whole command set
     *
     * @param ctx                    ParserRuleContext To evaluate
     * @param customDuplicateOptions Custom duplicate options to evaluate against
     */
    protected void checkDuplicates(
            ParserRuleContext ctx, Map<Integer, ErrorSeverity> customDuplicateOptions) {
        checkDuplicates(ctx, customDuplicateOptions, null);
    }

    protected void checkDuplicates(ParserRuleContext ctx, Map<Integer, ErrorSeverity> customDuplicateOptions, Map<Integer, String> customDuplicateRuleOptions) {
        // Check for duplicate options
        Set<Integer> foundEntries = new HashSet<>();
        Map<Integer, ErrorSeverity> updatedDuplicateOptions = new HashMap<>(baseDuplicateOptions);
        if (customDuplicateOptions != null) updatedDuplicateOptions.putAll(customDuplicateOptions);
        checkDuplicateEntries(ctx, foundEntries, updatedDuplicateOptions);

        // Check for duplicate rules
        Map<Integer, String> updatedRuleOptions = new HashMap<>(baseDuplicateRulesOptions);
        if (customDuplicateRuleOptions != null) updatedRuleOptions.putAll(customDuplicateRuleOptions);
        processDuplicateRules(ctx, updatedRuleOptions);
    }

    /**
     * Flags errors for rule lists passed as parameters if there are multiple instances of mutually
     * exclusive options.
     *
     * @param options Options checked to insert into error message
     * @param rules   Lists of TerminalNode to iterate through
     * @return Number of TerminalNode instances found
     */
    protected int checkHasMutuallyExclusiveOptions(String options, List<TerminalNode>... rules) {
        List<TerminalNode> nodes =
                Stream.of(rules)
                        .filter(rule -> !rule.isEmpty())
                        .flatMap(Collection::stream)
                        .collect(Collectors.toList());
        nodes.removeIf(Objects::isNull);

        // Only raise error if this validates mutual exclusivity and is not an artifact of duplicate
        // options
        if (!nodes.stream()
                .allMatch(e -> e.getSymbol().getType() == nodes.get(0).getSymbol().getType())) {
            nodes.forEach(
                    node -> {
                        throwException(
                                ErrorSeverity.ERROR,
                                getLocality(node),
                                "Exactly one option required, options are mutually exclusive: ",
                                options);
                    });
        }
        return nodes.size();
    }

    protected <E extends ParseTree> void checkHasExactlyOneOption(
            String options, ParserRuleContext parentCtx, List<E>... rules) {

        List<TerminalNode> children = new ArrayList<>();

        Stream.of(rules)
                .filter(rule -> !rule.isEmpty())
                .forEach(
                        rule -> {
                            rule.removeIf(Objects::isNull);
                            if (TerminalNode.class.isAssignableFrom(rule.get(0).getClass()))
                                children.addAll((List<TerminalNode>) rule);
                            else
                                rule.forEach(
                                        context -> getAllTokenChildren((ParserRuleContext) context, children, false));
                        });

        if (checkHasMutuallyExclusiveOptions(options, children) == 0) {
            throwException(
                    ErrorSeverity.ERROR,
                    getLocality(parentCtx),
                    "Exactly one option required, none provided: ",
                    options);
        }
    }

    protected void getAllTokenChildren(
            ParserRuleContext ctx, List<TerminalNode> children, boolean validateResponseHandler) {
        if (ctx.children == null) return;
        ctx.children.forEach(
                child -> {
                    if (TerminalNode.class.isAssignableFrom(child.getClass())
                            && baseDuplicateOptions.containsKey(((TerminalNode) child).getSymbol().getType()))
                        children.add((TerminalNode) child);
                    else if (ParserRuleContext.class.isAssignableFrom(child.getClass())) {
                        if (validateResponseHandler
                                && child.getClass().getSimpleName().equals("Cics_handle_responseContext"))
                            checkResponseHandlers((CICSParser.Cics_handle_responseContext) child);
                        if (!CICSParser.Cics_data_areaContext.class.isAssignableFrom(child.getClass())
                                && !CICSParser.Cics_nameContext.class.isAssignableFrom(child.getClass())
                                && !CICSParser.Cics_data_valueContext.class.isAssignableFrom(child.getClass())) {
                            getAllTokenChildren((ParserRuleContext) child, children, validateResponseHandler);
                        }
                    }
                });
    }

    /**
     * Throws error for commands without correct translator options
     *
     * @param rule                    Context to throw the error on
     * @param missingTranslatorOption The option name that is missing
     * @param <E>                     Generic for rule type
     */
    public <E> void throwIfMissingTranslatorOption(E rule, String missingTranslatorOption) {
        throwException(
                ErrorSeverity.ERROR,
                getLocality(rule),
                "Invalid CICS command without translator option: ",
                missingTranslatorOption);
    }

    /**
     * Throws error for commands with incorrect browse usage
     *
     * @param rule    Context to throw the error on
     * @param message Invalid Browse Usage Message
     * @param <E>     Generic for rule type
     */
    public <E> void throwBrowsingViolation(E rule, String message) {
        throwException(
                ErrorSeverity.ERROR, getLocality(rule), "Invalid option or parameter provided: ", message);
    }

    /**
     * Validates parser rules to ensure browser functionality
     *
     * @param ctx            Context to evaluate
     * @param coreTokenIndex The CICSParser index(ices) for the core token(s)
     */
    public void checkBrowsingInvalidOptions(ParserRuleContext ctx, int... coreTokenIndex) {
        if (ctx.children == null) return;
        for (int index = 0; index < ctx.children.size(); index++) {
            if (!TerminalNode.class.isAssignableFrom(ctx.children.get(index).getClass())) continue;
            int tokenIndex = ((TerminalNode) ctx.children.get(index)).getSymbol().getType();
            boolean isCoreToken = ArrayUtils.contains(coreTokenIndex, tokenIndex);
            if (!isCoreToken
                    && tokenIndex != CICSParser.START
                    && tokenIndex != CICSParser.AT
                    && tokenIndex != CICSParser.END
                    && tokenIndex != CICSParser.NEXT) {
                throwBrowsingViolation(
                        ctx.children.get(index),
                        "Accessory options not allowed when browsing with START or END");
            }
        }
    }

    /**
     * Ensures the main option has it's required parameter when not browsing with START or END
     *
     * @param ctx            Context to evaluate
     * @param coreTokenIndex The CICSParser index for the core rules with required parameter
     */
    public void checkStatementHasParameter(ParserRuleContext ctx, int... coreTokenIndex) {
        // Make sure the main option has it's required parameter if not browsing with START or END
        if (ctx.children == null) return;
        int traversalIndex = 0;
        for (ParseTree rule : ctx.children) {
            if (TerminalNode.class.isAssignableFrom(rule.getClass())) {
                if (ArrayUtils.contains(coreTokenIndex, ((TerminalNode) rule).getSymbol().getType())) {
                    if (traversalIndex + 1 < ctx.children.size()) {
                        ParseTree child = ctx.children.get(traversalIndex + 1).getChild(0);
                        if (child == null || (TerminalNode.class.isAssignableFrom(child.getClass()) && ((TerminalNode) child).getSymbol().getType() != CICSLexer.LPARENCHAR)) {
                            throwBrowsingViolation(
                                    ctx.children.get(traversalIndex), "Missing required option parameter");
                        }
                    } else
                        throwBrowsingViolation(
                                ctx.children.get(traversalIndex), "Missing required option parameter");
                    break;
                }
            }
            traversalIndex++;
        }
    }

    /**
     * Ensures the main option does not have parameter if browsing with START or END
     *
     * @param ctx            Context to evaluate
     * @param coreTokenIndex The CICSParser index for the core rules without parameters
     */
    public void checkBrowsingHasNotParameter(ParserRuleContext ctx, int... coreTokenIndex) {
        // Make sure the main option does not have parameter if browsing with START or END
        int traversalIndex = 0;
        if (ctx.children == null) return;
        for (ParseTree rule : ctx.children) {
            if (TerminalNode.class.isAssignableFrom(rule.getClass())) {
                if (ArrayUtils.contains(coreTokenIndex, ((TerminalNode) rule).getSymbol().getType())) {
                    if (traversalIndex + 1 < ctx.children.size()) {
                        ParseTree child = ctx.children.get(traversalIndex + 1).getChild(0);
                        if (child != null
                                && (TerminalNode.class.isAssignableFrom(child.getClass()) && ((TerminalNode) child).getSymbol().getType() == CICSLexer.LPARENCHAR)) {
                            throwBrowsingViolation(
                                    ctx.children.get(traversalIndex + 1),
                                    "Parameter usage when browsing with START or END");
                        }
                    }
                    break;
                }
            }
            traversalIndex++;
        }
    }

    /**
     * Checks common Browsing options of START, END, NEXT for mutual exclusivity
     *
     * @param ctx ParserRuleContext to validate
     * @param <E> Generic type of ParserRuleContext subclass
     */
    public <E extends ParserRuleContext> void checkBrowseMutuallyExclusive(E ctx) {
        if (ctx.children == null) return;
        int[] browsingIndices = {CICSParser.START, CICSParser.END, CICSParser.NEXT};
        List<TerminalNode> browsingContexts =
                ctx.children.stream().filter(TerminalNode.class::isInstance)
                        .map(TerminalNode.class::cast)
                        .filter(t -> ArrayUtils.contains(browsingIndices, t.getSymbol().getType()))
                        .collect(Collectors.toList());
        checkHasMutuallyExclusiveOptions("START or END or NEXT", browsingContexts);
    }

    /**
     * Performs a common BROWSING check to validate parameters and options for certain BROWSING scenarios
     * with START and END
     *
     * @param ctx       Context to validate
     * @param coreToken The core token of the rule
     * @param <E>       Generic type of ParserRuleContext subclass
     */
    public <E extends ParserRuleContext> void checkBrowsingCommon(E ctx, int coreToken) {
        checkBrowseMutuallyExclusive(ctx);
        CICSParser.Cics_browse_start_endContext startEndCtx = ctx.getChild(CICSParser.Cics_browse_start_endContext.class, 0);
        if (startEndCtx != null) {
            checkBrowsingInvalidOptions(ctx, coreToken);
            checkBrowsingHasNotParameter(ctx, coreToken);
        } else checkStatementHasParameter(ctx, coreToken);
    }
}
