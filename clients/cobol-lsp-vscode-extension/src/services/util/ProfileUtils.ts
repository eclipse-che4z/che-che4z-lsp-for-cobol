import * as path from "path";
import * as vscode from "vscode";
import { SettingsService } from "../Settings";
import { Utils } from "./Utils";

export class ProfileUtils {
    public static async getProfileNameForCopybook(documentUri: string): Promise<(string | undefined)> {
        const zoweExplorerApi = await Utils.getZoweExplorerAPI();
        let availableProfiles: string[] = [];
        zoweExplorerApi.registeredApiTypes().forEach(profileType => {
            availableProfiles = availableProfiles
                .concat(zoweExplorerApi.getExplorerExtenderApi().getProfilesCache()
                    .getProfiles(profileType)?.map(ele => ele.name));
        });
        return ProfileUtils.getValidProfileForCopybookDownload(documentUri, availableProfiles);
    }

    private static getValidProfileForCopybookDownload(documentUri: string, availableProfiles: string[]): string {
        const profileFromDoc = ProfileUtils.getProfileFromDocument(documentUri, availableProfiles);
        const passedProfile = SettingsService.getProfileName();
        if (!profileFromDoc && availableProfiles.indexOf(passedProfile) >= 0) {
            return passedProfile;
        }
        return profileFromDoc;
    }

    private static getProfileFromDocument(documentUri: string, availableProfiles: string[]): (string | undefined) {
        for (const doc of vscode.workspace.textDocuments) {
            if (documentUri === doc.uri.toString()) {
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
