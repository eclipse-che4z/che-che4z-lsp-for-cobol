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

package com.ca.lsp.core.cobol.visitor;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Keywords {
  private List<String> myList = new ArrayList<>();
  private static final InputStream KEYWORDS_FILE =
      Keywords.class.getResourceAsStream("Keywords.txt");

  Keywords() {
    try (Scanner s = new Scanner(KEYWORDS_FILE)) {
      while (s.hasNext()) {
        myList.add(s.next());
      }
    }
  }

  public List<String> getList() {
    return myList;
  }
}
