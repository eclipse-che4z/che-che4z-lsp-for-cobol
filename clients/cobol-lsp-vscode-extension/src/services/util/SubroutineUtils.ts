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

import { searchCopybookInWorkspace } from "./FSUtils";
import { COBOL_EXT_ARRAY } from "../../constants";
import { SettingsService } from "../Settings";

/**
 * This function try to resolve a given subroutine by searching COBOL source file with the same name
 * in local file system in directories specified in settings.
 * @param name the name of subroutine
 * @return subroutine file URI if it was found or undefined otherwise
 */
export function resolveSubroutineURI(name: string): string {
  const folders: string[] | undefined =
    SettingsService.getSubroutineLocalPath();
  return searchCopybookInWorkspace(name, folders, COBOL_EXT_ARRAY)!;
}
