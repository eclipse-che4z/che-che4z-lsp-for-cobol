/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */

package com.broadcom.lsp.domain.cobol.databus.model;

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;
import lombok.SneakyThrows;

import java.io.Serializable;
import java.time.Instant;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * This data class is used to store the analyzed copybook in cache. This object is expected to be
 * used with LRU algorithm.
 */
@Data
public class CopybookStorable implements Serializable {
  private static final long TTU = 3600L * 3L;

  private AtomicInteger hit = new AtomicInteger(0);
  private long genDt = Instant.now().getEpochSecond();
  private long id;
  private String name;
  private String uri;
  private String content;

  @Builder
  public CopybookStorable(@NonNull String name, @NonNull String uri, @NonNull String content) {
    this.name = name;
    this.uri = uri;
    this.content = content;
    id = CopybookRepository.calculateUUID(new StringBuilder().append(name));
  }

  @SneakyThrows
  public boolean isExpired() {
    return (Instant.now().getEpochSecond() - genDt) > TTU;
  }

  @SneakyThrows
  public void match() {
    hit.incrementAndGet();
  }

  @SneakyThrows
  public int getHit() {
    return hit.get();
  }
}
