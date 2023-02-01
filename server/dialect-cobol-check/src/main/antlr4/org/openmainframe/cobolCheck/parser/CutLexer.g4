/*
 * Copyright (c) 2023 Broadcom.
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

lexer grammar CutLexer;

channels{COMMENTS}
import TechnicalLexer;

AFTER: A F T E R;
AT: A T;
BE: B E;
BEFORE: B E F O R E;
CALL: C A L L;
EACH: E A C H;
END_AFTER: E N D MINUSCHAR AFTER;
END_BEFORE: E N D MINUSCHAR BEFORE;
END_MOCK: E N D MINUSCHAR MOCK;
EXPECT: E X P E C T;
HAPPENED: H A P P E N E D;
IGNORE: I G N O R E;
IN: I N;
LEAST: L E A S T;
MOCK: M O C K;
MOREWRD: M O R E;
NEVER: N E V E R;
NO: N O;
NOT: N O T;
ONCE: O N C E;
SECTION: S E C T I O N;
TESTCASE: T E S T C A S E;
TESTSUITE: T E S T S U I T E;
THAN: T H A N;
TO: T O;
OF: O F;
VERIFY: V E R I F Y;
