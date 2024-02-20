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
package org.eclipse.lsp.cobol.common;

import lombok.experimental.UtilityClass;


/**
 * Provides constants
 */
@UtilityClass
public class VariableConstants {
  public static final int LEVEL_FD_SD = -2;
  public static final int LEVEL_MAP_NAME = -1;
  public static final int LEVEL_MNEMONIC = 0;
  public static final int LEVEL_01 = 1;
  public static final int LEVEL_66 = 66;
  public static final int LEVEL_77 = 77;
  public static final int LEVEL_88 = 88;
  public static final int AREA_A_FINISH = 10;
  public static final String FD_WITHOUT_FILE_CONTROL = "semantics.noFileControl";
  public static final String EMPTY_STRUCTURE_MSG = "semantics.emptyStructure";
  public static final String TOO_MANY_CLAUSES_MSG = "semantics.tooManyClauses";
  public static final String PREVIOUS_WITHOUT_PIC_FOR_88 = "semantics.previousWithoutPicFor88";
  public static final String AREA_A_WARNING = "CobolVisitor.AreaAWarningMsg";
  public static final String NUMBER_NOT_ALLOWED_AT_TOP = "semantics.numberNotAllowedAtTop";
  public static final String NO_STRUCTURE_BEFORE_RENAME = "semantics.noStructureBeforeRename";
  public static final String CHILD_TO_RENAME_NOT_FOUND = "semantics.childToRenameNotFound";
  public static final String INCORRECT_CHILDREN_ORDER = "semantics.incorrectChildrenOrder";
  public static final String CANNOT_BE_RENAMED = "semantics.cannotBeRenamed";
  public static final String GLOBAL_NON_01_LEVEL_MSG = "semantics.globalNon01Level";
  public static final String GLOBAL_TOO_MANY_DEFINITIONS = "semantics.globalTooManyDefinitions";
  public static final String REDEFINE_IMMEDIATELY_FOLLOW = "semantics.redefineImmediatelyFollow";
  public static final String LEVELS_MUST_MATCH = "semantics.levelsMustMatch";
  public static final String REDEFINED_CONTAIN_VALUE = "semantics.redefinedContainValue";
  public static final String UNKNOWN_VARIABLE_DEFINITION = "semantics.unknownVariableDefinition";
  public static final String PICTURE_NOT_ALLOWED = "semantic.picNotAllowed";
}
