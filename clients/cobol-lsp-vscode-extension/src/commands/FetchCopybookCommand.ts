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
import {
  CopybookDownloadService,
  CopybookName,
} from "../services/copybook/CopybookDownloadService";
import { TelemetryService } from "../services/reporter/TelemetryService";

export function fetchCopybookCommand(
  copybook: string,
  downloader: CopybookDownloadService,
  programName: string,
) {
  TelemetryService.registerEvent(
    "Fetch copybook",
    ["COBOL", "copybook", "quickfix"],
    "The user tries to resolve a copybook that is not currently found",
  );
  downloader.downloadCopybooks(programName, [
    new CopybookName(copybook, "COBOL"),
  ]);
}
