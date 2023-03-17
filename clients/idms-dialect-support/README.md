<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://communityinviter.com/apps/che4z/code4z)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol)

</div>

# IDMS Dialect Support

IDMS Dialect Support is an add-on for the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) extension which enables language server protocol features for the IDMS dialect of COBOL, and support for IDMS copybooks.

## Prerequisites

- COBOL Language Support extension
- Java version 8 or higher with the PATH variable correctly configured. For more information, see the [Java documentation](https://www.java.com/en/download/help/path.html).

## LSP Features

IDMS Dialect Support enables the following LSP features:
- Autocomplete for IDMS DML keywords
- Syntax and semantic check for IDMS DML keywords and variables
- Syntax highlighting and coloring for IDMS DML keywords and variables

## Copybook Support

IDMS Dialect Support enables copybook support features of the COBOL Language Support extension for copybooks named in `COPY IDMS` statements. 

To enable copybook support, follow the instructions in the [COBOL Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.cobol-language-support) documentation. 

Specify paths to your IDMS copybooks in the IDMS Dialect Support extension settings as follows:
* Specify mainframe data sets under **Idms: Paths-dsn**
* Specify USS paths under **Idms: Paths-uss**
* Specify local paths under **Idms: Paths-local**

### Using Processor Groups

To use processor groups with IDMS copybooks, add the `preprocessor` array to individual groups within your `proc_grps.json` file. 

#### Example
```
{
    "pgroups": [
        {
            "name": "GROUP1",
            "libs": [
                "LIB1", "LIB2"
            ],
             "preprocessor": [
                {
                    "name": "IDMS"
                },
            ],
        },
    ]
}
```

In the above example, the IDMS preprocessor is enabled on the processor group GROUP1. This enables the use of IDMS copybooks with the programs linked to it in `pgm_conf.json`.
