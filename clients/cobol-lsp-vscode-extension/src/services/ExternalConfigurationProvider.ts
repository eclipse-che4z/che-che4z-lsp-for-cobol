/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */
import { isLeft } from "fp-ts/Either";
import { PathReporter } from "io-ts/lib/PathReporter";
import { Disposable, Uri } from "vscode";
import type {
  ConfigurationProviderRegistration,
  ExternalConfigurationProviderHandler,
} from "../type/externalConfigurationApi";
import {
  ExternalConfigurationResponseModel,
  ProcessorGroup,
  transformWorkspaceProcessorGroup,
} from "./ProcessorGroupsLoader";
import { Memoize } from "./util/Memoize";
import { outputChannel } from "./util/OutputChannel";
import { getErrorMessage } from "./util/ErrorsUtils";
import { telemetryEvent, telemetryExceptionEvent } from "./reporter";

const CHANGE_NOTIFICATION_DELAY = 250;

type Registration = {
  extensionId: string; // just helps in better logging. Can be removed
  handler: ExternalConfigurationProviderHandler;
};

export class ExternalConfigurationProvider {
  private registrations: Registration[] = [];
  private listeners = new Set<() => unknown>();
  private notificationTimer: ReturnType<typeof setTimeout> | undefined;
  private responses = new Memoize(
    (documentUri: Uri) => this.queryProviders(documentUri),
    undefined,
    (documentUri) => documentUri.toString(),
  );

  public addHandler(
    extensionId: string,
    handler: ExternalConfigurationProviderHandler,
  ): ConfigurationProviderRegistration {
    const registration: Registration = { extensionId, handler };
    this.registrations.push(registration);
    outputChannel.info(
      `External configuration provider registered by ${extensionId}`,
    );
    this.invalidate();

    return Object.freeze({
      dispose: () => {
        const idx = this.registrations.indexOf(registration);
        if (idx < 0) return;
        this.registrations.splice(idx, 1);
        outputChannel.info(
          `External configuration provider of ${extensionId} unregistered`,
        );
        this.invalidate();
      },
      invalidate: (uri?: Uri) => this.invalidate(uri),
    });
  }

  public onDidChange(listener: () => unknown): Disposable {
    this.listeners.add(listener);
    return new Disposable(() => this.listeners.delete(listener));
  }

  public invalidate(uri?: Uri) {
    if (uri) {
      this.responses.invalidateCache(uri);
    } else {
      this.responses.clearCache();
    }
    this.scheduleChangeNotification();
  }

  public invalidateCache(uri: Uri) {
    this.responses.invalidateCache(uri);
  }

  public async resolve(documentUri: Uri): Promise<ProcessorGroup | undefined> {
    if (this.registrations.length === 0) return;
    return this.responses.execute(documentUri);
  }

  private async queryProviders(
    documentUri: Uri,
  ): Promise<ProcessorGroup | undefined> {
    for (const { extensionId, handler } of [...this.registrations]) {
      let response: unknown;
      try {
        response = await handler(documentUri);
      } catch (error) {
        const message = getErrorMessage(error);
        outputChannel.error(
          `External configuration provider of ${extensionId} failed for ${documentUri.toString()} - ${message}`,
        );
        telemetryExceptionEvent(
          "ExternalConfigurationFailed",
          message,
          ["configuration", "external-configuration"],
          `External configuration provider of ${extensionId} failed`,
        );
        continue;
      }
      if (response === null || response === undefined) continue;

      const decoded = ExternalConfigurationResponseModel.decode(response);
      if (isLeft(decoded)) {
        outputChannel.error(
          `Invalid configuration provided by ${extensionId} for ${documentUri.toString()} - ${PathReporter.report(decoded).join("\n")}`,
        );
        continue;
      }

      telemetryEvent(
        "external-configuration",
        ["configuration", "external-configuration"],
        `Configuration provided by ${extensionId}`,
      );
      return transformWorkspaceProcessorGroup(decoded.right.configuration);
    }
  }

  /**
   *
   * @returns debounce for startup when many hadlers might call addHandler which would call invalidate
   */
  private scheduleChangeNotification() {
    if (this.notificationTimer !== undefined) return;
    this.notificationTimer = setTimeout(() => {
      this.notificationTimer = undefined;
      for (const listener of this.listeners) {
        Promise.resolve()
          .then(listener)
          .catch((error) =>
            outputChannel.error(
              `External configuration invalidation failed - ${getErrorMessage(error)}`,
            ),
          );
      }
    }, CHANGE_NOTIFICATION_DELAY);
  }
}

export const externalConfigurationProvider =
  new ExternalConfigurationProvider();
