const fs = require('fs');
const { Plugin } = require('release-it');

class VersionExtracter extends Plugin {
    static disablePlugin() {
        return 'version';
    }

    static isEnabled() {
        return true;
    }

    init() {
        this.changelogFile = fs.readFileSync('CHANGELOG.md', "utf-8");
        const versionRegex = /.*?\[(.*?)\]/
        const dateRegex = /\([\d-]+\)/
        this.version = this.changelogFile.match(versionRegex)[1];
        const oldDate = this.changelogFile.match(dateRegex)[0];
        this.changelogFile = this.changelogFile.replace(oldDate, "("+new Date().toISOString().substring(0, 10)+")");
        const start = this.changelogFile.indexOf("## [" + this.version)
        const stop = this.changelogFile.indexOf("\n## ", start)
        this.changelog = this.changelogFile.substring(start, stop);
    }

    getIncrementedVersion() {
        return this.version;
    }

    getChangelog() {
        return this.changelog;
    }

    beforeRelease() {
        const { isDryRun } = this.global;
        if (!isDryRun) {
            fs.writeFileSync('CHANGELOG.md', this.changelogFile);
        }
    }
}

module.exports = VersionExtracter;
