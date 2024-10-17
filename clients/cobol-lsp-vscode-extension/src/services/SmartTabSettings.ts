import * as vscode from "vscode";
import { SETTINGS_TAB_CONFIG } from "../constants";

export class TabRule {
  // tslint:disable-next-line:no-unnecessary-initializer
  public constructor(
    public stops: number[],
    public maxPosition: number,
    public regex: string | undefined = undefined,
  ) {}
}

export class TabSettings {
  public constructor(public rules: TabRule[], public defaultRule: TabRule) {}
}

/**
 * Retrieves and parse tab settings configuration that can be boolean, array or an object
 * @returns a TabSettings object
 */
export function getTabSettings(): TabSettings {
  const config = vscode.workspace.getConfiguration().get(SETTINGS_TAB_CONFIG);
  let settings = new TabSettings([], new TabRule([0, 6, 7, 11], 72));
  if (Array.isArray(config)) {
    const stops = config as number[];
    if (stops !== undefined && stops.length > 0) {
      const tabRule = new TabRule(stops, stops[stops.length - 1]);
      settings = new TabSettings([], tabRule);
    }
  } else if (typeof config === "object") {
    const obj = config as { default: number[]; anchors: number };
    let defaultRule = new TabRule([0, 6, 7, 11], 72);
    const stops = obj.default as number[];
    if (stops !== undefined && stops.length > 0) {
      defaultRule = new TabRule(stops, stops[stops.length - 1]);
    }
    const rules: TabRule[] = [];
    const anchors = obj.anchors;
    if (obj.anchors !== undefined && Object.keys(anchors).length > 0) {
      const keys = Object.keys(anchors);
      const values = Object.values(anchors);
      for (let i = 0; i < keys.length; i++) {
        const regex = keys[i] as string;
        const stops = values[i] as number[];
        if (regex !== undefined && stops !== undefined && stops.length > 0) {
          rules.push(new TabRule(stops, stops[stops.length - 1], regex));
        }
      }
    }
    settings = new TabSettings(rules, defaultRule);
  }
  return settings;
}
