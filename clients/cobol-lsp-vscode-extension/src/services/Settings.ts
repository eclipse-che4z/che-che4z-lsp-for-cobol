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

import * as path from "node:path";
import * as vscode from "vscode";
import {
  COPYBOOK_EXTENSIONS,
  PATHS_LOCAL_KEY,
  PATHS_USS,
  PATHS_DSN,
  SERVER_PORT,
  SERVER_RUNTIME,
  SETTINGS_CPY_EXTENSIONS,
  SETTINGS_CPY_FILE_ENCODING,
  SETTINGS_CPY_LOCAL_PATH,
  SETTINGS_CPY_SECTION,
  SETTINGS_DIALECT,
  SETTINGS_SUBROUTINE_LOCAL_KEY,
  SETTINGS_TAB_CONFIG,
  SETTINGS_SQL_BACKEND,
  SETTINGS_COMPILE_OPTIONS,
  DIALECT_LIBS,
  COBOL_PRGM_LAYOUT,
  SETTINGS_CPY_NDVR_DEPENDENCIES,
} from "../constants";
import cobolSnippets = require("../services/snippetcompletion/cobolSnippets.json");
import { DialectRegistry, DIALECT_REGISTRY_SECTION } from "./DialectRegistry";
import {
  loadProcessorGroupCompileOptionsConfig,
  loadProcessorGroupCopybookEncodingConfig,
  loadProcessorGroupCopybookExtensionsConfig,
  loadProcessorGroupCopybookPaths,
  loadProcessorGroupCopybookPathsConfig,
  loadProcessorGroupDialectConfig,
  loadProcessorGroupSqlBackendConfig,
} from "./ProcessorGroups";
import { getVariablesFromUri, SupportedVariables } from "./util/FSUtils";
import { SettingsUtils } from "./util/SettingsUtils";

export class TabRule {
  // tslint:disable-next-line:no-unnecessary-initializer
  public constructor(
    public stops: number[],
    public maxPosition: number,
    public regex: string | undefined = undefined,
  ) {}
}

export class TabSettings {
  public constructor(public rules: TabRule[], public defaultRule: TabRule) {}
}

export async function lspConfigHandler(request: any): Promise<Array<any>> {
  const result = new Array<unknown>();
  for (const item of request.items) {
    try {
      if (item.section === DIALECT_REGISTRY_SECTION) {
        const object = DialectRegistry.getDialects();
        result.push(object);
      } else if (item.scopeUri) {
        const cfg = vscode.workspace.getConfiguration().get(item.section);
        if (item.section === SETTINGS_DIALECT) {
          const object = await loadProcessorGroupDialectConfig(item, cfg);
          result.push(object);
        } else if (item.section === SETTINGS_CPY_LOCAL_PATH) {
          const object = await loadProcessorGroupCopybookPathsConfig(
            item,
            cfg as string[],
          );
          result.push(object);
        } else if (item.section === DIALECT_LIBS && !!item.dialect) {
          const dialectLibs: string[] =
            await SettingsService.getCopybookLocalPath(
              item.scopeUri,
              item.dialect,
            );
          result.push(dialectLibs);
        } else if (item.section === SETTINGS_CPY_EXTENSIONS) {
          const object = await loadProcessorGroupCopybookExtensionsConfig(
            item,
            cfg as string[],
          );
          result.push(object);
        } else if (item.section === SETTINGS_SQL_BACKEND) {
          const object = await loadProcessorGroupSqlBackendConfig(
            item,
            cfg as string,
          );
          result.push(object);
        } else if (item.section === SETTINGS_CPY_FILE_ENCODING) {
          const object = await loadProcessorGroupCopybookEncodingConfig(
            item,
            cfg as string,
          );
          result.push(object);
        } else if (item.section === SETTINGS_COMPILE_OPTIONS) {
          const object = await loadProcessorGroupCompileOptionsConfig(
            item,
            cfg as string,
          );
          result.push(object);
        } else {
          result.push(cfg);
        }
      } else if (item.section === COBOL_PRGM_LAYOUT) {
        result.push(SettingsService.getCobolProgramLayout());
      } else {
        result.push(vscode.workspace.getConfiguration().get(item.section));
      }
    } catch (error) {
      console.log(error);
    }
  }
  return result;
}

