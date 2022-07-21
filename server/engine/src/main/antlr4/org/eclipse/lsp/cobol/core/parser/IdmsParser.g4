/*
 * Copyright (c) 2022 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */

parser grammar IdmsParser;
options {tokenVocab = IdmsLexer;  superClass = MessageServiceParser;}

startRule: .*? idmsRules* EOF;
idmsRules: (idmsStatements | idmsSections | idmsIfStatement | ifStatement | copyIdmsStatement) .*?;

idmsSections
   : idmsControlSection | schemaSection | mapSection
   ;

// -- copy section ----------------------------------

copyIdmsStatement
    : LEVEL_NUMBER? COPY IDMS copyIdmsOptions (DOT_FS | SEMICOLON_FS)?
    ;

copyIdmsOptions
    : (RECORD copyIdmsSource versionClause? (REDEFINES cobolWord)?) |
    (FILE copyIdmsSource versionClause?) |
    ((MAP | MAP_CONTROL) copyIdmsSource) |
    (MODULE? copyIdmsSource versionClause?)
    ;

copyIdmsSource
    : copySource
    ;

copySource
   : (literal | cobolWord | SUBSCHEMA_NAMES) ((OF | IN) copyLibrary)?
   ;

copyLibrary
   : literal | cobolWord
   ;

// -- schema section ----------------------------------

schemaSection
   : SCHEMA SECTION DOT_FS schemaDBEntry
   ;

schemaDBEntry
   : DB idms_subschema_name WITHIN idms_schema_name versionClause? DOT_FS
   ;

// -- map section ----------------------------------

mapSection
   : MAP SECTION DOT_FS maxFieldListClause? mapClause+
   ;

maxFieldListClause
   :  MAX FIELD LIST IS? integerLiteral DOT_FS?
   ;

mapClause
    : MAP idms_map_name_definition versionClause? (TYPE IS? (STANDARD | EXTENDED) PAGING?)? DOT_FS?
    ;

versionClause
    : VERSION integerLiteral
    ;

// -- idms control section ----------------------------------
idmsControlSection
   : IDMS_CONTROL SECTION DOT_FS idmsControlSectionParagraph
   ;

// - idms control section paragraph ----------------------------------
idmsControlSectionParagraph
   : protocolParagraph (protocolParagraphs COMMACHAR?)*
   ;

protocolParagraphs
   : ssNamesLengthParagraph | idmsRecordLocationParagraph
   ;

protocolParagraph
   : PROTOCOL DOT_FS? protocolEntry?
   ;

protocolEntry
   : modeClause DEBUG? endClause?
   ;

modeClause
   : MODE IS? dataName
   ;

ssNamesLengthParagraph
   : SUBSCHEMA_NAMES LENGTH IS? ss_names_length endClause?
   ;

idmsRecordLocationParagraph
   : IDMS_RECORDS withinClause endClause?
   ;

withinClause
   : (withinEntry | MANUAL) levelsClause?
   ;

withinEntry
   : WITHIN (WORKING_STORAGE | LINKAGE) SECTION?
   ;

levelsClause
   : LEVELS? INCREMENTED BY? LEVEL_NUMBER
   ;

ss_names_length
    : {validateSubSchemaNameLength(_input.LT(1).getText());} LEVEL_NUMBER
    ;

// statements

ifStatement
   : IF idmsIfCondition
   ;

idmsIfCondition
   : (idms_db_entity_name idmsIfEmpty) | (idmsIfMember)
   ;

idmsIfEmpty
    : IS? NOT? EMPTY
    ;

idmsIfMember
    : NOT? idms_db_entity_name MEMBER
    ;

idmsIfStatement
    : inquireMapIfStatement
    ;

idmsStatements
    : idmsStmtsOptTermOn endClause? idmsOnClause? | idmsStmtsMandTermOn (SEMICOLON_FS idmsOnClause? | DOT_FS)
    ;


idmsStmtsOptTermOn
    : abendCodeStatement | attachTaskCodeStatement | bindStatement | changePriorityStatement | checkTerminalStatement | commitStatement |
     connectStatement | dcStatement | dequeueStatement | disconnectStatement | endStatement | endpageStatement | enqueueStatement | eraseStatement | findStatement |
     finishStatement | freeStatement | getStatement | inquireMapMoveStatement | keepStatement | loadStatement | mapStatement | modifyStatement | obtainStatement |
     postStatement | putStatement | readyStatement |rollbackStatement | snapStatement | startpageStatement | storeStatement | waitStatement | writeIdmsStatement |
     readStatement | acceptStatement | deleteStatement | returnStatement | sendStatement | setStatement
    ;

