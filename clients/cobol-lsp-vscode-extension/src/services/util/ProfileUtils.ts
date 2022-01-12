import { ZoweVsCodeExtension } from "@zowe/zowe-explorer-api/lib/vscode";
import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../Settings";

export class ProfileUtils {
    public static getProfileNameForCopybook(cobolFileName: string): (string | undefined) {
        const zoweExplorerApi = ZoweVsCodeExtension.getZoweExplorerApi();
        const availableProfiles = zoweExplorerApi.getExplorerExtenderApi().getProfilesCache().getProfiles();
        return ProfileUtils.getValidProfileForCopybookDownload(cobolFileName, availableProfiles.map(ele => ele.name));
    }

    private static getValidProfileForCopybookDownload(programName: string, availableProfiles: string[]): string {
        const profileFromDoc = ProfileUtils.getProfileFromDocument(programName, availableProfiles);
        if (!profileFromDoc) {
            return SettingsService.getProfileName();
        }
        return profileFromDoc;
    }

    private static getProfileFromDocument(programName: string, availableProfiles: string[]): (string | undefined) {
        for (const doc of vscode.workspace.textDocuments) {
            const openName = path.basename(doc.fileName);
            if (unescape(programName) === openName) {
                const profile = ProfileUtils.tryGetProfileFromDocumentPath(doc.fileName, availableProfiles);
                if (profile) {
                    return profile;
                }
            }
        }
        return undefined;
    }

    private static tryGetProfileFromDocumentPath(docPath: string, availableProfiles: string[]): (string | undefined) {
        const segments: string[] = docPath.split(path.sep);
        if (segments.length < 2) {
            return undefined;
        }
        const profileName = segments[segments.length - 2];
        if (availableProfiles.indexOf(profileName) >= 0) {
            return profileName;
        }
        return undefined;
    }
}
