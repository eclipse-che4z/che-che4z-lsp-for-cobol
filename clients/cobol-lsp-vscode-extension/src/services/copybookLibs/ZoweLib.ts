import * as vscode from "vscode";
import { ProfileUtils } from "../util/ProfileUtils";
import {
  externalApis,
  missingExtension,
} from "../copybook/CopybookDownloadService";
import {
  DownloadUtil,
  MainframeRemoteLocation,
} from "../copybook/downloader/DownloadUtil";
import { PROVIDE_PROFILE_MSG_PROC_GRUOPS } from "../../constants";

export abstract class ZoweLib {
  constructor(protected profile?: string) {}

  protected getProfile(documentUri: vscode.Uri) {
    return (
      this.profile ??
      ProfileUtils.getProfileNameForCopybook(
        documentUri,
        externalApis.explorerApi,
      ) ??
      "profile"
    );
  }

  async configCheck(documentUri: vscode.Uri) {
    const profile = this.getProfile(documentUri);

    if (!externalApis.dsnService) {
      missingExtension(documentUri, "Zowe Explorer is not installed");
      return false;
    }

    // isProfileLocked
    if (await DownloadUtil.isProfileLocked(profile)) {
      return false;
    }

    // isProfileValid
    const availableProfiles = ProfileUtils.getAvailableProfiles(
      externalApis.explorerApi,
    );

    if (!availableProfiles.includes(profile)) {
      const msg = `${PROVIDE_PROFILE_MSG_PROC_GRUOPS} Provided invalid profile name: ${profile}`;
      vscode.window.showErrorMessage(msg);
      return false;
    }

    if (
      await DownloadUtil.checkForInvalidCredProfile(
        this.getProfile(documentUri),
        this.credentialsTestLocation(),
      )
    ) {
      return false;
    }

    return true;
  }

  abstract credentialsTestLocation(): MainframeRemoteLocation;
}
