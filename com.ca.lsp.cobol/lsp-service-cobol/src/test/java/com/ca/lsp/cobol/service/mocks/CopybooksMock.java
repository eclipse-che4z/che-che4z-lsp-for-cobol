package com.ca.lsp.cobol.service.mocks;

import com.ca.lsp.cobol.positive.CobolText;

import java.util.List;

public interface CopybooksMock {

  /** @return all the Cobol files for copybooks */
  List<CobolText> getCopybooks();
}
