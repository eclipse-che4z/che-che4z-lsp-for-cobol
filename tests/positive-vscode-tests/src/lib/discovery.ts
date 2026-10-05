/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom - initial API and implementation
 */

import * as fs from "fs";
import * as path from "path";
import { Minimatch } from "minimatch";

export const CONFIG_FOLDER = ".cobolplugin";
export const PROGRAM_CONFIG = "pgm_conf.json";
export const SNAPSHOT_FOLDER = path.join("compileListing", "snapshot");
export const SNAPSHOT_IGNORE_FILE = ".snapshot-ignore";
export const INCLUDE_FILE = ".positive-include";
const EXCLUDED_FOLDERS = [CONFIG_FOLDER, ".vscode", "compileListing"];

export interface Program {
  /** absolute path of the program */
  file: string;
  /** file name, used as snapshot name and in failure messages */
  fileName: string;
  /** absolute path of the expected results snapshot, if any and not ignored */
  snapshot?: string;
}

/**
 * Find all test folders under the root: every folder with .cobolplugin/pgm_conf.json. Each test
 * folder is opened as a VS Code workspace on its own and tests the programs of its pgm_conf.json,
 * except the ones inside a nested test folder, which are tested with that folder's configuration.
 */
export function findTestFolders(root: string): string[] {
  const absRoot = path.resolve(root);
  if (!fs.existsSync(absRoot) || !fs.statSync(absRoot).isDirectory()) {
    throw new Error(`Test root folder not found: ${absRoot}`);
  }
  const result: string[] = [];
  const walk = (dir: string) => {
    if (isTestFolder(dir)) {
      result.push(dir);
    }
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      if (
        entry.isDirectory() &&
        !entry.name.startsWith(".") &&
        entry.name !== "node_modules"
      ) {
        walk(path.join(dir, entry.name));
      }
    }
  };
  walk(absRoot);
  return result.sort();
}

function isTestFolder(dir: string): boolean {
  return fs.existsSync(path.join(dir, CONFIG_FOLDER, PROGRAM_CONFIG));
}

/**
 * List the programs of a test folder: files matched by the "program" entries of pgm_conf.json,
 * using the same matching rules as the extension (see ProcessorGroups.matchProcessorGroup). If the
 * folder has a .positive-include file, only programs also matching one of its globs are tested.
 */
export function findPrograms(testFolder: string): Program[] {
  const config = JSON.parse(
    fs.readFileSync(path.join(testFolder, CONFIG_FOLDER, PROGRAM_CONFIG), "utf8"),
  ) as { pgms?: { program: string }[] };
  const patterns = (config.pgms || []).map((p) => p.program);
  const includes = readList(path.join(testFolder, INCLUDE_FILE));
  const snapshotIgnored = readSnapshotIgnoreList(testFolder);

  return listFiles(testFolder, testFolder)
    .filter((file) => patterns.some((p) => matches(p, file, testFolder)))
    .filter(
      (file) =>
        includes.length === 0 || includes.some((p) => matches(p, file, testFolder)),
    )
    .map((file) => {
      const fileName = path.basename(file);
      const snapshot = path.join(testFolder, SNAPSHOT_FOLDER, fileName);
      return {
        file,
        fileName,
        snapshot:
          fs.existsSync(snapshot) && !snapshotIgnored.has(fileName) ? snapshot : undefined,
      };
    });
}

function matches(pattern: string, file: string, testFolder: string): boolean {
  if (path.isAbsolute(pattern)) {
    return toForwardSlashUppercase(pattern) === toForwardSlashUppercase(file);
  }
  const relative = toForwardSlashUppercase(path.relative(testFolder, file));
  return new Minimatch(toForwardSlashUppercase(pattern), {
    nocase: true,
    dot: true,
  }).match(relative);
}

function toForwardSlashUppercase(p: string): string {
  return p.split("\\").join("/").toUpperCase();
}

/** Files of the test folder, without the ones of nested test folders */
function listFiles(dir: string, testFolder: string): string[] {
  if (dir !== testFolder && isTestFolder(dir)) {
    return [];
  }
  const result: string[] = [];
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (!EXCLUDED_FOLDERS.includes(entry.name)) {
        result.push(...listFiles(full, testFolder));
      }
    } else if (entry.isFile()) {
      result.push(full);
    }
  }
  return result.sort();
}

/**
 * File names whose snapshot is not compared (errors are still checked), like the blacklist of the
 * engine test: from <testFolder>/.snapshot-ignore and the POSITIVE_TESTS_SNAPSHOT_IGNORE env var
 */
function readSnapshotIgnoreList(testFolder: string): Set<string> {
  const names = (process.env.POSITIVE_TESTS_SNAPSHOT_IGNORE || "")
    .split(",")
    .map((n) => n.trim());
  names.push(...readList(path.join(testFolder, SNAPSHOT_IGNORE_FILE)));
  return new Set(names.filter((n) => n.length > 0));
}

/** Non-empty lines of a file, without # comments; empty if the file does not exist */
function readList(file: string): string[] {
  if (!fs.existsSync(file)) {
    return [];
  }
  return fs
    .readFileSync(file, "utf8")
    .split(/\r?\n/)
    .map((n) => n.trim())
    .filter((n) => n.length > 0 && !n.startsWith("#"));
}
