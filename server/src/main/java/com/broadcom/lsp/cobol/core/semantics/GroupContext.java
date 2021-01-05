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
package com.broadcom.lsp.cobol.core.semantics;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.ErrorSeverity;
import com.broadcom.lsp.cobol.core.model.Locality;
import com.broadcom.lsp.cobol.core.model.SyntaxError;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.NoArgsConstructor;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.stream.Collectors;

/**
 * This class represents a semantic context for paragraphs and sections
 */
@NoArgsConstructor
public class GroupContext {
  private final Multimap<String, Location> sections = HashMultimap.create();
  private final Multimap<String, Location> paragraphs = HashMultimap.create();

  private final Multimap<String, Locality> candidateUsageLocalities = HashMultimap.create();

  /**
   * Adds a section definition to the context
   * @param name is a section name
   * @param locality is a section locality
   */
  public void addSectionDefinition(String name, Locality locality) {
    sections.put(name, locality.toLocation());
  }

  /**
   * Adds a paragraph definition to the context
   * @param name is a paragraph name
   * @param locality is a paragraph locality
   */
  public void addParagraphDefinition(String name, Locality locality) {
    paragraphs.put(name, locality.toLocation());
  }

  /**
   * Adds a statement usage (it can be paragraph or section usage)
   * @param name is a statement name
   * @param locality is a statement locality
   */
  public void addCandidateUsage(String name, Locality locality) {
    candidateUsageLocalities.put(name, locality);
  }

  /**
   * Prepares and returns paragraphs definition structure
   * @return a map with a token and a collection of token locations
   */
  public Map<String, Collection<Location>> getParagraphDefinitions() {
    return paragraphs.asMap();
  }

  /**
   * Prepares and returns sections definition structure
   * @return a map with a token and a collection of token locations
   */
  public Map<String, Collection<Location>> getSectionDefinitions() {
    return sections.asMap();
  }

  /**
   * Prepares and returns paragraphs usages structure
   * @return a map with a token and a collection of token locations
   */
  public Map<String, Collection<Location>> getParagraphUsages() {
    return prepareUsages(paragraphs.keySet());
  }

  /**
   * Prepares and returns sections usages structure
   * @return a map with a token and a collection of token locations
   */
  public Map<String, Collection<Location>> getSectionUsages() {
    return prepareUsages(sections.keySet());
  }

  /**
   * Generates errors in case of not defined paragraphs
   * @param messageService is a message service to generate exact message
   * @return a list of SyntaxError objects
   */
  public List<SyntaxError> generateParagraphErrors(MessageService messageService) {
    Set<String> definitions = new HashSet<>();
    definitions.addAll(sections.keys());
    definitions.addAll(paragraphs.keys());

    Set<String> usages = new HashSet<>(candidateUsageLocalities.keys());

    usages.removeAll(definitions);

    return usages.stream()
        .flatMap(
            name ->
                candidateUsageLocalities.get(name).stream()
                    .map(
                        locality ->
                            SyntaxError.syntaxError()
                                .suggestion(
                                    messageService.getMessage(
                                        "CobolVisitor.paragraphNotDefined", name))
                                .severity(ErrorSeverity.ERROR)
                                .locality(locality)
                                .build()))
        .collect(Collectors.toList());
  }

  private Map<String, Collection<Location>> prepareUsages(Set<String> definitions) {
    return candidateUsageLocalities.asMap().entrySet()
        .stream()
        .filter(e -> definitions.contains(e.getKey()))
        .collect(Collectors.toMap(Map.Entry::getKey, e -> e.getValue().stream()
            .map(Locality::toLocation).collect(Collectors.toList())));
  }

}
