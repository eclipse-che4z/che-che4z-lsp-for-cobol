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

import lombok.Builder;
import lombok.Data;
import lombok.NonNull;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;
import java.time.Instant;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Created  on 15/10/2019
 */

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

    @Builder
    public CpyStorable(@NonNull String name, @NonNull String position, @NonNull String uri, @NonNull String content) {
        this.name = name;
        this.position = position;
        this.uri = uri;
        this.content = content;
        this.id = calculateUUID(new StringBuilder()
                .append(name));
    }

    @SneakyThrows
    public static long calculateUUID(@NonNull StringBuilder uuid) {
        return UUID.nameUUIDFromBytes(uuid.toString().getBytes())
                .getMostSignificantBits();
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
