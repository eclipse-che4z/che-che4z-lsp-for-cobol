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

import { hasMember } from "../../../services/util/Utils";

describe("Utils", () => {
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
