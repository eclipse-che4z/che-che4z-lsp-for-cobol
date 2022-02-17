import { SettingsService } from "../Settings";

export class InfoStorage {
    private static readonly map = new Map<string, Set<string>>();

    public static set(cobolFileName: string, copybookName: string, dialectType: string) {
        const key = InfoStorage.buildKey(cobolFileName, copybookName);
        let values: Set<string> = InfoStorage.map.get(key);
        if (!values) {
            values = new Set<string>();
        }
        values.add(dialectType);
        InfoStorage.map.set(key, values);
    }

    public static get(cobolFileName: string, copybookName: string): Set<string> {
        return InfoStorage.map.get(this.buildKey(cobolFileName, copybookName)) ?? new Set<string>([SettingsService.DEFAULT_DIALECT]);
    }

    public static clear() {
        InfoStorage.map.clear();
    }

    private static buildKey(cobolFileName: string, copybookName: string) {
        return `${cobolFileName}#${copybookName}`;
    }
}