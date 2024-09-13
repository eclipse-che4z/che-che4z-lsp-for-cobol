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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_extract;

/** Checks CICS Extract rules for required and invalid options */
public class CICSExtractOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_extract;

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("EXTRACT", ErrorSeverity.ERROR);
          put("ATTACH", ErrorSeverity.ERROR);
          put("ATTACHID", ErrorSeverity.ERROR);
          put("CONVID", ErrorSeverity.ERROR);
          put("SESSION", ErrorSeverity.ERROR);
          put("PROCESS", ErrorSeverity.ERROR);
          put("RESOURCE", ErrorSeverity.ERROR);
          put("RPROCESS", ErrorSeverity.ERROR);
          put("RRESOURCE", ErrorSeverity.ERROR);
          put("QUEUE", ErrorSeverity.ERROR);
          put("IUTYPE", ErrorSeverity.ERROR);
          put("DATASTR", ErrorSeverity.ERROR);
          put("RECFM", ErrorSeverity.ERROR);
          put("ATTRIBUTES", ErrorSeverity.ERROR);
          put("STATE", ErrorSeverity.ERROR);
          put("CERTIFICATE", ErrorSeverity.ERROR);
          put("LENGTH", ErrorSeverity.ERROR);
          put("SERIALNUMLEN", ErrorSeverity.ERROR);
          put("USERID", ErrorSeverity.ERROR);
          put("COMMONNAMELEN", ErrorSeverity.ERROR);
          put("COUNTRYLEN", ErrorSeverity.ERROR);
          put("STATELEN", ErrorSeverity.ERROR);
          put("LOCALITYLEN", ErrorSeverity.ERROR);
          put("ORGANIZATLEN", ErrorSeverity.ERROR);
          put("ORGUNITLEN", ErrorSeverity.ERROR);
          put("SERIALNUM", ErrorSeverity.ERROR);
          put("COMMONNAME", ErrorSeverity.ERROR);
          put("COUNTRY", ErrorSeverity.ERROR);
          put("LOCALITY", ErrorSeverity.ERROR);
          put("ORGANIZATION", ErrorSeverity.ERROR);
          put("ORGUNIT", ErrorSeverity.ERROR);
          put("OWNER", ErrorSeverity.WARNING);
          put("ISSUER", ErrorSeverity.WARNING);
          put("LOGONMSG", ErrorSeverity.ERROR);
          put("INTO", ErrorSeverity.ERROR);
          put("SET", ErrorSeverity.ERROR);
          put("PROCNAME", ErrorSeverity.ERROR);
          put("PROCLENGTH", ErrorSeverity.ERROR);
          put("MAXPROCLEN", ErrorSeverity.ERROR);
          put("SYNCLEVEL", ErrorSeverity.ERROR);
          put("PIPELENGTH", ErrorSeverity.ERROR);
          put("PIPLIST", ErrorSeverity.ERROR);
          put("TCPIP", ErrorSeverity.ERROR);
          put("AUTHENTICATE", ErrorSeverity.ERROR);
          put("CLNTIPFAMILY", ErrorSeverity.ERROR);
          put("SRVRIPFAMILY", ErrorSeverity.ERROR);
          put("SSLTYPE", ErrorSeverity.ERROR);
          put("PRIVACY", ErrorSeverity.ERROR);
          put("CLIENTNAME", ErrorSeverity.ERROR);
          put("CNAMELENGTH", ErrorSeverity.ERROR);
          put("SERVERNAME", ErrorSeverity.ERROR);
          put("SNAMELENGTH", ErrorSeverity.ERROR);
          put("CLIENTADDR", ErrorSeverity.ERROR);
          put("CADDRLENGTH", ErrorSeverity.ERROR);
          put("CLIENTADDRNU", ErrorSeverity.ERROR);
          put("CLNTADDR6NU", ErrorSeverity.ERROR);
          put("SERVERADDR", ErrorSeverity.ERROR);
          put("SADDRLENGTH", ErrorSeverity.ERROR);
          put("SERVERADDRNU", ErrorSeverity.ERROR);
          put("SRVRADDR6NU", ErrorSeverity.ERROR);
          put("TCPIPSERVICE", ErrorSeverity.ERROR);
          put("PORTNUMBER", ErrorSeverity.ERROR);
          put("PORTNUMNU", ErrorSeverity.ERROR);
          put("MAXDATALEN", ErrorSeverity.ERROR);
          put("TCT", ErrorSeverity.ERROR);
          put("NETNAME", ErrorSeverity.ERROR);
          put("SYSID", ErrorSeverity.ERROR);
          put("TERMID", ErrorSeverity.ERROR);
          put("WEB", ErrorSeverity.ERROR);
          put("REQUESTTYPE", ErrorSeverity.ERROR);
          put("HOSTTYPE", ErrorSeverity.ERROR);
          put("SCHEME", ErrorSeverity.ERROR);
          put("HOSTLENGTH", ErrorSeverity.ERROR);
          put("HOST", ErrorSeverity.ERROR);
          put("HTTPVERSION", ErrorSeverity.ERROR);
          put("VERSIONLEN", ErrorSeverity.ERROR);
          put("PATH", ErrorSeverity.ERROR);
          put("PATHLENGTH", ErrorSeverity.ERROR);
          put("HTTPMETHOD", ErrorSeverity.ERROR);
          put("METHODLENGTH", ErrorSeverity.ERROR);
          put("QUERYSTRING", ErrorSeverity.ERROR);
          put("QUERYSTRLEN", ErrorSeverity.ERROR);
          put("URIMAP", ErrorSeverity.ERROR);
          put("SESSTOKEN", ErrorSeverity.ERROR);
          put("REALM", ErrorSeverity.ERROR);
          put("REALMLEN", ErrorSeverity.ERROR);
        }
      };

  public CICSExtractOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
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
    else if (ctx.getClass() == CICSParser.Cics_extract_web_clientContext.class)
      checkWebClient((CICSParser.Cics_extract_web_clientContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_extract_web_serverContext.class)
      checkWebServer((CICSParser.Cics_extract_web_serverContext) ctx);
    checkDuplicates(ctx);
  }

  private void checkAttach(CICSParser.Cics_extract_attachContext ctx) {
    checkHasMandatoryOptions(ctx.ATTACH(), ctx, "ATTACH");
    checkHasMutuallyExclusiveOptions(
        "ATTACHID CONVID SESSION",
        new ArrayList<>(ctx.ATTACH()),
        new ArrayList<>(ctx.CONVID()),
        new ArrayList<>(ctx.SESSION()));
  }

  private void checkAttributes(CICSParser.Cics_extract_attributesContext ctx) {
    checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
    checkHasMandatoryOptions(ctx.STATE(), ctx, "STATE");

    if (!ctx.SESSION().isEmpty()) checkHasIllegalOptions(ctx.CONVID(), "CONVID with SESSION");
  }

  private void checkCertificate(CICSParser.Cics_extract_certificateContext ctx) {
    checkHasMandatoryOptions(ctx.CERTIFICATE(), ctx, "CERTIFICATE");
    checkHasMutuallyExclusiveOptions(
        "ISSUER OWNER", new ArrayList<>(ctx.ISSUER()), new ArrayList<>(ctx.OWNER()));
  }

  private void checkLogonMsg(CICSParser.Cics_extract_logonmessageContext ctx) {
    checkHasMandatoryOptions(ctx.LOGONMSG(), ctx, "LOGONMSG");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    checkHasExactlyOneOption(
        "INTO or SET", ctx, new ArrayList<>(ctx.INTO()), new ArrayList<>(ctx.SET()));
  }

  private void checkProcess(CICSParser.Cics_extract_processContext ctx) {
    checkHasMandatoryOptions(ctx.PROCESS(), ctx, "PROCESS");
    if (ctx.PROCNAME().isEmpty()) {
      checkHasIllegalOptions(ctx.PROCLENGTH(), "PROCLENGTH without PROCNAME");
      checkHasIllegalOptions(ctx.MAXPROCLEN(), "MAXPROCLEN without PROCNAME");
    } else if (ctx.PROCLENGTH().isEmpty())
      checkHasIllegalOptions(ctx.MAXPROCLEN(), "MAXPROCLEN without PROCLENGTH");

    if (ctx.PIPLIST().isEmpty())
      checkHasIllegalOptions(ctx.PIPLENGTH(), "PIPLENGTH without PIPLIST");
  }

  private void checkTcpIp(CICSParser.Cics_extract_tcpipContext ctx) {
    checkHasMandatoryOptions(ctx.TCPIP(), ctx, "TCPIP");
    if (ctx.CLIENTNAME().isEmpty())
      checkHasIllegalOptions(ctx.CNAMELENGTH(), "CNAMELENGTH without CLIENTNAME");
    if (ctx.SERVERNAME().isEmpty())
      checkHasIllegalOptions(ctx.SNAMELENGTH(), "SNAMELENGTH without SERVERNAME");
    if (ctx.CLIENTADDR().isEmpty())
      checkHasIllegalOptions(ctx.CADDRLENGTH(), "CADDRLENGTH without CLIENTADDR");
    if (ctx.SERVERADDR().isEmpty())
      checkHasIllegalOptions(ctx.SADDRLENGTH(), "SADDRLENGTH without SERVERADDR");
  }

  private void checkTCT(CICSParser.Cics_extract_tctContext ctx) {
    checkHasMandatoryOptions(ctx.TCT(), ctx, "TCT");
    checkHasMandatoryOptions(ctx.NETNAME(), ctx, "NETNAME");

    checkHasMutuallyExclusiveOptions(
        "TERMID SYSID", new ArrayList<>(ctx.TERMID()), new ArrayList<>(ctx.SYSID()));
  }

  private void checkWebClient(CICSParser.Cics_extract_web_clientContext ctx) {
    checkHasMandatoryOptions(ctx.WEB(), ctx, "WEB");
    checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");

    if (ctx.REALM().isEmpty()) checkHasIllegalOptions(ctx.REALMLEN(), "REALMLEN without REALM");

    if (ctx.HOST().isEmpty()) {
      checkHasIllegalOptions(ctx.HOSTLENGTH(), "HOSTLENGTH without HOST");
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without HOSTLENGTH");
    } else if (ctx.HOSTLENGTH().isEmpty())
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without HOSTLENGTH");
    if (ctx.HTTPVERSION().isEmpty())
      checkHasIllegalOptions(ctx.VERSIONLEN(), "VERSIONLEN without HTTPVERSION");
    if (ctx.PATH().isEmpty()) checkHasIllegalOptions(ctx.PATHLENGTH(), "PATHLEN without PATH");
  }

  private void checkWebServer(CICSParser.Cics_extract_web_serverContext ctx) {
    checkHasMandatoryOptions(ctx.WEB(), ctx, "WEB");
    if (ctx.HTTPMETHOD().isEmpty())
      checkHasIllegalOptions(ctx.METHODLENGTH(), "METHODLENGTH without HTTPMETHOD");
    if (ctx.QUERYSTRING().isEmpty())
      checkHasIllegalOptions(ctx.QUERYSTRLEN(), "QUERYSTRLEN without QUERYSTRING");

    if (ctx.HOST().isEmpty()) {
      checkHasIllegalOptions(ctx.HOSTLENGTH(), "HOSTLENGTH without HOST");
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without HOSTLENGTH");
    } else if (ctx.HOSTLENGTH().isEmpty())
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without HOSTLENGTH");
    if (ctx.HTTPVERSION().isEmpty())
      checkHasIllegalOptions(ctx.VERSIONLEN(), "VERSIONLEN without HTTPVERSION");
    if (ctx.PATH().isEmpty()) checkHasIllegalOptions(ctx.PATHLENGTH(), "PATHLEN without PATH");
  }
}
