package com.ca.lsp.core.cobol.model;

import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.Value;

@Value
public class PreprocessedInput {
  private String input;
  private SemanticContext semanticContext;
}
