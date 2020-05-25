import {CancellationToken} from "vscode";
import {ConfigurationParams, ConfigurationRequest} from "vscode-languageclient";
import {CopybooksPathGenerator} from "./CopybooksPathGenerator";
import {CopybookURI} from "./CopybookURI";

export class Middleware {
    private static extractFileAndCopybookNames(params: string): [string, string] {
        const firstDot = params.indexOf(".");
        const secondDot = params.indexOf(".", firstDot + 1);
        const lastDot = params.lastIndexOf(".");
        return [params.substring(secondDot + 1, lastDot), params.substring(lastDot + 1)];
    }
    constructor(
        private copybooksPathGenerator: CopybooksPathGenerator,
        private copybookResolverURI: CopybookURI) {
    }

    public async handleConfigurationRequest(
        params: ConfigurationParams,
        token: CancellationToken,
        next: ConfigurationRequest.HandlerSignature) {

        if (params.items.length === 1) {
            const sectionName = params.items[0].section;
            const section = sectionName.split(".");
            if (section[0] === "broadcom-cobol-lsp") {
                switch (section[1]) {
                    case "cpy-manager":
                        return (await this.copybooksPathGenerator.listUris()).map(uri => uri.toString());
                    case "copybook":
                        const [cobolFileName, copybookName] = Middleware.extractFileAndCopybookNames(sectionName);
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
