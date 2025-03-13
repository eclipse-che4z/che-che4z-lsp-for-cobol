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
import {
  CFASTNode,
  Program,
  Location,
  Paragraph,
  Section,
  Goto,
  Perform,
  NodeType,
  Alter,
  ProcedureName,
  CicsHandleAbend,
  SqlWhenever,
  Input,
  Output,
  XmlParse,
  ExitPerform,
  InlinePerform,
} from "../model/cfast";
import {
  CobolInstruction,
  GotoInstruction,
  ProgramUnit,
  SimpleCobolInstruction,
  VNCell,
  PerformInstruction,
  StopRunInstruction,
  GobackInstruction,
  ConditionEntry,
  ConditionBranchEnd,
  ExitSection,
  AlterInstruction,
  CicsHandleAbendInstruction,
  CicsInstruction,
  SqlWheneverInstruction,
  SqlInstruction,
  StartNode,
  JumpInstruction,
  CicsReturnInstruction,
  RestoreProgramUnit,
  FallThruDiagnosticChecker,
  ExitParagraph,
  ConditionExit,
} from "./instructions";
import { VmContext } from "./vm";
import { ConditionInfo, ListingUtils } from "./utils";

const DEFAULT_SECTION = "%DEFAULT_SECTION%";
const DEFAULT_PARAGRAPH = "%DEFAULT_PARAGRAPH%";

/**
 * COBOL intruction placegholder to avoid inserting COBOL instructions to the array
 */
abstract class Placeholder implements CobolInstruction {
  constructor(public node: CFASTNode) {}
  getInitialNode(): CFASTNode {
    return this.node;
  }
  execute(context: VmContext): number[] {
    throw new Error("Method not implemented.");
  }
  isProcessed(): boolean {
    throw new Error("Method not implemented.");
  }
  getLocation(): Location {
    throw new Error("Method not implemented.");
  }
}

class GotoPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public target: string,
  ) {
    super(node);
  }
}

class PerformPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public target: ProcedureName,
    public thru: ProcedureName,
  ) {
    super(node);
  }
}

class IfBranchPlaceholder extends Placeholder {
  constructor(node: CFASTNode) {
    super(node);
  }
}

class EvaluateBranchPlaceholder extends Placeholder {
  constructor(node: CFASTNode) {
    super(node);
  }
}

class ProgramUnitPlaceholder extends Placeholder {
  public vnCellPosition: number = 0;

  constructor(node: CFASTNode) {
    super(node);
  }
}

class ExitSectionPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public sectionLastParagraphPosition: number,
  ) {
    super(node);
  }
}

class ExitParagraphPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public paragraphPosition: number,
  ) {
    super(node);
  }
}

class ConditionalBlockPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public endType: NodeType,
  ) {
    super(node);
  }
}

class AlterPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public from: ProcedureName,
    public to: ProcedureName,
  ) {
    super(node);
  }
}

class XmlParsePlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public target: ProcedureName,
    public thru: ProcedureName,
  ) {
    super(node);
  }
}

class ExitPerformPlaceholder extends Placeholder {
  constructor(
    node: CFASTNode,
    public cycle: boolean,
    public performInfo: PerformInfo,
  ) {
    super(node);
  }
}

/////////////////// END OF PLACEHOLDERS BLOCK /////////////////////////////

/**
 * SECTION descriptor for Symbol Table that holds information about paragraphs and self position
 */
class SectionDescriptor {
  public paragraphMap: Map<string, number>;
  public latestParagraph: number | undefined;

  constructor(public position: number) {
    this.paragraphMap = new Map<string, number>();
    this.paragraphMap.set(DEFAULT_PARAGRAPH, position);
  }

  addParagraph(name: string, position: number) {
    name = name.toUpperCase();
    this.paragraphMap.set(name, position);
  }

  getLastParagraphPosition() {
    return this.latestParagraph ?? this.position;
  }

