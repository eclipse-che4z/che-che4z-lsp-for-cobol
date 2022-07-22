/*
 * Copyright (c) 2022 Broadcom.
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

import * as os from "os";
import { CobolCompileJobDefinition } from "../CompileTaskProvider";

export class CobolCompileJCLProvider {

    public static getCompileJobJCL = (taskDefinition: CobolCompileJobDefinition) => {
        const jobCard = taskDefinition.jobCard.join(os.EOL);
        const unit = taskDefinition.unit;
        const compilerOptions = CobolCompileJCLProvider.getCompilerOptions(taskDefinition.compilerOptions);
        const steplibs = taskDefinition.steplib && taskDefinition.steplib.length > 0 ? CobolCompileJCLProvider.generateLibs("STEPLIB", taskDefinition.steplib) : "//*";
        const syslibs = taskDefinition.syslib && taskDefinition.syslib.length > 0 ? CobolCompileJCLProvider.generateLibs("SYSLIB", taskDefinition.syslib) : "//*";
        const jcl =
            `${jobCard}
//*
//*  COBOL LIBRARIES
//*
//*
//******************************************************************
//*  COMP - COMPILE THE COBOL PROGRAM
//******************************************************************
//*
//COMP     EXEC PGM=IGYCRCTL,REGION=0M${compilerOptions.length > 0 ? "," : ""}
${compilerOptions.length > 0 ? compilerOptions : "//*"}
${steplibs}
//SYSUT1   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT2   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT3   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT4   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT5   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT6   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT7   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT8   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT9   DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT10  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT11  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT12  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT13  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT14  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSUT15  DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSMDECK DD  UNIT=${unit},SPACE=(TRK,(10,10))
//SYSPRINT DD  SYSOUT=*
//SYSLIN   DD  DSN=&&LOADSET,DISP=(MOD,PASS),
//             UNIT=${unit},SPACE=(400,(2000,200))
${syslibs}
//SYSPUNCH DD  DUMMY
//SYSIN    DD  * `;

        return jcl.split(new RegExp("\r\n?|\n")).join("\r\n");
    }

    private static getCompilerOptions = (compilerOptions: string[]): string => {
        if (typeof compilerOptions !== "undefined" && compilerOptions.length > 0) {
            return "// PARM=(" + CobolCompileJCLProvider.formatCompilerOptions(compilerOptions.join(","), 62) + ")";
        }
        return "";
    }

    private static generateLibs = (libName: string, params: string[]) => {
        if (libName.length > 8) { throw new Error("libName can have maximum of 8 characters."); }
        return params.map((str, i) => {
            let jclLine: string;
            if (i === 0) {
                jclLine = `//${libName} DD DISP=SHR,DSN=${str}`;
            } else {
                jclLine = `//         DD DISP=SHR,DSN=${str}`;
            }
            CobolCompileJCLProvider.validateJclLineLength(jclLine);
            return jclLine;
        }).join(os.EOL);
    }

    private static formatCompilerOptions = (options: string, allowedLength: number = 72): string => {
        if (options.length > allowedLength) {
            const intermittentOption = options.slice(0, allowedLength);
            return intermittentOption + "X" + os.EOL +
                CobolCompileJCLProvider.formatCompilerOptions("//             " + options.slice(allowedLength));
        } else {
            return options;
        }
    }

    private static validateJclLineLength = (jclLine: string) => {
        if (jclLine.length > 71) {
            throw new Error(`Error while generating JCL line. Line: ${jclLine}`);
        }
    }
}
