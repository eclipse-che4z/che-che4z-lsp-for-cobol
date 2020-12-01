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

Make sure that the user email you specified on your local git is the same as on the Github account.

For more information, please see the Eclipse Committer Handbook:
https://www.eclipse.org/projects/handbook/#resources-commit

## Setting up the Development Environment

To build project you need to install npm and maven.

Checkout source code:
$ git clone https://github.com/eclipse/che-che4z-lsp-for-cobol.git

To build server run:

```$ cd server && mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent verify test-compile```

To build extension run:

```$ cd clients/cobol-lsp-vscode-extension && npm install && npm run compile```

You need to change the run configuration in your IDE to enable logging to the console while debugging the Java part. 
Add `-Dlogback.configurationFile=server/localDev/logback.xml` to your `VM options` parameter. 
The value can be `localDev/logback.xml` if the `server` folder is a root folder for your project.

## Start contributing

Before contributing to the project, fork the repository and clone it, or add it as a new remote if you have already cloned the original repository. All the commits should be pushed to the fork in order to open pull requests from it.

All the activity on the project should begin with defining a new issue that describes the required changes.

## Committing

The best practice is to have "atomic" commits, i.e. if you have several iterations in your task, then it is better to create several
commits for each step. For example, first, apply the refactoring, commit it, then apply the actual changes.

We apply the conventional committing approach. The commit messages should start with a tag which describes the type of the commit:
"fix:" - this commit fixes a bug
"feat:" - this commit contains a new feature
If there is breaking change in the commit, e.g. some not back-compatible API changes, add the "BREAKING CHANGE:" footer that describes it in detail.
For more details, see https://www.conventionalcommits.org/en/v1.0.0/

The actual commit message title (the first commit line after a conventional tag) should start with a verb in the present tense, active voice that describes the applied action: fix, add, introduce, remove, change, etc. The line should describe the purpose of the applied changes, and be short (not more than 50 chars including all the tags). If it is hard to formulate it this way, maybe it would be better to split it into two (or more) smaller commits. It should end with a linked issue number like "#42" or "GH-42".

For example:

```fix: Use change profile command to recover from errors #283```

Also, If you have some not obvious changes, it would be nice to provide a longer commit message that contains some useful information.

## Contact

Contact the project developers.

* supportChe4z.pdl@broadcom.com
