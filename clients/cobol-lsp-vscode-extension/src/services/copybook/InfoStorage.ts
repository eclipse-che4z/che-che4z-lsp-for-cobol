import { SettingsService } from "../Settings";

export class InfoStorage {
    private static readonly map = new Map<string, string>();

    public static set(cobolFileName: string, copybookName: string, dialectType: string) {
        InfoStorage.map.set(`${cobolFileName}#${copybookName}`, dialectType);
    }

    public static get(cobolFileName: string, copybookName: string): string {
        return InfoStorage.map.get(`${cobolFileName}#${copybookName}`) ?? SettingsService.DEFAULT_DIALECT;
    }

    public static clear() {
        InfoStorage.map.clear();
    }

}