/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.service.settings;

import com.google.inject.Provider;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import static org.eclipse.lsp.cobol.service.settings.SettingsParametersEnum.COBOL_PROGRAM_LAYOUT;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Test for {@link SettingsServiceImpl}
 */
@ExtendWith(MockitoExtension.class)
class SettingsServiceImplTest {
    @Mock
    private Provider<CobolLanguageClient> clientProvider;
    private SettingsServiceImpl settingsService;

    @BeforeEach
    void setUp() {
        settingsService = new SettingsServiceImpl(clientProvider);
    }
    @Test
    void testFetchConfiguration() {
        when(clientProvider.get()).thenReturn(mock(CobolLanguageClient.class));
        when(clientProvider.get().configuration(any())).thenReturn(CompletableFuture.completedFuture(Arrays.asList(Object.class, Object.class)));
        CompletableFuture<List<Object>> future = settingsService.fetchConfiguration("param1", "param2");
        List<Object> result = future.join();
        assertNotNull(result);
        assertEquals(2, result.size());
    }

    @Test
    void testFetchTextConfiguration() {
        when(clientProvider.get()).thenReturn(mock(CobolLanguageClient.class));
        when(clientProvider.get().configuration(any())).thenReturn(CompletableFuture.completedFuture(Arrays.asList(Object.class, Object.class)));
        CompletableFuture<List<String>> future = settingsService.fetchTextConfiguration(COBOL_PROGRAM_LAYOUT.label);
        List<String> result = future.join();
        assertNotNull(result);
        verify(clientProvider.get(), times(1)).configuration(any());
    }

    @Test
    void testFetchTextConfigurationWithScope() {
        when(clientProvider.get()).thenReturn(mock(CobolLanguageClient.class));
        when(clientProvider.get().configuration(any())).thenReturn(CompletableFuture.completedFuture(Arrays.asList(Object.class, Object.class)));
        CompletableFuture<List<String>> future = settingsService.fetchTextConfigurationWithScope("scopeUri", "section");
        List<String> result = future.join();
        assertNotNull(result);
        verify(clientProvider.get(), times(1)).configuration(any());
    }

    @Test
    void testFetchTextConfigurationWithScope_dialect() {
        when(clientProvider.get()).thenReturn(mock(CobolLanguageClient.class));
        when(clientProvider.get().configuration(any())).thenReturn(CompletableFuture.completedFuture(Arrays.asList(Object.class, Object.class)));
        CompletableFuture<List<String>> future = settingsService.fetchTextConfigurationWithScope("scopeUri", "section", "dialect");
        List<String> result = future.join();
        assertNotNull(result);
        verify(clientProvider.get(), times(1)).configuration(any());
    }
}
