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

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.model.CopybookStorable;
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
 * This class manages the caching for copybooks in the databus applying the LRU (Last recently used)
 * algorithm.
 */
@Slf4j
@Singleton
public class CopybookRepositoryLRU implements CopybookRepository {
  @Getter private final int cacheMaxSize;
  @Setter @NonNull private ArrayList<CopybookStorable> cpyRepo;
  private final Comparator<CopybookStorable> storableComparator =
      Comparator.comparingInt(CopybookStorable::getHit); // Time last recently used

  @NonNull private final AtomicBoolean isSort = new AtomicBoolean(false);

  @Inject
  public CopybookRepositoryLRU(@Named("CACHE-MAX-SIZE") int cacheSize) {
    cacheMaxSize = cacheSize;
    cpyRepo = new ArrayList<>(cacheMaxSize);
  }

  @Override
  @SneakyThrows
  public synchronized void sortCache() {
    if (!isSort.get()) cpyRepo.sort(storableComparator.reversed());
    isSort.set(true);
  }

  @Override
  @SneakyThrows
  public Optional<CopybookStorable> getCopybookStorableFromCache(@NonNull long uuid) {
    ArrayList<CopybookStorable> shallowCpy = (ArrayList<CopybookStorable>) cpyRepo.clone();
    Optional<CopybookStorable> cpy =
            shallowCpy.stream().filter(copy -> uuid == copy.getId()).findAny();
    if (cpy.isPresent())
      return cpy.map(SerializationUtils::clone);
    return cpy;
  }

  @SneakyThrows
  private Optional<CopybookStorable> getCopybookStorableInstance(@NonNull long uuid) {
    return cpyRepo.stream().filter(copy -> uuid == copy.getId()).findAny();
  }

  @Override
  @SneakyThrows
  public void setSort(boolean isSort) {
    this.isSort.set(isSort);
  }

  @Override
  @SneakyThrows
  public synchronized void persist(@NonNull CopybookStorable deepCopy) {
    if (!isStored(deepCopy.getId())) {
      if (cpyRepo.size() < getCacheMaxSize()) {
        cpyRepo.add(deepCopy);
        return;
      }
      cpyRepo.remove(cpyRepo.size() - 1);
      cpyRepo.add(deepCopy);
    }
  }

  @Override
  @SneakyThrows
  public String logContent() {
    StringBuilder chars = new StringBuilder();
    cpyRepo.forEach(
        l ->
            chars
                .append(System.getProperty("line.separator"))
                .append(l)
                .append(System.getProperty("line.separator")));
    return chars.toString();
  }

  @Override
  @SneakyThrows
  public int size() {
    return cpyRepo.size();
  }

  @SneakyThrows
  public Optional<CopybookStorable> topItem() {
    return (cpyRepo.isEmpty()) ? Optional.empty() : Optional.of(cpyRepo.get(0));
  }

  @SneakyThrows
  public Optional<CopybookStorable> lastItem() {
    return (cpyRepo.isEmpty()) ? Optional.empty() : Optional.of(cpyRepo.get(size() - 1));
  }

  @Override
  @SneakyThrows
  public boolean isStored(@NonNull StringBuilder id) {
    long uuid = CopybookRepository.calculateUUID(id);
    return isStored(uuid);
  }

  @Override
  @SneakyThrows
  public boolean isStored(@NonNull String id) {
    long uuid = CopybookRepository.calculateUUID(id);
    return isStored(uuid);
  }

  @Override
  @SneakyThrows
  public synchronized boolean isStored(@NonNull long uuid) {
    Optional<CopybookStorable> cpy = getCopybookStorableInstance(uuid);
    if (cpy.isPresent()) {
      cpy.get().match();
      setSort(false);
    }
    sortCache();
    return cpy.isPresent();
  }

  /** Method that remove all the elements from the cache */
  @Override
  public void invalidateCache() {
    cpyRepo.clear();
  }
}
