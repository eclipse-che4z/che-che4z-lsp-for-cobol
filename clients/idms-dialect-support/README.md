<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/zt-22b0064vn-nBh~Fs9Fl47Prp5ItWOLWw)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse-che4z_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse-che4z_che-che4z-lsp-for-cobol)

</div>

# COBOL Language Support for IDMS

COBOL Language Support for IDMS is an add-on for the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) extension. This add-on enables language server protocol features for the [IDMS](https://techdocs.broadcom.com/idms) dialect of COBOL, and support for IDMS copybooks.

## Prerequisites

- COBOL Language Support extension
- Java version 8 or higher with the PATH variable correctly configured. For more information, see the [Java documentation](https://www.java.com/en/download/help/path.html).

## Getting Started

To enable COBOL Language Support for IDMS, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. Use the string "IDMS" to enable the IDMS dialect in your workspace extension settings or in a processor group.

## LSP Features

COBOL Language Support for IDMS enables the following LSP features:
- Autocomplete for IDMS DML keywords
- Syntax and semantic check for IDMS DML keywords and variables
- Syntax highlighting and coloring for IDMS DML keywords and variables
- IDMS code snippets

## Copybook Support

COBOL Language Support for IDMS enables copybook support features of the COBOL Language Support extension for copybooks named in `COPY IDMS` statements. 

To enable copybook support, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. 

Specify paths to your IDMS copybooks in the COBOL Dialect Support for IDMS extension settings as follows:
* Specify mainframe data sets under **Idms: Paths-dsn**
* Specify USS paths under **Idms: Paths-uss**
* Specify local paths under **Idms: Paths-local**
