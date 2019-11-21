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
package com.ca.lsp.core.cobol;

import com.broadcom.impl.*;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/** A suite to run the databus tests. */
@RunWith(Suite.class)
@Suite.SuiteClasses({
  DataBusGetFromCacheBadTest.class,
  DataBusGetFromCacheHappyTest.class,
  DataBusStoreHappyTest.class,
  DataBusSubscribeHappyTest.class,
  DataBusSubscribeBadTest.class,
  DataBusUnSubscribeTest.class
})
public class DatabusTestSuite {}
