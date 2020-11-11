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

package com.broadcom.lsp.cobol.core.annotation;

/**
 * {@link DisposableService} is a marker interface to mark all services which are disposable after a
 * shutdown call on LSP server.
 *
 * <p>Use {@link com.broadcom.lsp.cobol.core.annotation.CheckServerShutdownState} annotation on each
 * service methods to mark them disposed after a shutdown call.
 */
public interface DisposableService {}
