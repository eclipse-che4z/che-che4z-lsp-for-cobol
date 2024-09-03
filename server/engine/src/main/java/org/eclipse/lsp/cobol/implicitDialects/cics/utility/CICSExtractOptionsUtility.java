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

package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.List;

/** Checks CICS Extract rules for required and invalid options */
public class CICSExtractOptionsUtility extends CICSOptionsCheckBaseUtility {
  public CICSExtractOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors);
  }

  /**
   * Entrypoint to check CICS Extract rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_extract_attachContext.class)
      checkAttach((CICSParser.Cics_extract_attachContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_attributesContext.class)
      checkAttributes((CICSParser.Cics_extract_attributesContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_certificateContext.class)
      checkCertificate((CICSParser.Cics_extract_certificateContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_logonmessageContext.class)
      checkLogonMsg((CICSParser.Cics_extract_logonmessageContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_processContext.class)
      checkProcess((CICSParser.Cics_extract_processContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_tcpipContext.class)
      checkTcpIp((CICSParser.Cics_extract_tcpipContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_tctContext.class)
      checkTCT((CICSParser.Cics_extract_tctContext) ctx);
  }

  private void checkAttach(CICSParser.Cics_extract_attachContext ctx) {
    if (!ctx.ATTACHID().isEmpty()) {
      checkHasIllegalOptions(ctx.CONVID(), "CONVID with ATTACHID");
      checkHasIllegalOptions(ctx.SESSION(), "SESSION with ATTACHID");
    } else if (!ctx.CONVID().isEmpty()) {
      checkHasIllegalOptions(ctx.ATTACHID(), "ATTACHID with CONVID");
      checkHasIllegalOptions(ctx.SESSION(), "SESSION with CONVID");
    } else if (!ctx.SESSION().isEmpty()) {
      checkHasIllegalOptions(ctx.ATTACHID(), "ATTACHID with SESSION");
      checkHasIllegalOptions(ctx.CONVID(), "CONVID with ATTACHID");
    }

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ATTACHID(), "ATTACHID"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    contexts.add(new RuleContextData(ctx.PROCESS(), "PROCESS"));
    contexts.add(new RuleContextData(ctx.RESOURCE(), "RESOURCE"));
    contexts.add(new RuleContextData(ctx.RPROCESS(), "RPROCESS"));
    contexts.add(new RuleContextData(ctx.RRESOURCE(), "RRESOURCE"));
    contexts.add(new RuleContextData(ctx.QUEUE(), "QUEUE"));
    contexts.add(new RuleContextData(ctx.IUTYPE(), "IUTYPE"));
    contexts.add(new RuleContextData(ctx.DATASTR(), "DATASTR"));
    contexts.add(new RuleContextData(ctx.RECFM(), "RECFM"));
    checkDuplicates(contexts);
  }

  private void checkAttributes(CICSParser.Cics_extract_attributesContext ctx) {
    checkHasMandatoryOptions(ctx.STATE(), ctx, "STATE");

    if (!ctx.SESSION().isEmpty()) checkHasIllegalOptions(ctx.CONVID(), "CONVID with SESSION");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    checkDuplicates(contexts);
  }

  private void checkCertificate(CICSParser.Cics_extract_certificateContext ctx) {

    if (!ctx.OWNER().isEmpty()) checkHasIllegalOptions(ctx.ISSUER(), "ISSUER with OWNER");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ISSUER(), "ISSUER"));
    contexts.add(new RuleContextData(ctx.OWNER(), "OWNER"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.SERIALNUM(), "SERIALNUM"));
    contexts.add(new RuleContextData(ctx.SERIALNUMLEN(), "SERIALNUMLEN"));
    contexts.add(new RuleContextData(ctx.USERID(), "USERID"));
    contexts.add(new RuleContextData(ctx.COMMONNAME(), "COMMONNAME"));
    contexts.add(new RuleContextData(ctx.COMMONNAMLEN(), "COMMONNAMLEN"));
    contexts.add(new RuleContextData(ctx.COUNTRY(), "COUNTRY"));
    contexts.add(new RuleContextData(ctx.COUNTRYLEN(), "COUNTRYLEN"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.STATELEN(), "STATELEN"));
    contexts.add(new RuleContextData(ctx.LOCALITY(), "LOCALITY"));
    contexts.add(new RuleContextData(ctx.LOCALITYLEN(), "LOCALITYLEN"));
    contexts.add(new RuleContextData(ctx.ORGANIZATION(), "ORGANIZATION"));
    contexts.add(new RuleContextData(ctx.ORGANIZATLEN(), "ORGANIZATLEN"));
    contexts.add(new RuleContextData(ctx.ORGUNIT(), "ORGUNIT"));
    contexts.add(new RuleContextData(ctx.ORGANIZATLEN(), "ORGUNITLEN"));
    checkDuplicates(contexts);
  }

  private void checkLogonMsg(CICSParser.Cics_extract_logonmessageContext ctx) {
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    if (!ctx.INTO().isEmpty()) checkHasIllegalOptions(ctx.SET(), "SET with INTO");
    else checkHasMandatoryOptions(ctx.SET(), ctx, "INTO or SET");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.SET(), "SET"));
    contexts.add(new RuleContextData(ctx.INTO(), "INTO"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    checkDuplicates(contexts);
  }

  private void checkProcess(CICSParser.Cics_extract_processContext ctx) {
    if (ctx.PROCNAME().isEmpty()) {
      checkHasIllegalOptions(ctx.PROCLENGTH(), "PROCLENGTH without PROCNAME");
      checkHasIllegalOptions(ctx.MAXPROCLEN(), "MAXPROCLEN without PROCNAME");
    } else if (ctx.PROCLENGTH().isEmpty())
      checkHasIllegalOptions(ctx.MAXPROCLEN(), "MAXPROCLEN without PROCLENGTH");

    if (ctx.PIPLIST().isEmpty())
      checkHasIllegalOptions(ctx.PIPLENGTH(), "PIPLENGTH without PIPLIST");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PROCNAME(), "PROCNAME"));
    contexts.add(new RuleContextData(ctx.PROCLENGTH(), "PROCLENGTH"));
    contexts.add(new RuleContextData(ctx.MAXPROCLEN(), "MAXPROCLENGTH"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SYNCLEVEL(), "SYNCLEVEL"));
    contexts.add(new RuleContextData(ctx.PIPLIST(), "PIPLIST"));
    contexts.add(new RuleContextData(ctx.PIPLENGTH(), "PIPLENGTH"));
    checkDuplicates(contexts);
  }

  private void checkTcpIp(CICSParser.Cics_extract_tcpipContext ctx) {
    if (ctx.CLIENTNAME().isEmpty())
      checkHasIllegalOptions(ctx.CNAMELENGTH(), "CNAMELENGTH without CLIENTNAME");
    if (ctx.SERVERNAME().isEmpty())
      checkHasIllegalOptions(ctx.SNAMELENGTH(), "SNAMELENGTH without SERVERNAME");
    if (ctx.CLIENTADDR().isEmpty())
      checkHasIllegalOptions(ctx.CADDRLENGTH(), "CADDRLENGTH without CLIENTADDR");
    if (ctx.SERVERADDR().isEmpty())
      checkHasIllegalOptions(ctx.SADDRLENGTH(), "SADDRLENGTH without SERVERADDR");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.AUTHENTICATE(), "AUTHENTICATE"));
    contexts.add(new RuleContextData(ctx.CLIENTNAME(), "CLIENTNAME"));
    contexts.add(new RuleContextData(ctx.CNAMELENGTH(), "CNAMELENGTH"));
    contexts.add(new RuleContextData(ctx.SERVERNAME(), "SERVERNAME"));
    contexts.add(new RuleContextData(ctx.SNAMELENGTH(), "SNAMELENGTH"));
    contexts.add(new RuleContextData(ctx.CLIENTADDR(), "CLIENTADDR"));
    contexts.add(new RuleContextData(ctx.CADDRLENGTH(), "CADDRLENGTH"));
    contexts.add(new RuleContextData(ctx.CLNTIPFAMILY(), "CLNTIPFAMILY"));
    contexts.add(new RuleContextData(ctx.CLIENTADDRNU(), "CLIENTADDRNU"));
    contexts.add(new RuleContextData(ctx.CLNTADDR6NU(), "CLNTADDR6NU"));
    contexts.add(new RuleContextData(ctx.SERVERADDR(), "SERVERADDR"));
    contexts.add(new RuleContextData(ctx.SADDRLENGTH(), "SADDRLENGTH"));
    contexts.add(new RuleContextData(ctx.SRVRIPFAMILY(), "SRVRIPFAMILY"));
    contexts.add(new RuleContextData(ctx.SERVERADDRNU(), "SERVERADDRNU"));
    contexts.add(new RuleContextData(ctx.SRVRADDR6NU(), "SRVRADDR6NU"));
    contexts.add(new RuleContextData(ctx.SSLTYPE(), "SSLTYPE"));
    contexts.add(new RuleContextData(ctx.TCPIPSERVICE(), "TCPIPSERVICE"));
    contexts.add(new RuleContextData(ctx.PORTNUMBER(), "PORTNUMBER"));
    contexts.add(new RuleContextData(ctx.PORTNUMNU(), "PORTNUMNU"));
    contexts.add(new RuleContextData(ctx.PRIVACY(), "PRIVACY"));
    contexts.add(new RuleContextData(ctx.MAXDATALEN(), "MAXDATALEN"));
    checkDuplicates(contexts);
  }

  private void checkTCT(CICSParser.Cics_extract_tctContext ctx) {
    checkHasMandatoryOptions(ctx.NETNAME(), ctx, "NETNAME");

    if (!ctx.SYSID().isEmpty()) checkHasIllegalOptions(ctx.TERMID(), "TERMID with SYSID");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.NETNAME(), "NETNAME"));
    contexts.add(new RuleContextData(ctx.TERMID(), "TERMID"));
    contexts.add(new RuleContextData(ctx.SYSID(), "SYSID"));
    checkDuplicates(contexts);
  }
}
