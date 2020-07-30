/*
 * Copyright (c) 2020 Broadcom.
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
package com.broadcom.lsp.domain;

import com.broadcom.lsp.domain.cobol.databus.impl.*;
import com.broadcom.lsp.domain.cobol.event.CopybookEventSubscribersTest;
import com.broadcom.lsp.domain.cobol.event.CopybookEventsTest;
import org.junit.platform.runner.JUnitPlatform;
import org.junit.platform.suite.api.SelectClasses;
import org.junit.runner.RunWith;

/** A suite to run the databus tests. */
@RunWith(JUnitPlatform.class)
@SelectClasses({
  CopybookEventsTest.class,
  CopybookEventSubscribersTest.class,
  CopybookRepositoryLRUTest.class,
  CopybookStorableTest.class,
  DatabusBrokerTest.class,
  DataBusGetFromCacheBadTest.class,
  DataBusGetFromCacheHappyTest.class,
  DataBusStoreHappyTest.class,
  DatabusEventSubscriptionE2ETest.class
})
public class DomainTestSuite {}
