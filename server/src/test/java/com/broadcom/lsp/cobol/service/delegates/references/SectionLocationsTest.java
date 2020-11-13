package com.broadcom.lsp.cobol.service.delegates.references;

import org.junit.jupiter.api.BeforeEach;

/** Test to check SectionLocations */
class SectionLocationsTest extends AbstractReferenceTest {

  @BeforeEach
  void init() {
    this.provider = new SectionLocations();
  }
}
