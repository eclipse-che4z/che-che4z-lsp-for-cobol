/*
 * Copyright (c) 2025 Broadcom.
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

import { getConfigurationResult } from "../../__mocks__/vscode";
import { DEFAULT_DIALECT } from "../../constants";
import { DatasetLib } from "../../services/copybookLibs/DatasetLib";
import LocalPathLib from "../../services/copybookLibs/LocalPathLib";
import { readSettingConfig } from "../../services/ProcessorGroupsLoader";

describe("ProcessorGroupsLoader", () => {
  describe("readSettingConfig", () => {
    describe("local libs have priority over uss and dsn", () => {
      beforeEach(() => {
        getConfigurationResult["paths-local"] = ["copybooks"];
        getConfigurationResult["paths-dsn"] = ["DATASET.WITH.COPYBOOKS"];
        getConfigurationResult["paths-uss"] = ["/user/copybooks"];
      });

      it("generates workspace processor group with local path first", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(new LocalPathLib("copybooks"));
      });
    });

    describe("dsn have priority over uss", () => {
      beforeEach(() => {
        getConfigurationResult["paths-local"] = [];
        getConfigurationResult["paths-dsn"] = ["DATASET.WITH.COPYBOOKS"];
        getConfigurationResult["paths-uss"] = ["/user/copybooks"];
      });

      it("generates workspace processor group with dsn path first", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(
          new DatasetLib("DATASET.WITH.COPYBOOKS"),
        );
      });
    });

    describe("the order of resolution is same as the one provided in user settings", () => {
      beforeAll(() => {
        getConfigurationResult["paths-dsn"] = [
          "FIRST.DATASET",
          "SECOND.DATASET",
        ];
      });
      it("checks the order in generated processor group is same as the one provided in user settings", () => {
        const result = readSettingConfig(DEFAULT_DIALECT);
        expect(result.libs![0]).toEqual(new DatasetLib("FIRST.DATASET"));
        expect(result.libs![1]).toEqual(new DatasetLib("SECOND.DATASET"));
      });
    });
  });
});
