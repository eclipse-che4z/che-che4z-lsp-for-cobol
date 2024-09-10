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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_extract;

/** Checks CICS Extract rules for required and invalid options */
public class CICSExtractOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_extract;

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
    else if (ctx.getClass() == CICSParser.Cics_extract_webContext.class)
      checkWeb((CICSParser.Cics_extract_webContext) ctx);
  }

  private void checkAttach(CICSParser.Cics_extract_attachContext ctx) {
    checkHasMandatoryOptions(ctx.ATTACH(), ctx, "ATTACH");
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
    contexts.add(new RuleContextData(ctx.ATTACH(), "ATTACH"));
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
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkAttributes(CICSParser.Cics_extract_attributesContext ctx) {
    checkHasMandatoryOptions(ctx.ATTRIBUTES(), ctx, "ATTRIBUTES");
    checkHasMandatoryOptions(ctx.STATE(), ctx, "STATE");

    if (!ctx.SESSION().isEmpty()) checkHasIllegalOptions(ctx.CONVID(), "CONVID with SESSION");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ATTRIBUTES(), "ATTRIBUTES"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkCertificate(CICSParser.Cics_extract_certificateContext ctx) {
    checkHasMandatoryOptions(ctx.CERTIFICATE(), ctx, "CERTIFICATE");
    if (!ctx.OWNER().isEmpty()) checkHasIllegalOptions(ctx.ISSUER(), "ISSUER with OWNER");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.CERTIFICATE(), "CERTIFICATE"));
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
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkLogonMsg(CICSParser.Cics_extract_logonmessageContext ctx) {
    checkHasMandatoryOptions(ctx.LOGONMSG(), ctx, "LOGONMSG");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    if (!ctx.INTO().isEmpty()) checkHasIllegalOptions(ctx.SET(), "SET with INTO");
    else checkHasMandatoryOptions(ctx.SET(), ctx, "INTO or SET");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.LOGONMSG(), "LOGONMSG"));
    contexts.add(new RuleContextData(ctx.SET(), "SET"));
    contexts.add(new RuleContextData(ctx.INTO(), "INTO"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
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

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PROCESS(), "PROCESS"));
    contexts.add(new RuleContextData(ctx.PROCNAME(), "PROCNAME"));
    contexts.add(new RuleContextData(ctx.PROCLENGTH(), "PROCLENGTH"));
    contexts.add(new RuleContextData(ctx.MAXPROCLEN(), "MAXPROCLENGTH"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SYNCLEVEL(), "SYNCLEVEL"));
    contexts.add(new RuleContextData(ctx.PIPLIST(), "PIPLIST"));
    contexts.add(new RuleContextData(ctx.PIPLENGTH(), "PIPLENGTH"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
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

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.TCPIP(), "TCPIP"));
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
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkTCT(CICSParser.Cics_extract_tctContext ctx) {
    checkHasMandatoryOptions(ctx.TCT(), ctx, "TCT");
    checkHasMandatoryOptions(ctx.NETNAME(), ctx, "NETNAME");

    if (!ctx.SYSID().isEmpty()) checkHasIllegalOptions(ctx.TERMID(), "TERMID with SYSID");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.TCT(), "TCT"));
    contexts.add(new RuleContextData(ctx.NETNAME(), "NETNAME"));
    contexts.add(new RuleContextData(ctx.TERMID(), "TERMID"));
    contexts.add(new RuleContextData(ctx.SYSID(), "SYSID"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkWeb(CICSParser.Cics_extract_webContext ctx) {
    List<RuleContextData> contexts = new ArrayList<>();

    if (ctx.cics_extract_web_server() != null) {
      CICSParser.Cics_extract_web_serverContext server = ctx.cics_extract_web_server();

      if (server.HTTPMETHOD().isEmpty())
        checkHasIllegalOptions(server.METHODLENGTH(), "METHODLENGTH without HTTPMETHOD");
      if (server.QUERYSTRING().isEmpty())
        checkHasIllegalOptions(server.QUERYSTRLEN(), "QUERYSTRLEN without QUERYSTRING");

      contexts.add(new RuleContextData(server.SCHEME(), "SCHEME"));
      contexts.add(new RuleContextData(server.HTTPMETHOD(), "HTTPMETHOD"));
      contexts.add(new RuleContextData(server.METHODLENGTH(), "METHODLENGTH"));
      contexts.add(new RuleContextData(server.QUERYSTRING(), "QUERYSTRING"));
      contexts.add(new RuleContextData(server.QUERYSTRLEN(), "QUERYSTRLEN"));
      contexts.add(new RuleContextData(server.REQUESTTYPE(), "REQUESTTYPE"));

      harvestResponseHandlers(server.cics_handle_response(), contexts);
    } else if (ctx.cics_extract_web_client() != null) {
      CICSParser.Cics_extract_web_clientContext client = ctx.cics_extract_web_client();
      checkHasMandatoryOptions(client.SESSTOKEN(), client, "SESSTOKEN");

      if (client.REALM().isEmpty())
        checkHasIllegalOptions(client.REALMLEN(), "REALMLEN without REALM");

      contexts.add(new RuleContextData(client.SESSTOKEN(), "SESSTOKEN"));
      contexts.add(new RuleContextData(client.SCHEME(), "SCHEME"));
      contexts.add(new RuleContextData(client.REALM(), "REALM"));
      contexts.add(new RuleContextData(client.REALMLEN(), "REALMLEN"));
      harvestResponseHandlers(client.cics_handle_response(), contexts);
    }
    checkWebCommon(ctx);
    checkDuplicates(contexts);
  }

  private void checkWebCommon(CICSParser.Cics_extract_webContext ctx) {

    List<TerminalNode> web;
    List<TerminalNode> scheme;
    List<TerminalNode> host;
    List<TerminalNode> hostLength;
    List<TerminalNode> hostType;
    List<TerminalNode> httpVersion;
    List<TerminalNode> versionLen;
    List<TerminalNode> path;
    List<TerminalNode> pathLength;
    List<TerminalNode> portNumber;
    List<TerminalNode> uriMap;

    if (ctx.cics_extract_web_server() != null) {
      CICSParser.Cics_extract_web_serverContext server = ctx.cics_extract_web_server();
      web = server.WEB();
      scheme = server.SCHEME();
      host = server.HOST();
      hostLength = server.HOSTLENGTH();
      hostType = server.HOSTTYPE();
      httpVersion = server.HTTPVERSION();
      versionLen = server.VERSIONLEN();
      path = server.PATH();
      pathLength = server.PATHLENGTH();
      portNumber = server.PORTNUMBER();
      uriMap = server.URIMAP();
      checkHasMandatoryOptions(web, server, "WEB");
    } else {
      CICSParser.Cics_extract_web_clientContext client = ctx.cics_extract_web_client();
      web = client.WEB();
      scheme = client.SCHEME();
      host = client.HOST();
      hostLength = client.HOSTLENGTH();
      hostType = client.HOSTTYPE();
      httpVersion = client.HTTPVERSION();
      versionLen = client.VERSIONLEN();
      path = client.PATH();
      pathLength = client.PATHLENGTH();
      portNumber = client.PORTNUMBER();
      uriMap = client.URIMAP();
      checkHasMandatoryOptions(web, client, "WEB");
    }
    if (host.isEmpty()) {
      checkHasIllegalOptions(hostLength, "HOSTLENGTH without HOST");
      checkHasIllegalOptions(hostType, "HOSTTYPE without HOSTLENGTH");
    } else if (hostLength.isEmpty())
      checkHasIllegalOptions(hostType, "HOSTTYPE without HOSTLENGTH");
    if (httpVersion.isEmpty()) checkHasIllegalOptions(versionLen, "VERSIONLEN without HTTPVERSION");
    if (path.isEmpty()) checkHasIllegalOptions(pathLength, "PATHLEN without PATH");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(web, "WEB"));
    contexts.add(new RuleContextData(scheme, "SCHEME"));
    contexts.add(new RuleContextData(host, "HOST"));
    contexts.add(new RuleContextData(hostLength, "HOSTLENGTH"));
    contexts.add(new RuleContextData(hostType, "HOSTTYPE"));
    contexts.add(new RuleContextData(httpVersion, "HTTPVERSION"));
    contexts.add(new RuleContextData(versionLen, "VERSIONLEN"));
    contexts.add(new RuleContextData(path, "PATH"));
    contexts.add(new RuleContextData(pathLength, "PATHLENGTH"));
    contexts.add(new RuleContextData(portNumber, "PORTNUMBER"));
    contexts.add(new RuleContextData(uriMap, "URIMAP"));
    checkDuplicates(contexts);
  }
}
