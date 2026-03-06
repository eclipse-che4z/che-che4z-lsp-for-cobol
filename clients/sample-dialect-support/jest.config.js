const { createDefaultPreset } = require("ts-jest");

const tsJestTransformCfg = createDefaultPreset().transform;

/** @type {import("jest").Config} **/
module.exports = {
  roots: ["<rootDir>"],
  preset: "ts-jest",
  testEnvironment: "node",
  transform: {
    ...tsJestTransformCfg,
  },
  globals: {
    "ts-jest": {
      tsconfig: "tsconfig.jest.json",
    },
  },
  moduleNameMapper: {
    "^@code4z/cobol-dialect-api$":
      "<rootDir>/../cobol-dialect-api/src/index.ts",
  },
  modulePathIgnorePatterns: ["<rootDir>/out", "<rootDir>/dist"],
};
