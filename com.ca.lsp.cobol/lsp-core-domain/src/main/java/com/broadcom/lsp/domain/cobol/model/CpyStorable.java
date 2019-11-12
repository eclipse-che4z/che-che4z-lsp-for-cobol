/*
 * Copyright (c) 2019 Broadcom.
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

package com.broadcom.lsp.domain.cobol.model;

import com.broadcom.lsp.domain.cobol.databus.api.ICpyRepository;
import lombok.Builder;
import lombok.Data;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nullable;
import java.io.Serializable;
import java.time.Instant;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/** Created on 15/10/2019 */
@Slf4j
@Data
public class CpyStorable implements Serializable {
  //    private int hit = ThreadLocalRandom.current().nextInt(1, 99 + 1);
  private AtomicInteger hit = new AtomicInteger(0);
  private long genDt = Instant.now().getEpochSecond();
  private long ttu = 3600 * 3;
  private long id;
  private String name;
  private String position;
  private String uri;
  private String content;
  private Map<String, Set<Position>> paragraphPosition;

  @Builder
  public CpyStorable(
      @NonNull String name,
      @Nullable String position,
      @Nullable String uri,
      @NonNull String content,
      @Nullable Map<String, Set<Position>> paragraphPosition) {
    this.name = name;
    this.position = position;
    this.uri = uri;
    this.content = content;
    this.paragraphPosition = paragraphPosition;
    id = ICpyRepository.calculateUUID(new StringBuilder().append(name));
  }

  @SneakyThrows
  public boolean isExpired() {
    return (Instant.now().getEpochSecond() - genDt) > ttu;
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