idmsStmtsMandTermOn
    : transferStatement
    ;

idmsOnClause
    : ON generalIdentifier nextSentence?
    ;

nextSentence
    : (NEXT SENTENCE) DOT_FS?
    ;

// abend code statement

abendCodeStatement
    : ABEND CODE (literal | generalIdentifier) abendCodeDumpClause? abendCodeExitClause?
    ;

abendCodeDumpClause
    : (DUMP | NODUMP)
    ;

abendCodeExitClause
    : EXITS (INVOKED | IGNORED)
    ;

// accept transaction statistics statement

attachTaskCodeStatement
    : ATTACH TASK CODE (generalIdentifier | literal) attachTaskCodePriorityClause? idmsWaitNowaitClause?
    ;

attachTaskCodePriorityClause
    : PRIORITY (integerLiteral | generalIdentifier)
    ;

// bind statement

bindStatement
    : BIND (bindTaskClause | bindTransactionClause | bindRunUnitClause | bindMapClause | bindProcedureClause |bindRecordClause)
    ;

bindMapClause
    : MAP idms_map_name (RECORD idms_db_entity_name (TO (NULL | generalIdentifier))?)?
    ;

bindProcedureClause
    : PROCEDURE FOR idms_procedure_name TO generalIdentifier
    ;

bindTaskClause
    : TASK bindTaskStatementNodenameClause?
    ;

bindTaskStatementNodenameClause
    : NODENAME (generalIdentifier | literal)
    ;

bindTransactionClause
    : TRANSACTION STATISTICS
    ;

bindRunUnitClause
    : RUN_UNIT (FOR generalIdentifier)? (DBNODE bindDbNodeName)? (DBNAME bindDbNodeName)? (DICTNODE bindDbNodeName)? (DICTNAME bindDbNodeName)?
    ;

bindRecordClause
    : (generalIdentifier WITH idms_db_entity_name) | (idms_db_entity_name (TO generalIdentifier)?)
    ;

bindDbNodeName
    : literal | generalIdentifier
    ;

// change priority statement

changePriorityStatement
    : CHANGE PRIORITY TO? (integerLiteral | generalIdentifier)
    ;

// check terminal statement

checkTerminalStatement
    : CHECK TERMINAL checkTerminalGetStorageClause? INTO generalIdentifier (checkTerminalIntoClause | checkTerminalMaxLengthClause) checkTerminalReturnLengthClause?
    ;

checkTerminalGetStorageClause
    : GET STORAGE
    ;

checkTerminalIntoClause
    : TO generalIdentifier
    ;

checkTerminalMaxLengthClause
    : MAX LENGTH (generalIdentifier | integerLiteral)
    ;

checkTerminalReturnLengthClause
    : RETURN LENGTH INTO? generalIdentifier
    ;

// commit statement

commitStatement
   : COMMIT TASK? ALL?
   ;

// connect statement

connectStatement
   : CONNECT idms_db_entity_name TO idms_db_entity_name
   ;

// dc statement

dcStatement
    : DC RETURN dcNextTaskCodeClause? dcOptionClause? dcTimeoutClause? dcNextTaskIntervalClause?
    ;

dcNextTaskCodeClause
    : NEXT TASK CODE (generalIdentifier | literal)
    ;

dcOptionClause
    : (NORMAL | ABORT | CONTINUE | IMMEDIATE)
    ;

dcTimeoutClause
    : TIMEOUT (dcIntervalClause | dcProgramClause)*
    ;

dcNextTaskIntervalClause
    : NEXT TASK INTERVAL (generalIdentifier | integerLiteral) EVENT TYPE (INTERNAL | EXTERNAL) dcEventClause?
    ;

dcIntervalClause
    : INTERVAL (generalIdentifier | integerLiteral)
    ;

dcProgramClause
    : PROGRAM (generalIdentifier | literal)
    ;

dcEventClause
    :  (EVENT NAME (generalIdentifier | literal)) | (EVENT generalIdentifier)
    ;

// dequeue statement

dequeueStatement
    : DEQUEUE (ALL | dequeueNameStatement+)
    ;

dequeueNameStatement
    : NAME generalIdentifier LENGTH (generalIdentifier | integerLiteral)
    ;

// disconnect statement

disconnectStatement
   : DISCONNECT idms_db_entity_name FROM idms_db_entity_name
   ;

// end statement

