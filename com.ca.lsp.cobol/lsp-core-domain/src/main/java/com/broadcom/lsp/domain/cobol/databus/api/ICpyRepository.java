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

package com.broadcom.lsp.domain.cobol.databus.api;

import com.broadcom.lsp.domain.cobol.databus.impl.CpyRepositoryLRU;
import com.broadcom.lsp.domain.cobol.model.CpyStorable;
import com.google.inject.ImplementedBy;
import lombok.NonNull;
import lombok.SneakyThrows;

/**
 * Created on 31/10/2019
 */

@ImplementedBy(CpyRepositoryLRU.class)
public interface ICpyRepository {
    @SneakyThrows
    void sortCache();

    @SneakyThrows
    void persist(@NonNull CpyStorable deepcopy);
    @SneakyThrows
     String logContent();
    @SneakyThrows
     int size();

    @SneakyThrows
    boolean isStored(@NonNull StringBuilder id);

    @SneakyThrows
    boolean isStored(@NonNull String id);

    @SneakyThrows
    boolean isStored(@NonNull long uuid);

}
