/*
 * Copyright (c) 2020 Broadcom.
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

package com.broadcom.lsp.cobol.service.delegates.completions;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.is;
import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks the logic of the constant completion resolution */
class ConstantCompletionTest {
  private ConstantCompletion completion = new ConstantCompletion();

  @Test
  void getCompletionSourceEmptyAnalysisResult() {
    assertThat(
        completion.getCompletionSource(
            new CobolDocumentModel(
                "", AnalysisResult.builder().constantDefinitions(ImmutableMap.of()).build())),
        is(empty()));
  }

  @Test
  void getCompletionSource() {
    assertEquals(
        completion.getCompletionSource(
            new CobolDocumentModel(
                "",
                AnalysisResult.builder()
                    .constantDefinitions(
                        ImmutableMap.of(
                            "expected1",
                            ImmutableList.of(
                                new Location(
                                    "uri", new Range(new Position(0, 1), new Position(1, 2))),
                                new Location(
                                    "uri2", new Range(new Position(3, 4), new Position(5, 6)))),
                            "expected2",
                            ImmutableList.of()))
                    .constantUsages(
                        ImmutableMap.of(
                            "non-expected",
                            ImmutableList.of(
                                new Location(
                                    "uri", new Range(new Position(0, 1), new Position(1, 2))))))
                    .build())),
        ImmutableSet.of("expected2", "expected1"));
  }

  @Test
  void getSortOrderPrefix() {
    assertEquals("5", completion.getSortOrderPrefix());
  }

  @Test
  void getKind() {
    assertEquals(CompletionItemKind.Constant, completion.getKind());
  }
}
