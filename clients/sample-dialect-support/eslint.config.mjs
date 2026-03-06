import globals from "globals";
import pluginJs from "@eslint/js";
import tseslint from "typescript-eslint";

export default [
  { files: ["**/*.{js,mjs,cjs,ts}"] },
  {
    languageOptions: {
      ecmaVersion: 8,
      globals: { ...globals.node, ...globals.jest },
      parserOptions: {
        tsconfigRootDir: import.meta.dirname,
        project: ["./tsconfig.eslint.json"],
      },
    },
  },
  pluginJs.configs.recommended,
  ...tseslint.configs.recommended,
  ...tseslint.configs.recommendedTypeChecked,
  {
    rules: {
      "prefer-const": [
        "error",
        {
          destructuring: "all",
        },
      ],
      "@typescript-eslint/no-unused-vars": [
        "error",
        {
          argsIgnorePattern: "^_",
          caughtErrorsIgnorePattern: "^_",
        },
      ],
      "@typescript-eslint/no-require-imports": [
        "error",
        { allowAsImport: true },
      ],
    },
  },
  {
    files: ["**/*.spec.ts"],
    rules: {
      "@typescript-eslint/unbound-method": "off",
    },
  },
];
