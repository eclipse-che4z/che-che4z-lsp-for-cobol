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

package org.eclipse.lsp.cobol.core.annotation;

import org.eclipse.lsp.cobol.core.messages.LocaleStore;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.service.CopybookService;
import org.eclipse.lsp.cobol.service.SettingsService;
import org.eclipse.lsp.cobol.service.SubroutineService;
import org.eclipse.lsp.cobol.service.WatcherService;
import org.eclipse.lsp4j.services.LanguageServer;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Annotation to handle LSP server shutdown state.
 *
 * <p>NOTE: Annotation works only when binding to guice is provided using {@link ProxyUtil}.
 * </br>For example : check {@link
 * org.eclipse.lsp.cobol.domain.modules.ServiceModule#getWorkspaceService(DataBusBroker,
 * SettingsService, WatcherService, CopybookService, LocaleStore, SubroutineService,
 * LanguageServer)}
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface CheckServerShutdownState { }
