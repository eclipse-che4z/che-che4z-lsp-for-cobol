/*
 * Copyright (c) 2025 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
export type NodeType =
  | "program"
  | "paragraph"
  | "goto"
  | "perform"
  | "section"
  | "stop"
  | "exit"
  | "exitsection"
  | "exitparagraph"
  | "goback"
  | "if"
  | "else"
  | "endif"
  | "evaluate"
  | "when"
  | "whenother"
  | "endevaluate"
  | "inlineperform"
  | "endinlineperform"
  | "atEnd"
  | "atEndExit"
  | "alter"
  | "output"
  | "input"
  | "sort"
  | "endsort"
  | "merge"
  | "endmerge"
  | "xmlparse"
  | "endxml"
  | "onexception"
  | "onnotexception"
  | "endon"
  | "statement"
  | "execsql"
  | "execwhenever"
  | "execcics"
  | "execcicsreturn"
  | "execcicshandle"
  | "execcicsabend"
  | "endexec"
  | "use"
  | "usefordebugging"
  | "exitperform";
export type NodeId = number;

export type HandleAbendType = "CANCEL" | "PROGRAM" | "LABEL" | "RESET";
export type WheneverConditionType = "NOT_FOUND" | "SQLERROR" | "SQLWARNING";
export type WheneverType = "CONTINUE" | "GOTO" | "DO";
export type PerformUntilType = "UNTIL_EXIT" | "UNTIL_CONDITION";

export type Position = {
  line: number;
  character: number;
};

export type ProcedureName = {
  name: string;
  inSection?: string;
};

export type Range = {
  start: Position;
  end: Position;
};

export type Location = { uri: string } & Range;

export type CFASTNode = {
  id?: NodeId;
  children?: CFASTNode[];
  type: NodeType;
  location: Location;
  parent?: CFASTNode;
  processed?: boolean;
  snippet?: string;
};

export type Program = CFASTNode & {
  name: string;
  type: "program";
};

export type Paragraph = CFASTNode & {
  name: string;
  snippet: string;
  type: "paragraph";
  lastNode?: CFASTNode;
};

export type Section = CFASTNode & {
  name: string;
  snippet: string;
  type: "section";
  lastNode?: CFASTNode;
};

// https://www.ibm.com/support/knowledgecenter/en/SS6SG3_4.2.0/com.ibm.entcobol.doc_4.2/PGandLR/ref/rlpsperf.htm
export type Perform = CFASTNode & {
  targetName: string;
  targetSectionName?: string;
  thruName?: string;
  thruSectionName?: string;
  type: "perform";
  performUntilType?: PerformUntilType;
};

export type InlinePerform = CFASTNode & {
  type: "inlineperform";
  performUntilType?: PerformUntilType;
};

// https://www.ibm.com/support/knowledgecenter/en/SS6SG3_4.2.0/com.ibm.entcobol.doc_4.2/PGandLR/ref/rlpsgoto.htm
export type Goto = CFASTNode & {
  targetName: string[];
  type: "goto";
};

// https://www.ibm.com/support/knowledgecenter/en/SS6SG3_4.2.0/com.ibm.entcobol.doc_4.2/PGandLR/ref/rlpsstop.htm
export type Stop = CFASTNode & {
  type: "stop";
};

export type Exit = CFASTNode & {
  type: "exit";
};

export type ExitSection = CFASTNode & {
  type: "exitsection";
};

export type ExitParagraph = CFASTNode & {
  type: "exitparagraph";
};

export type ExitPerform = CFASTNode & {
  type: "exitperform";
  cycle: boolean;
  insideInlinePerform: boolean;
};

export type Goback = CFASTNode & {
  type: "goback";
};

export type Alter = CFASTNode & {
  type: "alter";
  from: ProcedureName;
  fromId: NodeId;
  to: ProcedureName;
  toId: NodeId;
};

export type Output = CFASTNode & {
  type: "output";
  target: ProcedureName;
  thru: ProcedureName;
};

export type Input = CFASTNode & {
  type: "input";
  target: ProcedureName;
  thru: ProcedureName;
};

export type XmlParse = CFASTNode & {
  type: "xmlparse";
  target: ProcedureName;
  thru: ProcedureName;
};

export type CicsHandleAbend = CFASTNode & {
  type: "execcicshandle";
  handleType: HandleAbendType;
  value: string;
};

export type CicsAbend = CFASTNode & {
  type: "execcicsabend";
  cancel: boolean
};

export type SqlWhenever = CFASTNode & {
  type: "execwhenever";
  wheneverCondition: WheneverConditionType;
  wheneverType: WheneverType;
  value: string;
};
