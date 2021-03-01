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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.NonNull;

import java.util.concurrent.*;

/**
 * {@inheritDoc}
 *
 * <p>Implements API for our CustomThreadPoolExecutor created using ThreadPoolExecutor and
 * ScheduledThreadPoolExecutor.
 *
 * <p>The main configuration parameters are: corePoolSize, maximumPoolSize, and keepAliveTime. The
 * pool consists of a fixed number of core threads that are kept inside all the time, and some
 * excessive threads that may be spawned and then terminated when they are not needed anymore.
 */
@Singleton
public class CustomThreadPoolExecutorService implements CustomThreadPoolExecutor {

  private ExecutorService executorService;
  private ScheduledExecutorService scheduledExecutorService;

  @Inject
  public CustomThreadPoolExecutorService(
      @Named("CORE-POOL-SIZE") int corePoolSize,
      @Named("MAX-POOL-SIZE") int maximumPoolSize,
      @Named("KEEP-ALIVE-TIME-IN-SECONDS") int keepAliveTime,
      @Named("CORE-POOL-SIZE-FOR-SCHEDULED-POOL") int corePoolSizeForScheduledThreadPool) {

    this.executorService =
        new ThreadPoolExecutor(
            corePoolSize,
            maximumPoolSize,
            keepAliveTime,
            TimeUnit.SECONDS,
            new LinkedBlockingQueue<Runnable>());
    this.scheduledExecutorService =
        new ScheduledThreadPoolExecutor(corePoolSizeForScheduledThreadPool);
  }

  /**
   * {@inheritdoc}
   *
   * @return
   */
  @Override
  @NonNull
  public ExecutorService getThreadPoolExecutor() {
    return this.executorService;
  }

  /**
   * {@inheritdoc}
   *
   * @return
   */
  @Override
  @NonNull
  public ScheduledExecutorService getScheduledThreadPoolExecutor() {
    return this.scheduledExecutorService;
  }
}
