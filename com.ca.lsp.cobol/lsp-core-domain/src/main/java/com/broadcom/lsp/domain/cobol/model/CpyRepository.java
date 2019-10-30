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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Created on 25/10/2019
 */

@Slf4j
@Singleton
public class CpyRepository {
    @Getter
    private int cacheMaxSize;
    @Setter
    @NonNull
    private List<CpyStorable> cpyRepo;
    private Comparator<CpyStorable> tlruComparator = (e1, e2) -> e1.getHit() - e2.getHit();

    @NonNull
    private AtomicBoolean isSort = new AtomicBoolean(false);

    @Inject
    public CpyRepository(@Named("CACHE-MAX-SIZE") int cachesize) {
        this.cacheMaxSize = cachesize;
        cpyRepo = new ArrayList<>(cacheMaxSize);
    }

    @SneakyThrows
    public @NonNull List<CpyStorable> getCache(Comparator<CpyStorable>... comparators) {
        if (comparators != null && comparators.length > 0) {
            for (Comparator<CpyStorable> c : comparators) {
                cpyRepo.sort(c);
            }
        } else {
            if (!isSort.get())
                cpyRepo.sort(tlruComparator.reversed());
            isSort.set(true);
        }
        return cpyRepo;
    }

    @SneakyThrows
    public void setSort(boolean isSort) {
        this.isSort.set(isSort);
    }
}
