package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.broadcom.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Location;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

/** Test to check SectionLocations */
class SectionLocationsTest {

  private CobolDocumentModel model;

  private SectionLocations provider;
  private Map<String, List<Location>> sectionDefinitions;
  private Map<String, List<Location>> sectionUsages;

  @BeforeEach
  void init() {
    sectionDefinitions = new HashMap<>();
    sectionUsages = new HashMap<>();

    AnalysisResult analysisResult = AnalysisResult.builder()
            .sectionDefinitions(sectionDefinitions)
            .sectionUsages(sectionUsages)
            .build();

    model = new CobolDocumentModel("", analysisResult);
    provider = new SectionLocations();
  }

  @Test
  void testReferences() {
    sectionUsages.put("usages", List.of(new Location()));
    assertEquals(sectionUsages, provider.references(model));
  }

  @Test
  void testDefinitions() {
    sectionDefinitions.put("definition", List.of(new Location()));
    assertEquals(sectionDefinitions, provider.definitions(model));
  }

  @Test
  void testContainsTokenPositive() {
    sectionDefinitions.put("token", List.of(new Location()));
    assertTrue(provider.containsToken(model, "token"));
  }

  @Test
  void testContainsTokenNegative() {
    assertFalse(provider.containsToken(model, "token"));
  }

}
