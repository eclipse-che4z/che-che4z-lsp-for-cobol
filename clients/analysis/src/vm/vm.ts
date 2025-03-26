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
  Paragraph,
  Section,
  Program,
  WheneverConditionType,
} from "../model/cfast";
import { VirtualProcessorListener } from "./listener";
import { ProgramListing } from "./listing";
import { CobolInstruction, ProgramUnit } from "./instructions";

const HANDLE_ABEND_KEY: string = "%handle_abend%";
const WHENEVER_KEY: string = "%sql_whenever%";

/**
 * VnCell position storage item for the PERFORM instruction
 */
class PerformStorageItem {
  constructor(
    public vnCellPosition: number,
    public redirectPosition: number,
    public programUnit: Paragraph | Section | Program,
  ) {}
}

/**
 * Represents the Virtual Machine unique state (Program listing with VnCell states, alter statements map and sticky statements maps)
 */
export class VmContext {
  private id: string;
  public ic: number;
  private currentProgramUnit: Paragraph | Section | Program;
  private alterMap: Map<number, number>;
  private stickyMap: Map<string, number>;
  private redirectMap: Map<number, number>;
  private storage: Map<number, PerformStorageItem>;
  private path: CobolInstruction[];
  private nestedLevel: number = 0;
  private static staticInt = 0;

  public constructor(
    private programListing: ProgramListing,
    private listener: VirtualProcessorListener,
  ) {
    this.currentProgramUnit = programListing.getProgram();
    this.id = String(VmContext.staticInt++);
    this.ic = 0;
    this.alterMap = new Map<number, number>();
    this.stickyMap = new Map<string, number>();
    this.redirectMap = new Map<number, number>();
    this.storage = new Map<number, PerformStorageItem>();
    this.path = [];
  }

  public getNestedLevel(): number {
    return this.nestedLevel;
  }

  /**
   * Increments conditional nested level for current VM
   */
  public incNestedLevel() {
    this.nestedLevel++;
  }

  /**
   * Decrements conditional nested level for current VM
   * @returns conditional nested level for current VM
   */
  public decNestedLevel() {
    this.nestedLevel--;
  }

  /**
   * Adds a node to the VM path
   */
  public addToPath() {
    const instruction = this.getInstructionByPosition(this.ic);
    if (instruction) {
      this.path.push(instruction);
    }
  }

  /**
   * Returns a VM path
   * @returns a VM path as a array of executed cobol instructions
   */
  public getPath(): CobolInstruction[] {
    return this.path;
  }

  /**
   * Get redirect position for the VNCell
   * @param defaultRedirectPosition is a default redirect position for the VNCell
   * @returns current redirect position
   */
  public getRedirectPosition(defaultRedirectPosition: number): number {
    return (
      this.redirectMap.get(defaultRedirectPosition) ?? defaultRedirectPosition
    );
  }

  /**
   * Redirects VNCell default redirect position to the perform position
   * @param defaultRedirectPosition is a default redirect position for the VNCell
   * @param performPosition is a perform statement position
   * @returns previous redirect position
   */
  public redirect(
    defaultRedirectPosition: number,
    performPosition: number,
  ): number {
    const prevPosition = this.getRedirectPosition(defaultRedirectPosition);
    this.redirectMap.set(defaultRedirectPosition, performPosition);

    const storageItem = new PerformStorageItem(
      defaultRedirectPosition - 1,
      prevPosition,
      this.getCurrentProgramUnit(),
    );
    this.storage.set(performPosition, storageItem);

    return prevPosition;
  }

  /**
   * Deactivates Perform statement after return the control
   * @param performPosition is a perform statment position
   */
  public deactivatePerform(performPosition: number) {
    const storageItem = this.storage.get(performPosition);
    if (storageItem) {
      this.restore(
        storageItem.vnCellPosition + 1,
        storageItem.redirectPosition,
      );

      this.storage.delete(performPosition);
      this.returnCurrentProgramUnit(storageItem.programUnit);
    }

    const performInstruction = this.getInstructionByPosition(performPosition);
    for (let i = this.path.length - 1; i > 0; i--) {
      if (
        this.path[i].getInitialNode()?.id ===
        performInstruction?.getInitialNode()?.id
      ) {
        this.path.length = i;
        break;
      }
    }
  }

  /**
   * Generates COBOL Virtual Machine state object
   * @returns VM State object
   */
  public generateVmState(): VirtualMachineState {
    return new VirtualMachineState(
      new Map<number, number>(this.redirectMap),
      new Map<number, number>(this.alterMap),
      new Map<string, number>(this.stickyMap),
    );
  }