/**
 * SettingsService provides read/write configurstion settings functionality
 */
export class SettingsService {
  public static readonly DEFAULT_DIALECT = "COBOL";
  /**
   * Get list of local subroutine path
   * @returns a list of local subroutine path
   */
  public static getSubroutineLocalPath(): string[] | undefined {
    return vscode.workspace
      .getConfiguration()
      .get(SETTINGS_SUBROUTINE_LOCAL_KEY);
  }

  /**
   * Get copybook local path based on program file name
   * @param documentUri is a program file URI
   * @param dialectType name of the cobol dialect type
   * @returns a list of local path
   */
  public static async getCopybookLocalPath(
    documentUri: string,
    dialectType: string,
  ): Promise<string[]> {
    const pgPaths = await loadProcessorGroupCopybookPaths(
      documentUri,
      dialectType,
    );
    const vars = getVariablesFromUri(documentUri);
    const paths: string[] = [
      ...SettingsService.evaluateVariables(pgPaths, vars),
      ...SettingsService.getCopybookConfigValues(
        PATHS_LOCAL_KEY,
        documentUri,
        dialectType,
      ),
    ];
    const wsFolders = SettingsUtils.getWorkspaceFoldersPath(true);

    return SettingsService.prepareLocalSearchFolders(paths, wsFolders);
  }

  public static async getCopybookExtension(
    documentUri: string,
  ): Promise<string[] | undefined> {
    const global: string[] | undefined = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get(COPYBOOK_EXTENSIONS);
    return documentUri === undefined
      ? global
      : loadProcessorGroupCopybookExtensionsConfig(
          { scopeUri: documentUri },
          global!,
        );
  }

  /**
   * Get Lsp Port from configuration
   * @returns lsp port number
   */
  public static getLspPort(): number | undefined {
    if (vscode.workspace.getConfiguration().get(SERVER_PORT)) {
      return Number(vscode.workspace.getConfiguration().get(SERVER_PORT));
    }
  }

  /**
   * Get list of dsn path
   * @param documentUri is a program URI
   * @param dialectType name of the cobol dialect type
   * @returns a list of dsn path
   */
  public static getDsnPath(documentUri: string, dialectType: string): string[] {
    return SettingsService.getCopybookConfigValues(
      PATHS_DSN,
      documentUri,
      dialectType,
    );
  }

  /**
   * Get list of uss path
   * @param cobolFileName is a program file name
   * @param dialectType name of the cobol dialect type
   * @returns a list of uss path
   */
  public static getUssPath(documentUri: string, dialectType: string): string[] {
    return SettingsService.getCopybookConfigValues(
      PATHS_USS,
      documentUri,
      dialectType,
    );
  }

  /**
   * Get profile name
   * @returns a profile name
   */
  public static getProfileName(): string | undefined {
    return vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get("profiles");
  }

  /**
   * Retrieves and parse tab settings configuration that can be boolean, array or an object
   * @returns a TabSettings object
   */
  public static getTabSettings(): TabSettings {
    const config = vscode.workspace.getConfiguration().get(SETTINGS_TAB_CONFIG);
    let settings = new TabSettings([], new TabRule([0, 6, 7, 11], 72));
    if (Array.isArray(config)) {
      const stops = config as number[];
      if (stops !== undefined && stops.length > 0) {
        const tabRule = new TabRule(stops, stops[stops.length - 1]);
        settings = new TabSettings([], tabRule);
      }
    } else if (typeof config === "object") {
      const obj = config as { default: number[]; anchors: number };
      let defaultRule = new TabRule([0, 6, 7, 11], 72);
      const stops = obj.default as number[];
      if (stops !== undefined && stops.length > 0) {
        defaultRule = new TabRule(stops, stops[stops.length - 1]);
      }
      const rules: TabRule[] = [];
      const anchors = obj.anchors;
      if (obj.anchors !== undefined && Object.keys(anchors).length > 0) {
        const keys = Object.keys(anchors);
        const values = Object.values(anchors);
        for (let i = 0; i < keys.length; i++) {
          const regex = keys[i] as string;
          const stops = values[i] as number[];
          if (regex !== undefined && stops !== undefined && stops.length > 0) {
            rules.push(new TabRule(stops, stops[stops.length - 1], regex));
          }
        }
      }
      settings = new TabSettings(rules, defaultRule);
    }
    return settings;
  }

