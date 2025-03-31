/** @type {import('ts-jest').JestConfigWithTsJest} **/
module.exports = {
  testEnvironment: "node",
  moduleFileExtensions: ["ts", "js"],
  transform: {
    "^.+.ts?$": ["ts-jest", {}],
  },
  coverageDirectory: "./coverage",
  collectCoverageFrom: [
    "src/**/*.{ts,js}",
    "!**/node_modules/**",
    "!**/coverage/**",
    "!src/__mocks__/**",
    "!src/__tests__/**",
    "!src/lib/**",
  ],
  testPathIgnorePatterns: ["lib", "src/__mocks__"],
  modulePathIgnorePatterns: ["lib"],
};
