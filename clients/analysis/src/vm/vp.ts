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
import { VirtualProcessorListener } from "./listener";
import { ProgramListing } from "./listing";
import { IbmOptimizer } from "./optimizer";
import { VirtualMachine, VmContext } from "./vm";
import { cfastNodeInfo, Channel } from "./logger";

export class VirtualProcessor {
  private vms: VirtualMachine[] = [];

  public constructor(
    programListing: ProgramListing,
    private listener: VirtualProcessorListener,
    private optimizer: IbmOptimizer,
    private maxVmCount: number,
    private logger?: Channel,
  ) {
    this.vms.push(new VirtualMachine(new VmContext(programListing, listener)));
  }

  /**
   * Runs virtual processor to process COBOL statement with set of Virtual Machines
   */
  public run() {
    while (this.vms.length > 0) {
      const vm = this.vms[0];
      if (!this.step(vm)) {
        this.remove(vm);
      }
      // Guard condition
      if (this.vms.length > this.maxVmCount) {
        this.listener.maximumVMCountReached();
        return;
      }
    }
  }

  /**
   * Returns a list of Virtual Machines
   * @returns list of Virtual Machines
   */
  public getVirtualMachines(): VirtualMachine[] {
    return this.vms;
  }

  /**
   * [Debugging]
   * Steps into, using the given virtual machine
   * @param vm a Virtual Machine to step into
   * @returns a current processing COBOL instruction or undefined if processing was stopped
   */
  public stepInto(vm: VirtualMachine): VirtualMachine | undefined {
    if (!this.step(vm)) {
      this.remove(vm);
      return undefined;
    }
    return vm;
  }

  private step(vm: VirtualMachine): boolean {
    this.logger?.debug(
      `${vm.getInfo()}: ${cfastNodeInfo(vm.currentInstruction()?.getInitialNode())}, CPU: ${vm.getCurrentProgramUnit()?.id}`,
    );
    vm.updateProgramUnit();

    if (this.optimizer && this.optimizer.apply(vm)) {
      return false;
    }
    const newVms = vm.step();
    if (!newVms) {
      return false;
    }
    for (const newVm of newVms) {
      this.vms.push(newVm);
    }
    return true;
  }

  private remove(vm: VirtualMachine) {
    let index = this.vms.indexOf(vm);
    if (index < 0) {
      return;
    }
    this.logger?.debug(`Remove vm ${vm.getId()}`);
    this.vms.splice(index, 1);
  }
}
