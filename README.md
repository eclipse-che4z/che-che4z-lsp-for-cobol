<div id="header" align="center">

[![Build Status](https://ci.eclipse.org/che4z/buildStatus/icon?job=LSP+for+COBOL%2Fdevelopment)](https://ci.eclipse.org/che4z/job/LSP%20for%20COBOL/job/development/)
[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/enQtNzk0MzA4NDMzOTIwLWIzMjEwMjJlOGMxNmMyNzQ1NWZlMzkxNmQ3M2VkYWNjMmE0MGQ0MjIyZmY3MTdhZThkZDg3NGNhY2FmZTEwNzQ)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse_che-che4z-lsp-for-cobol)

</div>

# COBOL Language Support

COBOL Language Support enhances the COBOL programming experience on your IDE. The extension leverages the language server protocol to provide autocomplete, syntax highlighting and coloring, and diagnostic features for COBOL code and copybooks. The COBOL Language Support extension can also connect to a mainframe using a Zowe CLI z/OSMF profile to automatically retrieve copybooks used in your programs and store them in your workspace. 

COBOL Language Support recognizes files with the extensions `.cob` and `.cbl` as COBOL files.

> How can we improve COBOL Language Support? [Let us know on our Git repository](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)

This extension is a part of the [Che4z](https://github.com/eclipse/che-che4z) open-source project. Feel free to contribute right here.

COBOL Language Support is also part of [Code4z](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.code4z-extension-pack), an all-round package that offers a modern experience for mainframe application developers, including [HLASM Language Support](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.hlasm-language-support), [Explorer for Endevor](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.explorer-for-endevor), [Zowe Explorer](https://marketplace.visualstudio.com/items?itemName=Zowe.vscode-extension-for-zowe) and [Debugger for Mainframe](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.debugger-for-mainframe) extensions.

## Prerequisites

- Java version 11 or higher with the PATH variable correctly configured. For more information, see the [Java documentation](https://www.java.com/en/download/help/path.xml).
- To enable automatic copybook retrieval, the following are required:
    - Configured TSO/E address space services, z/OS data set and file REST interface, and z/OS jobs REST interface. For more information, see [z/OS Requirements](https://docs.zowe.org/stable/user-guide/systemrequirements-zosmf.html#z-os-requirements).
    - [Zowe CLI z/OSMF profile](https://docs.zowe.org/stable/user-guide/cli-configuringcli.html) with credentials.
    
## Compatibility

The COBOL Language Support extension is supported on Visual Studio Code and Eclipse Che.

This extension is not compatible with other extensions that provide COBOL support. We recommend that you disable all other COBOL-related extensions to ensure that COBOL Language Support functions correctly.

The COBOL Language Support extension only supports IBM Enterprise COBOL. Other versions of COBOL are not supported.

## Features
COBOL Language Support provides the following COBOL syntax awareness features:

### Autocomplete
Autocomplete speeds up the coding process by intuitively suggesting the most likely variables or paragraphs to follow existing code. The extension provides live suggestions while you type for:

- COBOL keywords
- COBOL variables
- COBOL paragraphs
- CICS keywords
- Code Snippets
- Copybook variable and paragraph names
- Names of copybooks that are used in the program
- Names of locally-stored subroutines that are used in the program

The autocomplete feature is only available in the main COBOL file, not in copybooks.

![Autocomplete](/docs/images/CLSAutocorrect.gif)
		
### Syntax and Semantic Check for Code
This feature checks for mistakes and errors in COBOL code. The syntax check feature reviews the whole content of the code and suggests fixes, through syntax and semantic analysis which returns diagnostics on the entire context of the code, not just keywords.

This feature is also enabled for CICS keywords and variables.

![Syntax check](/docs/images/CLSErrorHighlighting.gif)
			
### Syntax Highlighting
The extension enables syntax highlighting for COBOL code.
	
### Syntax Coloring
Contrasting colors are used in displayed code for ease of identifying and distinguishing keywords, variables, and paragraphs.

### Outline View and Breadcrumb View
The extension enables outline view and breadcrumb view, which show the structure of elements within the program and allow easy navigation between them.

### Code Snippets
Before you write your COBOL code from scratch, search the snippet library for useful templates.

**Follow these steps:**

1. Press `F1` to open the command palette.
2. Type **Insert Snippet** and press enter.
3. Select the snippet that you want to insert.

![Code snippets](/docs/images/Snippet.gif)

You can also insert a code snippet by typing the name of the snippet in your code and clicking on the autocomplete text.

The COBOL Language Support extension also supports user snippets. Add your custom snippets to the `COBOL.json` file in your user snippets folder.

## Subroutine Support

The COBOL Language Support extension supports subroutines specified in CALL statements if the called program is stored in a local folder in your workspace. The Go To Definition and Find All References functionalities, as well as autocomplete, are extended to work for names of subroutines. 

To enable subroutine support, specify the paths of folders containing subroutine files in your workspace extension settings.

**Follow these steps:**

1. Open the **Extensions** tab, click the cog icon next to **COBOL Language Support** and select **Extension Settings** to open the COBOL Language Support extension settings. 
2. Switch from **User** to **Workspace**.
3. Under **Subroutine-manager: Paths-local**, specify the paths of the folders containing subroutines. Ensure that you specify relative paths to the workspace root. Absolute paths are not supported.  
   - **Tip:** To obtain the relative path of a folder in your workspace, right-click it in the folder tree and select **Copy Relative Path**.
   - The folders are searched in the order they are listed. If two folders contain a copybook with the same file name, the one from the folder higher on the list is used.
4. Open a program or project.  
   Subroutine support features are now enabled.

## Copybook Support

The COBOL Language Support extension supports copybooks used in your source code that are stored in a local folder in your workspace. If your copybooks are stored in mainframe data sets, you can use a Zowe CLI z/OSMF profile to automatically download them from the mainframe to your workspace. 

You can use copybooks stored in local folders, mainframe data sets or both. To enable copybook support, you specify the folders and data sets that contain copybooks used in your project in the workspace settings. When a copybook is used in the program, the folders and data sets are searched in the order they are listed for files and members that match the copybook's name. If a copybook with the same file name is located in both a local folder and a mainframe data set, the one in the local folder is used.

Copybook support features are disabled for files stored in the folder **.c4z/.extsrcs** in your workspace. If you also use the [Debugger for Mainframe](https://github.com/BroadcomMFD/debugger-for-mainframe) extension to debug your COBOL programs, you might have some files stored in this folder.

### Storing Copybooks Locally

You can store your copybooks locally in folders in your workspace and specify those folder paths in your workspace extension settings. Ensure that the file names of your locally stored copybooks are in upper case, for example `BOOK1.CPY` and not `book1.CPY`.

**Follow these steps:**

1. Open the **Extensions** tab, click the cog icon next to **COBOL Language Support** and select **Extension Settings** to open the COBOL Language Support extension settings. 
2. Switch from **User** to **Workspace**.
3. Under **Cpy-manager: Paths-local**, specify the paths of the folders containing copybooks. Ensure that you specify relative paths to the workspace root. Absolute paths are not supported.  
   - **Tip:** To obtain the relative path of a folder in your workspace, right-click it in the folder tree and select **Copy Relative Path**.
   - The folders are searched in the order they are listed. If two folders contain a copybook with the same file name, the one from the folder higher on the list is used.
4. Open a program or project.  
   Copybook support features are now enabled.

### Retrieving Copybooks from the Mainframe

You can also set up automatic copybook retrieval from the mainframe to download copybooks from mainframe data sets to your workspace. 

**Follow these steps:**

1. Ensure that you have a [Zowe CLI z/OSMF profile](https://docs.zowe.org/stable/user-guide/cli-configuringcli.html) configured, with credentials defined.
2. Open the **Extensions** tab, click the cog icon next to **COBOL Language Support** and select **Extension Settings** to open the COBOL Language Support extension settings. 
3. Switch from **User** to **Workspace**.
4. Under **Cpy-manager: Paths-dsn**, list the names of any number of partitioned data sets on the mainframe to search for copybooks. The data sets are searched in the order they are listed, so if two data sets contain a copybook with the same member name, the one from the data set higher on the list is downloaded.
5. Under **Profile**, enter the name of your Zowe CLI z/OSMF profile.
6. Open a program or project.  
   All copybooks used in the program or project which are not stored locally are downloaded from the mainframe data sets that you specified in step 3.  
   Copybook support features are now enabled.

Copybooks that you retrieve from mainframe data sets are stored in the **.c4z/.copybooks** directory within the workspace, which is created automatically.

Because copybooks that are downloaded to the .copybooks folder might change on the mainframe, we recommend that you refresh your copybooks from time to time. To refresh your copybooks, manually delete the .copybooks folder in your workspace. The copybooks are then re-downloaded from the mainframe the next time you open a file that references each copybook.

Copybooks downloaded from the mainframe using an older version of COBOL Language Support might also be found in a **.copybooks** directory in the workspace root. We recommend that you delete this folder so that all files are downloaded again to the **.c4z/.copybooks** folder.

### Copybook Support Features

The extension includes the following copybook support features:

#### Syntax and Semantic Check

Syntax and semantic analysis are enabled for keywords, variables, and paragraphs across all copybooks used in the COBOL file, to ensure and maintain compatibility of copybooks called in code.

The semantic analysis feature takes into account `COPY REPLACING` statements which alter the content of copybooks when checking for errors.

![Semantic check before and after a REPLACING statement](/docs/images/CPYReplacing.gif)

#### Syntax Coloring

Syntax coloring is automatically enabled for copybook files with the extension `.cpy`, as long as they are used in the main COBOL file. You can also select the **COBOL Copybook** language mode to enable syntax coloring for copybook files.

#### Go To Definition and Find All References

The Find All References and Go To Definition functionalities are extended to work for occurrences of copybook names, variables and paragraphs in the main COBOL file.

* **Find All References** identifies all occurrences of variables and paragraphs from copybooks in the code.
* **Go To Definition** enables you to right-click on any variable or paragraph to reveal a definition of the element. If the definition is in a copybook, or the name of a copybook, the copybook opens.

![Go To Definition in a copybook](/docs/images/CPYGoToDefinition.gif)

#### Other

* Inbuilt protection against recursive and missing copybooks. If the copybook is missing or contains looping code, an error displays, preventing issues only being discovered when the code is executed.  
* Variables and paragraphs are defined across copybooks. This ensures consistency of code, and prevents issues in error diagnostics caused by incorrect variables or paragraphs in code. 
* Functionality to skip variable levels when called, reducing call time.

## Troubleshooting

To generate a troubleshooting log for the LSP server, specify a value for the parameter **broadcom-cobol-lsp.logging.level.root** in the extension settings. Specify one of the following values:

* ERROR
* WARN
* INFO
* DEBUG
* TRACE
* ALL

These values are ordered from returning the least information ("ERROR"; errors only) to the most information ("ALL"; all details).

Troubleshooting logs are stored in the subfolder **\LSPCobol\logs** within your user home directory.

## Privacy Notice
The extensions for Visual Studio Code developed by Broadcom Inc., including its corporate affiliates and subsidiaries, ("Broadcom") are provided free of charge, but in order to better understand and meet its users’ needs, Broadcom may collect, use, analyze and retain anonymous users’ metadata and interaction data, (collectively, “Usage Data”) and aggregate such Usage Data with similar Usage Data of other Broadcom customers. Please find more detailed information in [License and Service Terms & Repository](https://www.broadcom.com/company/legal/licensing).

This data collection uses built-in Microsoft VS Code Telemetry, which can be disabled, at your sole discretion, if you do not want to send Usage Data.

The current release of COBOL Language Support collects anonymous data for the following events:
* Activation of this VS Code extension
* Problem interaction
* Quick Fix
* Invalid ZOWE credentials
* ZOWE connection issues
* Java version issues

Each such event is logged with the following information:
* Event time
* Operating system and version
* Country or region
* Anonymous user and session ID
* Version numbers of Microsoft VS Code and COBOL Language Support
