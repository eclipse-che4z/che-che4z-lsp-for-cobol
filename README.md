<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/enQtNzk0MzA4NDMzOTIwLWIzMjEwMjJlOGMxNmMyNzQ1NWZlMzkxNmQ3M2VkYWNjMmE0MGQ0MjIyZmY3MTdhZThkZDg3NGNhY2FmZTEwNzQ)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol)

</div>


# COBOL Language Support

COBOL Language Support standardizes the communication between language tooling and your code editor. COBOL Language Support defines the protocol that is used between an editor or IDE and a language server that provides the following COBOL syntax awareness features:

- **Autocomplete**

	Provides suggestions for COBOL keywords while you type.
	<img src="Autocomplete.gif" alt="alt text" width="500px" height="300px">

- **Syntax check for keywords**

	Checks for mistakes and errors in COBOL code.
	<img src="SyntaxCheck.gif" alt="alt text" width="500px" height="300px">
- **Syntax highlighting** (with third-party plugins)
	> Enables syntax highlighting for COBOL code as long as you have an appropriate third-party syntax highlighting extension installed.

The COBOL Language Support extension for Visual Studio Code (VSC) integrates several COBOL language features into tools used in VSC. Files with the extensions .COB, .CBL and .CPY are recognized as COBOL files.

## Prerequisites

- Java
- (Optional) COBOL 3rd party plugin (required for syntax highlighting)
