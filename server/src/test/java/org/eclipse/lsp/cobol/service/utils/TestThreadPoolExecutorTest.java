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
package org.eclipse.lsp.cobol.service.utils;

import org.junit.jupiter.api.Test;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test {@link TestThreadPoolExecutor}
 */
class TestThreadPoolExecutorTest {
  private static final int THE_MAGIC_NUMBER = 42;

  @Test
  void testExecutor() {
    CustomThreadPoolExecutor customThreadPoolExecutor = new TestThreadPoolExecutor();
    TestTask task = new TestTask();
    assertFalse(task.isDone());
    customThreadPoolExecutor.getThreadPoolExecutor().submit(task);
    assertTrue(task.isDone());
  }

  @Test
  void testSchedule() throws ExecutionException, InterruptedException {
    CustomThreadPoolExecutor customThreadPoolExecutor = new TestThreadPoolExecutor();
    TestTask task = new TestTask();
    assertFalse(task.isDone());
    Future<Integer> result = customThreadPoolExecutor.getScheduledThreadPoolExecutor()
        // schedule it for 10 days
        .schedule(task::getMagicNumber, 10, TimeUnit.DAYS);
    // it's done!
    assertTrue(task.isDone());
    assertEquals(42, result.get());
  }

  private static class TestTask implements Runnable {
    private boolean done = false;

    @Override
    public void run() {
      done = true;
    }

    public Integer getMagicNumber() {
      done = true;
      return THE_MAGIC_NUMBER;
    }

    public boolean isDone() {
      return done;
    }
  }
}
