export const { State } = jest.requireActual<
  typeof import("vscode-languageclient/node")
>("vscode-languageclient/node");

export class LanguageClient extends jest.fn() {
  constructor(
    languageId: string,
    extensionName: string,
    private serverOptions: () => void | object,
    clientOptions: object,
  ) {
    super(languageId, extensionName, serverOptions, clientOptions);
  }
  public state = State.Stopped;
  start() {
    // if socket server
    if (typeof this.serverOptions === "function") {
      this.serverOptions(); // create socket
    }
    this.state = State.Running;
  }
  dispose() {
    this.state = State.Stopped;
  }
  createDefaultErrorHandler() {
    return jest.fn();
  }
}