endStatement
   : END (endLineClause | endTransactionClause)
   ;

endLineClause
   : LINE TERMINAL SESSION?
   ;

endTransactionClause
   : TRANSACTION STATISTICS endTransactionWriteClause? endTransactionIntoClause? endTransactionLengthClause?
   ;

endTransactionWriteClause
   : (WRITE | NOWRITE)
   ;

endTransactionIntoClause
   : INTO generalIdentifier
   ;

endTransactionLengthClause
   : LENGTH (generalIdentifier | integerLiteral)
   ;

// endpage statement

endpageStatement
   : ENDPAGE SESSION?
   ;

// enqueue statement

enqueueStatement
   : ENQUEUE (WAIT | NOWAIT | TEST)? enqueueNameClause*
   ;

enqueueNameClause
   : NAME generalIdentifier LENGTH (generalIdentifier | integerLiteral) (EXCLUSIVE | SHARED)?
   ;

// erase statement

eraseStatement
   : ERASE idms_db_entity_name ((PERMANENT | SELECTIVE | ALL) MEMBERS)?
   ;

// find statement

findStatement
   : FIND keepClause? findObtainClause
   ;

// free statement

freeStatement
    : FREE STORAGE (freeStgidClause | freeForClause)
    ;

freeStgidClause
    : STGID (generalIdentifier | literal)
    ;

freeForClause
    : FOR generalIdentifier (FROM generalIdentifier)?
    ;

keepClause
    : KEEP EXCLUSIVE?
    ;

findObtainClause
    : calcClause | currentClause | ownerClause | recnameClause | dbkeyClause | positionClause
    ;

calcClause
    : (CALC | ANY | DUPLICATE) idms_db_entity_name
    ;

currentClause
    : CURRENT idms_db_entity_name? (WITHIN idms_db_entity_name)?
    ;

ownerClause
    : OWNER WITHIN idms_db_entity_name
    ;

recnameClause
    : idms_db_entity_name (DB_KEY IS? generalIdentifier | WITHIN idms_db_entity_name CURRENT? USING generalIdentifier)
    ;

dbkeyClause
    : DB_KEY IS? generalIdentifier (PAGE_INFO generalIdentifier)?
    ;

positionClause
    : (orderClause | integerLiteral | generalIdentifier) idms_db_entity_name? WITHIN idms_db_entity_name
    ;

orderClause
    : ( NEXT | PRIOR | FIRST | LAST )
    ;

// finish statement

finishStatement
   : FINISH TASK?
   ;

// get statement
getStatement
    : GET (getTimeClause | idms_db_entity_name | getQueueClause | getScratchClause | getStorageClause)?
    ;

getQueueClause
    : QUEUE (ID (generalIdentifier | literal))? getQueueTypeClause? getStatClause? getQueueLockClause?  idmsWaitNowaitClause? INTO generalIdentifier getLengthClause getReturnClause?
    ;

getQueueTypeClause
    : (NEXT | FIRST | LAST | PRIOR | (SEQUENCE (generalIdentifier | integerLiteral)) | (RECORD ID (generalIdentifier | literal)))
    ;

getStatClause
    : (DELETE | KEEP)
    ;

getQueueLockClause
    : (LOCK | NOLOCK)
    ;

getLengthClause
    : ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | literal)))
    ;

getReturnClause
    : RETURN LENGTH INTO generalIdentifier
    ;

getScratchClause
    : SCRATCH getScratchAreaClause? getScratchNextClause? getStatClause? INTO generalIdentifier getLengthClause getReturnClause?
    ;

getScratchAreaClause
    : AREA ID (generalIdentifier | literal)?
    ;

getScratchNextClause
    : (NEXT | FIRST | LAST | PRIOR | CURRENT | (RECORD ID generalIdentifier))
    ;

getStorageClause
    : STORAGE FOR generalIdentifier (TO generalIdentifier)? (LENGTH generalIdentifier)? (POINTER generalIdentifier)?
    idmsWaitNowaitClause? KEEP? (LONG | SHORT)? (USER | SHARED)? (STGID (generalIdentifier | literal))?
    getStorageValueClause? getStorageLocClause?
    ;

getStorageValueClause
    : VALUE IS (LOW_VALUE | HIGH_VALUE | generalIdentifier)
    ;

getStorageLocClause
    : LOCATION IS? (ANY | BELOW)?
    ;

getTimeClause
    : TIME getTimeIntoClause? (DATE INTO generalIdentifier)?
    ;