  getParagraphPositionByName(name: string): number | undefined {
    name = name.toUpperCase();
    return this.paragraphMap.get(name);
  }
}

class PerformInfo {
  endCycleIndex: number = 0;
  endPerformIndex: number = 0;

  constructor(
    public position: number,
    public performUntilType?: string,
  ) {}
}

/**
 * Symbol Table holds information about SECTIONs and PARAGRAPHs and its positions
 */
class SymbolTable {
  private sections: Map<string, SectionDescriptor>;
  private currentSection: string = DEFAULT_SECTION;
  private currentParagraph: string = DEFAULT_PARAGRAPH;
  private inlinePerformPositionStack: PerformInfo[];
  private currentProgramUnit: Paragraph | Section | Program;

  constructor(program: Program) {
    this.sections = new Map<string, SectionDescriptor>();
    this.addSection(DEFAULT_SECTION, 1);
    this.addParagraph(DEFAULT_PARAGRAPH, 1);
    this.inlinePerformPositionStack = [];
    this.currentProgramUnit = program;
  }

  addSection(name: string, position: number) {
    name = name.toUpperCase();
    this.currentSection = name;
    this.currentParagraph = DEFAULT_PARAGRAPH;
    this.sections.set(name, new SectionDescriptor(position));
  }

  addParagraph(name: string, position: number) {
    name = name.toUpperCase();
    this.currentParagraph = name;
    const paragraph = this.sections.get(this.currentSection);
    if (paragraph) {
      paragraph.addParagraph(name, position);
    }
  }

  getProcedurePositionsByNames(
    tagret: ProcedureName,
    thru: ProcedureName,
  ): { start: number; end: number } | undefined {
    let start = this.getProcedurePositionByName(tagret);
    let end;

    thru = this.toUppercase(thru);
    if (thru.inSection) {
      let section = this.sections.get(thru.inSection);
      if (section) {
        end = section.getParagraphPositionByName(thru.name);
      }
    } else {
      let section = this.sections.get(thru.name);
      if (section) {
        end = section.getLastParagraphPosition();
      } else {
        end = this.findParagraphByName(thru.name);
      }
    }

    if (!start || !end) {
      return undefined;
    }

    return { start, end };
  }

  getProcedurePositionByName(name: ProcedureName): number | undefined {
    name = this.toUppercase(name);

    let section: SectionDescriptor | undefined;
    if (name.inSection) {
      section = this.sections.get(name.inSection);
      return section?.getParagraphPositionByName(name.name);
    } else {
      section = this.sections.get(name.name);
      if (section) {
        return section.position;
      } else {
        return this.findParagraphByName(name.name);
      }
    }
  }

  getCurrentSectionPosition(): number {
    return this.sections.get(this.currentSection)?.position ?? 0;
  }

  getCurrentParagraphPosition(): number {
    return (
      this.getProcedurePositionByName({
        name: this.currentParagraph,
        inSection: this.currentSection,
      }) ?? 0
    );
  }

  pushCurrentInlinePerformInfo(currentInlinePerformPosition: PerformInfo) {
    this.inlinePerformPositionStack.push(currentInlinePerformPosition);
  }

  popCurrentInlinePerformInfo(): PerformInfo {
    const result = this.inlinePerformPositionStack.pop();
    if (result === undefined) {
      throw new Error("Inline perform position stack is empty");
    }
    return result;
  }

  pickCurrentInlinePerformInfo(): PerformInfo {
    if (this.inlinePerformPositionStack.length > 0) {
      return this.inlinePerformPositionStack[
        this.inlinePerformPositionStack.length - 1
      ];
    }
    throw new Error("Inline perform position stack is empty");
  }

  setCurrentProgramUnit(programUnit: Paragraph | Section | Program) {
    this.currentProgramUnit = programUnit;
  }

  getCurrentProgramUnit(): Paragraph | Section | Program {
    return this.currentProgramUnit;
  }

