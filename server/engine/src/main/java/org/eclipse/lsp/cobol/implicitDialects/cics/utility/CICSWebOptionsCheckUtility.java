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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_web;

/** Checks CICS Web rules for required and invalid options */
public class CICSWebOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

    public static final int RULE_INDEX = RULE_cics_web;

    private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
            new HashMap<String, ErrorSeverity>() {
                {
                    put("ALLOCATE", ErrorSeverity.ERROR);
                    put("SYSID", ErrorSeverity.ERROR);
                    put("PROFILE", ErrorSeverity.ERROR);
                    put("STATE", ErrorSeverity.ERROR);
                    put("SESSION", ErrorSeverity.ERROR);
                    put("PARTNER", ErrorSeverity.ERROR);
                    put("ASIS", ErrorSeverity.WARNING);
                    put("BUFFER", ErrorSeverity.WARNING);
                    put("LEAVEKB", ErrorSeverity.WARNING);
                    put("NOTRUNCATE", ErrorSeverity.WARNING);
                    put("NOQUEUE", ErrorSeverity.WARNING);
                    put("NOTRUNCATE", ErrorSeverity.WARNING);
                }
            };

    public CICSWebOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
        super(context, errors, DUPLICATE_CHECK_OPTIONS);
    }

    /**
     * Entrypoint to check CICS WEB rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        Class<?> ruleClass = ctx.getClass();

        if (ruleClass == CICSParser.Cics_web_closeContext.class) {
            checkClose((CICSParser.Cics_web_closeContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_converseContext.class) {
            checkConverse((CICSParser.Cics_web_converseContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_endbrowseContext.class) {
            checkEndbrowse((CICSParser.Cics_web_endbrowseContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_openContext.class) {
            checkOpen((CICSParser.Cics_web_openContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_parseContext.class) {
            checkParse((CICSParser.Cics_web_parseContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_readContext.class) {
            checkRead((CICSParser.Cics_web_readContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_readnext_formfield_queryparmContext.class) {
            checkReadnextFormfieldQueryparm((CICSParser.Cics_web_readnext_formfield_queryparmContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_readnext_httpheaderContext.class) {
            checkReadnextHTTPHeader((CICSParser.Cics_web_readnext_httpheaderContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_receive_server_bufferContext.class) {
            checkReceiveServerBuffer((CICSParser.Cics_web_receive_server_bufferContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_receive_server_containerContext.class) {
            checkReceiveServerContainer((CICSParser.Cics_web_receive_server_containerContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_receive_clientContext.class) {
            checkReceiveClient((CICSParser.Cics_web_receive_clientContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_receive_client_containerContext.class) {
            checkReceiveClientContainer((CICSParser.Cics_web_receive_client_containerContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_startbrowse_formfield_queryparmContext.class) {
            checkStartbrowseFormfieldQueryparm((CICSParser.Cics_web_startbrowse_formfield_queryparmContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_writeContext.class) {
            checkWrite((CICSParser.Cics_web_writeContext) ctx);
        } else {
            checkHelperRules(ctx, ruleClass);
        }
    }

    private <E extends ParserRuleContext> void checkHelperRules(E ctx, Class<?> ruleClass) {
        if (ruleClass == CICSParser.Cics_web_pathContext.class) {
            checkWebPath((CICSParser.Cics_web_pathContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_body_doctokenContext.class) {
            checkWebBodyDoctoken((CICSParser.Cics_web_body_doctokenContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_querystringContext.class) {
            checkWebQuerystring((CICSParser.Cics_web_querystringContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_close_optionsContext.class) {
            checkWebCloseOptions((CICSParser.Cics_web_close_optionsContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_auth_usernameContext.class) {
            checkWebAuthUsernameOptions((CICSParser.Cics_web_auth_usernameContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_auth_passwordContext.class) {
            checkWebAuthPasswordOptions((CICSParser.Cics_web_auth_passwordContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_client_auth_typeContext.class) {
            checkWebClientAuthType((CICSParser.Cics_web_client_auth_typeContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_send_from_chunkContext.class) {
            checkSendFromChunk((CICSParser.Cics_web_send_from_chunkContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_send_container_subruleContext.class) {
            checkSendContainerSubrule((CICSParser.Cics_web_send_container_subruleContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_into_set_tocontainerContext.class) {
            checkIntoSetTocontainer((CICSParser.Cics_web_into_set_tocontainerContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_hostContext.class) {
            checkHost((CICSParser.Cics_web_hostContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_host_hosttypeContext.class) {
            checkHostHosttype((CICSParser.Cics_web_host_hosttypeContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_httpmethodContext.class) {
            checkHTTPMethod((CICSParser.Cics_web_httpmethodContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_httpversionContext.class) {
            checkHTTPVersion((CICSParser.Cics_web_httpversionContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_realmContext.class) {
            checkRealm((CICSParser.Cics_web_realmContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_server_convertContext.class) {
            checkWebServerConvert((CICSParser.Cics_web_server_convertContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_client_convertContext.class) {
            checkWebClientConvert((CICSParser.Cics_web_client_convertContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_statuscodeContext.class) {
            checkStatuscode((CICSParser.Cics_web_statuscodeContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_send_doctokenContext.class) {
            checkSendDoctoken((CICSParser.Cics_web_send_doctokenContext) ctx);
        } else if (ruleClass == CICSParser.Cics_web_send_server_bodyContext.class) {
            checkSendServerBody((CICSParser.Cics_web_send_server_bodyContext) ctx);
        }
    }

    // Main rules
    private void checkClose(CICSParser.Cics_web_closeContext ctx) {
        List<TerminalNode> ruleList = new ArrayList<>();
        ruleList.add(ctx.SESSTOKEN()); // SESSTOKEN in CLOSE does not utilize the repeat notation.
        checkHasMandatoryOptions(ruleList, ctx, "SESSTOKEN");
    }

    private void checkConverse(CICSParser.Cics_web_converseContext ctx) {
        checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
        checkMutuallyExclusiveOptions("PATH PATHLENGTH or URIMAP", ctx.cics_web_path(), ctx.cics_web_urimap());
    }

    private void checkEndbrowse(CICSParser.Cics_web_endbrowseContext ctx) {
        checkMutuallyExclusiveOptions("FORMFIELD, HTTPHEADER, QUERYPARM", ctx.FORMFIELD(), ctx.HTTPHEADER(), ctx.QUERYPARM());
        checkHasRequiredOption(ctx.HTTPHEADER(), ctx.SESSTOKEN(), ctx, "HTTPHEADER");
    }

    // EXTRACT does not need any checks other than the helper rules.

    private void checkOpen(CICSParser.Cics_web_openContext ctx) {
        checkMutuallyExclusiveOptions("URIMAP or HOST", ctx.cics_web_urimap(), ctx.cics_web_host_portnumber());
        checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
        checkHasRequiredOption(ctx.HTTPVNUM(), ctx.HTTPRNUM(), ctx, "HTTPVNUM");

    }

    private void checkParse(CICSParser.Cics_web_parseContext ctx) {
        checkHasRequiredOption(ctx.URL(), ctx.URLLENGTH(), ctx, "URL");
    }

    private void checkRead(CICSParser.Cics_web_readContext ctx) {
        checkMutuallyExclusiveOptions("FORMFIELD, HTTPHEADER or QUERYPARM", ctx.FORMFIELD(), ctx.HTTPHEADER(), ctx.QUERYPARM());

        if (ctx.FORMFIELD().getText().isEmpty()) {
           checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
        }

        if (ctx.HTTPHEADER().getText().isEmpty()) {
            checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
        } else {
            checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
        }

        if (!ctx.QUERYPARM().getText().isEmpty()) {
            checkHasIllegalOptions(ctx.SESSTOKEN(), "SESSTOKEN");
        }

        checkMutuallyExclusiveOptions("VALUE or SET", ctx.VALUE(), ctx.SET());
        if (ctx.VALUE().isEmpty()) {
            checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
            checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
        } else if (ctx.SET().isEmpty()) {
            checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
            checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
        }

        checkHasRequiredOption(ctx.FORMFIELD(), ctx.CHARACTERSET(), ctx, "FORMFIELD");
    }

    private void checkReadnextFormfieldQueryparm(CICSParser.Cics_web_readnext_formfield_queryparmContext ctx) {
        checkMutuallyExclusiveOptions("FORMFIELD or QUERYPARM", ctx.FORMFIELD(), ctx.QUERYPARM());

        checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
        checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
        checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
    }

    private void checkReadnextHTTPHeader(CICSParser.Cics_web_readnext_httpheaderContext ctx) {
        checkHasMandatoryOptions(ctx.NAMELENGTH(), ctx, "NAMELENGTH");
        checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
        checkHasMandatoryOptions(ctx.VALUELENGTH(), ctx, "VALUELENGTH");
    }

    private void checkReceiveServerBuffer(CICSParser.Cics_web_receive_server_bufferContext ctx) {
        checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    }

    private void checkReceiveServerContainer(CICSParser.Cics_web_receive_server_containerContext ctx) {
        checkHasMandatoryOptions(ctx.TOCONTAINER(), ctx, "TOCONTAINER");
    }

    private void checkReceiveClient(CICSParser.Cics_web_receive_clientContext ctx) {
        checkHasMandatoryOptions(ctx.SESSTOKEN(), ctx, "SESSTOKEN");
    }

    // RECEIVE Client (Buffer) does not need any checks.

    private void checkReceiveClientContainer(CICSParser.Cics_web_receive_client_containerContext ctx) {
        checkHasMandatoryOptions(ctx.TOCONTAINER(), ctx, "TOCONTAINER");
    }

    // RETRIEVE does not need any checks.

    // STARTBROWSE does not need any checks other than the helper rules.

    private void checkStartbrowseFormfieldQueryparm(CICSParser.Cics_web_startbrowse_formfield_queryparmContext ctx) {
        checkHasRequiredOption(ctx.FORMFIELD(), ctx.CHARACTERSET(), ctx, "FORMFIELD");
    }

    private void checkWrite(CICSParser.Cics_web_writeContext ctx) {
        checkHasMandatoryOptions(ctx.HTTPHEADER(), ctx, "HTTPHEADER");
        checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
    }


    // ----- Helper rules -----
    private void checkWebPath(CICSParser.Cics_web_pathContext ctx) {
        checkHasRequiredOption(ctx.PATH(), ctx.PATHLENGTH(), ctx, "PATH");
    }

    private void checkWebBodyDoctoken(CICSParser.Cics_web_body_doctokenContext ctx) {
        if (!ctx.NODOCDELETE().getText().isEmpty() || !ctx.DOCDELETE().getText().isEmpty() || !ctx.DOCSTATUS().getText().isEmpty()) {
            checkHasMandatoryOptions(ctx.DOCTOKEN(), ctx, "DOCTOKEN");
        }
        checkMutuallyExclusiveOptions("DOCDELETE, NODOCDELETE, DOCSTATUS", ctx.DOCDELETE(), ctx.NODOCDELETE(), ctx.DOCSTATUS());
    }

    private void checkWebQuerystring(CICSParser.Cics_web_querystringContext ctx) {
        checkHasRequiredOption(ctx.QUERYSTRING(), ctx.QUERYSTRLEN(), ctx, "QUERYSTRING");
    }

    private void checkWebCloseOptions(CICSParser.Cics_web_close_optionsContext ctx) {
        checkMutuallyExclusiveOptions("NOCLOSE, CLOSE, CLOSESTATUS", ctx.NOCLOSE(), ctx.CLOSE(), ctx.CLOSESTATUS());
    }

    private void checkWebAuthUsernameOptions(CICSParser.Cics_web_auth_usernameContext ctx) {
        checkHasRequiredOption(ctx.USERNAME(), ctx.USERNAMELEN(), ctx, "USERNAME");
    }

    private void checkWebAuthPasswordOptions(CICSParser.Cics_web_auth_passwordContext ctx) {
        checkHasRequiredOption(ctx.PASSWORD(), ctx.PASSWORDLEN(), ctx, "PASSWORD");
    }

    private void checkWebClientAuthType(CICSParser.Cics_web_client_auth_typeContext ctx) {
        checkMutuallyExclusiveOptions("NONE, BASICAUTH, AUTHENTICATE", ctx.NONE(), ctx.BASICAUTH(), ctx.AUTHENTICATE());
    }

    private void checkSendFromChunk(CICSParser.Cics_web_send_from_chunkContext ctx) {
        checkMutuallyExclusiveOptions("CHUNKYES, CHUNKNO, CHUNKEND, CHUNKING", ctx.CHUNKYES(), ctx.CHUNKNO(), ctx.CHUNKEND(), ctx.CHUNKING());
    }

    private void checkIntoSetTocontainer(CICSParser.Cics_web_into_set_tocontainerContext ctx) {
        checkMutuallyExclusiveOptions("INTO, SET, TOCONTAINER TOCHANNEL", ctx.INTO(), ctx.SET(), ctx.TOCONTAINER());
        checkHasRequiredOption(ctx.TOCONTAINER(), ctx.TOCHANNEL(), ctx, "TOCONTAINER");
    }

    private void checkSendContainerSubrule(CICSParser.Cics_web_send_container_subruleContext ctx) {
        checkHasRequiredOption(ctx.CONTAINER(), ctx.CHANNEL(), ctx, "CONTAINER");
    }

    private void checkHost(CICSParser.Cics_web_hostContext ctx) {
        checkHasRequiredOption(ctx.HOST(), ctx.HOSTLENGTH(), ctx, "HOST");
    }

    private void checkHostHosttype(CICSParser.Cics_web_host_hosttypeContext ctx) {
        checkHasRequiredOption(ctx.cics_web_host(), ctx.HOSTTYPE(), ctx, "HOSTTYPE");
    }

    private void checkHTTPMethod(CICSParser.Cics_web_httpmethodContext ctx) {
        checkHasRequiredOption(ctx.HTTPMETHOD(), ctx.METHODLENGTH(), ctx, "HTTPMETHOD");
    }

    private void checkHTTPVersion(CICSParser.Cics_web_httpversionContext ctx) {
        checkHasRequiredOption(ctx.HTTPVERSION(), ctx.VERSIONLEN(), ctx, "HTTPVERSION");
    }

    private void checkRealm(CICSParser.Cics_web_realmContext ctx) {
        checkHasRequiredOption(ctx.REALM(), ctx.REALMLEN(), ctx, "REALM");
    }

    private void checkWebServerConvert(CICSParser.Cics_web_server_convertContext ctx) {
        checkMutuallyExclusiveOptions("SRVCONVERT, NOSRVCONVERT, SERVERCONV", ctx.SRVCONVERT(), ctx.NOSRVCONVERT(), ctx.SERVERCONV());
    }

    private void checkWebClientConvert(CICSParser.Cics_web_client_convertContext ctx) {
        checkMutuallyExclusiveOptions("CLICONVERT, NOCLICONVERT, CLIENTCONV", ctx.CLICONVERT(), ctx.NOCLICONVERT(), ctx.CLIENTCONV());
    }

    private void checkStatuscode(CICSParser.Cics_web_statuscodeContext ctx) {
        checkHasRequiredOption(ctx.STATUSCODE(), ctx.STATUSTEXT(), ctx, "STATUSCODE");
        checkHasRequiredOption(ctx.STATUSTEXT(), ctx.STATUSCODE(), ctx, "STATUSTEXT");
    }
    private void checkSendDoctoken(CICSParser.Cics_web_send_doctokenContext ctx) {
        checkHasRequiredOption(ctx.DOCTOKEN(), ctx.NODOCDELETE(), ctx, "DOCTOKEN");
        checkHasRequiredOption(ctx.DOCTOKEN(), ctx.DOCDELETE(), ctx, "DOCTOKEN");
        checkHasRequiredOption(ctx.DOCTOKEN(), ctx.DOCSTATUS(), ctx, "DOCTOKEN");
    }

    private void checkSendServerBody(CICSParser.Cics_web_send_server_bodyContext ctx) {
        checkMutuallyExclusiveOptions("DOCTOKEN, FROM or CONTAINER", ctx.cics_web_send_doctoken(), ctx.cics_web_send_from_chunk(), ctx.cics_web_send_container_subrule());
        if (ctx.cics_web_send_from_chunk() == null) {
            checkHasIllegalOptions(ctx.HOSTCODEPAGE(), "HOSTCODEPAGE");
        }
    }
}
