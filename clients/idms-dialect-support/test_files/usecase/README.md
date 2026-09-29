# Java IDMS usecase coverage

Run `node scripts/generate-java-usecase-fixtures.cjs` from
`clients/idms-dialect-support` to regenerate the COBOL fixtures and
`src/test/suite/java_usecases.test.ts`. The generated TypeScript file contains
one explicit, non-parameterized test per covered Java variant, grouped in a
suite for its Java class, with direct definition-navigation or diagnostic
assertions. Each fixture links to its original Java usecase.

All 335 Java `@ParameterizedTest` variants are accounted for:

- 260 definition-navigation tests and 4 diagnostic tests;
- 7 variants covered by dedicated integration fixtures;
- 50 literal/option-only variants with no distinct editor result to assert;
- 12 diagnostics deferred to the IDMS-specific diagnostics story;
- 2 variants whose only marked reference is not yet navigable.

Deferred and unsupported variants appear as skipped tests with an explanatory
TODO. Variants covered elsewhere or without an applicable editor assertion are
listed in comments next to their Java class. Another 35 marked references in
otherwise covered tests have TODOs: 31 `ON` path-status names and 4 `INDEXED
BY` index names.

The `NOT-EXISTING` sentinel confirms that analysis completed; it is never
the only assertion of a navigation test. The `ABEND CODE` and lowercase
`ACCEPT ... FROM ... PROCEDURE` cases assert navigation without a sentinel.
