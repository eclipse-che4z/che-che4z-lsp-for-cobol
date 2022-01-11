/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks;

import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.model.DocumentMapping;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.semantics.NamedSubContext;

import java.util.Deque;
import java.util.List;
import java.util.Map;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;

/** A type alias for curried applicative functors to update the preprocessor */
public interface PreprocessorFunctor
    extends Function<
        Deque<CopybookUsage>,
        BiFunction<
            Deque<List<Pair<String, String>>>,
            List<Pair<String, String>>,
            Function<
                PreprocessorStack,
                Function<
                    NamedSubContext,
                    Function<Map<String, DocumentMapping>, Consumer<List<SyntaxError>>>>>>> {}
