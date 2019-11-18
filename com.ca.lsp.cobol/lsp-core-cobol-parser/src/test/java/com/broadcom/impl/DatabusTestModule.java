package com.broadcom.impl;

import com.broadcom.lsp.cdi.module.DefaultModule;
import com.google.inject.name.Names;

public class DatabusTestModule extends DefaultModule {
  @Override
  protected void configure() {
    super.configure();
    bindConstant().annotatedWith(Names.named("ASYNC-MESS-DISPATCHER")).to(10);
    bindConstant().annotatedWith(Names.named("CACHE-MAX-SIZE")).to(5);
  }
}