  private toUppercase(procedureName: ProcedureName): ProcedureName {
    const result: ProcedureName = {
      name: procedureName.name.toUpperCase(),
    };
    if (procedureName.inSection) {
      result.inSection = procedureName.inSection.toUpperCase();
    }
    return result;
  }

  private findParagraphByName(target: string): number | undefined {
    for (const section of this.sections.values()) {
      const position = section.getParagraphPositionByName(target);
      if (position !== undefined) {
        return position;
      }
    }
    return undefined;
  }
}

/**
 * Program Listing contain a list of COBOL instructions with additional information such as VNCells
 */
export class ProgramListing {
  private instructions: CobolInstruction[];
  private uris: Set<string>;
  private symbolTable: SymbolTable;
  private vnCells: VNCell[];
  private performs: PerformInstruction[];

  public constructor(private program: Program) {
    this.uris = new Set<string>();
    this.symbolTable = new SymbolTable(program);
    this.instructions = [];
    this.vnCells = [];
    this.performs = [];
    this.buildInstructions(program);
  }

  /**
   * Gets COBOL Program node
   * @returns Program node
   */
  public getProgram(): Program {
    return this.program;
  }

  /**
   * Gets program instruction by instruction counter
   * @param ic is instruction counter that represents the index of the COBOL instruction
   * @returns COBOL instruction
   */
  public getInstructionByPosition(ic: number): CobolInstruction | undefined {
    if (ic < 0 || ic >= this.instructions.length) {
      return undefined;
    }
    return this.instructions[ic];
  }

  /**
   * Gets the set of program URIs including copybooks
   * @returns set of program URIs
   */
  public getUris(): Set<string> {
    return this.uris;
  }

  /**
   * Gets the array of the program statements
   * @returns the array of program statements
   */
  public getInstructions(): CobolInstruction[] {
    return this.instructions;
  }

  /**
   * Converts tree to list of nodes
   * @param program a program node
   * @returns list of nodes
   */
  private buildInstructions(program: Program) {
    this.instructions.push(new StartNode());
    this.addChildren(program);
    this.processPlaceholders();
    this.instructions.push(new FallThruDiagnosticChecker());
  }

  private addChildren(node: CFASTNode) {
    node.id = this.instructions.length;
    if (node.location?.uri) {
      this.uris.add(node.location.uri);
    }

    this.addInstructionsForNode(node);
    const instruction = this.instructions[this.instructions.length - 1];
    if (node.children) {
      for (const child of node.children) {
        child.parent = node;
        this.addChildren(child);
      }
    }
    if (node.type === "section") {
      if (
        !(this.instructions[this.instructions.length - 1] instanceof VNCell)
      ) {
        this.createVnCell(instruction as ProgramUnitPlaceholder, node);
      } else {
        (instruction as ProgramUnitPlaceholder).vnCellPosition =
          this.instructions.length - 1;
      }
    }
    if (node.type === "paragraph") {
      this.createVnCell(instruction as ProgramUnitPlaceholder, node);
    }
  }

  private createVnCell(placeholder: ProgramUnitPlaceholder, node: CFASTNode) {
    const vnCell = new VNCell(this.instructions.length + 1);
    this.instructions.push(vnCell);
    this.vnCells.push(vnCell);
    placeholder.vnCellPosition = this.instructions.length - 1;
  }

