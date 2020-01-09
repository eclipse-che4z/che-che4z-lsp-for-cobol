import * as fs from "fs";
import * as os from "os";
import * as path from "path";

export interface ZOSMFProfile {
    name: string;
    username: string;
    password: string;
    host: string;
    port: number;
    default?: boolean;
}

export class ZoweApi {
    public listZOSMFProfiles(): ZOSMFProfile[] {
        const profilesDir: string = path.join(os.homedir(), ".zowe", "profiles", "zosmf");
        const files: string[] = fs.readdirSync(profilesDir);
        let defaultName: string;
        const profiles: ZOSMFProfile[] = [];
        for (const file of files) {
            const content = fs.readFileSync(path.join(profilesDir, file)).toString();
            if (this.isMeta(file)) {
                defaultName = this.readDefaultProfileName(content);
            } else {
                profiles.push(this.readProfile(file, content));
            }
        }
        profiles.forEach(p => { p.default = p.name === defaultName; });
        return profiles;
    }

    private isMeta(file: string): boolean {
        return file.endsWith("_meta.yaml");
    }

    private readDefaultProfileName(content: string): string {
        return this.readValue("defaultProfile", content);
    }

    private readProfile(file: string, content: string): ZOSMFProfile {
        return {
            host: this.readValue("host", content),
            name: file.substr(0, ".yaml".length),
            password: this.readValue("password", content),
            port: this.readValue("port", content),
            username: this.readValue("user", content),
        };
    }

    private readValue(name: string, content: string, defaultValue: any = ""): any {
        const lines = content.split(/\r?\n/);
        name = name + ":";
        for (const line of lines) {
            if (line.startsWith(name)) {
                return line.substr(name.length).trim();
            }
        }
        return defaultValue;
    }
}
