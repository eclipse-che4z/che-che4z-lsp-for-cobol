module.exports = {
  roots: ["<rootDir>"],
  transform: {
    "^.+\\.tsx?$": [
      "ts-jest",
      {
        tsconfig: "<rootDir>/src/test/unit/tsconfig.json",
      },
    ],
  },
  modulePathIgnorePatterns: [
    "<rootDir>/out",
    "<rootDir>/dist",
    "<rootDir>/src/test/suite",
    "<rootDir>/.vscode-test",
  ],
  collectCoverage: true,
  collectCoverageFrom: [
    "src/**/*.{js,jsx,ts}",
    "resources/**/*.{js,jsx,ts}",
    "!**/node_modules/**",
    "!**/coverage/**",
    "!src/test/**",
    "!src/*.ts",
    "!src/generated/**",
    "!src/antlr/**",
  ],
  testRunner: "jasmine2",
  testResultsProcessor: "jest-sonar-reporter",
  coverageThreshold: {
    global: {
      branches: 70,
      functions: 70,
      lines: 70,
    },
  },
};
