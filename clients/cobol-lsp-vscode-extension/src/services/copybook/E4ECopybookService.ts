/*
 * Copyright (c) 2024 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
import * as vscode from "vscode";
import {
  DATASET,
  ENVIRONMENT,
  OUTPUT_MSG_SEARCH_LOCATION,
} from "../../constants";
import {
  E4E,
  e4eResponse,
  E4EExternalConfigurationResponse,
  defaultConfigs,
  EndevorElement,
  EndevorMember,
  ResolvedProfile,
  EndevorType,
} from "../../type/e4eApi.d";
import { Utils } from "../util/Utils";

export class E4ECopybookService {
  private static E4EConfigs = new Map<string, e4eResponse>();

  public static async getE4EAPI(): Promise<E4E | undefined> {
    const ext = vscode.extensions.getExtension(
      "BroadcomMFD.explorer-for-endevor",
    );
    if (!ext) {
      return undefined;
    }
    try {
      if (!ext.isActive) await ext.activate();
      const e4e = ext.exports;
      if (Utils.validateE4E(e4e)) return e4e;
    } catch (_err) {}
    return undefined;
  }

  public static async getE4EClient(
    uri: string,
    outputChannel?: vscode.OutputChannel,
  ): Promise<e4eResponse | undefined> {
    const config = this.E4EConfigs.get(uri);
    if (config) {
      return config;
    }
    const e4e = await this.getE4EAPI();

    if (!e4e || !e4e.isEndevorElement(uri)) return undefined;

    const profile = await e4e.getProfileInfo(uri);
    if (profile instanceof Error) throw profile;

    const result: E4EExternalConfigurationResponse | Error =
      await e4e.getConfiguration(uri, defaultConfigs);
    if (result instanceof Error) throw result;

    const candidate = result.pgroups.find(
      (x) => x.name === result.pgms[0].pgroup,
    );
    if (!candidate) throw Error("Invalid configuration");

    const libs = candidate.libs as (EndevorElement | EndevorMember)[];
    let elements: { [key: string]: EndevorElement | EndevorMember } = {};
    const promises: Promise<EndevorMember[] | EndevorElement[] | Error>[] = [];

    for (const lib of libs) {
      if (DATASET in lib) {
        promises.push(this.getMembers(e4e, profile, lib.dataset));
      }
      if (ENVIRONMENT in lib) {
        promises.push(this.getElements(e4e, profile, lib));
      }
    }
    for await (const promise of promises) {
      if (promise instanceof Error) {
        outputChannel?.appendLine(promise.message);
      } else {
        for (const pro of promise) {
          if (DATASET in pro && !elements[pro.member]) {
            elements[pro.member] = pro;
          } else if (ENVIRONMENT in pro && !elements[pro.element])
            elements[pro.element] = pro;
        }
      }
    }

    this.writeLocationLogs(candidate?.libs, outputChannel);

    const response = {
      profile: profile,
      api: e4e,
      uri: uri,
      elements: elements,
    };
    this.E4EConfigs.set(uri, response);
    return response;
  }

  private static writeLocationLogs(
    entries: any[],
    outputChannel?: vscode.OutputChannel,
  ) {
    entries.forEach((libEntry) => {
      outputChannel?.appendLine(
        OUTPUT_MSG_SEARCH_LOCATION + JSON.stringify(libEntry),
      );
    });
  }

  private static async getMembers(
    e4e: E4E,
    profile: ResolvedProfile,
    dataset: string,
  ): Promise<EndevorMember[] | Error> {
    const list = await e4e.listMembers(profile, { dataset });
    if (list instanceof Error) return list;

    return list.map((str) => ({
      dataset: dataset,
      member: str,
    }));
  }
  private static async getElements(
    e4e: E4E,
    profile: ResolvedProfile,
    lib: EndevorType,
  ): Promise<EndevorElement[] | Error> {
    const list = await e4e.listElements(profile, lib);
    if (list instanceof Error) return list;

    return list.map(([filename, fingerprint]) => ({
      environment: lib.environment,
      element: filename,
      use_map: lib.use_map ? true : false,
      stage: lib.stage,
      system: lib.system,
      subsystem: lib.subsystem,
      type: lib.type,
      fingerprint: fingerprint,
    }));
  }
}
