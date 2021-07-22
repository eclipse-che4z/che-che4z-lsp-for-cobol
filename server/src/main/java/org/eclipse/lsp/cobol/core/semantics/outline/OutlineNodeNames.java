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

package org.eclipse.lsp.cobol.core.semantics.outline;

import lombok.experimental.UtilityClass;

/** The class collects constants with various outline nodes names. */
@UtilityClass
public class OutlineNodeNames {
  public static final String IDENTIFICATION_DIVISION = "IDENTIFICATION DIVISION";
  public static final String PROCEDURE_DIVISION = "PROCEDURE DIVISION";
  public static final String ENVIRONMENT_DIVISION = "ENVIRONMENT DIVISION";
  public static final String DATA_DIVISION = "DATA DIVISION";
  public static final String WORKING_STORAGE_SECTION = "WORKING-STORAGE SECTION";
  public static final String FILLER_NAME = "FILLER";
  public static final String PROGRAM_ID_PREFIX = "PROGRAM-ID ";
  public static final String CONFIGURATION_SECTION = "CONFIGURATION SECTION";
  public static final String INPUT_OUTPUT_SECTION = "INPUT-OUTPUT SECTION";
  public static final String FILE_SECTION = "FILE SECTION";
  public static final String LINKAGE_SECTION = "LINKAGE SECTION";
  public static final String LOCAL_STORAGE_SECTION = "LOCAL STORAGE SECTION";
  public static final String MAP_SECTION = "MAP SECTION";
}
