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
  HandleAbendType,
  Location,
  Paragraph,
  Program,
  Section,
  WheneverConditionType,
} from "../model/cfast";
import { VmContext } from "./vm";

/**
 * COBOL instruction interface
 */
export interface CobolInstruction {
  /**
   * Gets CFAST node that is represented by this COBOL instruction
   * @returns CFAST node or undefined
   */
  getInitialNode(): CFASTNode | undefined;

  /**
   * Executes a COBOL instruction and returns new position(s)
   * @param context
   * @returns set of positions to move control to. For multiple case it means that VM must be cloned
   */
  execute(context: VmContext): number[];

  /**
   * Indicates if COBOL instruction was executed or not
   * @returns true if instruction was processed (executed) and false otherwise
   */
  isProcessed(): boolean;

  /**
   * Gets a COBOL instruction location
   * @returns location object or undefined
   */
  getLocation(): Location | undefined;
}

/**
 * Represents simple COBOL instruction that moves control to the next instruction
 * without other changes to the VM state
 */
export class SimpleCobolInstruction implements CobolInstruction {
  public constructor(protected node?: CFASTNode) {}

  public getInitialNode(): CFASTNode | undefined {
    return this.node;
  }

  public execute(context: VmContext): number[] {
    this.markProcessed();

    const position = this.doExecute(context);
    if (position > 0) {
      return [position];
    }
    return [];
  }

  public isProcessed(): boolean {
    return this.node?.processed ?? false;
  }

  public getLocation(): Location | undefined {
    return this.node?.location;
  }

  doExecute(context: VmContext): number {
    return context.ic + 1;
  }

  markProcessed(): void {
    if (this.node) {
      this.node.processed = true;
    }
  }
}

/**
 * Important cobol instructions are reflected in the VM path
 */
abstract class ImportantCobolInstruction extends SimpleCobolInstruction {
  public override execute(context: VmContext): number[] {
    if (this.getInitialNode()?.type !== "program") {
      context.addToPath();
    }
    return super.execute(context);
  }
}

/**
 * A dummy instruction thats starts a sequence of COBOL instructions that cannot be programmatically reached
 */
export class StartNode extends SimpleCobolInstruction {
  public override isProcessed(): boolean {
    return true;
  }

  override doExecute() {
    return 1;
  }
}

/**
 * Instruction that executes when control moves to Program, Section or Paragraph node
 */
export class ProgramUnit extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private vnCellPosition: number,
  ) {
    super(node);
  }

  getVnCellPosition(): number {
    return this.vnCellPosition;
  }
}

/**
 * Represents VNCell behaviour
 */
export class VNCell extends SimpleCobolInstruction {
  public constructor(private defaultRedirectPosition: number) {
    super(undefined);
  }

  override doExecute(context: VmContext): number {
    let position = context.getRedirectPosition(this.defaultRedirectPosition);

    const nextInstruction = context.getInstructionByPosition(position);
    if (nextInstruction instanceof PerformInstruction) {
      context.deactivatePerform(position);
      position++;
    }
    return position;
  }

  public override isProcessed(): boolean {
    return true;
  }
}

/**
 * PERFORM instruction
 */
export class PerformInstruction extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private target: number,
    private thru: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    const programUnit = context.getInstructionByPosition(
      this.thru,
    ) as ProgramUnit;

    context.redirect(programUnit.getVnCellPosition() + 1, context.ic);
    context.setCurrentProgramUnitByPosition(this.target);
    return this.target;
  }
}

/**
 * GO TO instruction
 */
export class GotoInstruction extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private position: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    const alterMap = context.getAlterMap();

    let alteredPosition = this.position;
    while (alterMap.has(alteredPosition)) {
      const position = alterMap.get(alteredPosition);
      if (position) {
        alteredPosition = position;
      }
    }

    context.setCurrentProgramUnitByPosition(alteredPosition);
    return alteredPosition;
  }
}

/**
 * Jump is a virtual instruction for managing loops such as inline perform
 */
export class JumpInstruction extends SimpleCobolInstruction {
  public constructor(private position: number) {
    super(undefined);
  }

  override doExecute(context: VmContext): number {
    return this.position;
  }

  public override isProcessed(): boolean {
    return true;
  }
}

/**
 * STOP RUN instruction
 */
export class StopRunInstruction extends SimpleCobolInstruction {
  override doExecute(context: VmContext): number {
    return -1;
  }
}

/**
 * GOBACK instruction
 */
export class GobackInstruction extends SimpleCobolInstruction {
  override doExecute(context: VmContext): number {
    return -1;
  }
}

/**
 * Represents any conditional entry point (f.e. IF or EVALUATE)
 */
export class ConditionEntry extends SimpleCobolInstruction {
  public constructor(
    node: CFASTNode | undefined,
    private starts: number[],
    private end: number,
    private closed: boolean,
    private branchEnds: number[],
  ) {
    super(node);
  }

  public override execute(context: VmContext): number[] {
    this.markProcessed();
    this.executeInstructionOnPosition(context, this.end);
    context.incNestedLevel();

    // If we reach the condition we must mark all branches as executed
    for (const branchEnd of this.branchEnds) {
      this.executeInstructionOnPosition(context, branchEnd);
    }

    const result: number[] = [];
    if (!this.closed) {
      result.push(this.end);
      for (let i = 0; i < this.starts.length; i++) {
        result.push(this.starts[i]);
      }
    } else {
      result.push(this.starts[this.starts.length - 1]);
      for (let i = 0; i < this.starts.length - 1; i++) {
        result.push(this.starts[i]);
      }
    }
    return result;
  }

