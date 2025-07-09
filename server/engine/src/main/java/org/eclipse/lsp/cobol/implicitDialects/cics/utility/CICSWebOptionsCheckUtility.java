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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_web;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS Web rules for required and invalid options */
public class CICSWebOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_web;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.CLOSE, ErrorSeverity.ERROR);
          put(CICSLexer.SESSTOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.CONVERSE, ErrorSeverity.ERROR);
          put(CICSLexer.PATH, ErrorSeverity.ERROR);
          put(CICSLexer.PATHLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
          put(CICSLexer.GET, ErrorSeverity.ERROR);
          put(CICSLexer.HEAD, ErrorSeverity.ERROR);
          put(CICSLexer.PATCH, ErrorSeverity.ERROR);
          put(CICSLexer.POST, ErrorSeverity.ERROR);
          put(CICSLexer.PUT, ErrorSeverity.ERROR);
          put(CICSLexer.TRACE, ErrorSeverity.ERROR);
          put(CICSLexer.OPTIONS, ErrorSeverity.ERROR);
          put(CICSLexer.DELETE, ErrorSeverity.ERROR);
          put(CICSLexer.METHOD, ErrorSeverity.ERROR);
          put(CICSLexer.MEDIATYPE, ErrorSeverity.ERROR);
          put(CICSLexer.QUERYSTRING, ErrorSeverity.ERROR);
          put(CICSLexer.QUERYSTRLEN, ErrorSeverity.ERROR);
          put(CICSLexer.DOCTOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.FROM, ErrorSeverity.ERROR);
          put(CICSLexer.FROMLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
          put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.ACTION, ErrorSeverity.ERROR);
          put(CICSLexer.CLOSESTATUS, ErrorSeverity.ERROR);
          put(CICSLexer.AUTHENTICATE, ErrorSeverity.ERROR);
          put(CICSLexer.USERNAME, ErrorSeverity.ERROR);
          put(CICSLexer.USERNAMELEN, ErrorSeverity.ERROR);
          put(CICSLexer.PASSWORD, ErrorSeverity.ERROR);
          put(CICSLexer.PASSWORDLEN, ErrorSeverity.ERROR);
          put(CICSLexer.INTO, ErrorSeverity.ERROR);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.TOCONTAINER, ErrorSeverity.ERROR);
          put(CICSLexer.TOCHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.TOLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.MAXLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.STATUSCODE, ErrorSeverity.ERROR);
          put(CICSLexer.STATUSTEXT, ErrorSeverity.ERROR);
          put(CICSLexer.STATUSLEN, ErrorSeverity.ERROR);
          put(CICSLexer.CHARACTERSET, ErrorSeverity.ERROR);
          put(CICSLexer.CLIENTCONV, ErrorSeverity.ERROR);
          put(CICSLexer.BODYCHARSET, ErrorSeverity.ERROR);
          put(CICSLexer.ENDBROWSE, ErrorSeverity.ERROR);
          put(CICSLexer.FORMFIELD, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPHEADER, ErrorSeverity.ERROR);
          put(CICSLexer.QUERYPARM, ErrorSeverity.ERROR);
          put(CICSLexer.EXTRACT, ErrorSeverity.ERROR);
          put(CICSLexer.SCHEME, ErrorSeverity.ERROR);
          put(CICSLexer.HOST, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPMETHOD, ErrorSeverity.ERROR);
          put(CICSLexer.METHODLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPVERSION, ErrorSeverity.ERROR);
          put(CICSLexer.VERSIONLEN, ErrorSeverity.ERROR);
          put(CICSLexer.PORTNUMBER, ErrorSeverity.ERROR);
          put(CICSLexer.REQUESTTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.REALM, ErrorSeverity.ERROR);
          put(CICSLexer.REALMLEN, ErrorSeverity.ERROR);
          put(CICSLexer.OPEN, ErrorSeverity.ERROR);
          put(CICSLexer.CERTIFICATE, ErrorSeverity.ERROR);
          put(CICSLexer.CODEPAGE, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPVNUM, ErrorSeverity.ERROR);
          put(CICSLexer.HTTPRNUM, ErrorSeverity.ERROR);
          put(CICSLexer.CIPHERS, ErrorSeverity.ERROR);
          put(CICSLexer.NUMCIPHERS, ErrorSeverity.ERROR);
          put(CICSLexer.PARSE, ErrorSeverity.ERROR);
          put(CICSLexer.URL, ErrorSeverity.ERROR);
          put(CICSLexer.SCHEMENAME, ErrorSeverity.ERROR);
          put(CICSLexer.READ, ErrorSeverity.ERROR);
          put(CICSLexer.NAMELENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.VALUE, ErrorSeverity.ERROR);
          put(CICSLexer.VALUELENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.HOSTCODEPAGE, ErrorSeverity.ERROR);
          put(CICSLexer.READNEXT, ErrorSeverity.ERROR);
          put(CICSLexer.TYPE, ErrorSeverity.ERROR);
          put(CICSLexer.SERVERCONV, ErrorSeverity.ERROR);
          put(CICSLexer.RECEIVE, ErrorSeverity.ERROR);
          put(CICSLexer.RETRIEVE, ErrorSeverity.ERROR);
          put(CICSLexer.SEND, ErrorSeverity.ERROR);
          put(CICSLexer.CHUNKING, ErrorSeverity.ERROR);
          put(CICSLexer.STARTBROWSE, ErrorSeverity.ERROR);
          put(CICSLexer.WRITE, ErrorSeverity.ERROR);
          put(CICSLexer.NODOCDELETE, ErrorSeverity.WARNING);
          put(CICSLexer.DOCDELETE, ErrorSeverity.WARNING);
          put(CICSLexer.DOCSTATUS, ErrorSeverity.WARNING);
          put(CICSLexer.EXPECT, ErrorSeverity.WARNING);
          put(CICSLexer.NOCLOSE, ErrorSeverity.WARNING);
          put(CICSLexer.NONE, ErrorSeverity.WARNING);
          put(CICSLexer.BASICAUTH, ErrorSeverity.WARNING);
          put(CICSLexer.NOTRUNCATE, ErrorSeverity.WARNING);
          put(CICSLexer.CLICONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.NOINCONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.NOOUTCONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.NOCLICONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.SRVCONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.NOSRVCONVERT, ErrorSeverity.WARNING);
          put(CICSLexer.CHUNKNO, ErrorSeverity.WARNING);
          put(CICSLexer.CHUNKYES, ErrorSeverity.WARNING);
          put(CICSLexer.CHUNKEND, ErrorSeverity.WARNING);
          put(CICSLexer.IMMEDIATE, ErrorSeverity.WARNING);
          put(CICSLexer.EVENTUAL, ErrorSeverity.WARNING);
        }
      };

  public CICSWebOptionsCheckUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS WEB rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_web_close:
        checkClose((CICSParser.Cics_web_closeContext) ctx);
        break;
      case CICSParser.RULE_cics_web_converse:
        checkConverse((CICSParser.Cics_web_converseContext) ctx);
        break;
      case CICSParser.RULE_cics_web_endbrowse:
        checkEndbrowse((CICSParser.Cics_web_endbrowseContext) ctx);
        break;
      case CICSParser.RULE_cics_web_extract:
        checkExtract((CICSParser.Cics_web_extractContext) ctx);
        break;
      case CICSParser.RULE_cics_web_open:
        checkOpen((CICSParser.Cics_web_openContext) ctx);
        break;
      case CICSParser.RULE_cics_web_parse:
        checkParse((CICSParser.Cics_web_parseContext) ctx);
        break;
      case CICSParser.RULE_cics_web_read:
        checkRead((CICSParser.Cics_web_readContext) ctx);
        break;
      case CICSParser.RULE_cics_web_readnext:
        checkReadNext((CICSParser.Cics_web_readnextContext) ctx);
        break;
      case CICSParser.RULE_cics_web_retrieve:
        checkRetrieve((CICSParser.Cics_web_retrieveContext) ctx);
        break;
      case CICSParser.RULE_cics_web_receive:
        checkReceive((CICSParser.Cics_web_receiveContext) ctx);
        break;
      case CICSParser.RULE_cics_web_send:
        checkSend((CICSParser.Cics_web_sendContext) ctx);
        break;
      case CICSParser.RULE_cics_web_startbrowse:
        checkStartbrowse((CICSParser.Cics_web_startbrowseContext) ctx);
        break;
      case CICSParser.RULE_cics_web_write:
        checkWrite((CICSParser.Cics_web_writeContext) ctx);
        break;
      default:
        break;
    }

    checkDuplicates(ctx);
  }

  // Main rules
  private void checkClose(CICSParser.Cics_web_closeContext ctx) {
    checkHasMandatoryOptions(ctx.CLOSE(), ctx, "CLOSE");
    checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
  }

  private void checkConverse(CICSParser.Cics_web_converseContext ctx) {
    checkHasMandatoryOptions(ctx.CONVERSE(), ctx, "CONVERSE");
    checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
    checkMutuallyExclusiveOptions("PATH or URIMAP", ctx.PATH(), ctx.URIMAP());
    checkHasExactlyOneOption(
        "GET, HEAD, PATCH, POST, PUT, TRACE, OPTIONS, DELETE or METHOD",
        ctx,
        ctx.GET(),
        ctx.HEAD(),
        ctx.PATCH(),
        ctx.POST(),
        ctx.PUT(),
        ctx.TRACE(),
        ctx.OPTIONS(),
        ctx.DELETE(),
        ctx.METHOD());
    checkPrerequisiteIsMet(
        ctx.QUERYSTRING(), ctx.QUERYSTRLEN(), ctx, "QUERYSTRLEN without QUERYSTRING");
    // Body subsection
    checkMutuallyExclusiveOptions(
        "DOCTOKEN, FROM or CONTAINER", ctx.DOCTOKEN(), ctx.FROM(), ctx.CONTAINER());

    checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.NODOCDELETE(), ctx, "NODOCDELETE without DOCTOKEN");
    checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCDELETE(), ctx, "DOCDELETE without DOCTOKEN");
    checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCSTATUS(), ctx, "DOCSTATUS without DOCTOKEN");
    checkMutuallyExclusiveOptions(
        "NODOCDELETE, DOCDELETE or DOCSTATUS", ctx.NODOCDELETE(), ctx.DOCDELETE(), ctx.DOCSTATUS());

    checkAllOptionsArePresentOrAbsent("FROM and FROMLENGTH", ctx, ctx.FROM(), ctx.FROMLENGTH());

    checkPrerequisiteIsMet(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CHANNEL without CONTAINER");
    // END - Body subsection

    checkMutuallyExclusiveOptions("ACTION or EXPECT", ctx.ACTION(), ctx.EXPECT());
    checkMutuallyExclusiveOptions(
        "NOCLOSE, CLOSE or CLOSESTATUS", ctx.NOCLOSE(), ctx.CLOSE(), ctx.CLOSESTATUS());

    checkMutuallyExclusiveOptions(
        "NONE, BASICAUTH, AUTHENTICATE", ctx.NONE(), ctx.BASICAUTH(), ctx.AUTHENTICATE());
    if (!ctx.NONE().isEmpty() || !ctx.BASICAUTH().isEmpty() || !ctx.AUTHENTICATE().isEmpty()) {
      checkAllOptionsArePresentOrAbsent(
          "USERNAME and PASSWORD", ctx, ctx.USERNAME(), ctx.PASSWORD());
    } else {
      checkHasIllegalOptions(ctx.USERNAME(), "USERNAME without NONE, BASICAUTH or AUTHENTICATE");
      checkHasIllegalOptions(
          ctx.USERNAMELEN(), "USERNAMELEN without NONE, BASICAUTH or AUTHENTICATE");
    }
    if (!ctx.TOLENGTH().isEmpty())
      checkHasExactlyOneOption("INTO or SET", ctx, ctx.INTO(), ctx.SET());
    else
      checkHasExactlyOneOption(
          "INTO, SET or TOCONTAINER", ctx, ctx.INTO(), ctx.SET(), ctx.TOCONTAINER());
    checkPrerequisiteIsMet(
        ctx.TOCONTAINER(), ctx.TOCHANNEL(), ctx, "TOCHANNEL without TOCONTAINER");

    if (!ctx.INTO().isEmpty() || !ctx.SET().isEmpty()) {
      checkHasMandatoryOptions(ctx.TOLENGTH(), ctx, "TOLENGTH");
      if (noLengthOptionsEnabled() && !ctx.INTO().isEmpty())
        checkHasMandatoryOptions(ctx.MAXLENGTH(), ctx, "MAXLENGTH");
    }

    checkAllOptionsArePresentOrAbsent(
        "STATUSCODE, STATUSTEXT, STATUSLEN",
        ctx,
        ctx.STATUSCODE(),
        ctx.STATUSTEXT(),
        ctx.STATUSLEN());

    checkMutuallyExclusiveOptions(
        "CLICONVERT, NOINCONVERT, NOOUTCONVERT, NOCLICONVERT, CLIENTCONV",
        ctx.CLICONVERT(),
        ctx.NOINCONVERT(),
        ctx.NOOUTCONVERT(),
        ctx.NOCLICONVERT(),
        ctx.CLIENTCONV());
    checkOptionalWithLength(ctx.PATH(), ctx.PATHLENGTH(), ctx, "PATH", "PATHLENGTH");
    checkOptionalWithLength(ctx.PASSWORD(), ctx.PASSWORDLEN(), ctx, "PASSWORD", "PASSWORDLEN");
    checkOptionalWithLength(ctx.USERNAME(), ctx.USERNAMELEN(), ctx, "USERNAME", "USERNAMELEN");
  }

  private void checkEndbrowse(CICSParser.Cics_web_endbrowseContext ctx) {
    checkHasMandatoryOptions(ctx.ENDBROWSE(), ctx, "ENDBROWSE");
    checkHasExactlyOneOption(
        "FORMFIELD, HTTPHEADER, QUERYPARM",
        ctx,
        ctx.FORMFIELD(),
        ctx.HTTPHEADER(),
        ctx.QUERYPARM());
    checkPrerequisiteIsMet(ctx.HTTPHEADER(), ctx.SESSTOKEN(), ctx, "HTTPHEADER");
    if (!ctx.FORMFIELD().isEmpty() || !ctx.QUERYPARM().isEmpty()) {
      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
    }
  }

  private void checkExtract(CICSParser.Cics_web_extractContext ctx) {
    checkHasMandatoryOptions(ctx.EXTRACT(), ctx, "EXTRACT");
    // HTTP Server
    if (!ctx.REQUESTTYPE().isEmpty()
        || !ctx.HTTPMETHOD().isEmpty()
        || !ctx.METHODLENGTH().isEmpty()
        || !ctx.QUERYSTRING().isEmpty()
        || !ctx.QUERYSTRLEN().isEmpty()) {
      checkPrerequisiteIsMet(
          ctx.HTTPMETHOD(), ctx.METHODLENGTH(), ctx, "METHODLENGTH without HTTPMETHOD");
      checkAllOptionsArePresentOrAbsent(
          "QUERYSTRING and QUERYSTRLEN", ctx, ctx.QUERYSTRING(), ctx.QUERYSTRLEN());

      checkAllOptionsArePresentOrAbsent(
          "HTTPMETHOD and METHODLENGTH", ctx, ctx.HTTPMETHOD(), ctx.METHODLENGTH());

      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
      checkHasIllegalOptions(ctx.REALM(), "REALM");
      checkHasIllegalOptions(ctx.REALMLEN(), "REALMLEN");
    }

    // HTTP Client
    if (!ctx.SESSTOKEN().isEmpty() || !ctx.REALM().isEmpty() || !ctx.REALMLEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
      checkAllOptionsArePresentOrAbsent("REALM and REALMLEN", ctx, ctx.REALM(), ctx.REALMLEN());

      checkHasIllegalOptions(ctx.REQUESTTYPE(), "REQUESTTYPE");
      checkHasIllegalOptions(ctx.HTTPMETHOD(), "HTTPMETHOD");
      checkHasIllegalOptions(ctx.METHODLENGTH(), "METHODLENGTH");
      checkHasIllegalOptions(ctx.QUERYSTRING(), "QUERYSTRING");
      checkHasIllegalOptions(ctx.QUERYSTRLEN(), "QUERYSTRLEN");
    }

    checkAllOptionsArePresentOrAbsent("HOST and HOSTLENGTH", ctx, ctx.HOST(), ctx.HOSTLENGTH());
    checkPrerequisiteIsMet(ctx.HOST(), ctx.HOSTTYPE(), ctx, "HOSTTYPE without HOST");
    checkAllOptionsArePresentOrAbsent("PATH and PATHLENGTH", ctx, ctx.PATH(), ctx.PATHLENGTH());
    checkAllOptionsArePresentOrAbsent(
        "HTTPVERSION and VERSIONLEN", ctx, ctx.HTTPVERSION(), ctx.VERSIONLEN());
  }

  private void checkOpen(CICSParser.Cics_web_openContext ctx) {
    checkHasMandatoryOptions(ctx.OPEN(), ctx, "OPEN");
    checkHasExactlyOneOption("URIMAP or HOST", ctx, ctx.URIMAP(), ctx.HOST());

    if (!ctx.HOST().isEmpty()) {
      checkHasExactlyOneOption("SCHEME, HTTP or HTTPS", ctx, ctx.SCHEME(), ctx.HTTP(), ctx.HTTPS());
    } else {
      checkHasIllegalOptions(ctx.SCHEME(), "SCHEME");
      checkHasIllegalOptions(ctx.HTTP(), "HTTP");
      checkHasIllegalOptions(ctx.HTTPS(), "HTTPS");
    }

    checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
    checkAllOptionsArePresentOrAbsent("HTTPVNUM and HTTPRNUM", ctx, ctx.HTTPVNUM(), ctx.HTTPRNUM());
  }

  private void checkParse(CICSParser.Cics_web_parseContext ctx) {
    checkHasMandatoryOptions(ctx.PARSE(), ctx, "PARSE");
    checkHasMandatoryOptions(ctx.URL(), ctx, "URL");
    checkPrerequisiteIsMet(ctx.URL(), ctx.URLLENGTH(), ctx, "URLLENGTH without URL");
    checkPrerequisiteIsMet(ctx.HOST(), ctx.HOSTTYPE(), ctx, "HOSTTYPE without HOST");

    checkOptionalWithLength(ctx.PATH(), ctx.PATHLENGTH(), ctx, "PATH", "PATHLENGTH");
    checkOptionalWithLength(ctx.HOST(), ctx.HOSTLENGTH(), ctx, "HOST", "HOSTLENGTH");
    checkOptionalWithLength(
        ctx.QUERYSTRING(), ctx.QUERYSTRLEN(), ctx, "QUERYSTRING", "QUERYSTRLEN");
  }

  private void checkRead(CICSParser.Cics_web_readContext ctx) {
    checkHasMandatoryOptions(ctx.READ(), ctx, "READ");
    checkHasExactlyOneOption(
        "FORMFIELD, HTTPHEADER or QUERYPARM",
        ctx,
        ctx.FORMFIELD(),
        ctx.HTTPHEADER(),
        ctx.QUERYPARM());

    if (!ctx.FORMFIELD().isEmpty()) {
      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
      checkHasExactlyOneOption("VALUE or SET", ctx, ctx.VALUE(), ctx.SET());
      checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
    }

    if (!ctx.HTTPHEADER().isEmpty()) {
      checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
      checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");

      checkHasIllegalOptions(ctx.SET(), "SET");
      checkHasIllegalOptions(ctx.CHARACTERSET(), "CHARACTERSET");
      checkHasIllegalOptions(ctx.HOSTCODEPAGE(), "HOSTCODEPAGE");
    }

    if (!ctx.QUERYPARM().isEmpty()) {
      checkHasExactlyOneOption("VALUE or SET", ctx, ctx.VALUE(), ctx.SET());
      checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");

      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
      checkHasIllegalOptions(ctx.CHARACTERSET(), "CHARACTERSET");
    }

    checkPrerequisiteIsMet(
        ctx.FORMFIELD(), ctx.CHARACTERSET(), ctx, "CHARACTERSET without FORMFIELD");
    if (noLengthOptionsEnabled()) {
      checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
    }
  }

  private void checkReadNext(CICSParser.Cics_web_readnextContext ctx) {
    checkHasMandatoryOptions(ctx.READNEXT(), ctx, "READNEXT");

    checkHasExactlyOneOption(
        "FORMFIELD, HTTPHEADER or QUERYPARM",
        ctx,
        ctx.FORMFIELD(),
        ctx.HTTPHEADER(),
        ctx.QUERYPARM());

    if (!ctx.FORMFIELD().isEmpty() || !ctx.QUERYPARM().isEmpty()) {
      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
    }

    checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
    checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
    checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
  }

  private void checkReceive(CICSParser.Cics_web_receiveContext ctx) {
    checkHasMandatoryOptions(ctx.RECEIVE(), ctx, "RECEIVE");

    boolean isBuffer = false;
    boolean isContainer = false;

    if (!ctx.INTO().isEmpty()
        || !ctx.SET().isEmpty()
        || !ctx.LENGTH().isEmpty()
        || !ctx.MAXLENGTH().isEmpty()
        || !ctx.NOTRUNCATE().isEmpty()
        || !ctx.SRVCONVERT().isEmpty()
        || !ctx.NOSRVCONVERT().isEmpty()
        || !ctx.SERVERCONV().isEmpty()
        || !ctx.CLICONVERT().isEmpty()
        || !ctx.NOCLICONVERT().isEmpty()
        || !ctx.CLIENTCONV().isEmpty()
        || !ctx.HOSTCODEPAGE().isEmpty()) {
      // Buffer
      isBuffer = true;
      checkHasIllegalOptions(ctx.TOCONTAINER(), "TOCONTAINER");
      checkHasIllegalOptions(ctx.TOCHANNEL(), "TOCHANNEL");

      checkHasExactlyOneOption("INTO or SET", ctx, ctx.INTO(), ctx.SET());
      checkMutuallyExclusiveOptions(
          "SRVCONVERT, NOSRVCONVERT or SERVERCONV",
          ctx.SRVCONVERT(),
          ctx.NOSRVCONVERT(),
          ctx.SERVERCONV());
      checkMutuallyExclusiveOptions(
          "CLICONVERT, NOCLICONVERT, CLIENTCONV",
          ctx.CLICONVERT(),
          ctx.NOCLICONVERT(),
          ctx.CLIENTCONV());

      checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    }

    if (!ctx.TOCONTAINER().isEmpty() || !ctx.TOCHANNEL().isEmpty()) {
      // Container
      isContainer = true;

      checkHasIllegalOptions(ctx.INTO(), "INTO");
      checkHasIllegalOptions(ctx.SET(), "SET");
      checkHasIllegalOptions(ctx.LENGTH(), "LENGTH");
      checkHasIllegalOptions(ctx.MAXLENGTH(), "MAXLENGTH");
      checkHasIllegalOptions(ctx.NOTRUNCATE(), "NOTRUNCATE");
      checkHasIllegalOptions(ctx.SRVCONVERT(), "SRVCONVERT");
      checkHasIllegalOptions(ctx.NOSRVCONVERT(), "NOSRVCONVERT");
      checkHasIllegalOptions(ctx.SERVERCONV(), "SERVERCONV");
      checkHasIllegalOptions(ctx.CLICONVERT(), "CLICONVERT");
      checkHasIllegalOptions(ctx.NOCLICONVERT(), "NOCLICONVERT");
      checkHasIllegalOptions(ctx.CLIENTCONV(), "CLIENTCONV");
      checkHasIllegalOptions(ctx.HOSTCODEPAGE(), "HOSTCODEPAGE");

      checkHasMandatoryOptions(ctx.TOCONTAINER(), ctx, "TOCONTAINER");
      checkPrerequisiteIsMet(
          ctx.TOCONTAINER(), ctx.TOCHANNEL(), ctx, "TOCHANNEL without TOCONTAINER");
    }

    if (!ctx.SESSTOKEN().isEmpty()
        || !ctx.STATUSCODE().isEmpty()
        || !ctx.STATUSTEXT().isEmpty()
        || !ctx.STATUSLEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
      checkAllOptionsArePresentOrAbsent(
          "STATUSCODE and STATUSTEXT", ctx, ctx.STATUSCODE(), ctx.STATUSTEXT());
      checkPrerequisiteIsMet(
          ctx.STATUSCODE(), ctx.STATUSLEN(), ctx, "STATUSLEN without STATUSCODE");
    }

    if (!isBuffer && !isContainer) {
      checkHasExactlyOneOption(
          "INTO, SET, LENGTH or TOCONTAINER",
          ctx,
          ctx.INTO(),
          ctx.SET(),
          ctx.LENGTH(),
          ctx.TOCONTAINER());
    }
    if (noLengthOptionsEnabled()) {
      if (!ctx.SESSTOKEN().isEmpty() && !ctx.STATUSCODE().isEmpty())
        checkHasMandatoryOptions(ctx.STATUSLEN(), ctx, "STATUSLEN");
      if (!ctx.INTO().isEmpty()) checkHasMandatoryOptions(ctx.MAXLENGTH(), ctx, "MAXLENGTH");
    }
  }

  private void checkRetrieve(CICSParser.Cics_web_retrieveContext ctx) {
    checkHasMandatoryOptions(ctx.RETRIEVE(), ctx, "RETRIEVE");
    checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
  }

  private void checkSend(CICSParser.Cics_web_sendContext ctx) {
    checkHasMandatoryOptions(ctx.SEND(), ctx, "SEND");
    if (!ctx.SESSTOKEN().isEmpty()) {
      // Client
      checkMutuallyExclusiveOptions(
          "GET, HEAD, PATCH, POST, PUT, TRACE, OPTIONS, DELETE or METHOD",
          ctx.GET(),
          ctx.HEAD(),
          ctx.PATCH(),
          ctx.POST(),
          ctx.PUT(),
          ctx.TRACE(),
          ctx.OPTIONS(),
          ctx.DELETE(),
          ctx.METHOD());

      checkMutuallyExclusiveOptions("PATH or URIMAP", ctx.PATH(), ctx.URIMAP());
      checkAllOptionsArePresentOrAbsent("PATH and PATHLENGTH", ctx, ctx.PATH(), ctx.PATHLENGTH());

      checkAllOptionsArePresentOrAbsent(
          "QUERYSTRING and QUERYSTRLEN", ctx, ctx.QUERYSTRING(), ctx.QUERYSTRLEN());

      // Body subsection
      if (!ctx.MEDIATYPE().isEmpty()
          || !ctx.DOCTOKEN().isEmpty()
          || !ctx.FROM().isEmpty()
          || !ctx.CONTAINER().isEmpty()) {
        checkHasMandatoryOptions(ctx.MEDIATYPE(), ctx, "MEDIATYPE");
        checkMutuallyExclusiveOptions(
            "DOCTOKEN, FROM or CONTAINER", ctx.DOCTOKEN(), ctx.FROM(), ctx.CONTAINER());

        checkPrerequisiteIsMet(
            ctx.DOCTOKEN(), ctx.NODOCDELETE(), ctx, "NODOCDELETE without DOCTOKEN");
        checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCDELETE(), ctx, "DOCDELETE without DOCTOKEN");
        checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCSTATUS(), ctx, "DOCSTATUS without DOCTOKEN");
        checkMutuallyExclusiveOptions(
            "NODOCDELETE, DOCDELETE or DOCSTATUS",
            ctx.NODOCDELETE(),
            ctx.DOCDELETE(),
            ctx.DOCSTATUS());

        checkAllOptionsArePresentOrAbsent("FROM and FROMLENGTH", ctx, ctx.FROM(), ctx.FROMLENGTH());

        checkPrerequisiteIsMet(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CHANNEL without CONTAINER");
      }
      // END - Body subsection

      checkMutuallyExclusiveOptions("ACTION or EXPECT", ctx.ACTION(), ctx.EXPECT());
      checkMutuallyExclusiveOptions(
          "NOCLOSE, CLOSE or CLOSESTATUS", ctx.NOCLOSE(), ctx.CLOSE(), ctx.CLOSESTATUS());

      checkMutuallyExclusiveOptions(
          "NONE, BASICAUTH, AUTHENTICATE", ctx.NONE(), ctx.BASICAUTH(), ctx.AUTHENTICATE());

      checkAllOptionsArePresentOrAbsent(
          "USERNAME and PASSWORD", ctx, ctx.USERNAME(), ctx.PASSWORD());

      checkPrerequisiteIsMet(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CHANNEL without CONTAINER");

      checkMutuallyExclusiveOptions(
          "CLICONVERT, NOCLICONVERT, CLIENTCONV",
          ctx.CLICONVERT(),
          ctx.NOCLICONVERT(),
          ctx.CLIENTCONV());
      checkOptionalWithLength(ctx.USERNAME(), ctx.USERNAMELEN(), ctx, "USERNAME", "USERNAMELEN");
      checkOptionalWithLength(ctx.PASSWORD(), ctx.PASSWORDLEN(), ctx, "PASSWORD", "PASSWORDLEN");

    } else {
      // Server
      checkMutuallyExclusiveOptions(
          "DOCTOKEN, FROM or CONTAINER", ctx.DOCTOKEN(), ctx.FROM(), ctx.CONTAINER());

      checkPrerequisiteIsMet(
          ctx.DOCTOKEN(), ctx.NODOCDELETE(), ctx, "NODOCDELETE without DOCTOKEN");
      checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCDELETE(), ctx, "DOCDELETE without DOCTOKEN");
      checkPrerequisiteIsMet(ctx.DOCTOKEN(), ctx.DOCSTATUS(), ctx, "DOCSTATUS without DOCTOKEN");
      checkMutuallyExclusiveOptions(
          "NODOCDELETE, DOCDELETE or DOCSTATUS",
          ctx.NODOCDELETE(),
          ctx.DOCDELETE(),
          ctx.DOCSTATUS());

      checkMutuallyExclusiveOptions(
          "DOCTOKEN, CONTAINER, CHUNKNO, CHUNKYES, CHUNKEND or CHUNKING",
          ctx.DOCTOKEN(),
          ctx.CONTAINER(),
          ctx.CHUNKNO(),
          ctx.CHUNKYES(),
          ctx.CHUNKEND(),
          ctx.CHUNKING());

      checkPrerequisiteIsMet(ctx.FROM(), ctx.HOSTCODEPAGE(), ctx, "HOSTCODEPAGE without FROM");

      checkAllOptionsArePresentOrAbsent("FROM and FROMLENGTH", ctx, ctx.FROM(), ctx.FROMLENGTH());

      checkPrerequisiteIsMet(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CHANNEL without CONTAINER");

      if (!ctx.STATUSCODE().isEmpty()
          || !ctx.STATUSTEXT().isEmpty()
          || !ctx.STATUSLEN().isEmpty()
          || !ctx.LENGTH().isEmpty()) {
        checkHasMandatoryOptions(ctx.STATUSCODE(), ctx, "STATUSCODE");
        checkHasMandatoryOptions(ctx.STATUSTEXT(), ctx, "STATUSTEXT");
        checkHasExactlyOneOption("STATUSLEN or LENGTH", ctx, ctx.STATUSLEN(), ctx.LENGTH());
      }

      checkMutuallyExclusiveOptions(
          "SRVCONVERT, NOSRVCONVERT, or SERVERCONV",
          ctx.SRVCONVERT(),
          ctx.NOSRVCONVERT(),
          ctx.SERVERCONV());
      checkMutuallyExclusiveOptions(
          "IMMEDIATE, EVENTUAL or ACTION", ctx.IMMEDIATE(), ctx.EVENTUAL(), ctx.ACTION());
      checkMutuallyExclusiveOptions(
          "NOCLOSE, CLOSE, CLOSESTATUS", ctx.NOCLOSE(), ctx.CLOSE(), ctx.CLOSESTATUS());
    }

    if (!ctx.USERNAME().isEmpty() && !ctx.PASSWORD().isEmpty())
      checkHasExactlyOneOption(
          "NONE, BASICAUTH, AUTHENTICATE", ctx, ctx.NONE(), ctx.BASICAUTH(), ctx.AUTHENTICATE());
  }

  private void checkStartbrowse(CICSParser.Cics_web_startbrowseContext ctx) {
    checkHasMandatoryOptions(ctx.STARTBROWSE(), ctx, "STARTBROWSE");
    checkHasExactlyOneOption(
        "FORMFIELD, HTTPHEADER or QUERYPARM",
        ctx,
        ctx.FORMFIELD(),
        ctx.HTTPHEADER(),
        ctx.QUERYPARM());

    if (!ctx.FORMFIELD().isEmpty()) {
      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
    }

    if (!ctx.HTTPHEADER().isEmpty()) {
      checkHasIllegalOptions(ctx.NAMELENGTH(), "NAMELENGTH");
      checkHasIllegalOptions(ctx.HOSTCODEPAGE(), "HOSTCODEPAGE");
      checkHasIllegalOptions(ctx.CHARACTERSET(), "CHARACTERSET");
    }

    if (!ctx.QUERYPARM().isEmpty()) {
      checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
      checkHasIllegalOptions(ctx.CHARACTERSET(), "CHARACTERSET");
    }
  }

  private void checkWrite(CICSParser.Cics_web_writeContext ctx) {
    checkHasMandatoryOptions(ctx.WRITE(), ctx, "WRITE");
    checkHasMandatoryOptions(ctx.HTTPHEADER(), ctx, "HTTPHEADER");
    checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
    if (noLengthOptionsEnabled()) {
      checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
      checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
    }
  }
}
