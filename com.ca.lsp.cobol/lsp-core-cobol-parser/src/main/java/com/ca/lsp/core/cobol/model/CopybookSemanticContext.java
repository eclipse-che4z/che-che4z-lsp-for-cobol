package com.ca.lsp.core.cobol.model;

import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.Value;

@Value
public class CopybookSemanticContext {
  private String name;
  private SemanticContext context;
}
