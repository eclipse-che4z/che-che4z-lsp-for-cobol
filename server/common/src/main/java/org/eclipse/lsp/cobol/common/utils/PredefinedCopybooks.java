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

package org.eclipse.lsp.cobol.common.utils;

import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks.Copybook.*;

/** This util class encapsulates the logic of resolving the predefined variable names. */
@UtilityClass
public class PredefinedCopybooks {

  /**
   * Get a predefined copybook instance for a given name or null
   *
   * @param name the name of the copybook
   * @return Copybook for this name or null
   */
  public Copybook forName(String name) {
    return Arrays.stream(values()).filter(c ->  c.name().equals(name))
        .findFirst().orElse(null);
  }

  /**
   * Get names of supported predefined copybooks
   *
   * @return list of copybook names
   */
  public List<String> getNames() {
    return Arrays.stream(values()).map(Enum::name).collect(Collectors.toList());
  }

  /** Enumeration of predefined copybooks */
  public enum Copybook {
    SQLCA {
      @Override
      public String nameForBackend(SQLBackend backend) {
        return backend == SQLBackend.DATACOM_SERVER
            ? "SQLCA_DATACOM"
            : "SQLCA_DB2";
      }
    },
    SQLDA {
      @Override
      public String nameForBackend(SQLBackend backend) {
        return "SQLDA";
      }
    };

    /**
     * Retrieve the uri of this predefined copybook using the given SQL backend
     *
     * @param backend SQL backend for the program
     * @return uri of the predefined copybook
     */
    public abstract String nameForBackend(SQLBackend backend);
  }
}
