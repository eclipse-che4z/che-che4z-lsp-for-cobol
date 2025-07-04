/*
 * Copyright (c) 2024 Broadcom.
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

import {
  FileNotFound,
  getWorkspaceFolderResult,
  readFileResult,
} from "../../__mocks__/vscode";
import {
  B4GTypeMetadata,
  watcherChangeEventHandler,
} from "../../services/BridgeForGitLoader";
import * as vscode from "vscode";
import { loadProcessorGroup } from "../../services/ProcessorGroups";
import { initializeExternalAPIs } from "../../services/ExternalAPIsService";
import {
  ProcessorGroupsDefinition,
  ProgramsConfig,
} from "../../services/ProcessorGroupsLoader";

const WS_PATH = "/my/b4g/workspace";
const WS_URI = vscode.Uri.file(WS_PATH);

const b4gJson: B4GTypeMetadata = {
  elements: {
    main: {
      processorGroup: "pg2",
    },
  },
  defaultProcessorGroup: "DEFGRP",
  definedProcessorGroups: [
    {
      name: "pg2",
      description: "A GROUP",
    },
    {
      name: "DEFGRP",
      description: "DEFAULT GROUP",
    },
  ],
  fileExtension: "cob",
};

const pgJson: ProcessorGroupsDefinition = {
  pgroups: [{ name: "pg1" }, { name: "pg2" }, { name: "DEFGRP" }],
};
const pgMapJson: ProgramsConfig = {
  pgms: [{ program: "main.cob", pgroup: "pg1" }],
};

describe("Bridge for Git group tests", () => {
  beforeEach(async () => {
    await initializeExternalAPIs(vscode.Uri.file("/storage"));
    getWorkspaceFolderResult.uri = WS_URI;
    readFileResult[`${WS_PATH}/.cobolplugin/proc_grps.json`] =
      JSON.stringify(pgJson);
    readFileResult[`${WS_PATH}/.cobolplugin/pgm_conf.json`] =
      JSON.stringify(pgMapJson);
    watcherChangeEventHandler(vscode.Uri.joinPath(WS_URI, ".bridge.json"));
  });

  describe("b4g config is present", () => {
    describe("fileExtension specified", () => {
      beforeEach(() => {
        b4gJson.fileExtension = "cob";
        readFileResult[`${WS_PATH}/.bridge.json`] = JSON.stringify(b4gJson);
      });
      test("Map file into processor group", async () => {
        const document = vscode.Uri.joinPath(WS_URI, "main.cob");
        const cfg = await loadProcessorGroup(document);
        expect(cfg?.name).toBe("pg2");
      });

      test("files without correct extension is matched to the default pg", async () => {
        const document = vscode.Uri.joinPath(WS_URI, "main");
        const cfg = await loadProcessorGroup(document);
        expect(cfg?.name).toBe("DEFGRP");
      });
    });

    describe("fileExtension setting is empty", () => {
      beforeEach(() => {
        b4gJson.fileExtension = "";
        readFileResult[`${WS_PATH}/.bridge.json`] = JSON.stringify(b4gJson);
      });
      test("No extension -> matched to b4g pg group", async () => {
        const document = vscode.Uri.joinPath(WS_URI, "main");
        const cfg = await loadProcessorGroup(document);
        expect(cfg?.name).toBe("pg2");
      });

      test("File with extension - extension is ignored, document is still matched with b4g definition", async () => {
        const document = vscode.Uri.joinPath(WS_URI, "main.cob");
        const cfg = await loadProcessorGroup(document);
        expect(cfg?.name).toBe("pg2");
      });
    });

    describe("default group", () => {
      beforeEach(() => {
        readFileResult[`${WS_PATH}/.bridge.json`] = JSON.stringify(b4gJson);
      });

      test("default b4g group is used for elements not matching configuration", async () => {
        const document = vscode.Uri.joinPath(WS_URI, "other-element.cob");
        const cfg = await loadProcessorGroup(document);
        expect(cfg?.name).toBe("DEFGRP");
      });
    });
  });

  describe("b4g configuration is not present", () => {
    beforeEach(() => {
      readFileResult[`${WS_PATH}/.bridge.json`] = new FileNotFound();
    });

    test("If no b4g config is present, use pgm_conf to select pg", async () => {
      const document = vscode.Uri.joinPath(WS_URI, "main.cob");
      const cfg = await loadProcessorGroup(document);
      expect(cfg?.name).toBe("pg1");
    });
  });
});
