/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import com.broadcom.lsp.domain.cobol.event.model.Position;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import lombok.extern.slf4j.Slf4j;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

@Slf4j
public class MultiMapSerializableHelper {
  private static final Map<String, Set<Position>> MAP = Maps.newHashMap();

  private MultiMapSerializableHelper() {}
  /**
   * For a given multimap, create a serialization in String
   *
   * @param multimap of type [STRING -> LIST[object]]
   * @return a String that serialize the data in the multimap
   */
  public static String serializeInString(Multimap<String, Position> multimap) {
    Map<String, Set<Position>> map = createHashMapFromMultimap(multimap);
    StringBuilder stringBuilder = new StringBuilder();

    for (Map.Entry<String, Set<Position>> entry : map.entrySet()) {
      stringBuilder.append(entry.getKey()).append(entry.getValue().toString());
    }
    LOG.info("STRING: " + stringBuilder.toString());
    return stringBuilder.toString();
  }

  /**
   * For a given multimap, create a serialization in HashMap
   *
   * @param multimap of type [STRING -> LIST[object]]
   * @return a HashMap that serialize the data in the multimap
   */
  public static Map<String, Set<Position>> serializeInHashMap(Multimap<String, Position> multimap) {
    return createHashMapFromMultimap(multimap);
  }

  private static Map<String, Set<Position>> createHashMapFromMultimap(
      Multimap<String, Position> multimap) {

    for (Map.Entry<String, Collection<Position>> entry : multimap.asMap().entrySet()) {
      MAP.put(entry.getKey(), ImmutableSet.copyOf(entry.getValue()));
    }
    LOG.info("MAP: " + MAP.toString());
    return MAP;
  }
}