getTimeIntoClause
    : INTO generalIdentifier (COMP | COMP_3 | EDIT)
    ;

// inquire map statement

inquireMapMoveStatement
   : INQUIRE MAP idms_map_name MOVE inqMapMovePhrase
   ;

inqMapMovePhrase
   : (AID TO generalIdentifier) | (CURSOR TO generalIdentifier generalIdentifier) | (IN LENGTH FOR generalIdentifier TO generalIdentifier)
   ;

inquireMapIfStatement
   : INQUIRE MAP idms_map_name IF inqMapIfPhrase
   ;

inqMapIfPhrase
   : INPUT (UNFORMATTED | TRUNCATED | CHANGED | EXTRANEOUS) | (CURSOR AT? DFLD generalIdentifier) |
   (inqMapWhichFields | inqMapWhichDflds) inqMapFieldTestPhrase
   ;

inqMapWhichFields
   : CURRENT | ALL | NONE | ANY | SOME | ALL (BUT | EXCEPT) CURRENT
   ;

inqMapWhichDflds
   : (ALL | NONE | ANY | SOME | ALL (BUT | EXCEPT))? (DFLD generalIdentifier)+?
   ;

inqMapFieldTestPhrase
   : DATA IS? (YES | NO | ERASE | TRUNCATED | IDENTICAL | DIFFERENT) | mapEditPhrase
   ;

mapEditPhrase
   : EDIT IS? (ERROR | CORRECT)
   ;

// keep statement

keepStatement
    : KEEP (keepCurrentClause | keepLongtermClause)
    ;

keepCurrentClause
    :  EXCLUSIVE? currentClause
    ;

keepLongtermClause
    : LONGTERM (ALL | (generalIdentifier | literal)) keepLongtermRestClause
    ;

keepLongtermRestClause
    : (keepLongtermNotifyClause | keepLongtermLockClause | keepLongtermTestClause | RELEASE)
    ;

keepLongtermNotifyClause
    : NOTIFY CURRENT idms_db_entity_name
    ;

keepLongtermLockClause
    : ((UPGRADE (SHARE | EXCLUSIVE) (RETURN NOTIFICATION INTO? generalIdentifier)) | ((SHARE | EXCLUSIVE) CURRENT idms_db_entity_name)) (WAIT | NOWAIT | NODEADLOCK)?
    ;

keepLongtermTestClause
    : TEST (RETURN NOTIFICATION INTO? generalIdentifier)?
    ;

// load Statement

loadStatement
    : LOAD TABLE (generalIdentifier | idms_table_name) INTO generalIdentifier loadLocationClause idmsDictnodeClause? idmsDictnameClause? loadLoadlibClause? idmsWaitNowaitClause
    ;

loadLocationClause
    : (TO | POINTER) generalIdentifier
    ;

loadLoadlibClause
    : LOADLIB (generalIdentifier | literal)
    ;

// map statement

mapStatement
    : MAP (mapInClause | mapOutClause | mapOutInClause)
    ;

mapInClause
    : IN USING idms_map_name mapIoInputPhrase? mapDetailPhrase?
    ;

mapIoInputPhrase
    : mapInIoPhrase | mapInputPhrase
    ;

mapInIoPhrase
    : (IO mapInputPhrase? | (NOIO DATASTREAM idmsDmlFromClause))
    ;

mapInputPhrase
    : INPUT DATA IS? (YES | NO)
    ;

mapDetailPhrase
    : ((DETAIL mapDetailOptions?) | HEADER ) ((PAGE IS? generalIdentifier) | MODIFIED)*
    ;

mapDetailOptions
    : (NEXT | FIRST | (SEQUENCE NUMBER IS? generalIdentifier) | (KEY IS? generalIdentifier))
    (RETURNKEY IS? generalIdentifier)?
    ;

mapOutClause
    : OUT USING idms_map_name  idmsWaitNowaitClause?  mapOutIoPhrase? mapOutputPhrase? mapMessagePhrase? mapOutDetailPhrase?
    ;

mapOutIoPhrase
    : (IO | (NOIO DATASTREAM mapOutIntoClause))
    ;

mapOutIntoClause
    : INTO? generalIdentifier ((TO generalIdentifier) | (MAX? LENGTH (generalIdentifier | integerLiteral)))
      (RETURN LENGTH INTO? generalIdentifier)?
    ;

mapOutputPhrase
    : OUTPUT ((DATA IS? (YES | NO | ERASE | ATTRIBUTE))? (NEWPAGE | ERASE)? LITERALS?)
    ;

