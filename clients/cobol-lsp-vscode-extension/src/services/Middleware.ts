import { CancellationToken } from "vscode";
import { ConfigurationParams, ConfigurationRequest } from "vscode-languageclient";
import { CopybooksDownloader } from "./CopybooksDownloader";
import { CopybooksPathGenerator } from "./CopybooksPathGenerator";

export class Middleware {
    constructor(
            private copybooksPathGenerator: CopybooksPathGenerator,
            private copybookDownloader: CopybooksDownloader) {}

    public async handleConfigurationRequest(
            params: ConfigurationParams,
            token: CancellationToken,
            next: ConfigurationRequest.HandlerSignature) {

        if (params.items.length === 1) {
            const section = params.items[0].section.split(".");
            if (section[0] === "broadcom-cobol-lsp") {
                switch (section[1]) {
                    case "cpy-manager":
                        return this.handleCpyManagerRequest();
                    case "copybook":
                        const cobolFileName = section[2];
                        const copybookName = section[3];
                        return [this.handleCopybookRequest(cobolFileName, copybookName)];
                    default:
                        break;
                }
            }
        }
        return next(params, token);
    }

    private async handleCpyManagerRequest() {
        return (await this.copybooksPathGenerator.listUris()).map(uri => uri.toString());
    }

    private handleCopybookRequest(cobolFileName: string, copybookName: string): string {
        this.copybookDownloader.downloadDependency(cobolFileName, copybookName);
        return "";
    }
}
