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
import { externalApis } from "../ExternalAPIsService";
import { translatePreprocessorName } from "../ProcessorGroupsLoader";
import type {
  ExternalConfigurationProviderHandler,
  ExternalPreprocessorDefinition,
} from "../../type/externalConfigurationApi";
import { EndevorElementLib } from "../copybookLibs/EndevorElementLib";
import { EndevorMemberLib } from "../copybookLibs/EndevorMemberLib";
import type { CopybookLibTypes } from "../ProcessorGroupsLoader";
import { asArray } from "../util/Utils";

/**
 * Lib types for E4E configs: dataset libs must resolve as Endevor members, not z/OSMF datasets.
 */
export const E4E_LIB_TYPES: CopybookLibTypes[] = [
  EndevorElementLib,
  EndevorMemberLib,
];

/**
 * Provides configuration of Endevor elements by Explorer for Endevor.
 */
export const e4eConfigurationHandler: ExternalConfigurationProviderHandler =
  async (documentUri) => {
    if (!externalApis?.handleAsEndevorElement(documentUri.toString())) return;

    const e4eConfig =
      await externalApis.e4eDownloader?.getEndevorProcessorGroupConfig(
        documentUri,
      );
    const processorGroupName = e4eConfig?.pgms[0]?.pgroup;
    const processorGroup = e4eConfig?.pgroups.find(
      (pg) => pg.name === processorGroupName,
    );
    if (!processorGroup) return;

    const preprocessor: ExternalPreprocessorDefinition[] | undefined =
      processorGroup.preprocessor
        ? asArray(processorGroup.preprocessor).map((p) => ({
            ...p,
            name: translatePreprocessorName(p.name),
          }))
        : undefined;

    return {
      configuration: {
        ...processorGroup,
        libs: [...processorGroup.libs],
        ...(preprocessor && { preprocessor }),
      },
    };
  };
