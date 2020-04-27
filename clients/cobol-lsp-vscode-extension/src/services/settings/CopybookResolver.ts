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
/**
 * This interface represent the base class that define the API to resolve a JSON segment or a list of paths
 * defined by the user in the settings configuration in a list of URI Paths available on the filesystem.
 */
export interface CopybookResolver {
    resolve(list: string[]): string[];
}
