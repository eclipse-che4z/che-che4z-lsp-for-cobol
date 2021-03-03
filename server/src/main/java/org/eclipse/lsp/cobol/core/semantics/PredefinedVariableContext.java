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

package org.eclipse.lsp.cobol.core.semantics;

import org.eclipse.lsp.cobol.core.model.Variable;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.eclipse.lsp4j.Location;

import java.util.List;

/**
 * This class represents a structure to store variables of a COBOL program and build a variable
 * hierarchy.
 */
@EqualsAndHashCode
@NoArgsConstructor
public class PredefinedVariableContext implements SubContext<Variable> {
  private static final Location MOCK_LOCATION = new Location();
  private static final Multimap<String, Location> VARIABLE_DEFINITIONS = HashMultimap.create();

  private final Multimap<String, Location> variableUsages = HashMultimap.create();

  static {
    // EXEC interface block fields
    VARIABLE_DEFINITIONS.put("EIBAID", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBATT", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBCALEN", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBCOMPL", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBCONF", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBCPOSN", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBDATE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBDS", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBEOC", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBERR", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBERRCD", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBFMH", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBFN", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBFREE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBNODAT", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRCODE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRECV", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBREQID", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRESP", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRESP2", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRLDBK", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBRSRCE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBSIG", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBSYNC", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBSYNRB", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBTASKN", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBTIME", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBTRMID", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("EIBTRNID", MOCK_LOCATION);

    // XML special registers
    VARIABLE_DEFINITIONS.put("XML-CODE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-EVENT", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-NAMESPACE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-NNAMESPACE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-NAMESPACE-PREFIX", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-NNAMESPACE-PREFIX", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-NTEXT", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("XML-TEXT", MOCK_LOCATION);

    // JNI special register
    VARIABLE_DEFINITIONS.put("JNIENVPTR", MOCK_LOCATION);

    // JSON special registers
    VARIABLE_DEFINITIONS.put("JSON-CODE", MOCK_LOCATION);
    VARIABLE_DEFINITIONS.put("JSON-STATUS", MOCK_LOCATION);
  }

  @Override
  public void addUsage(String variable, Location location) {
    variableUsages.put(variable, location);
  }

  @Override
  public boolean contains(String name) {
    return VARIABLE_DEFINITIONS.containsKey(name);
  }

  @Override
  public Multimap<String, Location> getDefinitions() {
    return VARIABLE_DEFINITIONS;
  }

  @Override
  public Multimap<String, Location> getUsages() {
    return variableUsages;
  }

  @Override
  public void define(Variable variable, Location location) {
    throw new UnsupportedOperationException();
  }

  @Override
  public List<Variable> getAll() {
    throw new UnsupportedOperationException();
  }

  @Override
  public void merge(SubContext<Variable> subContext) {
    throw new UnsupportedOperationException();
  }
}
