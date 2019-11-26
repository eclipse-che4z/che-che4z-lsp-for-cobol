<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/enQtNzk0MzA4NDMzOTIwLWIzMjEwMjJlOGMxNmMyNzQ1NWZlMzkxNmQ3M2VkYWNjMmE0MGQ0MjIyZmY3MTdhZThkZDg3NGNhY2FmZTEwNzQ)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol)

</div>


# COBOL Language Support

COBOL Language Support standardizes the communication between language tooling and your code editor.

## Prerequisites

- Java
- (Optional) COBOL 3rd party plugin (required for Syntax colouring)
- Copybook path must be defined as **"COPYBOOKS"** folder in current workspace (required for copybook support)

COBOL Language Support defines the protocol that is used between an editor or IDE, and a language server that provides the following COBOL syntax awareness features:

- **Autocomplete**

	- Provides live suggestions while you type for:
		- COBOL keywords
		- COBOL variables
		- COBOL paragraphs
		- Code Snippet
		<img src="Autocomplete.gif" alt="alt text" width="500px" height="300px">

- **Syntax and Semantic Check for Code**

	- Checks for mistakes and errors in COBOL code. Syntax check reviews and provides suggested fixes for the whole content of the code, through syntax and semantic analysis which returns diagnostics on the entire context of the code, not just keywords
		
		<img src="SyntaxCheck.gif" alt="alt text" width="500px" height="300px">
		
- **Syntax highlighting**
	
	- Enables syntax highlighting for COBOL code.
	
- **Syntax Coloring** (with third-party plugins)

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
	- Functionality to skip copybook levels when called, reducing call time.
	- Inbuilt search function to identify all references filled with paragraphs and variables from copybooks:
		- Find all references:
			- Easily identifies all occurences of relevant copybook in code
		- Go To Definition:
			- Right click on any data element to reveal a definition of the element in a small embedded window.	
	
The COBOL Language Support extension for Visual Studio Code (VSC) integrates several COBOL language features into tools used in VSC. Files with the extensions .COB, .CBL and .CPY are recognized as COBOL files.
