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

package com.broadcom.lsp.domain.cobol.databus.impl;

import com.broadcom.lsp.domain.cobol.databus.api.ICpyRepository;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.SerializationUtils;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Created on 25/10/2019
 */

@Slf4j
@Singleton
public class CpyRepositoryLRU implements ICpyRepository {
    @Getter
    private int cacheMaxSize;
    @Setter
    @NonNull
    private List<CpyStorable> cpyRepo;
    private Comparator<CpyStorable> storableComparator = (e1, e2) -> e1.getHit() - e2.getHit();//TLRU

    @NonNull
    private AtomicBoolean isSort = new AtomicBoolean(false);

    @Inject
    public CpyRepositoryLRU(@Named("CACHE-MAX-SIZE") int cachesize) {
        this.cacheMaxSize = cachesize;
        cpyRepo = new ArrayList<>(cacheMaxSize);
    }

    @Override
    @SneakyThrows
    public void sortCache() {
        if (!isSort.get())
                cpyRepo.sort(storableComparator.reversed());
        isSort.set(true);
    }


    @SneakyThrows
    public Optional<CpyStorable> getCpyStorableCache(@NonNull long uuid) {
        Optional<CpyStorable> cpy = cpyRepo.stream()
                .filter(copy -> uuid == copy.getId())
                .findAny();
        if (cpy.isPresent())
            return Optional.of(SerializationUtils.clone(cpy.get())) ;
        return cpy ;
    }

    @SneakyThrows
    private Optional<CpyStorable> getCpyStorableInstance(@NonNull long uuid) {
        Optional<CpyStorable> cpy = cpyRepo.stream()
                .filter(copy -> uuid == copy.getId())
                .findAny();
        return cpy ;
    }

    @Override
    @SneakyThrows
    public void setSort(boolean isSort) {
        this.isSort.set(isSort);
    }


    @Override
    @SneakyThrows
    public void persist(@NonNull CpyStorable deepcopy) {
        if (!isStored(deepcopy.getId())){
        if (cpyRepo.size() < getCacheMaxSize()) {
            cpyRepo.add(deepcopy);
            return;
        }
        cpyRepo
                .remove(cpyRepo.size() - 1);
        cpyRepo
                .add(deepcopy);
        }
    }

    @Override
    @SneakyThrows
    public String logContent() {
        StringBuilder chars = new StringBuilder();
        cpyRepo.stream().forEach(l -> chars.append(System.getProperty("line.separator")).append(l).append(System.getProperty("line.separator")));
        return chars.toString();
    }

    @Override
    @SneakyThrows
    public int size() {
        return cpyRepo.size();
    }

    @SneakyThrows
    public Optional<CpyStorable> topItem() {
        return (cpyRepo.isEmpty()) ? Optional.empty() : Optional.of(cpyRepo.get(0));
    }

    @SneakyThrows
    public Optional<CpyStorable> lastItem() {
        return (cpyRepo.isEmpty()) ? Optional.empty() : Optional.of(cpyRepo.get(size() - 1));
    }


    @Override
    @SneakyThrows
    public boolean isStored(@NonNull StringBuilder id) {
        long uuid = ICpyRepository.calculateUUID(id);
        return isStored(uuid);
    }

    @Override
    @SneakyThrows
    public boolean isStored(@NonNull String id) {
        long uuid = ICpyRepository.calculateUUID(id);
        return isStored(uuid);
    }

    @Override
    @SneakyThrows
    public boolean isStored(@NonNull long uuid) {
        Optional<CpyStorable> cpy = getCpyStorableInstance(uuid);
        if (cpy.isPresent()) {
            cpy.get().match();
            setSort(false);
        }
        sortCache();
        return cpy.isPresent();
    }
}
