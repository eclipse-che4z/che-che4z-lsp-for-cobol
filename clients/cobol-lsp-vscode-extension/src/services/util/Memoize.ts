import * as vscode from "vscode";

export class Memoize<TArgs extends unknown[], TReturn> {
  private cache = new Map<string, Promise<TReturn | undefined>>();

  constructor(
    private fn: (...args: TArgs) => Promise<TReturn | undefined>,
    private handleError?: (error: unknown) => unknown,
    private generateKey: (...args: TArgs) => string = (...args) =>
      JSON.stringify(args),
  ) {}

  execute = async (...args: TArgs): Promise<TReturn | undefined> => {
    const key = this.generateKey(...args);

    if (this.cache.has(key)) {
      debug(`Cached:  ${key} - ${JSON.stringify(this.cache.get(key))}`);
      return this.cache.get(key)!;
    }

    debug(`Fetching:  ${key}`);
    const promise = this.fn(...args);
    this.cache.set(key, promise);

    try {
      const result = await promise;
      return result;
    } catch (error) {
      this.cache.set(key, Promise.resolve(undefined));
      if (this.handleError) {
        this.handleError(error);
      }
      return;
    }
  };

  invalidateCache = (...args: TArgs): void => {
    debug(`Invalidate:  ${JSON.stringify(args)}`);

    const key = this.generateKey(...args);
    this.cache.delete(key);
  };

  clearCache = () => {
    this.cache.clear();
  };
}

let debugChannel: vscode.OutputChannel;

function debug(message: string, id = "DebugChannel") {
  if (!debugChannel) {
    debugChannel = vscode.window.createOutputChannel(id);
  }
  debugChannel.appendLine(message);
}
