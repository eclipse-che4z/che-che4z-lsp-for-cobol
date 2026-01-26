import {
  CloseAction,
  CloseHandlerResult,
  ErrorHandler,
  ErrorHandlerResult,
  Message,
} from "vscode-languageclient";

export class LanguageClientErrorHandler implements ErrorHandler {
  defaultHandler?: ErrorHandler = undefined;
  initialized = false;

  error(
    error: Error,
    message: Message | undefined,
    count: number | undefined,
  ): ErrorHandlerResult | Promise<ErrorHandlerResult> {
    return this.defaultHandler!.error(error, message, count);
  }

  closed(): CloseHandlerResult | Promise<CloseHandlerResult> {
    if (this.initialized) {
      return this.defaultHandler!.closed();
    }
    return { action: CloseAction.DoNotRestart };
  }
}
