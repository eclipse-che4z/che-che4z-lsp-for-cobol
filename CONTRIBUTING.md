# Contributing to Eclipse Che4z

Thanks for your interest in this project.

## Project description

Eclipse Che4z provides an components/extensions for Eclipse Che to facilitate mainframe application development by providing:

* https://projects.eclipse.org/projects/ecd.che.che4z

## Developer resources
Information regarding source code management, builds, coding standards, and more.

* https://projects.eclipse.org/projects/ecd.che.che4z/developer

The project maintains the following source code repository

* https://github.com/eclipse/che-che4z-lsp-for-cobol

## Eclipse Contributor Agreement

Before your contribution can be accepted by the project team contributors must electronically sign the Eclipse Contributor Agreement (ECA).

* http://www.eclipse.org/legal/ECA.php

Commits that are provided by non-committers must have a Signed-off-by field in the footer indicating that the author is aware of the terms by which the contribution has been provided to the project. The non-committer must additionally have an Eclipse Foundation account and must have a signed Eclipse Contributor Agreement (ECA) on file.

For more information, please see the Eclipse Committer Handbook:
https://www.eclipse.org/projects/handbook/#resources-commit

## Setting up the Development Environment

To build project you need to install npm and maven.

Checkout source code:
$ git clone https://github.com/eclipse/che-che4z-lsp-for-cobol.git

To build server run:

```$ cd com.ca.lsp.cobol && mvn org.jacoco:jacoco-maven-plugin:prepare-agent verify test-compile```

To build extension run:

```$ cd clients/cobol-lsp-vscode-extension && npm install && npm run compile```



## Contact

Contact the project developers.

* supportChe4z.pdl@broadcom.com

