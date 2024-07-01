module.exports = {
  roots: ["<rootDir>"],
  transform: {
    "^.+\\.tsx?$": "ts-jest",
  },
  modulePathIgnorePatterns: [
    "<rootDir>/out",
    "<rootDir>/dist",
    "<rootDir>/src/test",
    "<rootDir>/src/web",
    "<rootDir>/.vscode-test",
    "<rootDir>/.vscode-test-web",
  ],
  collectCoverage: true,
  collectCoverageFrom: [
    "src/**/*.{js,jsx,ts}",
    "resources/**/*.{js,jsx,ts}",
    "!**/node_modules/**",
    "!**/coverage/**",
    "!src/test/suite/**",
    "!src/__tests__/*.ts",
    "!src/__mocks__/*.ts",
    "!src/*.ts",
  ],
  testRunner: "jasmine2",
  testResultsProcessor: "jest-sonar-reporter",
  coverageThreshold: {
    global: {
      branches: 70,
      functions: 70,
      lines: 70,
      // "statements": -10
    },
  },
};
