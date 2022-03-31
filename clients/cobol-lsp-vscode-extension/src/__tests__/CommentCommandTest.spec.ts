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

import {
    CommentAction,
    commentLine,
    ensureIndicatorArea,
    getLineCommentStatus,
    LineCommentStatus,
    setIndicatorTo,
    ToggleComments,
    uncommentLine
} from '../commands/CommentCommand';
import * as vscode from "vscode";

describe('Validate ensureIndicatorArea', () => {
    test("with '       MOVE 1 to 2.'", () => {
        expect(ensureIndicatorArea('       MOVE 1 to 2.')).toBe('       MOVE 1 to 2.')
    })
    test("with '123456 MOVE 1 to 2.'", () => {
        expect(ensureIndicatorArea('123456 MOVE 1 to 2.')).toBe('123456 MOVE 1 to 2.')
    })
    test("with '       CBL FOO.'", () => {
        expect(ensureIndicatorArea('       CBL FOO.')).toBe('       CBL FOO.')
    })
    test("with 'CBL FOO.'", () => {
        expect(ensureIndicatorArea('CBL FOO.')).toBe('       CBL FOO.')
    })
    test("with '   cbl FOO.'", () => {
        expect(ensureIndicatorArea('   cbl FOO.')).toBe('       cbl FOO.')
    })
    test("with '   PROCESS FOO.'", () => {
        expect(ensureIndicatorArea('   PROCESS FOO.')).toBe('       PROCESS FOO.')
    })
})

describe('Validate getLineCommentStatus', () => {
    test("with comment '*' line", () => {
        expect(getLineCommentStatus('123456* The comment')).toBe(LineCommentStatus.COMMENT)
    })
    test("with comment '/' line", () => {
        expect(getLineCommentStatus('123456/ The comment')).toBe(LineCommentStatus.COMMENT)
    })
    test("with twice commented line", () => {
        expect(getLineCommentStatus('123456** The comment')).toBe(LineCommentStatus.COMMENTED_TWICE)
    })
    test("with twice commented line by '/'", () => {
        expect(getLineCommentStatus('123456*/ The comment')).toBe(LineCommentStatus.COMMENTED_TWICE)
    })
    test("with non comment line", () => {
        expect(getLineCommentStatus('123456     Display "Hello!"')).toBe(LineCommentStatus.NON_COMMENT)
    })
    test("with debug line", () => {
        expect(getLineCommentStatus('123456D    Display "Hello!"')).toBe(LineCommentStatus.OTHER_TYPE)
    })
    test("with empty line", () => {
        expect(getLineCommentStatus('')).toBe(LineCommentStatus.OTHER_TYPE)
    })
    test("with spaces line", () => {
        expect(getLineCommentStatus('                           ')).toBe(LineCommentStatus.NON_COMMENT)
    })
})

describe('Validate commentLine', () => {
    test('with comment line', () => {
        expect(commentLine('123456* Foobar!')).toBe('123456** Foobar!')
    })
    test("with comment '/' line", () => {
        expect(commentLine('123456/ Foobar!')).toBe('123456*/ Foobar!')
    })
    test('with twice commented line', () => {
        expect(commentLine('123456** Foobar!')).toBe('123456*** Foobar!')
    })
    test('with debug line', () => {
        expect(commentLine('123456D Something')).toBe('123456* Something')
    })
    test('with non comment line', () => {
        expect(commentLine('123456  MOVE 1 TO SOME.')).toBe('123456* MOVE 1 TO SOME.')
    })
    test('with empty line', () => {
        expect(commentLine('')).toBe('      *')
    })
})

describe('Validate uncommentLine', () => {
    test('with comment line', () => {
        expect(uncommentLine('123456* Foobar!')).toBe('123456  Foobar!')
    })
    test('with twice commented line', () => {
        expect(uncommentLine('123456** Foobar!')).toBe('123456* Foobar!')
    })
    test("with twice commented line with '/'", () => {
        expect(uncommentLine('123456*/ Foobar!')).toBe('123456/ Foobar!')
    })
    test('with debug line', () => {
        expect(uncommentLine('123456D Something')).toBe('123456D Something')
    })
    test('with non comment line', () => {
        expect(uncommentLine('123456  MOVE 1 TO SOME.')).toBe('123456  MOVE 1 TO SOME.')
    })
    test('with empty line', () => {
        expect(uncommentLine('')).toBe('')
    })
})

describe('Validate setIndicatorTo', () => {
    test('with long line', () => {
        expect(setIndicatorTo('123456 Foobarbaz', '!')).toBe('123456!Foobarbaz')
    })
    test('with indicator and nothing in area A', () => {
        expect(setIndicatorTo('123456*', 'D')).toBe('123456D')
    })
    test('with only sequence area', () => {
        expect(setIndicatorTo('123456', '-')).toBe('123456-')
    })
    test('with 3 character string', () => {
        expect(setIndicatorTo('str', '*')).toBe('str   *')
    })
    test('with empty string', () => {
        expect(setIndicatorTo('', '/')).toBe('      /')
    })
})

