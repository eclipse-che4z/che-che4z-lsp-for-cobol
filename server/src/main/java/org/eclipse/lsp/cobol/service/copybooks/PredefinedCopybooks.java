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

package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.service.SQLBackend;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.service.copybooks.PredefinedCopybooks.Copybook.*;

/** This util class encapsulates the logic of resolving the predefined variable names. */
@UtilityClass
public class PredefinedCopybooks {
  /** Prefix for uri of the predefined copybooks */
  public static final String PREF_IMPLICIT = "implicit://";
  @SuppressWarnings("java:S1075")
  public static final String IMPLICIT_PATH = "/implicitCopybooks/";
  private static final Map<String, Copybook> PREDEFINED_COPYBOOKS =
      ImmutableMap.of(
          "SQLCA",
          SQLCA,
          "SQLDA",
          SQLDA,
          "DFHEIBLC",
          DFHEIBLC,
          "PLABEL",
          PLABEL,
          "SPECIALREGISTERS",
          SPECIALREGISTERS);

  /**
   * Get a predefined copybook instance for a given name or null
   *
   * @param name the name of the copybook
   * @return Copybook for this name or null
   */
  public Copybook forName(String name) {
    return PREDEFINED_COPYBOOKS.get(name);
  }

  /**
   * Get names of supported predefined copybooks
   *
   * @return list of copybook names
   */
  public List<String> getNames() {
    return Arrays.stream(values()).map(Enum::name).collect(Collectors.toList());
  }

  /**
   * Check if this copybook is predefined
   *
   * @param uri uri of the copybook
   * @return true if the copybook is predefined
   */
  public boolean isCopybookPredefined(String uri) {
    return uri.startsWith(IMPLICIT_PATH);
  }

  /** Enumeration of predefined copybook content types */
  public enum CopybookContentType {
    FILE,
    GENERATED
  }

  /** Enumeration of predefined copybooks */
  public enum Copybook {
    SQLCA {
      @Override
      public String uriForBackend(SQLBackend backend) {
        return backend == SQLBackend.DATACOM_SERVER
            ? IMPLICIT_PATH + "SQLCA_DATACOM.cpy"
            : IMPLICIT_PATH + "SQLCA_DB2.cpy";
      }
    },
    SQLDA {
      @Override
      public String uriForBackend(SQLBackend backend) {
        return IMPLICIT_PATH + "SQLDA.cpy";
      }
    },
    DFHEIBLC {
      @Override
      public String uriForBackend(SQLBackend backend) {
        return IMPLICIT_PATH + "DFHEIBLC.cpy";
      }
    },
    PLABEL {
      @Override
      public String uriForBackend(SQLBackend backend) {
        return IMPLICIT_PATH + "PLABEL.cpy";
      }

      @Override
      public CopybookContentType getContentType() {
        return CopybookContentType.GENERATED;
      }
    },
    SPECIALREGISTERS {
      @Override
      public String uriForBackend(SQLBackend backend) {
        return IMPLICIT_PATH + "SPECIALREGISTERS.cpy";
      }
    };

    /**
     * Retrieve the uri of this predefined copybook using the given SQL backend
     *
     * @param backend SQL backend for the program
     * @return uri of the predefined copybook
     */
    public abstract String uriForBackend(SQLBackend backend);

    /**
     * Get predefined copybook's content type
     *
     * @return predefined copybook content type
     */
    public CopybookContentType getContentType() {
      return CopybookContentType.FILE;
    }
  }
}
