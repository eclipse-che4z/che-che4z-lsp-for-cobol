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

/**
 * Type for a cobol code layout
 */
interface LayoutStructure {
  sequence_length?: integer;
  indicator_length?: integer;
  area_a_length?: integer;
  area_b_length?: integer;
  comment_area?: integer;
}
