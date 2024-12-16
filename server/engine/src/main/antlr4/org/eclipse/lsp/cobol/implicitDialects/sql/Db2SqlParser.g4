/*
 * Copyright (c) 2020 Broadcom.
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

parser grammar Db2SqlParser;
options {tokenVocab = Db2SqlLexer; superClass = MessageServiceParser;}

startRule: (
      execRule
    | ( nonExecRule | SINGLEDIGIT_1 | DOUBLEDIGIT_1 | INTEGERLITERAL | SINGLEDIGITLITERAL)
    | ~( EXEC_SQL | EXEC_SQLIMS | SINGLEDIGIT_1 | DOUBLEDIGIT_1 | INTEGERLITERAL | SINGLEDIGITLITERAL)
    )* EOF;
//startRule: .*? ((execRule | nonExecRule) .*?) * EOF;
//startIncludeRule: .*? (includeStatement .*?)* EOF;

execRule: (EXEC_SQL | EXEC_SQLIMS) sqlCode END_EXEC;

nonExecRule: sql_host_variables | binary_host_variable | binary_host_variable_array;

binary_host_variable_array: dbs_host_var_levels entry_name SQL TYPE IS binary_host_variable_type host_variable_array_times;

binary_host_variable: dbs_level_01 entry_name host_variable_usage binary_host_variable_type;
binary_host_variable_type:
    VARBINARY LPARENCHAR binary_host_variable_varbinary_size RPARENCHAR
    | BINARY (VARYING LPARENCHAR binary_host_variable_varbinary_size RPARENCHAR | LPARENCHAR binary_host_variable_binary_size RPARENCHAR);

binary_host_variable_binary_size: T=dbs_integerliteral_expanded {validateIntegerRange($T.start, $T.text, 1, 255);};
binary_host_variable_varbinary_size: T=dbs_integerliteral_expanded {validateIntegerRange($T.start, $T.text, 1, 32704);};

host_variable_usage: (USAGE IS?)? SQL TYPE IS;
host_variable_array_times: OCCURS host_variable_array_size TIMES?;
host_variable_array_size: T=dbs_integerliteral_expanded {validateIntegerRange($T.start, $T.text, 1, 32767);};

sql_host_variables: result_set_locator_variable | lob_xml_host_variables | lob_host_variables_arrays | lob_host_variables
                  | tableLocators_variable | rowid_host_variables_arrays | rowid_host_variables;

result_set_locator_variable: dbs_level_01 entry_name host_variable_usage result_set_locator;

tableLocators_variable: dbs_host_var_levels entry_name host_variable_usage tableLocators;

lob_xml_host_variables: dbs_host_var_levels entry_name host_variable_usage xml_as (lobWithSize | xml_lobNO_size) host_variable_array_times?;

lob_host_variables: dbs_integer entry_name host_variable_usage (lobWithSize | lobNoSize);

lob_host_variables_arrays: dbs_host_var_levels_arrays entry_name host_variable_usage (lobWithSize | lobNoSize) occurs_clause;

rowid_host_variables: dbs_host_var_levels entry_name host_variable_usage ROWID;

rowid_host_variables_arrays: dbs_host_var_levels_arrays entry_name host_variable_usage ROWID occurs_clause;

dbs_host_var_levels: dbs_level_01 | T=dbs_integer {validateIntegerRange($T.text, 2, 48);};

dbs_host_var_levels_arrays: T=dbs_integer {validateIntegerRange($T.text, 2, 48);};

result_set_locator: RESULT_SET_LOCATOR VARYING;

tableLocators: TABLE LIKE entry_name AS LOCATOR;

lobWithSize
    : (BINARY LARGE OBJECT | BLOB | CHARACTER LARGE OBJECT | CHAR LARGE OBJECT | CLOB | DBCLOB) LPARENCHAR dbs_integer k_m_g? RPARENCHAR
    ;
lobNoSize
    : BLOB_LOCATOR | CLOB_LOCATOR | DBCLOB_LOCATOR |  xml_lobNO_size
    ;

xml_lobNO_size: BLOB_FILE | CLOB_FILE | DBCLOB_FILE;

xml_as: XML AS;

occurs_clause: OCCURS dbs_host_var_size_arrays TIMES?;

dbs_host_var_size_arrays: T=dbs_integer {validateIntegerRange($T.text, 1, 32767);};

entry_name : (FILLER |dbs_host_names);
sqlCode
   : ~END_EXEC*
   ;

k_m_g: (K_CHAR | M_CHAR | G_CHAR);
dbs_host_names: dbs_special_name | IDENTIFIER ;

dbs_special_name: ABSOLUTE | ACCELERATION | ACCELERATOR | ACCESS | ACCESSCTRL | ACCTNG| ACTION | ACTIVATE | ACTIVE
                  | ADD | ADDRESS | AFTER | AGE| ALGORITHM | ALIAS | ALL | ALLOCATE | ALLOW | ALTER | ALTERIN | ALWAYS
                  | AND | ANY | APPEND | APPLCOMPAT | APPLICATION | APPLNAME | ARCHIVE | ARRAY| ARRAY_EXISTS | AS
                  | ASC | ASCII | ASENSITIVE | ASSEMBLE | ASSOCIATE | ASUTIME | AT | ATOMIC | ATTRIBUTES | AUDIT
                  | AUTHENTICATION | AUTHID | AUTONOMOUS | AUX | AUXILIARY | AVG | BASED | BEFORE | BEGIN
                  | BETWEEN | BIGINT | BINARY | BINARY_STRING_CONSTANT | BIND | BINDADD | BINDAGENT | BIT | BLOB
                  | BOTH | BSDS | BUFFERPOOL | BUFFERPOOLS | BUSINESS_TIME | BY | CACHE| CALL | CALLED | CALLER
                  | CAPTURE | CARDINALITY | CASCADE | CASCADED | CASE | CAST | CATALOG_NAME| CCSID | CHANGE
                  | CHANGED | CHANGES | CHAR | CHARACTER | CHARACTER_LENGTH | CHAR_LENGTH | CHECK | CLAUSE | CLIENT
                  | CLIENT_ACCTNG | CLIENT_APPLNAME| CLIENT_CORR_TOKEN| CLIENT_USERID| CLIENT_WRKSTNNAME| CLOB
                  | CLONE | CLOSE | CLUSTER | COALESCE | COBOL | COLLECTION | COLLID | COLUMN | COLUMNS | COMMENT
                  | COMMIT | COMMITTED| COMPATIBILITY | COMPRESS | CONCAT | CONCENTRATE | CONCURRENT | CONDITION
                  | CONDITION_NUMBER | CONNECT | CONNECTION | CONSTANT | CONSTRAINT | CONTAINS | CONTEXT | CONTINUE
                  | CONTROL | COPY | CORR | CORRELATION | COUNT | COUNT_BIG | COVARIANCE| CREATE | CREATEALIAS
                  | CREATEDBA | CREATEDBC | CREATEIN | CREATESG | CREATETAB | CREATETMTAB | CREATETS
                  | CREATE_SECURE_OBJECT | CROSS | CS | CUBE | CUME_DIST| CURRENT | CURRENTLY | CURRENT_DATE
                  | CURRENT_LC_CTYPE | CURRENT_PATH | CURRENT_SCHEMA | CURRENT_SERVER | CURRENT_TIME
                  | CURRENT_TIMESTAMP | CURRENT_TIMEZONE | CURSOR | CURSORS | CURSOR_NAME | CYCLE | DATA
                  | DATAACCESS | DATABASE | DATACLAS| DATE | DAY | DAYOFMONTH | DAYOFWEEK | DAYOFYEAR | DAYS | DB2
                  | DB2SQL | DB2_AUTHENTICATION_TYPE | DB2_AUTHORIZATION_ID | DB2_CONNECTION_STATE
                  | DB2_CONNECTION_STATUS | DB2_ENCRYPTION_TYPE | DB2_ERROR_CODE1 | DB2_ERROR_CODE2
                  | DB2_ERROR_CODE3 | DB2_ERROR_CODE4 | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_INTERNAL_ERROR_POINTER
                  | DB2_LAST_ROW | DB2_LINE_NUMBER | DB2_MESSAGE_ID | DB2_MODULE_DETECTING_ERROR
                  | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS | DB2_NUMBER_ROWS | DB2_ORDINAL_TOKEN1
                  | DB2_ORDINAL_TOKEN2 | DB2_ORDINAL_TOKEN3 | DB2_ORDINAL_TOKEN4| DB2_PRODUCT_ID | DB2_REASON_CODE
                  | DB2_RETURNED_SQLCODE | DB2_RETURN_STATUS | DB2_ROW_NUMBER | DB2_SERVER_CLASS_NAME | DB2_SQLERRD1
                  | DB2_SQLERRD2 | DB2_SQLERRD3 | DB2_SQLERRD4 | DB2_SQLERRD5 | DB2_SQLERRD6 | DB2_SQLERRD_SET
                  | DB2_SQL_ATTR_CURSOR_HOLD | DB2_SQL_ATTR_CURSOR_ROWSET | DB2_SQL_ATTR_CURSOR_SCROLLABLE
                  | DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE | DB2_SQL_NESTING_LEVEL
                  | DB2_TOKEN_COUNT | DBADM | DBCLOB | DBCTRL | DBINFO | DBMAINT | DEACTIVATE | DEALLOCATE | DEBUG
                  | DEBUGSESSION | DEC | DECFLOAT | DECIMAL | DECLARE | DEC_ROUND_CEILING | DEC_ROUND_DOWN
                  | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN | DEC_ROUND_HALF_UP | DEC_ROUND_UP
                  | DEFAULT | DEFAULTS | DEFER | DEFERRED | DEFINE | DEFINEBIND | DEFINER | DEFINERUN | DEGREE
                  | DELETE | DENSE_RANK| DEPENDENT | DESC | DESCRIBE | DESCRIPTOR | DETERMINISTIC | DIAGNOSTICS
                  | DISABLE | DISALLOW | DISPATCH | DISPLAY | DISPLAYDB | DISTINCT | DO | DOUBLE | DROP | DROPIN
                  | DSNDB04 | DSSIZE| DYNAMIC | DYNAMICRULES | EACH | EBCDIC | EDITPROC| ELEMENT  | ELIGIBLE | ELSE
                  | ELSEIF | EMPTY | ENABLE | ENCODING | ENCRYPTION | END | ENDING | ENFORCED | ENVIRONMENT | ERASE
                  | ESCAPE | EUR | EVERY | EXCEPT | EXCHANGE | EXCLUDE | EXCLUDING | EXCLUSIVE | EXECUTE | EXISTS
                  | EXIT | EXPLAIN | EXTERNAL | EXTRA | EXTRACT | FAILBACK | FAILURE| FAILURES | FENCED | FETCH
                  | FIELDPROC| FINAL | FIRST | FIRST_VALUE| FILENAME | FLOAT | FOLLOWING | FOR | FOREIGN | FORMAT | FOUND | FREE
                  | FREEPAGE | FULL | FUNCTION | FUNCTION_LEVEL_10| FUNCTION_LEVEL_11| FUNCTION_LEVEL_12
                  | GBPCACHE | GENERAL | GENERATE | GENERATED | GENERIC | GET | GET_ACCEL_ARCHIVE | GLOBAL | GO
                  | GOTO | GRANT | GRAPHIC | GROUP | GROUPING | G_CHAR| HANDLER | HASH | HAVING | HEX | HIDDENCHAR
                  | HIGH | HINT| HISTORY | HOLD | HOUR | HOURS | ID | IDENTITY | IF | IGNORE | IMAGCOPY | IMMEDIATE
                  | IMPLICITLY | IN | INCLUDE | INCLUDING | INCLUSIVE | INCREMENT | INDEX | INDEXBP | INDICATOR
                  | INHERIT | INITIALLY | INLINE | INOUT | INPUT | INSENSITIVE | INSERT | INSTEAD | INT
                  | INTEGER | INTERSECT | INVALID | INVOKEBIND | INVOKERUN | IS | ISO | ISOLATION | ITERATE
                  | JAR | JAVA | JIS | JOBNAME| JOIN | KEEP | KEY | KEYS | K_CHAR| LABEL | LABELS | LAG| LANGUAGE
                  | LANGUAGE_C | LARGE | LAST | LAST_VALUE| LC_CTYPE | LEAD | LEAVE | LEFT | LENGTH | LEVEL | LIKE
                  | LIMIT | LITERALS | LOAD | LOB | LOCAL | LOCALE | LOCATION | LOCATOR | LOCATORS | LOCK | LOCKED
                  | LOCKMAX | LOCKS | LOCKSIZE | LOGGED | LOOP | LOW | LOWER | MAIN | MAINTAINED | MASK | MATCHED
                  | MATERIALIZED | MAX | MAXPARTITIONS | MAXROWS | MAXVALUE | MEMBER | MERGE | MESSAGE_TEXT
                  | MGMTCLAS| MICROSECOND | MICROSECONDS | MIN| MINUTE | MINUTES | MINVALUE | MIXED | MODE
                  | MODIFIERS | MODIFIES | MONITOR1 | MONITOR2 | MONTH | MONTHS | MORECHAR | MOVE | MULTIPLIER
                  | M_CHAR| NAME | NAMES | NAMESPACE | NATIONAL | NCNAME| NEW | NEW_TABLE | NEXT | NO | NODEFER
                  | NONE | NOT | NTH_VALUE| NTILE| NULL | NULLS | NULTERM | NUMBER | NUMERIC | NUMPARTS| OBID| OBJECT
                  | OF | OFF | OFFSET | OLD | OLD_TABLE | ON | ONCE | ONLY | OPEN | OPERATION | OPTHINT | OPTIMIZE
                  | OPTIMIZATION | OPTION | OPTIONAL | OPTIONS | OR | ORDER | ORDINALITY | ORGANIZE | ORIGINAL | OUT
                  | OUTCOME | OUTER | OUTPUT | OVER | OVERLAPS | OVERRIDING | OWNER | OWNERSHIP | PACKADM | PACKAGE
                  | PACKAGESET| PACKAGE_NAME | PACKAGE_SCHEMA | PACKAGE_VERSION | PADDED | PAGE | PAGENUM | PARALLEL
                  | PARAMETER | PART | PARTITION | PARTITIONED| PASSING | PASSWORD | PATH | PCTFREE | PENDING
                  | PERCENT_RANK| PERIOD | PERMISSION | PIECESIZE | PLAN | PLI | PORTION | POSITION | POSITIONING
                  | PRECEDING | PRECISION | PREPARE | PRESERVE | PREVIOUS| PRIMARY | PRIOR | PRIQTY | PRIVILEGES
                  | PROCEDURE | PROFILE | PROGRAM | PUBLIC | QUALIFIER | QUERY | QUERYNO | QUOTED_NONE | RANDOM
                  | RANGE | RANK | RATIO_TO_REPORT| READ | READS | REAL | RECORDS | RECOVER | RECOVERDB | REF
                  | REFERENCES | REFERENCING | REFRESH | REGENERATE | REGISTERS | RELATIVE | RELEASE | REMOVE
                  | RENAME | REOPT | REORG | REPAIR | REPEAT | REPLACE | REQUIRED | RESET | RESIDENT | RESIGNAL
                  | RESOLUTION | RESPECT | RESTART | RESTRICT | RESULT | RESULT_SET_LOCATOR | RETAIN | RETURN
                  | RETURNED_SQLSTATE | RETURNING | RETURNS | REUSE | REVOKE | REXX | RIGHT | ROLE | ROLLBACK
                  | ROLLUP | ROTATE | ROUNDING | ROUND_CEILING | ROUND_DOWN | ROUND_FLOOR | ROUND_HALF_DOWN
                  | ROUND_HALF_EVEN | ROUND_HALF_UP | ROUND_UP | ROUTINE | ROW | ROWID | ROWS | ROWSET | ROW_COUNT
                  | ROW_NUMBER| RR | RS | RULES| RUN | SAVEPOINT | SBCS | SCHEMA | SCHEME | SCRATCHPAD | SCROLL
                  | SECOND | SECONDS | SECQTY | SECTION | SECURED | SECURITY | SEGSIZE| SELECT | SELECTIVITY
                  | SENSITIVE | SEQUENCE | SERVAUTH | SERVER | SERVER_NAME | SESSION | SESSION_USER | SET | SETS
                  | SHARE | SIGNAL | SIZE | SKIPCHAR | SMALLINT | SOME | SOURCE | SPACE | SPECIAL | SPECIFIC | SQL
                  | SQLADM | SQLCA | SQLCODE | SQLD | SQLDA | SQLDABC | SQLERROR | SQLEXCEPTION | SQLID | SQLN
                  | SQLSTATE | SQLVAR | SQLWARNING | STABILIZED | STACKED | START | STARTDB | STARTING | STATEMENT
                  | STATEMENTS | STATIC | STATS | STAY | STDDEV | STMTCACHE | STMTID | STMTTOKEN | STOGROUP | STOP
                  | STOPALL | STOPDB | STORAGE | STORCLAS| STORES | STOSPACE | STRUCTURE | STYLE | SUB | SUBSTR
                  | SUBSTRING | SUM | SYNONYM | SYSADM | SYSCTRL | SYSDEFLT | SYSIBM | SYSOPR | SYSTEM | SYSTEM_TIME
                  | TABLE | TABLESPACE | TEMPORAL| TEMPORARY | THEN | TIME | TIMESTAMP | TIMEZONE | TO | TOKEN
                  | TRACE | TRACKMOD | TRANSACTION | TRANSFER | TRANSLATE | TRANSLATION | TRIGGER | TRIGGERS | TRIM
                  | TRUNCATE | TRUSTED | TYPE | TYPES| UNBOUNDED | UNICODE | UNION | UNIQUE | UNNEST | UNPACK | UNTIL
                  | UPDATE | UPON | UPPER | UR | URL | USA | USAGE | USE | USER | USERID | USING | V1 | VALIDATE
                  | VALIDPROC| VALUE | VALUES | VARBINARY | VARCHAR | VARGRAPHIC | VARIABLE | VARIANCE| VARYING
                  | VCAT | VERSION | VERSIONING | VERSIONS | VIEW | VOLATILE | VOLUMES | WAIT | WAITFORDATA
                  | WHENEVER | WHERE | WHILE | WITH | WITHOUT | WLM | WORK | WORKFILE | WRAPPED | WRITE | WRKSTNNAME
                  | XML | XMLCAST| XMLNAMESPACES| XMLPATTERN| XMLQUERY| XMLSCHEMA| XMLTABLE | YEAR | YEARS | YES
                  | ZONE;

dbs_integer: INTEGERLITERAL | SINGLEDIGIT_1 | DOUBLEDIGIT_1 | SINGLEDIGITLITERAL;
dbs_integer_constant: dbs_integer | NUMERICLITERAL; //range 1 - 32767
dbs_search_condition: (NOT? (SELECTIVITY dbs_integer_constant)? | LPARENCHAR dbs_search_condition RPARENCHAR) ((AND|OR) NOT?
                      ( dbs_search_condition))* ;
dbs_integerliteral_expanded: MINUSCHAR? (INTEGERLITERAL|SINGLEDIGITLITERAL|SINGLEDIGIT_1);
dbs_level_01: SINGLEDIGIT_1 | DOUBLEDIGIT_1;
