import {CancellationToken} from "vscode";
import {ConfigurationParams, ConfigurationRequest} from "vscode-languageclient";
import {CopybooksPathGenerator} from "./CopybooksPathGenerator";
import {CopybookURI} from "./CopybookURI";

export class Middleware {
    constructor(
        private copybooksPathGenerator: CopybooksPathGenerator,
        private copybookResolverURI: CopybookURI) {
    }

    public async handleConfigurationRequest(
        params: ConfigurationParams,
        token: CancellationToken,
        next: ConfigurationRequest.HandlerSignature) {

        if (params.items.length === 1) {
            const section = params.items[0].section.split(".");
            if (section[0] === "broadcom-cobol-lsp") {
                switch (section[1]) {
                    case "cpy-manager":
                        return (await this.copybooksPathGenerator.listUris()).map(uri => uri.toString());
                    case "copybook":

                        const cobolFileName = section[2];
                        const copybookName = section[3];
                        const uri = await this.copybookResolverURI.resolveCopybookURI(copybookName, cobolFileName);

                        return [uri];
                    default:
                        break;
                }
            }
        }
        return next(params, token);
    }
}