mapMessagePhrase
    : MESSAGE IS? generalIdentifier idmsDmlLengthClause
    ;

mapOutDetailPhrase
    : (DETAIL (NEW | CURRENT)? (KEY IS? generalIdentifier)?) |
      (RESUME (PAGE IS? (CURRENT | NEXT | PRIOR | FIRST | LAST | generalIdentifier))?)
    ;

mapOutInClause
    : OUTIN USING idms_map_name mapOutputPhrase? mapInputPhrase? mapMessagePhrase?
    ;

idmsDictnameClause
    : DICTNAME (generalIdentifier | idms_dictionary_name)
    ;


idmsDictnodeClause
    : DICTNODE (generalIdentifier | idms_node_name)
    ;

idmsDmlFromClause
    : FROM generalIdentifier idmsDmlLengthClause
    ;

idmsDmlLengthClause
   : ((TO generalIdentifier) | (LENGTH (generalIdentifier | integerLiteral)))
   ;

idmsWaitNowaitClause
    : (WAIT | NOWAIT)
    ;

// modify statement
modifyStatement
    : MODIFY  ((MAP modifyMapClause) | idms_db_entity_name )
    ;
// modify map statement
modifyMapClause
    : idms_map_name (PERMANENT | TEMPORARY)?
     (CURSOR AT? ((DFLD generalIdentifier) | (generalIdentifier | integerLiteral) (generalIdentifier | integerLiteral)))?
     (WCC ((RESETMDT | NOMDT) | (RESETKBD | NOKBD) | (ALARM | NOALARM) | (STARTPRT | NOPRT) |
     (NLCR | FORTYCR | SIXTYFOURCR | EIGHTYCR))+)? (modifyMapForClause modifyMapFieldOptionsClause)?
    ;

modifyMapForClause
    : FOR ((ALL ((BUT | EXCEPT) (CURRENT | (DFLD generalIdentifier)+) | (ERROR | CORRECT)? FIELDS)) |
      (ALL? (DFLD generalIdentifier)+))
    ;

modifyMapFieldOptionsClause
    : (BACKSCAN | NOBACKSCAN)? (OUTPUT DATA IS? (YES | NO | ERASE | ATTRIBUTE))? mapInputPhrase?
    ((RIGHT | LEFT)? JUSTIFY)? (PAD (LOW_VALUE | HIGH_VALUE | (literal | generalIdentifier)))?
    mapEditPhrase? (REQUIRED | OPTIONAL)? (ERROR MESSAGE IS? (ACTIVE | SUPPRESS))? (ATTRIBUTES (attributeList)+)?
    ;

attributeList
    : SKIPCHAR | ALPHANUMERIC | NUMERIC | PROTECTED | UNPROTECTED | DISPLAY | DARK | BRIGHT | DETECT | NOMDT | MDT | BLINK | NOBLINK | REVERSE_VIDEO |
    NORMAL_VIDEO | UNDERSCORE | NOUNDERSCORE | NOCOLOR | BLUE | RED | PINK | GREEN | TURQUOISE | YELLOW | WHITE
    ;

// obtain statement

obtainStatement
   : OBTAIN keepClause? findObtainClause
   ;

// IDMS post statement

postStatement
   : POST ((EVENT NAME (generalIdentifier | literal) CLEAR?) | (EVENT generalIdentifier))
   ;

// IDMS put statement

putStatement
   : PUT (putQueueStatement | putScratchClause)
   ;

putQueueStatement
   : QUEUE (ID (generalIdentifier | literal))? (FIRST | LAST)? idmsDmlFromClause putReturnClause? putRetentionClause?
   ;

putReturnClause
   : RETURN RECORD ID INTO generalIdentifier?
   ;

putRetentionClause
   : RETENTION (generalIdentifier | integerLiteral)
   ;

putScratchClause
   : SCRATCH putAreaIdClause? idmsDmlFromClause putRecordClause? putReturnClause
   ;

putAreaIdClause
   : AREA ID (generalIdentifier | literal)
   ;

putRecordClause
   : RECORD ID (generalIdentifier | integerLiteral) REPLACE?
   ;

// ready statement
readyStatement
    : READY idms_db_entity_name? (USAGE_MODE IS? (PROTECTED | EXCLUSIVE)? (RETRIEVAL | UPDATE))?
    ;

// rollback statement
rollbackStatement
    : ROLLBACK TASK? CONTINUE?
    ;

// snap statement

