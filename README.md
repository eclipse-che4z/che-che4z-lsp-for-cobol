# LSP for COBOL Extension

The LSP for COBOL extension standardizes the communication between language tooling and your code editor. LSP for COBOL defines the protocol that is used between an editor or IDE and a language server that provides the following COBOL syntax awareness features:

- **Autocomplete**
	> Provides suggestions for COBOL keywords while you type.
- **Syntax check for keywords**
	> Checks for mistakes and errors in COBOL code.
- **Syntax highlighting** (with third-party plugins)
	> Enables syntax highlighting for COBOL code as long as you have an appropriate third-party syntax highlighting extension installed.

The LSP for COBOL extension for Visual Studio Code (VSC) integrates several COBOL language features into tools used in Visual Studio Code (VSC). LSP for COBOL recognizes files with the extensions .COB, .CBL and .CPY as COBOL files.

## Prerequisites

- NodeJS and npm (You can install them from [here](https://www.npmjs.com/get-npm) if required.)
- Java
- (Optional) COBOL 3rd party plugin (required for syntax highlighting)