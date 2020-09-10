/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

const fs = require('fs');
const { Plugin } = require('release-it');

const versionRegex = /.*?\[(.*?)\]/
const dateRegex = /\([\d-]+\)/

class VersionExtractor extends Plugin {
    static disablePlugin() {
        return 'version';
    }

    static isEnabled() {
        return true;
    }

    init() {
        this.userChangelog = new ChangelogFile('CHANGELOG.md');
        this.rootChangelog = new ChangelogFile('../../CHANGELOG.md')
        if (this.userChangelog.version !== this.rootChangelog.version) {
            throw new Error("The latest versions in root changelog and user changelog are not the same");
        }
    }

    getIncrementedVersion() {
        return this.userChangelog.version;
    }

    getChangelog() {
        return this.userChangelog.changelog;
    }

    bump() {
        const { isDryRun } = this.global;
        if (!isDryRun) {
            this.userChangelog.updateFile();
            this.rootChangelog.updateFile();
        }
    }
}

class ChangelogFile {
    constructor(name) {
        this.name = name;
        this.changelogFile = fs.readFileSync(name, "utf-8");
        this.version = this.changelogFile.match(versionRegex)[1];
        const oldDate = this.changelogFile.match(dateRegex)[0];
        this.changelogFile = this.changelogFile.replace(oldDate, "("+new Date().toISOString().substring(0, 10)+")");
        const start = this.changelogFile.indexOf("## [" + this.version)
        const stop = this.changelogFile.indexOf("\n## ", start)
        this.changelog = this.changelogFile.substring(start, stop);
    }

    updateFile() {
        fs.writeFileSync(this.name, this.changelogFile);
    }
}

module.exports = VersionExtractor;
