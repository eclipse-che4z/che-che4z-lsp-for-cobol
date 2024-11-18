import * as vscode from "vscode";
import { SETTINGS_TAB_CONFIG } from "../constants";
import * as t from "io-ts";
import { decodeUnknown } from "./util/decoder";

export class TabRule {
  public constructor(
    public stops: number[],
    public maxPosition: number,
    public regex: string | undefined = undefined,
  ) {}
}

export class TabSettings {
  public constructor(
    public rules: TabRule[],
    public defaultRule: TabRule,
  ) {}
}

const TabSettingsBoolean = t.boolean;
const TabSettingsNumbers = t.array(t.number);
const TabSettingsObject = t.partial({
  default: TabSettingsNumbers,
  anchors: t.record(t.string, TabSettingsNumbers),
});

const TabSettingsType = t.union([
  TabSettingsBoolean,
  TabSettingsNumbers,
  TabSettingsObject,
]);

/**
 * Parses configuration input into one of valid configuration types.
 * `Undefined` is returned if the incorrect input is used.
 */
function parseConfiguration(input: unknown) {
  try {
    return decodeUnknown(TabSettingsType, input);
  } catch (_err) {
    return void 0;
  }
}

const DEFAULT_RULE = new TabRule([0, 6, 7, 11], 72);

/**
 * Retrieves and parse tab settings configuration that can be boolean, array or an object
 * @returns a TabSettings object
 */
export function getTabSettings(): TabSettings {
  const input = vscode.workspace.getConfiguration().get(SETTINGS_TAB_CONFIG);
  const config = parseConfiguration(input);

  let settings = new TabSettings([], DEFAULT_RULE);

  if (typeof config === "boolean") {
    // handled by the keybindings section of package.json
  } else if (Array.isArray(config)) {
    if (config.length > 0) {
      const tabRule = new TabRule(config, config[config.length - 1]);
      settings = new TabSettings([], tabRule);
    }
  } else if (typeof config === "object") {
    let defaultRule = DEFAULT_RULE;

    const stops = config.default;
    if (stops !== undefined && stops.length > 0) {
      defaultRule = new TabRule(stops, stops[stops.length - 1]);
    }

    const rules: TabRule[] = [];
    if (config.anchors) {
      for (const regex in config.anchors) {
        const stops = config.anchors[regex];
        if (stops.length > 0) {
          rules.push(new TabRule(stops, stops[stops.length - 1], regex));
        }
      }
    }

    settings = new TabSettings(rules, defaultRule);
  }
  return settings;
}
