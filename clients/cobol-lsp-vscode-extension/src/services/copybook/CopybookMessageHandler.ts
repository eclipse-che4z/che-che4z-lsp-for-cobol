import {SettingsService} from "../Settings";
import {searchInWorkspace} from "../util/FSUtils";
import {CopybookURI} from "./CopybookURI";
import {CopybookName} from "./CopybookDownloadService";

export function resolveCopybookHandler(cobolFileName: string, copybookName: string, dialectType: string): string {
    let result: string;
    result = searchInWorkspace(copybookName,
        SettingsService.getCopybookLocalPath(cobolFileName, dialectType), SettingsService.getCopybookExtension());
    // check in subfolders under .copybooks (copybook downloaded from MF)
    if (!result) {
        result = searchInWorkspace(
            copybookName,
            CopybookURI.createPathForCopybookDownloaded(
                cobolFileName,
                dialectType),
            SettingsService.getCopybookExtension());
    }
    return result;
}

export function downloadCopybookHandler(cobolFileName: string, copybookNames: string[], dialectType: string, quietMode: boolean): string {

    return this.copybookDownloader.downloadCopybooks(
        cobolFileName,
        copybookNames.map(copybookName => new CopybookName(copybookName, dialectType)),
        quietMode);

}
