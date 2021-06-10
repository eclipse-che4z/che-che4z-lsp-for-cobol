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

import java.util.Collections;
import java.util.List;
import java.util.concurrent.*;

/**
 * The {@link CustomThreadPoolExecutor} implementation for run everything in main thread.
 */
public class TestThreadPoolExecutor implements CustomThreadPoolExecutor {
  private static final ScheduledExecutorService EXECUTOR_SERVICE = new TestExecutorService();

  @Override
  public ExecutorService getThreadPoolExecutor() {
    return EXECUTOR_SERVICE;
  }

  @Override
  public ScheduledExecutorService getScheduledThreadPoolExecutor() {
    return EXECUTOR_SERVICE;
  }

  private static class TestExecutorService extends AbstractExecutorService implements ScheduledExecutorService {

    @Override
    public void shutdown() {

    }

    @Override
    public List<Runnable> shutdownNow() {
      return Collections.emptyList();
    }

    @Override
    public boolean isShutdown() {
      return false;
    }

    @Override
    public boolean isTerminated() {
      return false;
    }

    @Override
    public boolean awaitTermination(long l, TimeUnit timeUnit) throws InterruptedException {
      return false;
    }

    @Override
    public void execute(Runnable runnable) {
      runnable.run();
    }

    @Override
    public ScheduledFuture<?> schedule(Runnable runnable, long l, TimeUnit timeUnit) {
      return new TestScheduledFuture<>(submit(runnable));
    }

    @Override
    public <V> ScheduledFuture<V> schedule(Callable<V> callable, long l, TimeUnit timeUnit) {
      return new TestScheduledFuture<>(submit(callable));
    }

    @Override
    public ScheduledFuture<?> scheduleAtFixedRate(Runnable runnable, long l, long l1, TimeUnit timeUnit) {
      return new TestScheduledFuture<>(submit(runnable));
    }

    @Override
    public ScheduledFuture<?> scheduleWithFixedDelay(Runnable runnable, long l, long l1, TimeUnit timeUnit) {
      return new TestScheduledFuture<>(submit(runnable));
    }
  }

  private static final class TestScheduledFuture<V> implements ScheduledFuture<V> {

    private final Future<V> future;

    private TestScheduledFuture(Future<V> future) {
      this.future = future;
    }

    @Override
    public long getDelay(TimeUnit timeUnit) {
      return 0;
    }

    @Override
    public int compareTo(Delayed delayed) {
      return 0;
    }

    @Override
    public boolean cancel(boolean b) {
      return future.cancel(b);
    }

    @Override
    public boolean isCancelled() {
      return future.isCancelled();
    }

    @Override
    public boolean isDone() {
      return future.isDone();
    }

    @Override
    public V get() throws InterruptedException, ExecutionException {
      return future.get();
    }

    @Override
    public V get(long l, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
      return future.get(l, timeUnit);
    }
  }
}
