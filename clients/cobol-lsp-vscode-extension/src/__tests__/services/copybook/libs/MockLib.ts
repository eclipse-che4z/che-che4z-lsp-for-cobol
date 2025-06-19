import { Uri, OutputChannel } from "vscode";
import CopybookLib from "../../../../services/copybookLibs/CopybookLib";

export class MockLib implements CopybookLib {
  constructor(private directory: { [key: string]: Uri }) {}

  resolveCopybookUri(
    copybookName: string,
    _documentUri: Uri,
  ): Promise<Uri | (() => Promise<Uri | undefined>) | undefined> {
    return Promise.resolve(this.directory[copybookName]);
  }

  listCopybooks(
    _documentUri: Uri,
    _outputChannel?: OutputChannel,
  ): Promise<string[]> {
    return Promise.resolve(Object.keys(this.directory));
  }
}
