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
 *   Broadcom - initial API and implementation
 */

import { hasMember, isSchemeQualifiedPath } from "../../../services/util/Utils";

describe("Utils", () => {
  describe("isSchemeQualifiedPath", () => {
    test("recognizes a scheme with no authority", () => {
      expect(isSchemeQualifiedPath("zowe-uss:/profile/path")).toEqual(true);
    });

    test("recognizes a scheme with an authority", () => {
      expect(isSchemeQualifiedPath("file:///local/path")).toEqual(true);
    });

    test("does not mistake a Windows drive letter for a scheme", () => {
      expect(isSchemeQualifiedPath("C:/local/path")).toEqual(false);
      expect(isSchemeQualifiedPath("C:\\local\\path")).toEqual(false);
    });

    test("does not mistake an absolute POSIX path for a scheme", () => {
      expect(isSchemeQualifiedPath("/local/path")).toEqual(false);
    });

    test("does not mistake a relative path for a scheme", () => {
      expect(isSchemeQualifiedPath("copybooks")).toEqual(false);
    });
  });

  describe("hasMember", () => {
    test("should return true and narrow unknown type if member is available", () => {
      const unknownObject: unknown = { member: "hello" };
      const result = hasMember(unknownObject, "member");
      if (result) {
        expect(unknownObject.member).toEqual("hello");
        // @ts-expect-error Property 'foo' does not exist on type { member: unknown }
        expect(unknownObject.foo).toBeUndefined();
      }
      expect(result).toEqual(true);
    });

    test("should return false if member is not present", () => {
      const unknownObject: unknown = {};
      const result = hasMember(unknownObject, "member");
      expect(result).toEqual(false);
    });

    test("should return false if object is null", () => {
      const result = hasMember(null, "member");
      expect(result).toEqual(false);
    });

    test("should return false if object is undefined", () => {
      const result = hasMember(undefined, "member");
      expect(result).toBeFalsy();
    });
  });
});
