package com.ca.lsp.core.cobol;

import com.broadcom.impl.*;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
  DataBusGetFromCacheBadTest.class,
  DataBusGetFromCacheHappyTest.class,
  DataBusImplBadTest.class,
  DataBusImplHappyTest.class,
  DataBusStoreHappyTest.class,
  DataBusSubscribeHappyTest.class,
  DataBusSubscribelBadTest.class
})
public class DatabusTestSuite {}