  private executeInstructionOnPosition(context: VmContext, position: number) {
    const instruction = context.getInstructionByPosition(position);
    if (instruction instanceof SimpleCobolInstruction) {
      instruction.markProcessed();
    }
  }
}

/**
 * Represents any conditional exit point (f.e. END-IF or END-EVALUATE)
 */
export class ConditionExit extends SimpleCobolInstruction {
  public override execute(context: VmContext): number[] {
    this.markProcessed();
    context.decNestedLevel();
    return [context.ic + 1];
  }
}

/**
 * Represents conditional branch end (f.r. ELSE, END-IF, WHEN, etc.)
 */
export class ConditionBranchEnd extends SimpleCobolInstruction {
  public constructor(
    node: CFASTNode | undefined,
    private endPosition: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    return this.endPosition;
  }
}

/**
 * EXIT SECTION instruction
 */
export class ExitSection extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private sectionVnCellPosition: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    return this.sectionVnCellPosition;
  }
}

/**
 * EXIT PARAGRAPH instruction
 */
export class ExitParagraph extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private paragraphVnCellPosition: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    return this.paragraphVnCellPosition;
  }
}

/**
 * Alter instruction
 */
export class AlterInstruction extends ImportantCobolInstruction {
  public constructor(
    node: CFASTNode,
    private from: number,
    private to: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    context.addAtler(this.from, this.to);
    return super.doExecute(context);
  }
}

/**
 * EXEC CICS HANDLE ABEND instruction
 */
export class CicsHandleAbendInstruction extends SimpleCobolInstruction {
  public constructor(
    node: CFASTNode,
    private handleAbendType: HandleAbendType,
    private size: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    if (this.handleAbendType === "LABEL") {
      context.addHandleAbend();
    }
    if (this.handleAbendType === "RESET") {
      context.resetHandleAbend();
    }
    return context.ic + this.size;
  }
}

/**
 * Any EXEC CICS instruction (except HANDLE ABEND, CICS RETURN)
 */
export class CicsInstruction extends SimpleCobolInstruction {
  public constructor(node: CFASTNode) {
    super(node);
  }

  public override execute(context: VmContext): number[] {
    this.markProcessed();

    const position = context.getHandleAbendEntry();
    if (position > 0) {
      return [context.ic + 1, position + 1];
    }
    return [context.ic + 1];
  }
}

/**
 * EXEC CICS RETURN instruction
 */
export class CicsReturnInstruction extends SimpleCobolInstruction {
  public constructor(node: CFASTNode) {
    super(node);
  }

  public override execute(context: VmContext): number[] {
    this.markProcessed();

    const position = context.getHandleAbendEntry();
    if (position > 0) {
      return [position + 1];
    }
    return [];
  }
}

/**
 * EXEC CICS ABEND instruction
 */
export class CicsAbendInstruction extends SimpleCobolInstruction {
  public constructor(
    node: CFASTNode,
    private cancel: boolean,
  ) {
    super(node);
  }

  public override execute(context: VmContext): number[] {
    this.markProcessed();

    if (this.cancel) {
      return [];
    }

    const position = context.getHandleAbendEntry();

    if (position > 0) {
      return [position + 1];
    }

    return [];
  }
}


/**
 * EXEC SQL WHENEVER instruction
 */
export class SqlWheneverInstruction extends SimpleCobolInstruction {
  public constructor(
    node: CFASTNode,
    private wheneverCondition: WheneverConditionType,
    private size: number,
  ) {
    super(node);
  }

  override doExecute(context: VmContext): number {
    context.addSqlWhenever(this.wheneverCondition);
    return context.ic + this.size;
  }
}

/**
 * Any EXEC SQL instruction (except SQL WHENEVER)
 */
export class SqlInstruction extends SimpleCobolInstruction {
  public constructor(node: CFASTNode) {
    super(node);
  }

  public override execute(context: VmContext): number[] {
    this.markProcessed();

    const result = [context.ic + 1];
    const positions = context.getSqlWheneverEntries();
    positions.forEach((p) => result.push(p + 1));
    return result;
  }
}

/**
 * Sets current program unit to defined program unit when executed
 */
export class RestoreProgramUnit extends SimpleCobolInstruction {
  public constructor(programUnit: Paragraph | Section | Program) {
    super(programUnit);
  }

  public override isProcessed(): boolean {
    return true;
  }

  override doExecute(context: VmContext): number {
    context.returnCurrentProgramUnit(
      this.getInitialNode() as Paragraph | Section | Program,
    );
    return context.ic + 1;
  }
}

/**
 * Checker for the fall-thru diagnostic
 */
export class FallThruDiagnosticChecker implements CobolInstruction {
  public constructor() {}

  getInitialNode(): CFASTNode | undefined {
    return undefined;
  }

  execute(context: VmContext): number[] {
    if (context.getNestedLevel() === 0) {
      context.getListener().reportFallThru(context.getPath());
    }
    return [];
  }

  getLocation(): Location | undefined {
    return undefined;
  }

  public isProcessed(): boolean {
    return true;
  }
}