snapStatement
   : SNAP (TITLE IS? generalIdentifier)? (ALL | SYSTEM | TASK)? idmsDmlFromClause*
   ;

// startpage statement

startpageStatement
    : STARTPAGE SESSION? idms_map_name (WAIT | NOWAIT | RETURN)? (BACKPAGE | NOBACKPAGE)? (UPDATE | BROWSE)?
     (AUTODISPLAY | NOAUTODISPLAY)?
    ;

// store statement
storeStatement
    : STORE idms_db_entity_name
    ;

// transfer statement

transferStatement
   : TRANSFER CONTROL? TO? (generalIdentifier | idms_program_name) (RETURN | LINK | NORETURN | XCTL)?
   (USING generalIdentifier (COMMACHAR? generalIdentifier)*)?
   ;

// wait statement

waitStatement
   : WAIT (((LONG | SHORT)? (waitEventTypeClause | waitEventListClause (COMMACHAR? waitEventListClause)*))
   | (REDISPATCH (waitEventTypeClause | waitEventListClause (COMMACHAR? waitEventListClause)*)?))
   ;

waitEventTypeClause
   : EVENT NAME (generalIdentifier | literal)
   ;

waitEventListClause
   : EVENT generalIdentifier
   ;

// write IDMS
writeIdmsStatement
   : WRITE (writeJournalClause | writeLineClause | writeLogClause | writePrinterClause | writeTerminalClause |
            writeThenReadClause) idmsOnClause?
   ;

writeJournalClause
   : JOURNAL idmsWaitNowaitClause? (SPAN | NOSPAN)? idmsDmlFromClause
   ;

writeLineClause
   : LINE TO? TERMINAL idmsWaitNowaitClause? (NEWPAGE | ERASE)? NOBACKPAGE? idmsDmlFromClause (HEADER (generalIdentifier | integerLiteral))?
   ;

writeLogClause
   : LOG MESSAGE ID (generalIdentifier | integerLiteral) writeLogParmsClause? writeLogReplyClause? writeLogMessagePrefixClause? writeLogTextClause?
   ;

writeLogParmsClause
   : PARMS idmsDmlFromClause+
   ;

writeLogReplyClause
   : REPLY INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   ;

writeLogMessagePrefixClause
   : MESSAGE PREFIX IS (generalIdentifier | literal)
   ;

writeLogTextClause
   : TEXT INTO? generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (MESSAGE? PREFIX IS? (YES | NO))? (TEXT IS? ONLY)?
   ;

writePrinterClause
   : PRINTER (NEWPAGE | ERASE)? ENDRPT? (SCREEN CONTENTS | writePrinterNativeClause)
   (COPIES (generalIdentifier | integerLiteral))? (REPORT ID (generalIdentifier | integerLiteral))?
   writePrinterTypeClause? HOLD? KEEP?
   ;

writePrinterNativeClause
   : NATIVE? idmsDmlFromClause
   ;

writePrinterTypeClause
   : (CLASS (generalIdentifier | integerLiteral)) | (DESTINATION (generalIdentifier | literal) ALL?)
   ;

writeTerminalClause
   : TERMINAL idmsWaitNowaitClause? writeTerminalEraseClause? (FREE STORAGE)? idmsDmlFromClause
   ;

writeTerminalEraseClause
   : NEWPAGE | ERASE | EAU | (ERASE ALL UNPROTECTED)
   ;

writeThenReadClause
   : THEN READ TERMINAL idmsWaitNowaitClause? writeTerminalEraseClause? (FREE STORAGE)?
   idmsDmlFromClause ((MODIFIED | BUFFER) FROM POSITION (generalIdentifier | literal))? (GET STORAGE)?
   INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (RETURN LENGTH INTO? generalIdentifier)?
   ;

// read statement
readStatement
   : READ (readLineFromTerminalClause | readTerminalClause) idmsOnClause?
   ;

readTerminalClause
   : TERMINAL idmsWaitNowaitClause? (BUFFER | (MODIFIED FROM POSITION (generalIdentifier | literal)))?
   (GET STORAGE)? INTO generalIdentifier ((TO generalIdentifier) | (MAX LENGTH (generalIdentifier | integerLiteral)))
   (RETURN LENGTH INTO? generalIdentifier)?
   ;

readLineFromTerminalClause
   : LINE FROM? TERMINAL ECHO? NOBACKPAGE? INTO generalIdentifier ((TO generalIdentifier)
   | (MAX LENGTH (generalIdentifier | integerLiteral))) (RETURN LENGTH INTO? generalIdentifier)?
   ;

