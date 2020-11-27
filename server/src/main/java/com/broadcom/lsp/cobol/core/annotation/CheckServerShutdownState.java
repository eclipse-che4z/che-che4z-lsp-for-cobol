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

import java.lang.annotation.*;

/**
 * Annotation to handle LSP server shutdown state.
 * This annotation only work on a class of type {@link DisposableService}.
 * <p>annotation limitation:
 * 1. Classes must be public or package-private.
 * 2. Classes must be non-final
 * 3. Methods must be public, package-private or protected
 * 4. Methods must be non-final
 * 5. It is not possible to use on instances that aren't constructed by Guice.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface CheckServerShutdownState {}