  /**
   * Return the code page for the copybook file encoding supplied by user
   * @returns string
   */
  public static getCopybookFileEncoding(): string | undefined {
    return vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get("copybook-file-encoding");
  }

  /**
   * Return the dialect type supplied by user
   * @returns Map of snippets
   */
  public static async getSnippetsForCobol(): Promise<Map<any, any>> {
    const map: Map<any, any> = new Map<any, any>([
      ...Object.entries(cobolSnippets),
    ]);
    return map;
  }

  /**
   * Gets list of desired fialects
   * @returns a list of desired fialects
   */
  public static getDialects(): string[] | undefined {
    return vscode.workspace.getConfiguration().get(SETTINGS_DIALECT);
  }

  /**
   * Gives the configured runtime from settings.
   *
   * @returns returns configured runtime
   */
  public static serverRuntime(): string | undefined {
    return vscode.workspace.getConfiguration().get(SERVER_RUNTIME);
  }

  public static getCobolProgramLayout() {
    return vscode.workspace.getConfiguration().get(COBOL_PRGM_LAYOUT);
  }

  public static evaluateVariables(
    dataList: string[] | undefined,
    vars: SupportedVariables,
  ): string[] {
    if (!dataList) return [];
    return dataList.map((d) =>
      d
        .replace(/\${fileBasenameNoExtension}/g, vars.filename)
        .replace(/\${fileDirname}/g, vars.dirName)
        .replace(/\${fileDirnameBasename}/g, vars.dirBasename)
        .replace(/\${workspaceFolder(:[^}]+)?}/g, (_, ws) => {
          if (ws === undefined)
            return vscode.workspace.workspaceFolders?.[0]?.uri.fsPath ?? "";
          ws = ws.substring(1);
          return (
            vscode.workspace.workspaceFolders?.find((x) => x.name === ws)?.uri
              .fsPath ?? ""
          );
        }),
    );
  }

  private static getCopybookConfigValues(
    section: string,
    documentUri: string,
    dialectType: string,
  ) {
    const vars = getVariablesFromUri(documentUri);
    if (dialectType !== SettingsService.DEFAULT_DIALECT) {
      const pathList: string[] | undefined = vscode.workspace
        .getConfiguration(SETTINGS_CPY_SECTION)
        .get(`${dialectType.toLowerCase()}.${section}`);
      return SettingsService.evaluateVariables(pathList, vars);
    }
    const pathList: string[] | undefined = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get(section);
    return SettingsService.evaluateVariables(pathList, vars);
  }
  public static prepareLocalSearchFolders(
    paths: string[],
    wsFolders: string[],
  ): string[] {
    const result = [];
    for (const p of paths) {
      if (path.isAbsolute(p)) result.push(p);
      else
        wsFolders.forEach((wsFolder) => {
          result.push(path.join(wsFolder, p));
        });
    }
    return result;
  }
  /**
   * Gives the configured endevor dependecy from settings.
   *
   * @returns returns configured endevor dependency
   */
  public static getCopybookEndevorDependencySettings(): string | undefined {
    const setting: string | undefined = vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get(SETTINGS_CPY_NDVR_DEPENDENCIES);
    return setting;
  }
}
