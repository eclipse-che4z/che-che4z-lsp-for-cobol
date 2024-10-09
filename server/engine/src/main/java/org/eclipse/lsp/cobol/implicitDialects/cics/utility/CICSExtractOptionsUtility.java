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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_extract;

/** Checks CICS Extract rules for required and invalid options */
public class CICSExtractOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_extract;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.EXTRACT, ErrorSeverity.ERROR);
          put(CICSLexer.ATTACH, ErrorSeverity.ERROR);
          put(CICSLexer.ATTACHID, ErrorSeverity.ERROR);
          put(CICSLexer.CONVID, ErrorSeverity.ERROR);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.RESOURCE, ErrorSeverity.ERROR);
          put(CICSLexer.RPROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.RRESOURCE, ErrorSeverity.ERROR);
          put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.IUTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.DATASTR, ErrorSeverity.ERROR);
          put(CICSLexer.RECFM, ErrorSeverity.ERROR);
          put(CICSLexer.ATTRIBUTES, ErrorSeverity.ERROR);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
          put(CICSLexer.CERTIFICATE, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.SERIALNUMLEN, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
          put(CICSLexer.COMMONNAMLEN, ErrorSeverity.ERROR);
          put(CICSLexer.COUNTRYLEN, ErrorSeverity.ERROR);
          put(CICSLexer.STATELEN, ErrorSeverity.ERROR);
          put(CICSLexer.LOCALITYLEN, ErrorSeverity.ERROR);
          put(CICSLexer.ORGANIZATLEN, ErrorSeverity.ERROR);
          put(CICSLexer.ORGUNITLEN, ErrorSeverity.ERROR);
          put(CICSLexer.SERIALNUM, ErrorSeverity.ERROR);
          put(CICSLexer.COMMONNAME, ErrorSeverity.ERROR);
          put(CICSLexer.COUNTRY, ErrorSeverity.ERROR);
          put(CICSLexer.LOCALITY, ErrorSeverity.ERROR);
          put(CICSLexer.ORGANIZATION, ErrorSeverity.ERROR);
          put(CICSLexer.ORGUNIT, ErrorSeverity.ERROR);
          put(CICSLexer.OWNER, ErrorSeverity.WARNING);
          put(CICSLexer.ISSUER, ErrorSeverity.WARNING);
          put(CICSLexer.LOGONMSG, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.PROCNAME, ErrorSeverity.ERROR);
          put(CICSLexer.PROCLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.MAXPROCLEN, ErrorSeverity.ERROR);
          put(CICSLexer.SYNCLEVEL, ErrorSeverity.ERROR);
          put(CICSLexer.PIPLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.PIPLIST, ErrorSeverity.ERROR);
          put(CICSLexer.TCPIP, ErrorSeverity.ERROR);
          put(CICSLexer.AUTHENTICATE, ErrorSeverity.ERROR);
          put(CICSLexer.CLNTIPFAMILY, ErrorSeverity.ERROR);
          put(CICSLexer.SRVRIPFAMILY, ErrorSeverity.ERROR);
          put(CICSLexer.SSLTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.PRIVACY, ErrorSeverity.ERROR);
          put(CICSLexer.CLIENTNAME, ErrorSeverity.ERROR);
          put(CICSLexer.CNAMELENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.SERVERNAME, ErrorSeverity.ERROR);
          put(CICSLexer.SNAMELENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.CLIENTADDR, ErrorSeverity.ERROR);
          put(CICSLexer.CADDRLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.CLIENTADDRNU, ErrorSeverity.ERROR);
          put(CICSLexer.CLNTADDR6NU, ErrorSeverity.ERROR);
          put(CICSLexer.SERVERADDR, ErrorSeverity.ERROR);
          put(CICSLexer.SADDRLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.SERVERADDRNU, ErrorSeverity.ERROR);
          put(CICSLexer.SRVRADDR6NU, ErrorSeverity.ERROR);
          put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.PORTNUMBER, ErrorSeverity.ERROR);
          put(CICSLexer.PORTNUMNU, ErrorSeverity.ERROR);
          put(CICSLexer.MAXDATALEN, ErrorSeverity.ERROR);
          put(CICSLexer.TCT, ErrorSeverity.ERROR);
          put(CICSLexer.NETNAME, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.TERMID, ErrorSeverity.ERROR);
          put(CICSLexer.WEB, ErrorSeverity.ERROR);
          put(CICSLexer.REQUESTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.SCHEME, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.HOST, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPVERSION, ErrorSeverity.ERROR);
          put(CICSLexer.VERSIONLEN, ErrorSeverity.ERROR);
          put(CICSLexer.PATH, ErrorSeverity.ERROR);
          put(CICSLexer.PATHLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPMETHOD, ErrorSeverity.ERROR);
          put(CICSLexer.METHODLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.QUERYSTRING, ErrorSeverity.ERROR);
          put(CICSLexer.QUERYSTRLEN, ErrorSeverity.ERROR);
          put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
          put(CICSLexer.SESSTOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.REALM, ErrorSeverity.ERROR);
          put(CICSLexer.REALMLEN, ErrorSeverity.ERROR);
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
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_extract_attach:
        checkAttach((CICSParser.Cics_extract_attachContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_attributes:
        checkAttributes((CICSParser.Cics_extract_attributesContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_certificate:
        checkCertificate((CICSParser.Cics_extract_certificateContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_logonmessage:
        checkLogonMsg((CICSParser.Cics_extract_logonmessageContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_process:
        checkProcess((CICSParser.Cics_extract_processContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_tcpip:
        checkTcpIp((CICSParser.Cics_extract_tcpipContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_tct:
        checkTCT((CICSParser.Cics_extract_tctContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_web_client:
        checkWebClient((CICSParser.Cics_extract_web_clientContext) ctx);
        break;
      case CICSParser.RULE_cics_extract_web_server:
        checkWebServer((CICSParser.Cics_extract_web_serverContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkAttach(CICSParser.Cics_extract_attachContext ctx) {
    checkHasMandatoryOptions(ctx.ATTACH(), ctx, "ATTACH");
    checkHasMutuallyExclusiveOptions(
        "ATTACHID or CONVID or SESSION", ctx.ATTACHID(), ctx.CONVID(), ctx.SESSION());
  }

  private void checkAttributes(CICSParser.Cics_extract_attributesContext ctx) {
    checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
    checkHasMandatoryOptions(ctx.STATE(), ctx, "STATE");

    checkHasMutuallyExclusiveOptions("CONVID or SESSION", ctx.SESSION(), ctx.CONVID());
  }

  private void checkCertificate(CICSParser.Cics_extract_certificateContext ctx) {
    checkHasMandatoryOptions(ctx.CERTIFICATE(), ctx, "CERTIFICATE");
    checkHasMutuallyExclusiveOptions("ISSUER or OWNER", ctx.ISSUER(), ctx.OWNER());
  }

  private void checkLogonMsg(CICSParser.Cics_extract_logonmessageContext ctx) {
    checkHasMandatoryOptions(ctx.LOGONMSG(), ctx, "LOGONMSG");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.INTO(), ctx.SET());
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

    checkHasMutuallyExclusiveOptions("TERMID or SYSID", ctx.TERMID(), ctx.SYSID());
  }

  private void checkWebClient(CICSParser.Cics_extract_web_clientContext ctx) {
    checkHasMandatoryOptions(ctx.WEB(), ctx, "WEB");
    checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");

    if (ctx.REALM().isEmpty()) checkHasIllegalOptions(ctx.REALMLEN(), "REALMLEN without REALM");

    if (ctx.HOST().isEmpty()) {
      checkHasIllegalOptions(ctx.HOSTLENGTH(), "HOSTLENGTH without HOST");
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without without HOST");
    } else if (ctx.HOSTLENGTH().isEmpty())
      checkHasIllegalOptions(ctx.HOSTTYPE(), "HOSTTYPE without HOSTLENGTH");
    if (ctx.HTTPVERSION().isEmpty())
      checkHasIllegalOptions(ctx.VERSIONLEN(), "VERSIONLEN without HTTPVERSION");
    if (ctx.PATH().isEmpty()) checkHasIllegalOptions(ctx.PATHLENGTH(), "PATHLENGTH without PATH");
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
