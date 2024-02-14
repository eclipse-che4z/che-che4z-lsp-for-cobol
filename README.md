<div id="header" align="center">

[![Build Status](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/actions/workflows/build.yml/badge.svg)](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/actions/workflows/build.yml)
[![GitHub issues](https://img.shields.io/github/issues-raw/eclipse/che-che4z-lsp-for-cobol)](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)
[![slack](https://img.shields.io/badge/chat-on%20Slack-blue)](https://join.slack.com/t/che4z/shared_invite/zt-22b0064vn-nBh~Fs9Fl47Prp5ItWOLWw)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=eclipse-che4z_che-che4z-lsp-for-cobol&metric=alert_status)](https://sonarcloud.io/dashboard?id=eclipse-che4z_che-che4z-lsp-for-cobol)

</div>

# COBOL Language Support

COBOL Language Support enhances the COBOL programming experience on your IDE. The extension leverages the language server protocol to provide autocomplete, syntax highlighting and coloring, and diagnostic features for COBOL code and copybooks. The COBOL Language Support extension can also connect to a mainframe using the Zowe Explorer extension to automatically retrieve copybooks used in your programs and store them in your workspace. COBOL Language Support also supports COBOL programs which interact with Datacom, CICS, and DB2 SQL. An add-on extension which adds support for the IDMS dialect is available on the VS Code Marketplace.

COBOL Language Support recognizes files with the extensions `.cob`, `.cbl` and `.cobol` as COBOL files.

> How can we improve COBOL Language Support? [Let us know on our Git repository](https://github.com/eclipse/che-che4z-lsp-for-cobol/issues)

This extension is a part of the [Che4z](https://github.com/eclipse/che-che4z) open-source project. Feel free to contribute right here.

COBOL Language Support is also part of [Code4z](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.code4z-extension-pack), an all-round package that offers a modern experience for mainframe application developers, including extensions for language support, data editing, testing, and source code management. For an interactive overview of Code4z, see the [Code4z Developer Cockpit](https://mainframe.broadcom.com/code4z-developer-cockpit).

## Prerequisites

There are no client or server-side prerequisites for COBOL Language Support.

## Compatibility

The COBOL Language Support extension is supported on Visual Studio Code and Github Codespaces.

This extension is not compatible with other extensions that provide COBOL support except [COBOL Control Flow](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.ccf) and the dialect add-ons published by Broadcom. We recommend that you disable all other COBOL-related extensions to ensure that COBOL Language Support functions correctly.

The COBOL Language Support extension only supports IBM Enterprise COBOL. Other versions of COBOL are not supported.

## Integration with Zowe Explorer

Integrating COBOL Language Support with Zowe Explorer lets you:

- Load your data sets containing COBOL code directly from the data set tree.
- Enable automatic copybook retrieval from the mainframe.

To enable these features, install the [Zowe Explorer](https://marketplace.visualstudio.com/items?itemName=Zowe.vscode-extension-for-zowe) extension and configure a Zowe Explorer `zosmf` or `zftp` profile with credentials and a connection URL.

<a href="https://www.openmainframeproject.org/all-projects/zowe/conformance"><img alt="This extension is Zowe v2 conformant" src="https://artwork.openmainframeproject.org/other/zowe-conformant/zowev2/explorer/color/zowe-conformant-zowev2-explorer-color.png" width=20% height=20% /></a>

## Features
COBOL Language Support provides the following COBOL syntax awareness features:

### Autocomplete
Autocomplete speeds up the coding process by intuitively suggesting the most likely variables or paragraphs to follow existing code. The extension provides live suggestions while you type for:

- COBOL keywords, variables, paragraphs and sections
- CICS keywords
- DB2 and Datacom SQL keywords
- Code Snippets
- Copybook variable and paragraph names
- Names of copybooks that are used in the program
- Names of locally-stored subroutines that are used in the program

The autocomplete feature is only available in the main COBOL file, not in copybooks.

![Autocomplete](/docs/images/CLSAutocorrect.gif)

### Syntax and Semantic Check for Code
This feature checks for mistakes and errors in COBOL code. The syntax check feature reviews the whole content of the code and suggests fixes, through syntax and semantic analysis which returns diagnostics on the entire context of the code, not just keywords.

This feature is also enabled for Datacom, CICS, and DB2 SQL keywords and variables.

![Syntax check](/docs/images/CLSErrorHighlighting.gif)

### Syntax Highlighting
The extension enables syntax highlighting for COBOL code.

### Syntax Coloring
Contrasting colors are used in displayed code for ease of identifying and distinguishing keywords, variables, paragraphs and sections.

### Outline View and Breadcrumb View
The extension enables outline view and breadcrumb view, which show the structure of elements within the program and allow easy navigation between them.

### Code Snippets
Before you write your COBOL code from scratch, search the snippet library for useful templates.

1. Press `F1` to open the command palette.
2. Type **Insert Snippet** and press enter.
3. Select the snippet that you want to insert.

![Code snippets](/docs/images/Snippet.gif)

You can also insert a code snippet by typing the name of the snippet in your code and clicking on the autocomplete text.

The COBOL Language Support extension also supports user snippets. Add your custom snippets to the `COBOL.json` file in your user snippets folder.

### Smart Tab

Configure the smart tab function in your `settings.json` file to set tab stops at specific columns in the editor window. The cursor stops at these columns when you use **Tab** and **Shift+Tab** to move forwards and backwards in the code. You can specify custom tab stops, and use regular expressions to set conditional tab settings for different sections and divisions of the code.

To configure the smart tab feature, open your `settings.json` file and change the `"cobol-lsp-smart-tab":` parameter.

**Tip:** You can open your `settings.json` file directly from the COBOL Language Support extension settings. Under **Cobol-lsp: Smart-tab**, click **Edit in settings.json**.

- Specify `false` to use the default tab settings for Visual Studio Code.
- Specify `true` to use the default tab settings for COBOL Language Support. This adds extra tab stops for the margins at columns 8, 12 and 73.
- To specify custom tab stops for the whole file, specify an array of integers. The tab stops are set at the next column after the numbers that you specify.   
   Example: a value of `[0, 7, 20]` sets tab stops at columns 1, 8 and 21 and nowhere else.
- To specify conditional tab settings for different anchors in the document, specify a JSON element containing the parameters `"default":` and `"anchors":`.
   - For `"anchors":`, specify a JSON element containing any number of parameters of the format `"ANCHOR": tab stops`. 
      - The `ANCHOR` can be a regular expression and corresponds to a string that occurs in the code. 
      - The `tab stops` are an array of integers that specify tab stops. These tab stop settings apply to all lines in the code below the string specified in the anchor until another condition is met.
   - For `"default":`, specify an array of integers that specify tab stops when no condition is met.  
The following example sets tab stops after columns 1, 2, 3 and 4 after the line `DATA DIVISION`, after columns 3, 5 and 70 after the line `PROCEDURE DIVISION` and after columns 5, 10 and 15 elsewhere.
   ```
   "cobol-lsp.smart-tab": {  
        "default": [5, 10, 15],
        "anchors": {
            "DATA +DIVISION": [1 ,2, 3, 4],
            "PROCEDURE +DIVISION": [3, 5, 70]
        }
    }
    ```

### Dialect Add-ons

Many companies have their own COBOL preprocessors which complement or modify standard IBM enterprise COBOL with custom statements and keywords. In our documentation, we refer to these preprocessors as "dialects".

Dialect add-ons are available to add support for specific language analysis in your COBOL files. Currently an add-on for the IDMS dialect is available on the Visual Studio Code Marketplace. 

Dialect add-ons must be enabled in the COBOL Language Support extension settings. To enable dialect add-ons that you install, complete the following tasks:

1. Ensure that you meet the Java prerequisite described in the add-on readme. 
2. Set **Cobol-lsp: serverRuntime** to **JAVA** in the your extension settings.
3. Add the dialect to the **Cobol-lsp: dialects** array in your workspace extension settings, or to the `preprocessor` parameter in a processor group. For more information, see [Processor Groups](#processor-groups).

COBOL Language Support processes dialects in the order you list them in the **Cobol-lsp: dialects** setting or within the `preprocessor` parameter of a processor group. If you list dialects in the wrong order, some pieces of code might be incorrectly processed using the wrong dialect parser and marked as errors. 

### SQL Backend Server

Set the SQL backend server as either DB2 or Datacom to ensure you use the correct version of the implicit `SQLCA` and `SQLDA` copybooks. To set the SQL backend server, go to **VS Code Settings** > **User** > **Extensions** > **COBOL Language Support** > **Cobol-lsp: Target-sql-backend**. The default setting is DB2.

## Subroutine Support

The COBOL Language Support extension supports subroutines specified in CALL statements if the called program is stored in a local folder in your workspace. The Go To Definition and Find All References functionalities, as well as autocomplete, are extended to work for names of subroutines.

To enable subroutine support, specify the paths of folders containing subroutine files in your workspace extension settings.

1. Open the COBOL Language Support extension settings.
2. Switch from **User** to **Workspace**.
3. Under **Subroutine-manager: Paths-local**, specify the paths of the folders containing subroutines.
   - **Tip:** We recommend that you specify relative paths from the workspace root. To obtain the relative path of a folder in your workspace, right-click it in the folder tree and select **Copy Relative Path**.
   - The folders are searched in the order they are listed. If two folders contain a subroutine with the same file name, the one from the folder higher on the list is used.
4. Open a program or project.  
   Subroutine support features are now enabled.

If you specify your subroutine folders using absolute paths or paths containing `../` or `./`, the subroutine folders are not watched for changes. You might need to resolve names of recently added files in your code manually.

## Copybook Support

The COBOL Language Support extension supports copybooks used in your source code that are stored in a local folder in your workspace. If you have copybooks stored in mainframe data sets or USS directories, you can use a Zowe Explorer profile to automatically download them from the mainframe to your workspace.

To enable copybook support, you specify the folders and data sets that contain copybooks used in your project in the workspace settings. When a copybook is used in the program, the folders and data sets are searched in the order they are listed for files and members that match the name of the copybook. If a copybook with the same file name is located in both a local folder and a remote location, the one in the local folder is used.

Copybook support features are disabled for files stored in the folder **.c4z/.extsrcs** in your workspace. If you also use the [Debugger for Mainframe](https://github.com/BroadcomMFD/debugger-for-mainframe) extension to debug your COBOL programs, you might have some files stored in this folder.

Configuring copybook support on COBOL Language Support also enables copybook support features of the [COBOL Control Flow](https://marketplace.visualstudio.com/items?itemName=broadcomMFD.ccf) extension.

### Supported Copybook Types

COBOL Language Support supports the following copybook types:

- IBM COBOL Copybooks, called with the `COPY` statement.
- Datacom COBOL copybooks, called with the `COPY` statement. Datacom copybooks must be extracted to a mainframe data set or local folder for use in COBOL Language Support. For more information, see the [Datacom documentation](https://techdocs.broadcom.com/datacom).

### Storing Copybooks Locally

You can store your copybooks locally in folders in your workspace and specify those folder paths in your workspace extension settings.

1. Open the COBOL Language Support extension settings.
2. Switch from **User** to **Workspace**.
3. Specify the paths of the folders containing copybooks under **Cpy-manager: Paths-local**.
   - **Tip:** We recommend that you specify relative paths from the workspace root. To obtain the relative path of a folder in your workspace, right-click it in the folder tree and select **Copy Relative Path**.
   - You can use [Glob](https://www.npmjs.com/package/glob) wildcards, such as * to substitute one whole level of the path. For example, specifying the path `*/copybooks` searches all subfolders named "copybooks" in  subfolders of your workspace root, while the path `copybooks/*` searches all subfolders one level below the `copybooks` folder in the workspace root. For more information on available wildcards, see the [Glob Primer](https://www.npmjs.com/package/glob#Glob-Primer)
   - The folders are searched in the order they are listed, or in alphabetical order if multiple paths are indexed by a wildcard. If two folders contain a copybook with the same file name, the one from the folder higher on the list is used.
4. (Optional) Under **Cpy-manager: Copybook-extensions**, specify the file extensions used for your copybooks. The default supported file extensions are `.cpy` and `.copy`.
5. Open a program or project.  
   Copybook support features are now enabled.

If you specify your copybook folders using absolute paths or paths containing `../` or `./`, the copybook folders are not watched for changes. You might need to resolve names of recently added copybooks in your code manually.

To resolve copybook names manually, hover over the copybook name with the error underline, select **Quick Fix...** and **Resolve copybook**.

### Retrieving Copybooks from the Mainframe

You can also set up automatic copybook retrieval from the mainframe to download copybooks from mainframe data sets and USS directories to your workspace.

1. Ensure that you have a [Zowe Explorer profile](https://docs.zowe.org/stable/user-guide/ze-profiles/) configured, with credentials and a connection URL defined.
2. Open the COBOL Language Support extension settings.
3. Switch from **User** to **Workspace**.
4. Under **Cpy-manager: Paths-dsn**, list the names of any number of partitioned data sets on the mainframe to search for copybooks. The data sets are searched in the order they are listed, so if two data sets contain a copybook with the same member name, the one from the data set higher on the list is downloaded.
5. Under **Cpy-manager: Paths-uss**, list absolute paths of directories on USS subsystems to search for copybooks. The directories are searched in the order they are listed, so if two directories contain a copybook with the same member name, the one from the directory higher on the list is downloaded. If copybooks with the same name are found in both a mainframe data set and a USS directory, the one from the mainframe data set is downloaded.
6. Under **Cpy-manager: Profiles**, enter the name of your Zowe Explorer profile.
7. (Optional) Under **Cpy-manager: Copybook-extensions**, specify the file extensions used for your copybooks. The default supported file extensions are `.cpy` and `.copy`.
8. (Optional) Under **Cpy-manager: Copybook-file-encoding**, specify the file encoding used in your copybooks. COBOL Language Support converts copybooks that it downloads from the mainframe from the specified encoding to UTF-8.
9. Open a program or project.  
   All copybooks used in the program or project which are not stored locally are downloaded from the mainframe data sets and USS directories that you specified in steps 4 and 5.  
   Copybook support features are now enabled.

Copybooks that you retrieve from mainframe data sets are stored in the **.c4z/.copybooks** directory within the workspace, which is created automatically. 

We recommend that you refresh your copybooks from time to time. To refresh your copybooks, press **F1** and run the command **Clear downloaded copybooks**. This command clears the **.c4z/.copybooks** directory so that copybooks are downloaded again from the mainframe.

### Copybook Support Features

The extension includes the following copybook support features:

#### Syntax and Semantic Check

Syntax and semantic analysis are enabled for keywords, variables, and paragraphs across all copybooks used in the COBOL file, to ensure and maintain compatibility of copybooks called in code.

The semantic analysis feature takes into account `COPY REPLACING` statements which alter the content of copybooks when checking for errors.

#### Syntax Coloring

Syntax coloring is automatically enabled for copybook files with the extension `.cpy` and `.copy`, as long as they are used in the main COBOL file. You can also select the **COBOL Copybook** language mode to enable syntax coloring for copybook files.

#### Go To Definition and Find All References

The Find All References and Go To Definition functionalities are extended to work for occurrences of copybook names, variables and paragraphs in the main COBOL file.

* **Find All References** identifies all occurrences of variables and paragraphs from copybooks in the code.
* **Go To Definition** enables you to right-click on any variable or paragraph to reveal a definition of the element. If the definition is in a copybook, or the name of a copybook, the copybook opens.

![Go To Definition in a copybook](/docs/images/CPYGoToDefinition.gif)

#### Other

* Inbuilt protection against recursive and missing copybooks. If the copybook is missing or contains looping code, an error displays, preventing issues only being discovered when the code is executed.
* Variables and paragraphs are defined across copybooks. This ensures consistency of code, and prevents issues in error diagnostics caused by incorrect variables or paragraphs in code.
* Functionality to skip variable levels when called, reducing call time.

## Processor Groups

Use processor groups to link programs with specific dialects, SQL backend settings, copybook extensions, compiler options, and local folders containing copybooks. You define processor groups in a `proc_grps.json` file and associate processor groups with programs in a `pgm_conf.json` file. Create both of these files in a `/.cobolplugin` folder in your workspace root.

The `proc_grps.json` file is formatted as an array of JSON elements, with one JSON per processor group. Each processor group can contain the following elements:

- **"name":** (string)  
    - Specify a name for the processor group.
- (Optional) **"libs":** (array)  
    - Specify libraries that contain copybooks as either absolute or relative local paths. These libraries are used to search for copybooks in programs linked with this processor group, and take priority over the local copybook libraries that you specify in the extension settings.
- (Optional) **"copybook-extensions":** (array)  
    - Specify copybook extensions that you use for the programs linked with this processor groups. These copybook extensions take priority over extensions that you specify in the extension settings.
- (Optional) **"compiler-options":** (array)  
    - Specify compiler directives that you want to apply to the programs linked with this processor group. Currently the following directives are supported:
        - QUALIFY(*EXTEND|COMPAT*)
		- XMLPARSE(*XMLSS|COMPAT*)
	- For more information on COBOL compiler options, see the [IBM Enterprise COBOL documentation](https://www.ibm.com/docs/en/cobol-zos/6.3?topic=guide-enterprise-cobol-compiler-options).
- (Optional) **"preprocessor":** (array)
	- Specify dialect and SQL preprocessors that you want to apply to the programs linked with this processor group. See the [Preprocessors](#preprocessors) section below for further information.

### Preprocessors

Specify preprocessors to enable specific dialects and SQL backend settings for the programs linked to a processor group. You can also specify libraries that contain copybooks that use a specific dialect.

Each preprocessor is formatted as a JSON element containing a name, which identifies the type of preprocessor, and other parameters which specify the configuration. As the `preprocessor` element of the `proc_grps.json` file is an array, you can specify more than one preprocessor per processor group.

#### SQL Backend Preprocessor

The SQL backend preprocessor is used to override the SQL server that you specify in the extension settings. This preprocessor has the following parameters:

- **"name":** (string)
    - Specify **SQL**
- **"target-sql-backend":** (string)
    - Specify either **DB2_SERVER** or **DATACOM_SERVER**
	
#### Dialect Preprocessor

A dialect preprocessor can be used to enable a COBOL dialect for a particular processor group and specify libraries which contain copybooks written in that dialect. Dialects that you enable in processor groups take priority over those that you specify in the extension settings. A dialect preprocessor has the following parameters:

- **"name":** (string)
    - Specify the name of a dialect.
- (Optional) **"libs":** (array)
    - Specify libraries that contain copybooks written in the specified dialect as either absolute or relative local paths. These libraries are used to search for copybooks in programs linked with this processor group, and take priority over the local copybook libraries that you specify in the extension settings.
 
### Program configuration file

The program configuration file, `pgm_conf.json`, links programs to processor groups. The program configuration file has the following format:

```
{
    "pgms": [
        { "program": "PROGRAM1", "pgroup": "GROUP1" },
        { "program": "PROGRAM2", "pgroup": "GROUP2" },
    ]
}
```

Each element contains the following parameters:

- **"program":** (string)
    - Specify a program name. This field can be wildcarded.
- **"pgroup":** (string)
    - Specify the name of a procecssor group that is defined in `proc_grps.json`.
   
### Example

Using the example `pgm_conf.json` file above, the following `proc_grps.json` example enables the following:

- Copybooks from libraries LIB1 and LIB2, with the extensions ".cpy" and ".copy", are used with PROGRAM1.
- The QUALIFY(EXTEND) and XMLPARSE(COMPAT) compiler options are enabled for PROGRAM1.
- The IDMS dialect is enabled for PROGRAM2, and IDMS copybooks from LIB3 and LIB4 are used with PROGRAM2.
- The DB2 SQL server is enabled for PROGRAM2. 
- Non-IDMS copybooks from libraries LIB5 and LIB6 are used with PROGRAM2. 

```
{
    "pgroups": [
        {
            "name": "GROUP1",
            "libs": [
                "LIB1", "LIB2"
            ],
            "copybook-extensions": [
                ".cpy", ".copy"
            ],
            "compiler-options": [
                "QUALIFY(EXTEND)", "XMLPARSE(COMPAT)"
            ]
        },
        {
            "name": "GROUP2",
            "preprocessor": [
                {
                    "name": "IDMS",
                    "libs": [
                        "LIB3", "LIB4"
                        ]
                }, 
                {
                    "name": "SQL",
                    "target-sql-backend": "DB2_SERVER"
                }
            ],
            "libs": [
                "LIB5", "LIB6"
                ]
        }
    ]
}
```

## Troubleshooting

To enable troubleshooting logs for the LSP server, specify a value for the parameter **cobol-lsp.logging.level.root** in the extension settings. Specify one of the following values:

* ERROR
* WARN
* INFO
* DEBUG
* TRACE
* ALL

These values are ordered from returning the least information ("ERROR"; errors only) to the most information ("ALL"; all details).

To view troubleshooting logs, open the output panel and select **COBOL Language Support** from the drop-down menu.

## Technical Assistance and Support for COBOL Language Support

The COBOL Language Support extension is made available to customers on the Visual Studio Code Marketplace in accordance with the terms and conditions contained in the provided End-User License Agreement (EULA).

If you are on active support for Brightside, you get technical assistance and support in accordance with the terms, guidelines, details, and parameters that are located within the Broadcom [Working with Support](https://support.broadcom.com/external/content/release-announcements/CA-Support-Policies/6933) guide.

This support generally includes:

* Telephone and online access to technical support
* Ability to submit new incidents 24x7x365
* 24x7x365 continuous support for Severity 1 incidents
* 24x7x365 access to Broadcom Support
* Interactive remote diagnostic support
* Technical support cases must be submitted to Broadcom in accordance with guidance provided in “Working with Support”.

Note: To receive technical assistance and support, you must remain compliant with “Working with Support”, be current on all applicable licensing and maintenance requirements, and maintain an environment in which all computer hardware, operating systems, and third party software associated with the affected Broadcom software are on the releases and version levels from the manufacturer that Broadcom designates as compatible with the software. Changes you elect to make to your operating environment could detrimentally affect the performance of Broadcom software and Broadcom shall not be responsible for these effects or any resulting degradation in performance of the Broadcom software. Severity 1 cases must be opened via telephone and elevations of lower severity incidents to Severity 1 status must be requested via telephone.

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
