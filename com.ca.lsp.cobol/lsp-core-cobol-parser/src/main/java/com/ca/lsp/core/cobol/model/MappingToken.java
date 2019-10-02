package com.ca.lsp.core.cobol.model;

import lombok.Value;

@Value
public class MappingToken {
  String copybooksName;
  Position startPosition;
  Position stopPosition;
}
