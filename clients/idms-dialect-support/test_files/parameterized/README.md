# Java IDMS parameterized usecase audit

`manifest.json` enumerates all 335 `@ParameterizedTest` variants in the Java IDMS
usecase suite. Each entry links to its Java class and records its coverage state.
Regenerate the fixtures and manifest with
`node scripts/generate-java-usecase-fixtures.cjs` from the
`clients/idms-dialect-support` directory.

Current breakdown: 260 individual navigation tests, 4 individual diagnostic
tests, 7 variants covered by dedicated fixtures, 50 not applicable to editor
assertions, 12 diagnostics deferred to the separate story, and 2 known gaps.

| Status | Meaning |
| --- | --- |
| `integration` | An individual fixture has direct definition-navigation assertions in `parameterized_usecases.test.ts`. The expected diagnostic set is also checked, except for navigation-only cases. |
| `diagnostic` | An individual fixture asserts the exact range and text of a generic undefined-variable diagnostic. |
| `dedicated` | A named fixture in another integration suite checks the section/control behaviour directly. |
| `notApplicable` | A literal/option-only grammar permutation has no Java-marked reference or expected diagnostic, so it has no distinct editor result to assert. |
| `deferred` | A name-length or `SUBSCHEMA-NAMES LENGTH` diagnostic belongs to the separate IDMS-specific diagnostics story. |
| `knownGap` | The variant has no assertion yet because its only Java-marked reference is not navigable in the TypeScript port. |

`omittedUsages` identifies 35 individual Java-marked references for which
navigation is not asserted even though other references in the same variant
may be covered. These are `ON` path-status names and `INDEXED BY` index names. They
are recorded explicitly so that partial coverage is not mistaken for Java
parity. The two `knownGap` variants are
`TestIdmsSetStatement/SET_ABEND_ON` and
`TestIdmsSetStatement/SET_ABEND_ON_1`; both contain only an unmapped `ON`
path-status reference.

The sentinel `NOT-EXISTING` variable is used to wait for analysis; it is never
the sole assertion of an `integration` test. `ABEND CODE` and the lowercase
`ACCEPT ... FROM ... PROCEDURE` variant assert navigation directly without a
sentinel.
