const { createDefaultPreset } = require("ts-jest");

const tsJestTransformCfg = createDefaultPreset().transform;

/** @type {import("jest").Config} **/
module.exports = {
  roots: ["<rootDir>"],
  testEnvironment: "node",
  transform: {
    ...tsJestTransformCfg,
  },
  moduleNameMapper: {
    "^@code4z/cobol-dialect-api$":
      "<rootDir>/../cobol-dialect-api/src/index.ts",
  },
  modulePathIgnorePatterns: ["<rootDir>/out", "<rootDir>/dist"],
};
