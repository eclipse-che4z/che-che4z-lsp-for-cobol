module.exports = {
    "roots": [
      "<rootDir>"
    ],
    "transform": {
      "^.+\\.tsx?$": "ts-jest"
    },
    "modulePathIgnorePatterns": [
      "<rootDir>/out",
      "<rootDir>/dist",
    ],
    "collectCoverage": true,
    "collectCoverageFrom": [
        "src/**/*.{js,jsx,ts}",
        "resources/**/*.{js,jsx,ts}",
        "!**/node_modules/**",
        "!**/coverage/**"
     ],
    //"testResultsProcessor": "jest-sonar-reporter",
     "coverageThreshold": {
      "global": {
        "branches": 70,
        "functions": 70,
        "lines": 70,
        // "statements": -10
      }
    }
  }
