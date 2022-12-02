/**
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/

 * SPDX-License-Identifier: EPL-2.0

 * Contributors:
 *  Broadcom, Inc. - initial API and implementation
 */

import {Server} from "../server";
import {
    RelatedFullDocumentDiagnosticReport
} from "vscode-languageserver-protocol/lib/common/protocol.diagnostic";
import * as fs from "fs";
import * as path from "path";
import {ProtocolConnection} from "vscode-languageserver-protocol";

//TODO :
// 1. Get working folder as a cmd line. deduce programs and copybooks based on file structure.
// 2. resolve copybooks based on program name.
// 3. Automate the path for executables.

describe("Test native builds", () => {

    // Path where the test file are
    const cobol85TestSuitePath = "../test_files/Cobol85PositiveTestsSuite";

    // Folder under the workspace where cobol prgm resides
    const cobolProgramFolder = "positive"

    const progDir = path.join(cobol85TestSuitePath, cobolProgramFolder);

    //resources/clientConfig.json = contains the configuration for client
    const server = new Server(path.resolve(progDir), "SampleProj", "resources/clientConfig.json");
    let serverConnection: ProtocolConnection;

    beforeAll(async () => {
        await server.launchServer(); // launch server
        serverConnection = await server.establishLSProtocolConnection();
    })

    afterAll(async () => {
        await server.shutdownServer(serverConnection); // close server
    })

    test("tests diagnostic error for cobol85 test suite", async () => {
        for (const f of fs.readdirSync(progDir)) {
            process.stdout.write(`=== WORKING ON ${f} ===\r\n`);
            await server.openDocument(serverConnection, f);
            let diagnostics = await server.getDocumentDiagnostics(serverConnection, f) as RelatedFullDocumentDiagnosticReport;
            if (diagnostics.items.length > 0) {
                process.stdout.write(`seems issue with following response\r\n`);
                process.stdout.write(`${JSON.stringify(diagnostics)}\r\n`);
            }
            expect(
                (diagnostics && !diagnostics.items)
                || (diagnostics.items.length === 0)
                || (diagnostics.items?.filter(item => item && item.severity && item.severity >= 2).length === diagnostics.items.length) // Ignore less severe error
            )
                .toBeTruthy();
        }
    }, 999999);
});

