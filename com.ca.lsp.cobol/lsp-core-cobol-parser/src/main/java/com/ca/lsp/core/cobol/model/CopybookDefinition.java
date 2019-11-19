package com.ca.lsp.core.cobol.model;

import com.broadcom.lsp.domain.cobol.model.Position;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Collection;

@Data
@AllArgsConstructor
public class CopybookDefinition {
  private String name;
  private String uri;
  private Collection<Position> usages;
}
