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
package org.eclipse.lsp.cobol.core.visitor;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

import java.util.Optional;

import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.retrieveRangeLocality;

/**
 * A collection of mapping related utilities.
 */
@UtilityClass
public class MappingUtils {
    /**
     * Retrieve a locality from the given context with a range from the start to the end
     *
     * @param ctx ParserRuleContext to extract locality
     * @param extendedDocument an extended document.
     * @param copybooks a copybook registry.
     * @return locality which has a range from the start to the end of the rule
     */

    public static Optional<Locality> retrieveLocality(ParserRuleContext ctx, ExtendedDocument extendedDocument, CopybooksRepository copybooks) {
        return retrieveRangeLocality(ctx)
                .map(extendedDocument::mapLocation)
                .map(loc -> Locality.builder()
                        .range(loc.getRange())
                        .uri(loc.getUri())
                        .copybookId(copybooks.getCopybookIdByUri(loc.getUri()))
                        .build());
    }
}
