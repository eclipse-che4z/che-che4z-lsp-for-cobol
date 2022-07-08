/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree.statements;

import com.google.common.collect.ImmutableList;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;

import java.util.List;

/** The class represents a Obsolete Node in Cobol. It throws warning message. */
@ToString(callSuper = true)
@Getter
@EqualsAndHashCode
public abstract class ObsoleteNode extends Node {

  protected ObsoleteNode(Locality location) {
    super(location, NodeType.OBSOLETE);
    addProcessStep(this::throwObsoleteNodeWarning);
  }

  private List<SyntaxError> throwObsoleteNodeWarning() {
    return ImmutableList.of(
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .severity(ErrorSeverity.WARNING)
            .locality(getLocality())
            .messageTemplate(MessageTemplate.of("cobolParser.ObsoleteCode"))
            .build());
  }
}