  private addInstructionsForNode(node: CFASTNode) {
    if (node.type === "program") {
      this.program.id = node.id;
      this.instructions.push(new ProgramUnit(node, 0));
      return;
    }

    if (node.type === "section") {
      this.instructions.push(new ProgramUnitPlaceholder(node));
      const section = node as Section;
      this.symbolTable.addSection(section.name, this.instructions.length - 1);
      this.symbolTable.setCurrentProgramUnit(section);
      return;
    }

    if (node.type === "paragraph") {
      this.instructions.push(new ProgramUnitPlaceholder(node));
      const paragraph = node as Paragraph;
      this.symbolTable.addParagraph(
        paragraph.name,
        this.instructions.length - 1,
      );
      this.symbolTable.setCurrentProgramUnit(paragraph);
      return;
    }

    if (node.type === "goto") {
      const target = (node as Goto).targetName[0];
      this.instructions.push(new GotoPlaceholder(node, target));
      return;
    }

    if (node.type === "perform") {
      const performNode = node as Perform;

      const target: ProcedureName = {
        name: performNode.targetName,
        inSection: performNode.targetSectionName,
      };
      let thru = target;

      const thruName = performNode.thruName;
      if (thruName) {
        thru = { name: thruName, inSection: performNode.thruSectionName };
      }

      this.instructions.push(new PerformPlaceholder(node, target, thru));
      if (performNode.performUntilType === "UNTIL_CONDITION") {
        this.instructions.push(
          new ConditionEntry(
            undefined,
            [this.instructions.length + 1],
            this.instructions.length + 2,
            false,
            [],
          ),
        );
        this.instructions.push(
          new JumpInstruction(this.instructions.length - 1),
        );
        this.instructions.push(new ConditionExit());
      } else if (performNode.performUntilType === "UNTIL_EXIT") {
        this.instructions.push(new JumpInstruction(this.instructions.length));
        this.instructions.push(new SimpleCobolInstruction());
      }
      return;
    }

    if (node.type === "stop") {
      this.instructions.push(new StopRunInstruction(node));
      return;
    }

    if (node.type === "goback") {
      this.instructions.push(new GobackInstruction(node));
      return;
    }

    if (node.type === "if") {
      this.instructions.push(new IfBranchPlaceholder(node));
      return;
    }

    if (node.type === "evaluate") {
      this.instructions.push(new EvaluateBranchPlaceholder(node));
      return;
    }

    if (node.type === "inlineperform") {
      const inlinePerform = node as InlinePerform;
      const performInfo = new PerformInfo(
        this.instructions.length,
        inlinePerform.performUntilType,
      );
      this.symbolTable.pushCurrentInlinePerformInfo(performInfo);
      this.instructions.push(new SimpleCobolInstruction(node));
      return;
    }

    if (node.type === "exitperform") {
      const exitPerform = node as ExitPerform;
      if (exitPerform.insideInlinePerform) {
        const performInfo = this.symbolTable.pickCurrentInlinePerformInfo();
        this.instructions.push(
          new ExitPerformPlaceholder(node, exitPerform.cycle, performInfo),
        );
      } else {
        this.instructions.push(new SimpleCobolInstruction(node));
      }
      return;
    }

    if (node.type === "endinlineperform") {
      const performInfo = this.symbolTable.popCurrentInlinePerformInfo();
      performInfo.endCycleIndex = this.instructions.length;

      if (performInfo.performUntilType === "UNTIL_CONDITION") {
        this.instructions.push(
          new ConditionEntry(
            undefined,
            [this.instructions.length + 1],
            this.instructions.length + 2,
            false,
            [],
          ),
        );
        this.instructions.push(new JumpInstruction(performInfo.position + 1));
        this.instructions.push(new ConditionExit());
      } else if (performInfo.performUntilType === "UNTIL_EXIT") {
        this.instructions.push(new JumpInstruction(performInfo.position + 1));
        this.instructions.push(new SimpleCobolInstruction());
      }
      performInfo.endPerformIndex = this.instructions.length;
      return;
    }

    if (node.type === "exitsection") {
      this.instructions.push(
        new ExitSectionPlaceholder(
          node,
          this.symbolTable.getCurrentSectionPosition(),
        ),
      );
      return;
    }

    if (node.type === "exitparagraph") {
      this.instructions.push(
        new ExitSectionPlaceholder(
          node,
          this.symbolTable.getCurrentParagraphPosition(),
        ),
      );
      return;
    }

    if (node.type === "atEnd") {
      this.instructions.push(
        new ConditionalBlockPlaceholder(node, "atEndExit"),
      );
      return;
    }

    if (node.type === "alter") {
      const alter = node as Alter;
      this.instructions.push(new AlterPlaceholder(node, alter.from, alter.to));
      return;
    }

    if (node.type === "execcicshandle") {
      const cicsHandle = node as CicsHandleAbend;

      this.instructions.push(
        new CicsHandleAbendInstruction(node, cicsHandle.handleType, 3),
      );
      this.instructions.push(
        new RestoreProgramUnit(this.symbolTable.getCurrentProgramUnit()),
      );
      if (cicsHandle.handleType === "LABEL") {
        this.instructions.push(new GotoPlaceholder(node, cicsHandle.value));
      } else {
        this.instructions.push(new SimpleCobolInstruction(node));
      }
      return;
    }

    if (node.type === "execcics") {
      this.instructions.push(new CicsInstruction(node));
      return;
    }

    if (node.type === "execcicsreturn") {
      this.instructions.push(new CicsReturnInstruction(node));
      return;
    }

    if (node.type === "execwhenever") {
      const whenever = node as SqlWhenever;
      this.instructions.push(
        new SqlWheneverInstruction(node, whenever.wheneverCondition, 3),
      );
      this.instructions.push(
        new RestoreProgramUnit(this.symbolTable.getCurrentProgramUnit()),
      );
      if (whenever.wheneverType === "GOTO") {
        this.instructions.push(new GotoPlaceholder(node, whenever.value));
      } else {
        this.instructions.push(new SimpleCobolInstruction(node));
      }
      return;
    }

    if (node.type === "execsql") {
      this.instructions.push(new SqlInstruction(node));
      return;
    }

    if (node.type === "input" || node.type === "output") {
      const input = node as Input | Output;
      this.instructions.push(
        new PerformPlaceholder(node, input.target, input.thru ?? input.target),
      );
      return;
    }

    if (node.type === "onexception" || node.type === "onnotexception") {
      this.instructions.push(new ConditionalBlockPlaceholder(node, "endon"));
      return;
    }

    if (node.type === "xmlparse") {
      const xml = node as XmlParse;
      this.instructions.push(
        new XmlParsePlaceholder(node, xml.target, xml.thru ?? xml.target),
      );
      return;
    }

    this.instructions.push(new SimpleCobolInstruction(node));
  }

