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

import { Logger } from "vscode-languageserver-protocol";
import * as cp from "child_process";
import * as net from "net";
import { StreamMessageReader, StreamMessageWriter } from "vscode-languageserver-protocol/node";
import * as os from "os";

const serverExecutable = {
    args: ["pipeEnabled","-Dline.separator=\r\n", "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener"],
    command: "",
    options: { stdio: "pipe", detached: false, cwd: "" },
};
const utf8 = "utf-8";

export class ServerLaucher {

    createSocketMessageTransporter = (logger: Logger, port?: number) => {
        if(port) {
            return ServerLaucher.createLocalConnectionOnPort(port);
        }
        return this.startANativeBuild(logger);
    };

    private startANativeBuild(logger: Logger) {
        switch (os.type()) {
            case "Windows_NT":
                serverExecutable.command = "engine.exe";
                serverExecutable.options.cwd = "server/windows";
                break;
            case "Darwin":
                serverExecutable.command = "./server-mac";
                serverExecutable.options.cwd = "server/mac";
                break;
            case "Linux":
                serverExecutable.command = "./server-linux";
                serverExecutable.options.cwd = "server/linux";
                break;
            default:
                console.error("OS not supported yet !!!");
        }
        const serverProcess = cp.spawn(
            serverExecutable.command,
            serverExecutable.args,
            serverExecutable.options as cp.SpawnOptions
        );
        if (!serverProcess || !serverProcess.pid) {
            console.log(
                serverProcess,
                `Launching server using command ${serverExecutable.command} failed.`
            );
        }
        serverProcess!.stderr!.on("data", (data) => {
            logger.error(typeof data === "string" ? data : data.toString(utf8));
        });
        serverProcess!.stdout!.on("data", (data) => {
            logger.log(typeof data === "string" ? data : data.toString(utf8));
        });
        return Promise.resolve({
            reader: new StreamMessageReader(serverProcess.stdout!),
            writer: new StreamMessageWriter(serverProcess.stdin!),
        });
    }

    private static createLocalConnectionOnPort(port: number) {
        const connectionInfo = {host: "localhost", port};
        const socket = net.connect(connectionInfo);
        return Promise.resolve({
            reader: new StreamMessageReader(socket),
            writer: new StreamMessageWriter(socket),
        });
    }
}
