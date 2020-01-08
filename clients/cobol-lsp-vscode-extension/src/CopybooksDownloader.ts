import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";

export const DEPENDENCIES_FOLDER: string = ".cobdeps";
export const COPYBOOKS_FOLDER: string = ".copybooks";

const SETTINGS_ROOT = "cobol-language-support";

export class CopybooksDownloader {
    public async downloadCopyBooks(copybooks: string[]) {
        const cb: Set<string> = new Set(copybooks);
        const profile = await this.askProfile();
        for (const ds of await this.listPathDatasets()) {
            const members: string[] = this.listMembers(ds, profile);
            for (const member of members) {
                if (cb.has(member)) {
                    await this.downloadCopybook(ds, member, profile);
                    cb.delete(member);
                    if (cb.size === 0) {
                        return;
                    }
                }
            }
        }
    }

    private async downloadCopybook(dataset: string, copybook: string, profile: string) {
        // TOOO error if no workspace
        const rootPath = vscode.workspace.workspaceFolders[0].uri.fsPath;
        const copybookDirPath = path.join(rootPath, COPYBOOKS_FOLDER, dataset);
        const copybookPath = path.join(copybookDirPath, copybook + ".cpy");

        fs.mkdirSync(copybookDirPath, { recursive: true });
        if (!fs.existsSync(copybookPath)) {
            // TODO download content of copybook and save it
            fs.writeFileSync(copybookPath, "Hello, CopyBook");
        }
    }

    private listMembers(dataset: string, profile: string): string[] {
        // TODO
        return ["CPY1", "CPY2"];
    }

    private async listPathDatasets(): Promise<string[]> {
        if (!vscode.workspace.getConfiguration(SETTINGS_ROOT).has("paths")) {
            // TODO mey be replace with throw
            await vscode.window.showErrorMessage("Please, specify DATASET paths for copybooks in settings.");
            return [];
        }
        return vscode.workspace.getConfiguration(SETTINGS_ROOT).get("paths");
    }

    private async askProfile(): Promise<string> {
        // TODO list all
        const profiles: string[] = ["Default profile (1st)", "Profile 2"];
        // TODO If 0 - error
        if (profiles.length === 1) {
            return profiles[0];
        }
        return await vscode.window.showQuickPick(profiles, { placeHolder: profiles[0], canPickMany: false });
    }
}