  private processPlaceholders() {
    for (let i = 0; i < this.instructions.length; i++) {
      if (this.instructions[i] instanceof GotoPlaceholder) {
        const placeholder = this.instructions[i] as GotoPlaceholder;
        const result = this.symbolTable.getProcedurePositionByName({
          name: placeholder.target,
        });
        if (result) {
          this.instructions[i] = new GotoInstruction(
            placeholder.getInitialNode(),
            result,
          );
        } else {
          this.instructions[i] = new SimpleCobolInstruction(
            placeholder.getInitialNode(),
          );
        }
      }

      if (this.instructions[i] instanceof PerformPlaceholder) {
        const placeholder = this.instructions[i] as PerformPlaceholder;
        const result = this.symbolTable.getProcedurePositionsByNames(
          placeholder.target,
          placeholder.thru,
        );
        if (result) {
          const performInstruction = new PerformInstruction(
            placeholder.getInitialNode(),
            result.start,
            result.end,
          );
          this.instructions[i] = performInstruction;
          this.performs.push(performInstruction);
        } else {
          this.instructions[i] = new SimpleCobolInstruction(
            placeholder.getInitialNode(),
          );
        }
      }

      if (this.instructions[i] instanceof ProgramUnitPlaceholder) {
        const placeholder = this.instructions[i] as ProgramUnitPlaceholder;
        this.instructions[i] = new ProgramUnit(
          placeholder.node,
          placeholder.vnCellPosition,
        );
      }

      if (this.instructions[i] instanceof IfBranchPlaceholder) {
        this.substituteBranchPlaceholders(
          i,
          ListingUtils.buildIfConditionInfo(this.instructions, i),
        );
      }

      if (this.instructions[i] instanceof EvaluateBranchPlaceholder) {
        this.substituteBranchPlaceholders(
          i,
          ListingUtils.buildEvaluateConditionInfo(this.instructions, i),
        );
      }

      if (this.instructions[i] instanceof ConditionalBlockPlaceholder) {
        const placeholder = this.instructions[i] as ConditionalBlockPlaceholder;
        this.substituteBranchPlaceholders(
          i,
          ListingUtils.buildSimpleConditionInfo(
            this.instructions,
            i,
            placeholder.getInitialNode().type,
            placeholder.endType,
          ),
        );
      }

      if (this.instructions[i] instanceof ExitSectionPlaceholder) {
        const placeholder = this.instructions[i] as ExitSectionPlaceholder;
        const programUnit = this.instructions[
          placeholder.sectionLastParagraphPosition
        ] as ProgramUnit;

        this.instructions[i] = new ExitSection(
          placeholder.getInitialNode(),
          programUnit.getVnCellPosition(),
        );
      }

      if (this.instructions[i] instanceof ExitParagraphPlaceholder) {
        const placeholder = this.instructions[i] as ExitParagraphPlaceholder;
        const programUnit = this.instructions[
          placeholder.paragraphPosition
        ] as ProgramUnit;

        this.instructions[i] = new ExitParagraph(
          placeholder.getInitialNode(),
          programUnit.getVnCellPosition(),
        );
      }

      if (this.instructions[i] instanceof AlterPlaceholder) {
        const placeholder = this.instructions[i] as AlterPlaceholder;
        const from = this.symbolTable.getProcedurePositionByName(
          placeholder.from,
        );
        const to = this.symbolTable.getProcedurePositionByName(placeholder.to);

        if (from && to) {
          this.instructions[i] = new AlterInstruction(
            placeholder.getInitialNode(),
            from,
            to,
          );
        } else {
          this.instructions[i] = new SimpleCobolInstruction(
            placeholder.getInitialNode(),
          );
        }
      }

      if (this.instructions[i] instanceof XmlParsePlaceholder) {
        const placeholder = this.instructions[i] as XmlParsePlaceholder;
        const result = this.symbolTable.getProcedurePositionsByNames(
          placeholder.target,
          placeholder.thru,
        );
        if (result) {
          const performInstruction = new PerformInstruction(
            placeholder.getInitialNode(),
            result.start,
            result.end,
          );
          this.instructions[i] = performInstruction;
          this.performs.push(performInstruction);
        } else {
          this.instructions[i] = new SimpleCobolInstruction(
            placeholder.getInitialNode(),
          );
        }
      }

      if (this.instructions[i] instanceof ExitPerformPlaceholder) {
        const placeholder = this.instructions[i] as ExitPerformPlaceholder;
        let index = placeholder.cycle
          ? placeholder.performInfo.endCycleIndex
          : placeholder.performInfo.endPerformIndex;
        this.instructions[i] = new JumpInstruction(index);
      }
    }
  }

  private substituteBranchPlaceholders(
    position: number,
    conditionInfo: ConditionInfo,
  ) {
    this.instructions[position] = new ConditionEntry(
      this.instructions[position].getInitialNode(),
      conditionInfo.starts,
      conditionInfo.end,
      conditionInfo.closed,
      conditionInfo.elses,
    );

    for (const elseIndex of conditionInfo.elses) {
      this.instructions[elseIndex] = new ConditionBranchEnd(
        this.instructions[elseIndex].getInitialNode(),
        conditionInfo.end,
      );
    }

    this.instructions[conditionInfo.end] = new ConditionExit(
      this.instructions[conditionInfo.end].getInitialNode(),
    );
  }
}
