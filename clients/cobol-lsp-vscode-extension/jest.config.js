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
     ]
  }
