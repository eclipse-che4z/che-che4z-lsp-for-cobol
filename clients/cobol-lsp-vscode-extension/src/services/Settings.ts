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
  SETTINGS_SQL_BACKEND,
  SETTINGS_COMPILE_OPTIONS,
  DIALECT_LIBS,
  COBOL_PRGM_LAYOUT,
  SETTINGS_CPY_NDVR_DEPENDENCIES,
} from "../constants";
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
import { decodeUnknown, DecodingError } from "./util/decoder";
import * as t from "io-ts";
import { getChannel } from "../extension";

interface Request {
  items: Item[];
}

interface Item {
  section: string;
  scopeUri?: string;
  dialect?: string;
}

const DialectsConfigurationCodec = t.array(t.string);
export type DialectsConfiguration = t.TypeOf<typeof DialectsConfigurationCodec>;
const CopybooksLocalPathsConfigurationCodec = t.array(t.string);
export type CopybooksLocalPathsConfiguration = t.TypeOf<
  typeof CopybooksLocalPathsConfigurationCodec
>;
const CopybookExtensionsConfigurationCodec = t.array(t.string);
const TargetSQLBackendConfigurationCodec = t.string;
const CopybookEncodingConfigurationCodec = t.string;
const CompileOptionsConfigurationCodec = t.string;

async function handleProcessorGroupConfigurationRequest<Type, Output, R>(
  codec: t.Type<Type, Output, unknown>,
  processorGroupLoader: (
    requestItem: { section: string; scopeUri: string },
    cfg: Type,
  ) => Promise<R>,
  item: Item,
  result: (R | undefined)[],
) {
  if (item.scopeUri) {
    try {
      const configuration = vscode.workspace
        .getConfiguration()
        .get(item.section);
      if (typeof configuration !== "undefined") {
        const decodedConfiguration = decodeUnknown(codec, configuration);
        const itemWithScope = {
          scopeUri: item.scopeUri,
          section: item.section,
        };
        const object = await processorGroupLoader(
          itemWithScope,
          decodedConfiguration,
        );
        result.push(object);
      } else {
        result.push(configuration);
      }
    } catch (err) {
      if (err instanceof DecodingError) {
        getChannel().appendLine(
          `Invalid settings: ${item.section} - ${err.message}`,
        );
      }
    }
  } else {
    result.push(vscode.workspace.getConfiguration().get(item.section));
  }
}

export async function lspConfigHandler(request: Request) {
  const result: unknown[] = [];
  for (const item of request.items) {
    try {
      switch (item.section) {
        case DIALECT_REGISTRY_SECTION:
          result.push(DialectRegistry.getDialects());
          break;
        case COBOL_PRGM_LAYOUT:
          result.push(SettingsService.getCobolProgramLayout());
          break;
        case SETTINGS_DIALECT:
          await handleProcessorGroupConfigurationRequest(
            DialectsConfigurationCodec,
            loadProcessorGroupDialectConfig,
            item,
            result,
          );
          break;
        case SETTINGS_CPY_LOCAL_PATH:
          await handleProcessorGroupConfigurationRequest(
            CopybooksLocalPathsConfigurationCodec,
            loadProcessorGroupCopybookPathsConfig,
            item,
            result,
          );
          break;
        case SETTINGS_CPY_EXTENSIONS:
          await handleProcessorGroupConfigurationRequest(
            CopybookExtensionsConfigurationCodec,
            loadProcessorGroupCopybookExtensionsConfig,
            item,
            result,
          );
          break;
        case SETTINGS_SQL_BACKEND:
          await handleProcessorGroupConfigurationRequest(
            TargetSQLBackendConfigurationCodec,
            loadProcessorGroupSqlBackendConfig,
            item,
            result,
          );
          break;
        case SETTINGS_CPY_FILE_ENCODING:
          await handleProcessorGroupConfigurationRequest(
            CopybookEncodingConfigurationCodec,
            loadProcessorGroupCopybookEncodingConfig,
            item,
            result,
          );
          break;
        case SETTINGS_COMPILE_OPTIONS:
          await handleProcessorGroupConfigurationRequest(
            CompileOptionsConfigurationCodec,
            loadProcessorGroupCompileOptionsConfig,
            item,
            result,
          );
          break;
        case DIALECT_LIBS:
          if (item.dialect && item.scopeUri) {
            const dialectLibs = await SettingsService.getCopybookLocalPath(
              item.scopeUri,
              item.dialect,
            );
            result.push(dialectLibs);
          }
          break;
        default:
          result.push(vscode.workspace.getConfiguration().get(item.section));
      }
    } catch (error) {
      console.log(error);
    }
  }
  return result;
}

/**
 * SettingsService provides read/write configuration settings functionality
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
   * Return the code page for the copybook file encoding supplied by user
   * @returns string
   */
  public static getCopybookFileEncoding(): string | undefined {
    return vscode.workspace
      .getConfiguration(SETTINGS_CPY_SECTION)
      .get("copybook-file-encoding");
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
        .replace(
          /\${workspaceFolder(:[^}]+)?}/g,
          (_, ws: string | undefined) => {
            if (ws === undefined) {
              return vscode.workspace.workspaceFolders?.[0]?.uri.fsPath ?? "";
            }
            ws = ws.substring(1);
            return (
              vscode.workspace.workspaceFolders?.find((x) => x.name === ws)?.uri
                .fsPath ?? ""
            );
          },
        ),
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
   * Gives the configured endevor dependency from settings.
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