  /**
   * Assign current program unit to the new program unit without updating Listener
   * @param newProgramUnit a new Program, Section or Paragraph node
   */
  public returnCurrentProgramUnit(
    newProgramUnit: Paragraph | Section | Program,
  ) {
    this.currentProgramUnit = newProgramUnit;
  }

  /**
   * Assign current program unit to the new program unit by position and updats the Listener
   * @param position is a Program, Section or Paragraph listing position
   */
  public setCurrentProgramUnitByPosition(position: number) {
    const programUnit =
      this.getInstructionByPosition(position)?.getInitialNode();
    if (
      programUnit &&
      (programUnit.type === "paragraph" ||
        programUnit.type === "section" ||
        programUnit.type === "program")
    ) {
      this.listener.moveControl(
        this.currentProgramUnit,
        programUnit as Paragraph | Section | Program,
      );
      this.currentProgramUnit = programUnit as Paragraph | Section | Program;
    }
  }

  /**
   * Gets current program unit
   * @returns current Program, Section or Paragraph node
   */
  public getCurrentProgramUnit(): Paragraph | Section | Program {
    return this.currentProgramUnit;
  }

  /**
   * Gets a COBOL instruction by the position
   * @param position is a instruction position in the listing
   * @returns COBOL instruction
   */
  public getInstructionByPosition(
    position: number,
  ): CobolInstruction | undefined {
    return this.programListing.getInstructionByPosition(position);
  }

  /**
   * Gets COBOL Virtual Machine identifier
   * @returns COBOL Virtual Machine identifier
   */
  public getVmId(): string {
    return this.id;
  }

  /**
   * Adds a redirect item from one position to another that represents ALTER behaviour
   * @param from default position
   * @param to a new position
   */
  public addAtler(from: number, to: number) {
    this.alterMap.set(from, to);
  }

  /**
   * Gets ALTER redirect map for current COBOL Virtual Machine
   * @returns ALTER redirect map
   */
  public getAlterMap(): Map<number, number> {
    return this.alterMap;
  }

  /**
   * Gets Program Listing
   * @returns Program Listing object
   */
  public getProgramListing(): ProgramListing {
    return this.programListing;
  }

  /**
   * Gets Virtual Processor Listener
   * @returns Virtual Processor Listener object
   */
  public getListener(): VirtualProcessorListener {
    return this.listener;
  }

  /**
   * Clones COBOL Cirtual Machine Context
   * @returns cloned VM Context
   */
  public clone(): VmContext {
    const newContext = new VmContext(this.getProgramListing(), this.listener);

    newContext.redirectMap = new Map<number, number>(this.redirectMap);
    newContext.alterMap = new Map<number, number>(this.alterMap);
    newContext.stickyMap = new Map<string, number>(this.stickyMap);

    newContext.storage = new Map(this.storage);
    newContext.path = [...this.path];

    newContext.nestedLevel = this.nestedLevel;

    return newContext;
  }

  /**
   * Adds CICS HANDLE ABEND instruction position to the map for further processing
   */
  public addHandleAbend() {
    this.stickyMap.set(HANDLE_ABEND_KEY, this.ic);
  }

  /**
   * Gets CICS HANDLE ABEND instruction position if any, otherwise return 0
   * @returns CICS HANDLE ABEND instruction position or 0
   */
  public getHandleAbendEntry(): number {
    return this.stickyMap.get(HANDLE_ABEND_KEY) ?? 0;
  }

  /**
   * Removes HANDLE ABEND instruction position from the map
   */
  public resetHandleAbend() {
    this.stickyMap.delete(HANDLE_ABEND_KEY);
  }

  /**
   * Adds SQL WHENEVER instruction position to the map for further processing
   * @param wheneverCondition is a WHENEVER statement condition type
   */
  public addSqlWhenever(wheneverCondition: WheneverConditionType) {
    this.stickyMap.set(WHENEVER_KEY + wheneverCondition, this.ic);
  }

  /**
   * Retrieves all SQL WHENEVER instruction positions with different whenever condition types
   * @returns set of SQL WHENEVER instruction positions
   */
  public getSqlWheneverEntries(): number[] {
    const result: number[] = [];
    this.addForWheneverCondition(result, "NOT_FOUND");
    this.addForWheneverCondition(result, "SQLERROR");
    this.addForWheneverCondition(result, "SQLWARNING");
    return result;
  }

  /**
   * Restore redirect position for the VNCell
   * @param defaultRedirectPosition  is a default redirect position for the VNCell
   * @param position is a position to restore
   */
  private restore(defaultRedirectPosition: number, position: number) {
    if (position === defaultRedirectPosition) {
      this.redirectMap.delete(defaultRedirectPosition);
    } else {
      this.redirectMap.set(defaultRedirectPosition, position);
    }
  }

