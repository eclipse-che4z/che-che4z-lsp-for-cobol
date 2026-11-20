/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import type { Uri } from "vscode";

/**
 * same format as proc_grps.json
 * Inspired from https://github.com/eclipse-che4z/che-che4z-lsp-for-hlasm/blob/development/clients/vscode-hlasmplugin/src/hlasmExternalConfigurationProvider.ts
 */
export type ExternalLibraryDefinition =
  | string
  | { dataset: string; profile?: string }
  | { uss: string; profile?: string }
  | {
      environment: string;
      stage: string;
      system: string;
      subsystem: string;
      type: string;
      use_map?: boolean;
      profile?: string;
    }
  | { locationType: "local"; tarFileLocation: string; folderPattern?: string }
  | {
      locationType: "DSN" | "USS";
      tarFileLocation: string;
      folderPattern?: string;
      profile?: string;
    };

export interface ExternalProcessorGroupProperties {
  libs?: ExternalLibraryDefinition[];
  "copybook-extensions"?: string[];
  "compiler-options"?: string[];
  "copybook-file-encoding"?: string;
  "target-sql-backend"?: string;
}

export type ExternalPreprocessorDefinition =
  | string
  | ({ name: string } & ExternalProcessorGroupProperties);

export interface ExternalProcessorGroup
  extends ExternalProcessorGroupProperties {
  name: string;
  preprocessor?:
    | ExternalPreprocessorDefinition
    | ExternalPreprocessorDefinition[];
}

export interface ExternalConfigurationResponse {
  configuration: ExternalProcessorGroup;
}

export type ExternalConfigurationProviderHandler = (
  uri: Uri,
) =>
  | PromiseLike<ExternalConfigurationResponse | null | undefined>
  | ExternalConfigurationResponse
  | null
  | undefined;

export interface ConfigurationProviderRegistration {
  dispose(): void;
  invalidate(uri?: Uri): void;
}

export interface ExternalConfigurationApi {
  registerExternalConfigurationProvider(
    extensionId: string,
    handler: ExternalConfigurationProviderHandler,
  ): ConfigurationProviderRegistration;
}
