import {fetchCopybookCommand} from "../commands/FetchCopybookCommand";
import {CopybookDownloadService} from "../services/copybook/CopybookDownloadService";
import {TelemetryService} from "../services/reporter/TelemetryService";
import {ZoweApi} from "../services/ZoweApi";

jest.mock("../services/reporter/TelemetryService");
jest.mock("../services/copybook/CopybookDownloadService");
const zoweApi: ZoweApi = new ZoweApi();
const copybookDownloadService: CopybookDownloadService = new CopybookDownloadService(zoweApi, null, null);
const copybook: string = "cobyBookTest";
const progName: string = "progNameTest";

test("Test fetchCopybookCommand calls telementry services and coprbook download service with proper input", () => {
    expect(fetchCopybookCommand).toBeTruthy();
    fetchCopybookCommand(copybook, copybookDownloadService, progName);
    expect(TelemetryService.registerEvent).toBeCalledWith("Fetch copybook", ["COBOL", "copybook", "quickfix"], "The user tries to resolve a copybook that is not currently found");
    expect(copybookDownloadService.downloadCopybooks).toBeCalledWith(progName, [copybook], false);
});