// accept statement
acceptStatement
    : ACCEPT (acceptIdmsDcClause idmsOnClause? | acceptIdmsDbClause idmsOnClause?)
    ;

acceptIdmsDcClause
   : acceptTransactionStatisticsClause | ((LTERM ID | PTERM ID | SCREENSIZE | SYSTEM ID | SYSVERSION | TASK CODE | TASK ID | USER ID) INTO generalIdentifier)
   ;

acceptTransactionStatisticsClause
    : TRANSACTION STATISTICS acceptTransactionStatisticsWriteClause? acceptTransactionStatisticsIntoClause? acceptTransactionStatisticsLengthClause?
    ;

acceptTransactionStatisticsWriteClause
    : (WRITE | NOWRITE)
    ;

acceptTransactionStatisticsIntoClause
    : INTO generalIdentifier
    ;

acceptTransactionStatisticsLengthClause
    : LENGTH (integerLiteral | generalIdentifier)
    ;

acceptIdmsDbClause
    : generalIdentifier ((FROM acceptIdmsDbOptions) | FOR idms_db_entity_name)
    ;

acceptIdmsDbOptions
    : (idms_procedure_name PROCEDURE) | currencyPageInfo | (idms_db_entity_name acceptIdmsTypes) |
     (IDMS_STATISTICS (EXTENDED generalIdentifier)?)
    ;

acceptIdmsTypes
    : (BIND | ((NEXT | PRIOR |OWNER)? currencyPageInfo))
    ;

currencyPageInfo
    : CURRENCY (PAGE_INFO generalIdentifier)?
    ;

// delete statement

deleteStatement
    : DELETE deleteIdmsDCStatement idmsOnClause?
    ;

deleteIdmsDCStatement
    : deleteQueueClause | deleteScratchClause | deleteTableClause
    ;

deleteQueueClause
    : QUEUE deleteQueueIdClause? (CURRENT | ALL)?
    ;

deleteQueueIdClause
    : ID (generalIdentifier | literal)
    ;

deleteScratchClause
    : SCRATCH deleteScratchIdClause? (CURRENT | FIRST | LAST | NEXT | PRIOR | ALL | RECORD ID generalIdentifier)? (RETURN RECORD ID INTO? generalIdentifier)?
    ;

deleteScratchIdClause
    : AREA ID (generalIdentifier | literal)
    ;

deleteTableClause
    : TABLE FROM? (generalIdentifier | idms_table_name) idmsDictnodeClause? idmsDictnameClause? (LOADLIB (generalIdentifier | literal))?
    ;

// return statment

returnStatement
    : RETURN idmsReturn idmsOnClause?
    ;

idmsReturn
    : generalIdentifier FROM idms_db_entity_name (CURRENCY | orderClause CURRENCY? | USING generalIdentifier)
      (KEY INTO? generalIdentifier)?
    ;

// send statement

sendStatement
    : SEND sendIdmsClause
    ;

sendIdmsClause
    : MESSAGE (ONLY | ALWAYS)? TO sendIdmsToClause idmsDmlFromClause
    ;

sendIdmsToClause
    : (DEST ID (generalIdentifier | literal)) | (USER ID generalIdentifier) | (LTERM ID (generalIdentifier | literal))
    ;

// set statement

setStatement
    : SET setIdmsDcStatement idmsOnClause?
    ;

setIdmsDcStatement
   : setAbendExitStatement | setTimerStatement
   ;

setAbendExitStatement
   : ABEND EXIT ((ON? PROGRAM (generalIdentifier | literal)) | OFF)
   ;

setTimerStatement
   : TIMER (setTimerWaitClause | setTimerPostClause | setTimerStartClause | (CANCEL setTimerIdClause))
   ;

setTimerWaitClause
   : WAIT setTimerIntervalClause
   ;

setTimerPostClause
   : POST setTimerIntervalClause setTimerEventClause? setTimerIdClause?
   ;

setTimerStartClause
   : START setTimerIntervalClause (TASK CODE (generalIdentifier | literal) (PRIORITY (generalIdentifier | integerLiteral))?)? setTimerIdClause? setTimerDataClause?
   ;

setTimerIntervalClause
   : INTERVAL (generalIdentifier | integerLiteral) SECONDS?
   ;

setTimerEventClause
   : EVENT generalIdentifier
   ;

setTimerIdClause
   : TIMER ID generalIdentifier
   ;

setTimerDataClause
   : DATA idmsDmlFromClause
   ;

// condition

