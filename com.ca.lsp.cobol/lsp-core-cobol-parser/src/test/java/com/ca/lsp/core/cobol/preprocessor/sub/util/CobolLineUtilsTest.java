/*
 * Copyright (c) 2020 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.core.cobol.preprocessor.sub.util;

import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLineTypeEnum;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.CobolLineUtils;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/** This class is a unit test for {@link CobolLineUtils} and checks its utility methods. */
public class CobolLineUtilsTest {

  @Test
  public void copyCobolLineWithContentArea() {
    CobolLine line = new CobolLine();
    line.setCommentArea("000000");
    line.setContentAreaA("cont");
    line.setContentAreaB("contentB");
    line.setIndicatorArea("*");
    line.setNumber(1);
    line.setSequenceArea("seqArea");
    line.setPredecessor(null);
    line.setSuccessor(null);
    line.setType(CobolLineTypeEnum.COMMENT);

    CobolLine expected = new CobolLine();
    expected.setCommentArea("000000");
    expected.setContentAreaA("");
    expected.setContentAreaB("");
    expected.setIndicatorArea("*");
    expected.setNumber(1);
    expected.setSequenceArea("seqArea");
    expected.setPredecessor(null);
    expected.setSuccessor(null);
    expected.setType(CobolLineTypeEnum.COMMENT);

    CobolLine actual = CobolLineUtils.copyCobolLineWithContentArea("", line);

    assertEquals(expected, actual);
  }

  @Test
  public void copyCobolLineWithContentAreaLineIsSplitBetweenAreas() {
    CobolLine line = new CobolLine();
    line.setCommentArea("000000");
    line.setContentAreaA("cont");
    line.setContentAreaB("contentB");

    CobolLine expected = new CobolLine();
    expected.setCommentArea("000000");
    expected.setContentAreaA("1234");
    expected.setContentAreaB("56");

    CobolLine actual = CobolLineUtils.copyCobolLineWithContentArea("123456", line);

    assertEquals(expected, actual);
  }

  @Test
  public void copyCobolLineWithIndicatorAndContentArea() {
    CobolLine line = new CobolLine();
    line.setCommentArea("000000");
    line.setIndicatorArea("*");
    line.setContentAreaA("cont");
    line.setContentAreaB("contentB");

    CobolLine expected = new CobolLine();
    expected.setCommentArea("000000");
    expected.setIndicatorArea("-");
    expected.setContentAreaA("1234");
    expected.setContentAreaB("56");

    CobolLine actual = CobolLineUtils.copyCobolLineWithIndicatorAndContentArea("-", "123456", line);

    assertEquals(expected, actual);
  }

  @Test
  public void copyCobolLineWithIndicatorArea() {
    CobolLine line = new CobolLine();
    line.setCommentArea("000000");
    line.setIndicatorArea("*");
    line.setContentAreaA("cont");
    line.setContentAreaB("contentB");

    CobolLine expected = new CobolLine();
    expected.setCommentArea("000000");
    expected.setIndicatorArea("-");
    expected.setContentAreaA("cont");
    expected.setContentAreaB("contentB");

    CobolLine actual = CobolLineUtils.copyCobolLineWithIndicatorArea("-", line);

    assertEquals(expected, actual);
  }
}