  private addForWheneverCondition(
    result: number[],
    wheneverCondition: WheneverConditionType,
  ) {
    const position = this.stickyMap.get(WHENEVER_KEY + wheneverCondition);
    if (position) {
      result.push(position);
    }
  }
}

/**
 * COBOL Virtual Machine State that holds VnCell states and also ALTER and HANDLE ABEND/WHENEVER statements maps
 */
export class VirtualMachineState {
  public constructor(
    public vnCellStates: Map<number, number>,
    public alterMap: Map<number, number>,
    public stickyMap: Map<string, number>,
  ) {}

  /**
   * Indicates if current COBOL Virtual Machine state is equals to a given VM state
   * @param state VM state to compare
   * @returns true if states are equals and false otherwise
   */
  public equals(state: VirtualMachineState): boolean {
    if (state.vnCellStates.size !== this.vnCellStates.size) {
      return false;
    }

    for (const key of state.vnCellStates.keys()) {
      if (state.vnCellStates.get(key) !== this.vnCellStates.get(key)) {
        return false;
      }
    }

    // Compare alter maps
    if (this.alterMap.size !== state.alterMap.size) {
      return false;
    }

    for (const key of state.alterMap.keys()) {
      if (state.alterMap.get(key) !== this.alterMap.get(key)) {
        return false;
      }
    }

    // Compare sticky maps
    if (this.stickyMap.size !== state.stickyMap.size) {
      return false;
    }

    for (const key of state.stickyMap.keys()) {
      if (state.stickyMap.get(key) !== this.stickyMap.get(key)) {
        return false;
      }
    }
    return true;
  }
}

/**
 * COBOL Virtual Machine that executes COBOL instructions
 */
export class VirtualMachine {
  private context: VmContext;

  public constructor(context: VmContext) {
    this.context = context;
  }

  /**
   * Generates vm info
   * @returns vm info string
   */
  public getInfo(): string {
    if (this.currentInstruction()?.getLocation()) {
      return `Lines: ${this.currentInstruction()?.getLocation()?.start.line}-${this.currentInstruction()?.getLocation()?.end.line}, vm: ${this.getId()}`;
    }
    return `vm: ${this.getId()}`;
  }

  /**
   * Returns vistual machine identifier
   * @returns vistual machine identifier
   */
  public getId(): string {
    return this.context.getVmId();
  }

  /**
   * Gets current COBOL VM instruction
   * @returns current COBOL instruction
   */
  public currentInstruction(): CobolInstruction | undefined {
    return this.context.getInstructionByPosition(this.context.ic);
  }

  /**
   * Gets instruction counter
   * @returns instuction counter
   */
  public ic(): number {
    return this.context.ic;
  }

  /**
   * Indicates if VM is conditional or not
   * @returns true for conditional VM and false otherwise
   */
  public isConditional(): boolean {
    return this.context.getNestedLevel() > 0;
  }

  /**
   * Generates the COBOL Virtual Machine State
   * @returns VM State object
   */
  public generateState(): VirtualMachineState {
    return this.context.generateVmState();
  }

  /**
   * Gets current program unit that is currently performing by VM
   * @returns current program unit (Paragraph, Section or Program)
   */
  public getCurrentProgramUnit(): Paragraph | Section | Program {
    return this.context.getCurrentProgramUnit();
  }

  /**
   * Performs current COBOL VM instruction and moves instruction counter to the next istruction
   * @returns forked Virtual Machines after performing or undefined if VM was stopped
   */
  public step(): VirtualMachine[] | undefined {
    const instruction = this.context.getInstructionByPosition(this.context.ic);
    if (!instruction) {
      return undefined;
    }
    const positions = instruction
      .execute(this.context)
      .filter((p) =>
        this.context.getProgramListing().getInstructionByPosition(p),
      );
    if (positions.length === 0) {
      return undefined;
    }
    const forked = [];
    if (positions.length > 1) {
      for (let i = 1; i < positions.length; i++) {
        forked.push(this.clone(positions[i]));
      }
    }
    this.context.ic = positions[0];
    return forked;
  }

  /**
   * Updates current program unit (Program, Section or Paragraph) if needed
   */
  public updateProgramUnit() {
    const instruction = this.context.getInstructionByPosition(this.context.ic);
    if (instruction && instruction instanceof ProgramUnit) {
      const programUnit = (instruction as ProgramUnit).getInitialNode() as
        | Paragraph
        | Section
        | Program;
      if (this.context.getCurrentProgramUnit().id !== programUnit.id) {
        this.context.setCurrentProgramUnitByPosition(this.context.ic);
      }
    }
  }

  private clone(position: number): VirtualMachine {
    const newVm = new VirtualMachine(this.context.clone());

    newVm.context.returnCurrentProgramUnit(
      this.context.getCurrentProgramUnit(),
    );
    newVm.context.ic = position;

    return newVm;
  }
}
