package org.eclipse.lsp.cobol.core.model.tree.logic;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.eclipse.lsp.cobol.core.model.SyntaxError;

import java.util.List;

@Data
@AllArgsConstructor
public class ProcessingContext {
    final List<SyntaxError> errors;
}
