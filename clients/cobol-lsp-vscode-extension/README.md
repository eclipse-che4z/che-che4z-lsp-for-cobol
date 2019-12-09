<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/enQtNzk0MzA4NDMzOTIwLWIzMjEwMjJlOGMxNmMyNzQ1NWZlMzkxNmQ3M2VkYWNjMmE0MGQ0MjIyZmY3MTdhZThkZDg3NGNhY2FmZTEwNzQ)
<a href="https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol">
<img src="https://github.com/eclipse/che-che4z-lsp-for-cobol/raw/master/clients/cobol-lsp-vscode-extension/sonarcloud-black.png" width="94" height="20" href="" />
</a>

</div>


# COBOL Language Support

COBOL Language Support standardizes the communication between language tooling for COBOL and your code editor. Files with the extensions .COB, .CBL and .CPY are recognized as COBOL files.

## Prerequisites

- Java 8 or newer
- (Optional) COBOL 3rd party plugin (required for Syntax colouring)
- Copybook path must be defined as **"COPYBOOKS"** folder in current workspace (required for copybook support)

COBOL Language Support defines the protocol that is used between an editor or IDE, and a language server that provides the following COBOL syntax awareness features:

- **Autocomplete**

	- Provides live suggestions while you type for:
		- COBOL keywords
		- COBOL variables
		- COBOL paragraphs
		- Code Snippet

        ![Autocomplete](https://github.com/eclipse/che-che4z-lsp-for-cobol/raw/master/Autocompletev2.gif)

- **Syntax and Semantic Check for Code**

	- Checks for mistakes and errors in COBOL code. Syntax check reviews and provides suggested fixes for the whole content of the code, through syntax and semantic analysis which returns diagnostics on the entire context of the code, not just keywords.

        ![Syntax check](https://github.com/eclipse/che-che4z-lsp-for-cobol/raw/master/SyntaxCheckv2.gif)

- **Syntax Highlighting**

	- Enables syntax highlighting for COBOL code.

- **Syntax Colouring** (with third-party plugins)

	- Contrasting colors used in displayed code for ease of identifying and distinguishing keywords, variables, and paragraphs.

- **Copybook Support**

	- Semantic analysis for keywords, variables, and paragraphs, across copybooks supported.
		- Ensures and maintains compatibility of copybooks called in code.
	- Inbuilt protection against recursive + missing copybooks.
		- Protects against code errors where copybook may contain looping code which could crash processes.
		- Error message shows where copybook is missing, preventing issue only being discovered when code is executed.
	- Variables and paragraphs defined across copybooks.
		- Ensures consistency of code, assisting with error diagnostics as issues will not be caused by incorrect variables or paragraphs in code.
	- Autocomplete updated to include copybook variables and paragraphs.
		- Speeds up coding process by intuitively suggesting most likely variables or paragraphs to follow existing code.
	- Functionality to skip variable levels when called, reducing call time.
	- Inbuilt search function to identify all references filled with paragraphs and variables from copybooks:
		- Find all references:
			- Easily identifies all occurences of variables and paragraphs in the code
		- Go To Definition:
			- Right click on any variable or paragraph to reveal a definition of the element

