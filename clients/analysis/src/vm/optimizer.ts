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
import { GotoInstruction, PerformInstruction, VNCell } from "./instructions";
import { VirtualMachine, VirtualMachineState } from "./vm";

class OptimizerItem {
  constructor(
    public state: VirtualMachineState,
    public conditional: boolean,
  ) {}
}

/**
 * Optimizer stops COBOL Virtual Machine if it process the same COBOL instruction with the same VM state
 */
export class IbmOptimizer {
  private stateMap: Map<number, Map<number, OptimizerItem[]>>;

  public constructor() {
    this.stateMap = new Map<number, Map<number, OptimizerItem[]>>();
  }

  /**
   * Apply optimizer to checks if VM must be stopped or not
   * @param vm COBOL Virtual Machine
   * @returns true if VM must be stopped and false otherwise
   */
  public apply(vm: VirtualMachine): boolean {
    const currentInstruction = vm.currentInstruction();

    if (
      !currentInstruction ||
      currentInstruction instanceof VNCell ||
      currentInstruction instanceof GotoInstruction ||
      currentInstruction instanceof PerformInstruction
    ) {
      return false;
    }

    const vmState = vm.generateState();
    const vmHash = this.calculateHash(vmState);

    if (!currentInstruction.isProcessed()) {
      const states =
        this.stateMap.get(vm.ic()) ?? new Map<number, OptimizerItem[]>();
      const array = states.get(vmHash) ?? [];

      array.push(new OptimizerItem(vmState, vm.isConditional()));
      states.set(vmHash, array);
      this.stateMap.set(vm.ic(), states);
      return false;
    }

    const states =
      this.stateMap.get(vm.ic()) ?? new Map<number, OptimizerItem[]>();
    const array = states.get(vmHash) ?? [];

    for (const item of array) {
      if (item.state.equals(vmState)) {
        if (!vm.isConditional()) {
          if (item.conditional) {
            item.conditional = false;
            return false;
          }
          return true;
        }
        return true;
      }
    }
    array.push(new OptimizerItem(vmState, vm.isConditional()));
    states.set(vmHash, array);
    this.stateMap.set(vm.ic(), states);

    return false;
  }

  private calculateHash(state: VirtualMachineState): number {
    const prime = 0x01000193;
    let h = 0x811c9dc5;
    const keys = [...state.vnCellStates.keys()].sort((a, b) => a - b);

    for (const key of keys) {
      const value = state.vnCellStates.get(key) ?? 0;
      h = (h * prime) ^ key;
      h = (h * prime) ^ value;
    }
    return h;
  }
}
