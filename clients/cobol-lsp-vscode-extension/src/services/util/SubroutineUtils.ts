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
import { isAbsolute } from "path";
import { COBOL_EXT_ARRAY_CASE_INSENSITIVE } from "../../constants";
import { SettingsService } from "../Settings";
import * as vscode from "vscode";
/**
 * This function try to resolve a given subroutine by searching COBOL source file
 * with the same name in local workspace directories specified in settings.
 * @param name the name of subroutine
 * @return subroutine file URI if it was found or undefined otherwise
 */
export async function resolveSubroutineURI(name: string) {
  const subroutinePaths = SettingsService.getSubroutineLocalPath();

  if (subroutinePaths) {
    for (const subroutinePath of subroutinePaths) {
      let pattern: vscode.RelativePattern | string;
      if (isAbsolute(subroutinePath)) {
        pattern = new vscode.RelativePattern(
          subroutinePath,
          `**/${name}{${COBOL_EXT_ARRAY_CASE_INSENSITIVE.join(",")}}`,
        );
      } else {
        pattern = `${subroutinePath}/**/${name}{${COBOL_EXT_ARRAY_CASE_INSENSITIVE.join(",")}}`;
      }

      const uris = await vscode.workspace.findFiles(pattern, null, 1);

      if (uris.length > 0) {
        return uris[0].toString();
      }
    }
  }

  return undefined;
}
