/*
 * Copyright (c) 2023 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.service.settings;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import org.eclipse.lsp4j.ConfigurationItem;

/**
 * Represents a text configuration at the client as per LSP. This is an extension of {@link
 * ConfigurationItem} to accommodate dialect in the configuration requests.
 */
@EqualsAndHashCode(callSuper = true)
@Getter
@Setter
public class CobolConfigItem extends ConfigurationItem {
  private String dialect;
}
