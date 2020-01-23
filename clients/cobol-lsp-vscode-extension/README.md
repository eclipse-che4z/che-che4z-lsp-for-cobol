<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/enQtNzk0MzA4NDMzOTIwLWIzMjEwMjJlOGMxNmMyNzQ1NWZlMzkxNmQ3M2VkYWNjMmE0MGQ0MjIyZmY3MTdhZThkZDg3NGNhY2FmZTEwNzQ)
<a href="https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol">
<img src="https://sonarcloud.io/images/project_badges/sonarcloud-black.svg" width="94" height="20" href="" />
</a>

</div>

# COBOL Language Support

COBOL Language Support standardizes the communication between language tooling for COBOL and your code editor. Files with the extensions .COB and .CBL are recognized as COBOL files.

> How can we improve COBOL Language Support? [Let us know on our Git repository](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)

This extension is a part of the [Che4z](https://github.com/eclipse/che-che4z) open-source project. Feel free to contribute right here.

COBOL Language Support is also part of [Code4z](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.code4z-extension-pack), an all-round package that offers a modern experience for mainframe application developers, including [HLASM Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.hlasm-language-support), [Explorer for Endevor](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.explorer-for-endevor), [Zowe Explorer](https://marketplace.visualstudio.com/items?itemName=Zowe.vscode-extension-for-zowe) and [Debugger for Mainframe](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.debugger-for-mainframe) extensions.

## Prerequisites

- Java version 8 or higher
- To enable syntax coloring, a third-party COBOL extension is required. The Che4z basic stack and Code4z pack both contain Bitlang, which fulfils this requirement.
- To use the COBOL Language Support extension while working with copybooks, place the copybook files inside a **"COPYBOOKS"** folder within the current workspace.

## Features
COBOL Language Support defines the protocol that is used between an editor or IDE, and a language server that provides the following COBOL syntax awareness features:

### Autocomplete
Autocomplete speeds up the coding process by intuitively suggesting the most likely variables or paragraphs to follow existing code. The extension provides live suggestions while you type for:

* COBOL keywords
* COBOL variables
* COBOL paragraphs
* Code Snippet
* Copybook variables
* Copybook paragraphs

![Autocomplete](https://github.com/eclipse/che-che4z-lsp-for-cobol/raw/master/docs/images/CLSAutocorrect.gif)

### Syntax and Semantic Check for Code
This feature checks for mistakes and errors in COBOL code. The syntax check feature reviews the whole content of the code and suggests fixes, through syntax and semantic analysis which returns diagnostics on the entire context of the code, not just keywords.

![Syntax check](https://github.com/eclipse/che-che4z-lsp-for-cobol/raw/master/docs/images/CLSErrorHighlighting.gif)

### Syntax Highlighting
The extension enables syntax highlighting for COBOL code.
	
### Syntax Coloring
Contrasting colors are used in displayed code for ease of identifying and distinguishing keywords, variables, and paragraphs.

A third-party plugin is required to enable syntax coloring. The Che4z basic stack and Code4z pack both contain Bitlang, which fulfils this requirement.
	
### Copybook Support
To use the COBOL Language Support extension while working with copybooks, place the copybook files inside a **"COPYBOOKS"** folder within the current workspace. The extension includes the following copybook support features:

* Semantic analysis for keywords, variables, and paragraphs across copybooks, to ensure and maintain compatibility of copybooks called in code.
* Inbuilt protection against recursive and missing copybooks. If the copybook is missing or contains looping code, an error displays, preventing issues only being discovered when the code is executed.  
* Variables and paragraphs are defined across copybooks. This ensures consistency of code, and prevents issues in error diagnostics caused by incorrect variables or paragraphs in code. 
* Functionality to skip variable levels when called, reducing call time.
* Find All References and Go To Definition functionalities.
    - **Find All References** identifies all occurrences of variables and paragraphs from copybooks in the code.
    - **Go To Definition** enables you to right-click on any variable or paragraph to reveal a definition of the element.
