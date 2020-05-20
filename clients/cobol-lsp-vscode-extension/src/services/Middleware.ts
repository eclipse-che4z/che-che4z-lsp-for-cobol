import { CancellationToken } from "vscode";
import { ConfigurationParams, ConfigurationRequest } from "vscode-languageclient";
import { CopybookResolveURI } from "./CopybookResolveURI";
import { CopybooksPathGenerator } from "./CopybooksPathGenerator";

export class Middleware {
    constructor(
            private copybooksPathGenerator: CopybooksPathGenerator,
            private copybookResolverURI: CopybookResolveURI) {}

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
                            const uri = await this.copybookResolverURI.resolveCopybooksInDepFile(copybookName, cobolFileName);

                            return [uri];
                        default:
                            break;
                    }
                }
            }
        return next(params, token);
            // TODO if request params are right

            // TODO after server modification this method return the local copybooks URI
            /*
             there should be logic here to check if user complete the zowe settings, than add
             calculated path to response object
             use checkMFSettings and this.copybooksPathGenerator.listUris()
            */

            /**
             * TODO
             * at initialize moment, check if there is a dependency file created for the open COBOL
             * file, if not send empty array, if yes call prioritizer.checkCopybooksPresentLocal
             * If the dependency file is not present at the initialize moment, the server after analyzing
             * the open file has to ask for settings in order to resolve the local copybooks
             */

            // TODO: get the dependency file content and apply the prioritazion..

            // TODO: Should return an object in the form {cpy_name, uri}
            // return (await this.copybooksPathGenerator.listUris()).map(uri => uri.toString());
            // TODO else return next(params, token);
    }
}
