# Java IDMS usecase coverage

Run `node scripts/generate-java-usecase-fixtures.cjs` from
`clients/idms-dialect-support` to regenerate the COBOL fixtures and
`src/test/suite/java_usecases.test.ts`. The generated TypeScript file contains
one explicit, non-parameterized test per covered Java variant, grouped in a
suite for its Java class, with direct definition-navigation or diagnostic
assertions. Each fixture links to its original Java usecase.

All 335 Java `@ParameterizedTest` variants are accounted for:

- 260 definition-navigation tests, 15 diagnostic tests and 1 valid-boundary test;
- 52 smoke tests that assert the exact diagnostic set; 2 of these retain TODOs
  for `ON` references without definition navigation;
- 7 variants covered by dedicated integration fixtures.

All name-length and `SUBSCHEMA-NAMES LENGTH` variants now have active,
source-aware diagnostic assertions. Variants covered elsewhere are listed in
comments next to their Java class.
Across navigation and smoke tests, 35 marked references still have TODOs: 31
`ON` path-status names and 4 `INDEXED BY` index names.

The `NOT-EXISTING` sentinel confirms that analysis completed; it is never
the only assertion of a navigation test. The `ABEND CODE` and lowercase
`ACCEPT ... FROM ... PROCEDURE` cases assert navigation without a sentinel.
