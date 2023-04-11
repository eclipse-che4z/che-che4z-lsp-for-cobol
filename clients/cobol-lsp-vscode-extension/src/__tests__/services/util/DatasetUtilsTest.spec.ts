/*
 * Copyright (c) 2020 Broadcom.
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

import {
  DSN_CONTAINS_PROHIBITED_CHAR,
  DSN_MUSTBE_NOT_EMPTY,
  DSN_NOMORE_8CHARS,
  DSN_START_PROHIBITED_CHAR,
  SEGMENT_PLACEHOLDER,
} from "../../../constants";
import { validateDatasetNames } from "../../../services/util/DatasetUtils";

describe("Validate dataset name against bad configurations", () => {
  test("Given a empty value as dataset name, the UI returns an appropriate message", () => {
    expect(validateDatasetNames("")).toBe(DSN_MUSTBE_NOT_EMPTY);
  });

  test("Given a dataset with more than 8 chars, the UI returns an appropriate message", () => {
    expect(validateDatasetNames("ALONGDATASETMORETHANEIGHTCHARS")).toBe(
      DSN_NOMORE_8CHARS,
    );
  });

  test("Given a dataset with a prohibited char at the beginning, the UI returns an appropriate message", () => {
    expect(validateDatasetNames("1DSN")).toBe(
      DSN_START_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, "1DSN"),
    );
  });

  test("Given a dataset that contains a prohibited char, the UI returns an appropriate message", () => {
    expect(validateDatasetNames("HLQ!DSN")).toBe(
      DSN_CONTAINS_PROHIBITED_CHAR.replace(SEGMENT_PLACEHOLDER, "HLQ!DSN"),
    );
  });
});

describe("Validate dataset name against correct input from the user", () => {
  test("Given a dataset no longer than 8 chars, the UI will not throw any notification message to the user", () => {
    expect(validateDatasetNames("DSN")).toBeUndefined();
  });

  test("Given a correct dataset configuration, the UI will not throw any notification message to the user", () => {
    expect(validateDatasetNames("HLQ.DSNAME1")).toBeUndefined();
  });
});