describe('Validate ToggleComments', () => {
    test('with no selection', () => {
        const textEditor = {
            selections: [],
            edit: jest.fn()
        } as unknown as vscode.TextEditor
        new ToggleComments(textEditor, CommentAction.TOGGLE).doIt()
        expect(textEditor.edit).toBeCalledTimes(0)
    })

    // selection[0]
    //              | start selection
    // 5:       01  WS-POINT.
    // 6:           05 WS-POINTER USAGE    IS POINTER.
    //                  end selection ^
    // selection[1]
    // 14:      *    DISPLAY 'From P1:' BAR of FOOBAR.
    //             selected  ^~~~~~~~~^
    // selection[2]
    // 20:      -    "LLLLLLLLLLMMMMMMMMMM"
    // selection[3]
    // 25:      d  debug command

    const documentLines = {
        5: {
            text: '       01  WS-POINT.',
            range: getRange(5, 0, 5, 20)
        },
        6: {
            text: '           05 WS-POINTER USAGE    IS POINTER.',
            range: getRange(6, 0, 6, 45)
        },
        14: {
            text: '      *    DISPLAY \'From P1:\' BAR of FOOBAR.',
            range: getRange(14, 0, 14, 44)
        },
        20: {
            text: '      -    "LLLLLLLLLLMMMMMMMMMM"',
            range: getRange(20, 0, 20, 33)
        },
        25: {
            text: '      d  debug command',
            range: getRange(25, 0, 25, 22)
        }
    }
    const editBuilder = {
        replace: jest.fn()
    };
    const textEditor = {
        selections: [
            getRange(5, 12, 6, 25),
            getRange(14, 20, 14, 30),
            getRange(20, 13, 20, 20),
            getRange(25, 15, 25, 20),
        ],
        document: {
            lineAt: jest.fn().mockImplementation(line => documentLines[line]),
            eol: vscode.EndOfLine.LF
        },
        edit: jest.fn().mockImplementation(callback => callback(editBuilder))
    } as unknown as vscode.TextEditor

    afterEach(() => {
        editBuilder.replace.mockClear();
        (textEditor.document.lineAt as any).mockClear();
        (textEditor.edit as any).mockClear();
    });

    test('with toggle action', () => {
        new ToggleComments(textEditor, CommentAction.TOGGLE).doIt()
        checkCommonCalls()
        expect(editBuilder.replace).toBeCalledWith(
            getRange(5, 0, 6, 45),
            '      *01  WS-POINT.\n' +
            '      *    05 WS-POINTER USAGE    IS POINTER.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(14, 0, 14, 44),
            '           DISPLAY \'From P1:\' BAR of FOOBAR.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(20, 0, 20, 33),
            '      *    "LLLLLLLLLLMMMMMMMMMM"'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(25, 0, 25, 22),
            '      *  debug command'
        )
    })

    test('with comment action', () => {
        new ToggleComments(textEditor, CommentAction.COMMENT).doIt()
        checkCommonCalls()
        expect(editBuilder.replace).toBeCalledWith(
            getRange(5, 0, 6, 45),
            '      *01  WS-POINT.\n' +
            '      *    05 WS-POINTER USAGE    IS POINTER.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(14, 0, 14, 44),
            '      **    DISPLAY \'From P1:\' BAR of FOOBAR.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(20, 0, 20, 33),
            '      *    "LLLLLLLLLLMMMMMMMMMM"'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(25, 0, 25, 22),
            '      *  debug command'
        )
    })

    test('with uncomment action', () => {
        new ToggleComments(textEditor, CommentAction.UNCOMMENT).doIt()
        checkCommonCalls()
        expect(editBuilder.replace).toBeCalledWith(
            getRange(5, 0, 6, 45),
            '       01  WS-POINT.\n' +
            '           05 WS-POINTER USAGE    IS POINTER.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(14, 0, 14, 44),
            '           DISPLAY \'From P1:\' BAR of FOOBAR.'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(20, 0, 20, 33),
            '      -    "LLLLLLLLLLMMMMMMMMMM"'
        )
        expect(editBuilder.replace).toBeCalledWith(
            getRange(25, 0, 25, 22),
            '      d  debug command'
        )
    })

    function checkCommonCalls() {
        expect(textEditor.document.lineAt).toBeCalledTimes(5)
        expect(textEditor.document.lineAt).toBeCalledWith(5)
        expect(textEditor.document.lineAt).toBeCalledWith(6)
        expect(textEditor.document.lineAt).toBeCalledWith(14)
        expect(textEditor.edit).toBeCalledTimes(1)
        expect(editBuilder.replace).toBeCalledTimes(4)
    }
})

function getRange(startLine: number, startCharacter: number, endLine: number, endCharacter: number) {
    return {
        start: {
            line: startLine,
            character: startCharacter
        },
        end: {
            line: endLine,
            character: endCharacter
        }
    }
}
