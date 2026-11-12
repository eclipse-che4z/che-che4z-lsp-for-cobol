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
import { Uri } from "../../__mocks__/vscode";
import { DatasetLib } from "../../services/copybookLibs/DatasetLib";
import LocalPathLib from "../../services/copybookLibs/LocalPathLib";
import { ExternalConfigurationProvider } from "../../services/ExternalConfigurationProvider";
import { outputChannel } from "../../services/util/OutputChannel";

const DOCUMENT = Uri.file("/workspace/PROGRAM.cbl");
const OTHER_DOCUMENT = Uri.file("/workspace/OTHER.cbl");

const groupResponse = (name: string, libs: unknown[] = []) => ({
  configuration: { name, libs },
});

let provider: ExternalConfigurationProvider;

beforeEach(() => {
  jest.clearAllMocks();
  provider = new ExternalConfigurationProvider();
});

describe("ExternalConfigurationProvider resolves configuration", () => {
  it("returns nothing when no provider is registered", async () => {
    expect(await provider.resolve(DOCUMENT)).toBeUndefined();
  });

  it("returns nothing when no provider handles the document", async () => {
    provider.addHandler("null", jest.fn().mockReturnValue(null));
    provider.addHandler("undefined", jest.fn().mockResolvedValue(undefined));
    expect(await provider.resolve(DOCUMENT)).toBeUndefined();
  });

  it("uses the first provider in registration order returning a configuration", async () => {
    const first = jest.fn().mockReturnValue(null);
    const second = jest
      .fn()
      .mockResolvedValue(
        groupResponse("SECOND", ["/second", { dataset: "HLQ.COPY" }]),
      );
    const third = jest.fn().mockReturnValue(groupResponse("THIRD"));
    provider.addHandler("first", first);
    provider.addHandler("second", second);
    provider.addHandler("third", third);

    const pg = await provider.resolve(DOCUMENT);

    expect(pg?.name).toBe("SECOND");
    expect(pg?.libs).toStrictEqual([
      new LocalPathLib("/second"),
      new DatasetLib("HLQ.COPY"),
    ]);
    expect(first).toHaveBeenCalledWith(DOCUMENT);
    expect(third).not.toHaveBeenCalled();
  });

  it("skips a provider that throws", async () => {
    provider.addHandler(
      "failing",
      jest.fn().mockRejectedValue(new Error("provider failure")),
    );
    provider.addHandler(
      "working",
      jest.fn().mockReturnValue(groupResponse("WORKING")),
    );

    expect((await provider.resolve(DOCUMENT))?.name).toBe("WORKING");
    expect(outputChannel.error).toHaveBeenCalledWith(
      expect.stringContaining("provider failure"),
    );
  });

  it("skips a provider returning an invalid configuration", async () => {
    provider.addHandler(
      "invalid",
      jest.fn().mockReturnValue({ configuration: { libs: "/not/an/array" } }),
    );
    provider.addHandler(
      "valid",
      jest.fn().mockReturnValue(groupResponse("VALID")),
    );

    expect((await provider.resolve(DOCUMENT))?.name).toBe("VALID");
    expect(outputChannel.error).toHaveBeenCalledWith(
      expect.stringContaining("Invalid configuration provided by invalid"),
    );
  });
});

describe("ExternalConfigurationProvider registrations", () => {
  it("dispose removes only its own registration", async () => {
    const first = provider.addHandler(
      "same.id",
      jest.fn().mockReturnValue(groupResponse("FIRST")),
    );
    provider.addHandler(
      "same.id",
      jest.fn().mockReturnValue(groupResponse("SECOND")),
    );

    first.dispose();
    first.dispose();

    expect((await provider.resolve(DOCUMENT))?.name).toBe("SECOND");
  });

  it("caches configuration per document until invalidated", async () => {
    const handler = jest.fn().mockReturnValue(groupResponse("CACHED"));
    const registration = provider.addHandler("cache", handler);

    await provider.resolve(DOCUMENT);
    await provider.resolve(DOCUMENT);
    expect(handler).toHaveBeenCalledTimes(1);

    registration.invalidate(DOCUMENT);
    await provider.resolve(DOCUMENT);
    expect(handler).toHaveBeenCalledTimes(2);

    await provider.resolve(OTHER_DOCUMENT);
    registration.invalidate();
    await provider.resolve(DOCUMENT);
    await provider.resolve(OTHER_DOCUMENT);
    expect(handler).toHaveBeenCalledTimes(5);

    provider.invalidateCache(DOCUMENT);
    await provider.resolve(DOCUMENT);
    expect(handler).toHaveBeenCalledTimes(6);
  });
});

describe("ExternalConfigurationProvider change notification", () => {
  beforeEach(() => {
    jest.useFakeTimers();
  });

  afterEach(() => {
    jest.useRealTimers();
  });

  it("notifies listeners once for changes in quick succession", async () => {
    const listener = jest.fn();
    provider.onDidChange(listener);

    const registration = provider.addHandler("first", jest.fn());
    provider.addHandler("second", jest.fn());
    registration.invalidate(DOCUMENT);
    expect(listener).not.toHaveBeenCalled();

    await jest.advanceTimersByTimeAsync(250);
    expect(listener).toHaveBeenCalledTimes(1);

    registration.dispose();
    await jest.advanceTimersByTimeAsync(250);
    expect(listener).toHaveBeenCalledTimes(2);
  });

  it("does not notify listeners when a document is removed from cache", async () => {
    provider.addHandler("first", jest.fn());
    await jest.advanceTimersByTimeAsync(250);

    const listener = jest.fn();
    provider.onDidChange(listener);
    provider.invalidateCache(DOCUMENT);
    await jest.advanceTimersByTimeAsync(250);

    expect(listener).not.toHaveBeenCalled();
  });

  it("stops notifying a disposed listener and logs failing listeners", async () => {
    const disposedListener = jest.fn();
    provider.onDidChange(disposedListener).dispose();
    provider.onDidChange(
      jest.fn().mockRejectedValue(new Error("invalidation failure")),
    );

    provider.addHandler("first", jest.fn());
    await jest.advanceTimersByTimeAsync(250);

    expect(disposedListener).not.toHaveBeenCalled();
    expect(outputChannel.error).toHaveBeenCalledWith(
      expect.stringContaining("invalidation failure"),
    );
  });
});
