import * as fs from "fs";
import * as os from "os";
import * as path from "path";
import * as request from "request";

export interface ZOSMFProfile {
    name: string;
    username: string;
    password: string;
    host: string;
    port: number;
    rejectUnauthorized: boolean;
    default?: boolean;
}

export class ZoweApi {
    public listZOSMFProfiles(): ZOSMFProfile[] {
        let defaultName: string;
        const profilesDir: string = path.join(os.homedir(), ".zowe", "profiles", "zosmf");
        const files: string[] = fs.readdirSync(profilesDir);
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

    public async fetchMember(dataset: string, member: string, profile: ZOSMFProfile): Promise<string> {
        const headers = {
            "Authorization": "Basic " + Buffer.from(profile.username + ":" + profile.password).toString("base64"),
            "Content-Type": "text/plain; charset=UTF-8",
            "X-CSRF-ZOSMF-HEADER": "",
        };
        // default should be https
        const rpath = `/zosmf/restfiles/ds/${dataset}(${member})`;
        const url = `https://${profile.host}:${profile.port}${rpath}`;
        return (await this.doRequest(url, {
            headers,
            hostname: profile.host,
            method: "GET",
            path: rpath,
            port: profile.port,
            rejectUnauthorized: profile.rejectUnauthorized,
        })).body;
    }

    public async listMembers(dataset: string, profile: ZOSMFProfile): Promise<string[]> {
        const headers = {
            "Authorization": "Basic " + Buffer.from(profile.username + ":" + profile.password).toString("base64"),
            "Content-Type": "application/json",
            "X-CSRF-ZOSMF-HEADER": "",
        };
        // default should be https
        const rpath = `/zosmf/restfiles/ds/${dataset}/member`;
        const url = `https://${profile.host}:${profile.port}${rpath}`;
        // FIXME process responce better
        const result = JSON.parse((await this.doRequest(url, {
            headers,
            hostname: profile.host,
            method: "GET",
            path: rpath,
            port: profile.port,
            rejectUnauthorized: profile.rejectUnauthorized,
        })).body);
        return result.items.map((i: any) => i.member);
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
            rejectUnauthorized: this.readValue("rejectUnauthorized", content),
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

    private async doRequest(url: string, options: any): Promise<any> {
        return new Promise<any>((resolve: (arg: any) => void, reject: (arg: any) => void) => {
            request(url, options, (connectionError: any, response: request.Response, body: any) => {
                if (connectionError) {
                    return reject(new Error(connectionError.message));
                }
                const error = this.getError(response);
                if (error) {
                    return reject(new Error(error));
                }
                return resolve({ body, response });
            });
        });
    }

    private getError(response: any): string | undefined {
        if (!response.statusCode.toString().startsWith("2")) {
            if (response.body) {
                try {
                    const errorObj = JSON.parse(response.body);
                    return errorObj.errorMsg || errorObj.details[0];
                } catch (ignore) {
                    return response.body;
                }
            } else {
                return response.statusMessage;
            }
        }
        return undefined;
    }
}
