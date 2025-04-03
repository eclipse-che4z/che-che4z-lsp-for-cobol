/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.test.engine;

import lombok.Getter;
import org.eclipse.lsp.cobol.common.symbols.ProcedureId;
import org.eclipse.lsp4j.Location;
import org.eclipse.usecase.UseCasePreprocessorBaseListener;
import org.eclipse.usecase.UseCasePreprocessorParser;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.test.engine.UseCasePreprocessorListener.*;

/**
 * Resolves usage of procedures in use-case text.
 */
@Getter
public class UseCaseUsageResolver extends UseCasePreprocessorBaseListener {
    private final TestData processingResult;
    private String currentSectionName = null;

    public UseCaseUsageResolver(TestData processingResult) {
        this.processingResult = processingResult;
    }

    @Override
    public void exitParagraphStatement(UseCasePreprocessorParser.ParagraphStatementContext ctx) {
        UseCasePreprocessorParser.ParagraphUsageContext p = ctx.paragraphUsage();
        if (p == null) {
            return;
        }
        UseCasePreprocessorParser.SectionUsageContext su = ctx.sectionUsage();
        if (su != null) {
            return;
        }

        String procedureName = getReplacementText(p.word().getText(), p.word().replacement()).get(0).toUpperCase();
        ProcedureId procedureId = new ProcedureId(null, procedureName);
        ProcedureId possibleParagraphId = new ProcedureId(currentSectionName, procedureName);
        Map<ProcedureId, List<Location>> definitions = processingResult.getProcedureDefinitions();
        if (definitions.containsKey(possibleParagraphId)) {
            moveUsageLocation(procedureId, possibleParagraphId);
            return;
        }
        ProcedureId possibleSectionId = new ProcedureId(procedureName, null);
        if (definitions.containsKey(possibleSectionId)) {
            moveUsageLocation(procedureId, possibleSectionId);
            return;
        }
        // Resolve all variants
        List<ProcedureId> candidates = new ArrayList<>();
        for (Map.Entry<ProcedureId, List<Location>> en : definitions.entrySet()) {
            if (procedureName.equals(en.getKey().getParagraphName())) {
                candidates.add(en.getKey());
            }
            if (en.getKey().isSection() && procedureName.equals(en.getKey().getSectionName())) {
                candidates.add(en.getKey());
            }
        }
        if (!candidates.isEmpty()) {
            List<Location> locations = processingResult.getProcedureUsages().remove(procedureId);
            candidates.forEach(en -> processingResult.getProcedureUsages().put(en, locations));
        }
    }

    private void moveUsageLocation(ProcedureId from, ProcedureId to) {
        if (from.equals(to)) {
            return;
        }
        List<Location> fromLocations = processingResult.getProcedureUsages().get(from);
        List<Location> toLocations = processingResult.getProcedureUsages().computeIfAbsent(to, it -> new ArrayList<>());
        if (fromLocations == null || fromLocations.isEmpty()) {
            return;
        }
        Location loc = fromLocations.remove(0);
        if (fromLocations.isEmpty()) {
            processingResult.getProcedureUsages().remove(from);
        }
        toLocations.add(loc);
    }

    @Override
    public void exitEndDeclaratives(UseCasePreprocessorParser.EndDeclarativesContext ctx) {
        super.exitEndDeclaratives(ctx);
        currentSectionName = null;
    }
    @Override
    public void exitProcedureDivision(UseCasePreprocessorParser.ProcedureDivisionContext ctx) {
        super.exitProcedureDivision(ctx);
        currentSectionName = null;
    }
    @Override
    public void exitSectionStatement(UseCasePreprocessorParser.SectionStatementContext ctx) {
        UseCasePreprocessorParser.SectionDefinitionContext sectionDefinition = ctx.sectionDefinition();
        if (sectionDefinition != null && sectionDefinition.word() != null) {
            UseCasePreprocessorParser.WordContext word = sectionDefinition.word();
            currentSectionName = getReplacementText(word.getText(), word.replacement()).get(0).toUpperCase();
        }
    }
}
