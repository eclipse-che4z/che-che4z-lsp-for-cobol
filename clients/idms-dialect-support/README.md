<div id="header" align="center">

[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/zt-22b0064vn-nBh~Fs9Fl47Prp5ItWOLWw)

</div>

# COBOL Language Support for IDMS

COBOL Language Support for IDMS is an add-on for the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) extension. This add-on enables language server protocol features for the [IDMS](https://techdocs.broadcom.com/idms) dialect of COBOL, and support for IDMS copybooks.

## Address Software Requirements

- COBOL Language Support extension version 2.1.0 or higher.
- Java version 8 or higher with the PATH variable correctly configured. For more information, see the [Java documentation](https://www.java.com/en/download/help/path.html).

## Getting Started

To enable COBOL Language Support for IDMS, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. Use the string "IDMS" to enable the IDMS dialect in your extension settings or in a processor group.

## LSP Features

COBOL Language Support for IDMS enables the following LSP features:
- Autocomplete for IDMS DML keywords
- Syntax and semantic check for IDMS DML keywords and variables
- Syntax highlighting and coloring for IDMS DML keywords and variables
- IDMS code snippets

## Copybook Support

COBOL Language Support for IDMS enables copybook support features of the COBOL Language Support extension for copybooks named in `COPY IDMS` statements. 

To enable copybook support, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. 

Specify paths to your IDMS copybooks in the COBOL Language Support for IDMS extension settings as follows:
* Specify a path to a TAR file in a PDS under **Idms: Paths-dsn** in the format **tar:DSN(MEMBER)**.
* Specify USS paths to libraries and TAR files under **Idms: Paths-uss**. Use the prefix **tar:** to specify a TAR file.
* Specify local paths to libraries and TAR files under **Idms: Paths-local**. Use the prefix **tar:** to specify a TAR file.
