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
  DataBusSubscribeBadTest.class
})
public class DatabusTestSuite {}
