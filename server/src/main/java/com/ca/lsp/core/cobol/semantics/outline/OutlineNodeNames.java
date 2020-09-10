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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.core.cobol.semantics.outline;

import lombok.experimental.UtilityClass;

@UtilityClass
public class OutlineNodeNames {
  public final String IDENTIFICATION_DIVISION = "IDENTIFICATION DIVISION";
  public final String PROCEDURE_DIVISION = "PROCEDURE DIVISION";
  public final String ENVIRONMENT_DIVISION = "ENVIRONMENT DIVISION";
  public final String DATA_DIVISION = "DATA DIVISION";
  public final String WORKING_STORAGE_SECTION = "WORKING-STORAGE SECTION";
  public final String FILLER_NAME = "FILLER";
  public final String PROGRAM_ID_PREFIX = "PROGRAM-ID ";
  public final String CONFIGURATION_SECTION = "CONFIGURATION SECTION";
  public final String INPUT_OUTPUT_SECTION = "INPUT-OUTPUT SECTION";
  public final String FILE_SECTION = "FILE SECTION";
  public final String LINKAGE_SECTION = "LINKAGE SECTION";
  public final String LOCAL_STORAGE_SECTION = "LOCAL STORAGE SECTION";
  public final String COMMUNICATION_SECTION = "COMMUNICATION SECTION";
}