idms_map_name
    : {validateLength(_input.LT(1).getText(), "map name", 8);} variableUsageName
    ;

idms_db_entity_name
    : {validateLength(_input.LT(1).getText(), "db entity name", 16);} variableUsageName
    ;

idms_map_name_definition
    : {validateLength(_input.LT(1).getText(), "map name", 8);} dataName
    ;

idms_schema_name
    : {validateLength(_input.LT(1).getText(), "schema name", 8);} dataName
    ;

idms_subschema_name
    : {validateLength(_input.LT(1).getText(), "subschema name", 8);} dataName
    ;

idms_dictionary_name
    : {validateLengthTrimBorders(_input.LT(1).getText(), "dictionary name", 8);} literal
    ;

idms_node_name
    : {validateLengthTrimBorders(_input.LT(1).getText(), "node name", 8);} literal
    ;

idms_procedure_name
    : {validateLength(_input.LT(1).getText(), "procedure name", 8);} variableUsageName
    ;

idms_table_name
    : {validateLengthTrimBorders(_input.LT(1).getText(), "table name", 8);} literal
    ;

// identifier

generalIdentifier
   : specialRegister | qualifiedDataName | functionCall
   ;

functionCall
   : FUNCTION functionName (LPARENCHAR argument (COMMACHAR? argument)* RPARENCHAR)* referenceModifier?
   ;

referenceModifier
   : LPARENCHAR characterPosition COLONCHAR length? RPARENCHAR
   ;

characterPosition
   : arithmeticExpression
   ;

length
   : arithmeticExpression
   ;

idms_program_name
    : {validateLengthTrimBorders(_input.LT(1).getText(), "program name", 8);} literal
    ;

argument
   : arithmeticExpression
   ;

// qualified data name ----------------------------------

qualifiedDataName
   : variableUsageName tableCall? referenceModifier? inData*
   ;

tableCall
   : LPARENCHAR (ALL | arithmeticExpression) (COMMACHAR? (ALL | arithmeticExpression))* RPARENCHAR
   ;

specialRegister
   : ADDRESS OF generalIdentifier
   | LENGTH OF? generalIdentifier | LINAGE_COUNTER
   ;

// in

inData
   : (IN | OF) variableUsageName tableCall? referenceModifier?
   ;

// names
dataName
   : cobolWord
   ;

variableUsageName
   : cobolWord
   ;

functionName
   : INTEGER | LENGTH | RANDOM | SUM | WHEN_COMPILED | cobolWord
   ;

integerLiteral
   : INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88
   ;

literal
   : NONNUMERICLITERAL | figurativeConstant | numericLiteral | booleanLiteral | charString
   ;

figurativeConstant
   : ALL literal | HIGH_VALUE | HIGH_VALUES | LOW_VALUE | LOW_VALUES | NULL | NULLS | QUOTE | QUOTES | SPACE | SPACES | ZEROS | ZEROES
   ;

booleanLiteral
   : TRUE | FALSE
   ;

numericLiteral
   : NUMERICLITERAL | ZERO | integerLiteral
   ;

charString
   : FINALCHARSTRING
   ;

// arithmetic expression ----------------------------------

arithmeticExpression
   : multDivs plusMinus*
   ;

plusMinus
   : (PLUSCHAR | MINUSCHAR) multDivs
   ;

multDivs
   : powers multDiv*
   ;

multDiv
   : (ASTERISKCHAR | SLASHCHAR) powers
   ;

powers
   : (PLUSCHAR | MINUSCHAR)? basis power*
   ;

power
   : DOUBLEASTERISKCHAR basis
   ;

basis
   : generalIdentifier | literal | LPARENCHAR arithmeticExpression RPARENCHAR
   ;

//

cobolWord
   : IDENTIFIER | cobolCompilerDirectivesKeywords | cobolKeywords | idmsKeywords
   ;


cobolKeywords
   : ABEND | ADDRESS | CHECK | CR | FIELD | FIRST | HEADER | LINK
   | RESUME | TIMER | UPDATE
   ;

idmsKeywords
   : DAY | DATE | DAY_OF_WEEK | TIME
   ;

cobolCompilerDirectivesKeywords
    :  ANY
    | DATA | DUMP
    | MAP
    | NAME
    | NODUMP
    | NUMBER
    | OUT
    | QUOTE
    | SEQUENCE | SHORT
    | SUPPRESS
    | TERMINAL | TEST
    ;

endClause
    : (DOT_FS | SEMICOLON_FS)
    ;
