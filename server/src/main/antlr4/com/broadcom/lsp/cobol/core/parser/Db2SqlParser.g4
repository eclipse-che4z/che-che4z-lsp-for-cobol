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
options {tokenVocab = Db2SqlLexer;}
import CICSParser;

allRules: dbs_allocate | dbs_alter | dbs_associate | dbs_begin | dbs_call | dbs_close | dbs_comment | dbs_commit |
          dbs_connect | dbs_create | dbs_declare | dbs_delete | dbs_describe | dbs_drop | dbs_end | dbs_exchange |
          dbs_execute | dbs_explain | dbs_fetch | dbs_free | dbs_get | dbs_grant | dbs_hold | dbs_include | dbs_insert |
          dbs_label | dbs_lock | dbs_merge | dbs_open | dbs_prepare | dbs_refresh | dbs_release | dbs_rename |
          dbs_revoke | dbs_rollback | dbs_savepoint | dbs_select | dbs_set | dbs_signal | dbs_transfer | dbs_truncate |
          dbs_update | dbs_values | dbs_whenever ;



/*ALLOCATE CURSOR */
dbs_allocate: ALLOCATE dbs_cursor_name CURSOR FOR RESULT SET dbs_rs_locator_variable;

/*ALTER (all) */
dbs_alter: literal+; //?

/*ASSOCIATE LOCATORS */
dbs_associate: ASSOCIATE (RESULT SET)? (LOCATOR | LOCATORS) dbs_rs_locator_variable (COMMACHAR dbs_rs_locator_variable)*
               WITH PROCEDURE (dbs_procedure_name | dbs_host_variable);


/*BEGIN DECLARE SECTION */
dbs_begin: BEGIN DECLARE SECTION;

/*CALL */
//?
dbs_call: CALL (dbs_procedure_name | dbs_variable) (LPARENCHAR dbs_expression (COMMACHAR dbs_expression)* | NULL |
          TABLE dbs_transition_table_name RPARENCHAR | USING DESCRIPTOR dbs_descriptor_name)?;

/*CLOSE */
dbs_close: CLOSE dbs_cursor_name;

/*COMMENT */
dbs_comment: COMMENT ON (dbs_comment_multiple_column_list | (dbs_comment_alias_designator | dbs_comment_column |
             dbs_comment_function | dbs_comment_index | dbs_comment_package | dbs_comment_plan | dbs_comment_procedure |
             dbs_comment_role | dbs_comment_sequence | dbs_comment_table | dbs_comment_trigger | dbs_comment_trusted |
             dbs_comment_type | dbs_comment_mask | dbs_comment_permission | dbs_comment_variable) IS dbs_string_constant);
//?
dbs_comment_multiple_column_list: (dbs_table_name | dbs_view_name) LPARENCHAR dbs_column_name IS
                                  dbs_string_constant (COMMACHAR dbs_column_name IS dbs_string_constant)* RPARENCHAR;
dbs_comment_alias_designator: (dbs_comment_public_alias_designator | dbs_comment_nonpub_alias_designator);
dbs_comment_public_alias_designator: PUBLIC ALIAS dbs_alias_name FOR SEQUENCE;
dbs_comment_nonpub_alias_designator: ALIAS dbs_alias_name (FOR (TABLE | SEQUENCE))?;
dbs_comment_column: COLUMN (dbs_table_name | dbs_view_name) dbs_column_name;
dbs_comment_function: dbs_comment_function_designator (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_function_designator: (FUNCTION dbs_function_name (LPARENCHAR dbs_comment_parameter_type
                                 (COMMACHAR dbs_comment_parameter_type)* RPARENCHAR)? | SPECIFIC FUNCTION dbs_specific_name);
dbs_comment_parameter_type: (dbs_comment_built_in_type | dbs_distinct_type_name | dbs_array_type_name) (AS LOCATOR)?;
dbs_comment_built_in_type: (dbs_comment_bit_int | dbs_comment_bit_decimal | dbs_comment_bit_float | dbs_comment_bit_decfloat |
                            dbs_comment_bit_char | dbs_comment_bit_clob | dbs_comment_bit_varchar | dbs_comment_bit_graphic |
                            dbs_comment_bit_binary | DATE | TIME | dbs_comment_bit_timestamp | ROWID);
dbs_comment_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_comment_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_comment_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_comment_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_comment_bit_char: (CHARACTER | CHAR) (VARYING dbs_comment_bit_varchara | LARGE OBJECT dbs_comment_bit_cloba |
                       LPARENCHAR dbs_integer RPARENCHAR dbs_comment_bit_charopts);
dbs_comment_bit_charopts: (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED | BIT) DATA)?;
dbs_comment_bit_varchar: VARCHAR dbs_comment_bit_varchara;
dbs_comment_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_comment_bit_charopts;
dbs_comment_bit_clob: CLOB dbs_comment_bit_cloba;
dbs_comment_bit_cloba: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? dbs_comment_bit_charopts;
dbs_comment_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR |
                         DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_comment_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR
                        dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
dbs_comment_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_comment_index: INDEX dbs_index_name;
dbs_comment_package: dbs_collection_id_package_name (VERSION? dbs_version_id)?;
dbs_comment_plan: PLAN dbs_plan_name;
dbs_comment_procedure: PROCEDURE dbs_procedure_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_role: ROLE dbs_role_name;
dbs_comment_sequence: SEQUENCE dbs_sequence_name;
dbs_comment_table: TABLE (dbs_table_name | dbs_view_name);
dbs_comment_trigger: TRIGGER dbs_trigger_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_trusted: TRUSTED CONTEXT dbs_context name;
dbs_comment_type: TYPE dbs_type_name;
dbs_comment_mask: MASK dbs_mask_name;
dbs_comment_permission: PERMISSION dbs_permission_name;
dbs_comment_variable: VARIABLE dbs_variable_name;


/*COMMIT */
dbs_commit: COMMIT WORK?;

/*CONNECT */
dbs_connect: CONNECT (TO (dbs_location_name | dbs_host_variable) dbs_connect_authorization? | RESET | dbs_connect_authorization)?;
dbs_connect_authorization: USER dbs_host_variable USING dbs_host_variable;

/*CREATE (all) */
dbs_create: literal+; //?

/*DECLARE (all) */
dbs_declare: literal+; //?

/*DELETE */
dbs_delete: DELETE FROM (dbs_table_name | dbs_view_name) (dbs_delete_period | dbs_delete_noperiod | dbs_delete_positioned);
dbs_delete_period: dbs_delete_period_clause dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)?
                    (WHERE dbs_search_condition)? (dbs_delete_isolation_clause | SKIP LOCKED DATA)* (QUERYNO dbs_integer)?;
dbs_delete_period_clause: FOR PORTION OF BUSINESS_TIME (FROM dbs_value TO dbs_value | BETWEEN dbs_value AND dbs_value)?;
dbs_delete_include_column: INCLUDE LPARENCHAR dbs_column_name dbs_delete_data_type (COMMACHAR dbs_column_name dbs_delete_data_type)* RPARENCHAR;
dbs_delete_data_type: (dbs_delete_built_in_type | dbs_distinct_type);
dbs_delete_built_in_type: (dbs_delete_bit_int | dbs_delete_bit_decimal | dbs_delete_bit_float | dbs_delete_bit_decfloat | dbs_delete_bit_char |
                            dbs_delete_bit_varchar | dbs_delete_bit_graphic | dbs_delete_bit_binary | DATE | TIME | dbs_delete_bit_timestamp );
dbs_delete_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_delete_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_delete_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_delete_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_delete_bit_char: (CHARACTER | CHAR) (VARYING dbs_delete_bit_varchara | LPARENCHAR dbs_integer RPARENCHAR) (FOR BIT DATA)?;
dbs_delete_bit_varchar: VARCHAR dbs_delete_bit_varchara;
dbs_delete_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?;
dbs_delete_bit_graphic: (GRAPHIC | VARGRAPHIC) (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_delete_bit_binary: (BINARY VARYING? | VARBINARY) (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_delete_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_delete_assignment_clause: (dbs_delete_assignment_clause_whole | dbs_delete_assignment_clause_part);
dbs_delete_assignment_clause_whole: dbs_column_name EQUALCHAR (dbs_expression | NULL) (COMMACHAR dbs_column_name EQUALCHAR (dbs_expression | NULL))*;
dbs_delete_assignment_clause_part: LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_row_fullselect | (dbs_expression |
                                   NULL) (COMMACHAR (dbs_expression | NULL)*)) RPARENCHAR;
dbs_delete_isolation_clause: WITH (RR | RS | CS);
dbs_delete_noperiod: dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)? (WHERE dbs_search_condition)?
                        dbs_fetch_clause? (dbs_delete_isolation_clause | SKIP LOCKED DATA)* (QUERYNO dbs_integer)?;
dbs_delete_positioned: dbs_correlation_name? WHERE CURRENT OF dbs_cursor_name (FOR ROW (dbs_host_variable | dbs_integer_constant) OF ROWSET)?;


 /*DESCRIBE (all) */
dbs_describe: DESCRIBE (dbs_describe_cursor | dbs_describe_input | dbs_describe_output | dbs_describe_procedure | dbs_describe_table);
dbs_describe_cursor: CURSOR (dbs_cursor_name | dbs_host_variable) INTO dbs_descriptor_name;
dbs_describe_input: INPUT dbs_statement_name INTO dbs_descriptor_name;
dbs_describe_output: OUTPUT? dbs_statement_name INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?;
dbs_describe_procedure: PROCEDURE (dbs_procedure_name | dbs_host_variable) INTO dbs_descriptor_name;
dbs_describe_table: TABLE dbs_host_variable INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?;


/*DROP */
dbs_drop: DROP (dbs_drop_alias_designator | dbs_drop_database | dbs_drop_function | dbs_drop_specific |
            dbs_drop_index | dbs_drop_mask | dbs_drop_package | dbs_drop_permission | dbs_drop_procedure | dbs_drop_role |
            dbs_drop_sequence | dbs_drop_stogroup | dbs_drop_synonym | dbs_drop_table | dbs_drop_tablespace |
            dbs_drop_trigger | dbs_drop_trusted | dbs_drop_type | dbs_drop_variable | dbs_drop_view);
dbs_drop_alias_designator: (dbs_drop_public_alias_designator | dbs_drop_nonpub_alias_designator);
dbs_drop_public_alias_designator: PUBLIC ALIAS dbs_alias_name FOR SEQUENCE;
dbs_drop_nonpub_alias_designator: ALIAS dbs_alias_name (FOR (TABLE | SEQUENCE))?;
dbs_drop_database: DATABASE dbs_database_name;
dbs_drop_function: FUNCTION dbs_function_name (LPARENCHAR (dbs_drop_parameter_type (COMMACHAR dbs_drop_parameter_type)*)? RPARENCHAR)? RESTRICT?;
dbs_drop_parameter_type: (dbs_drop_built_in_type | dbs_distinct_type_name | dbs_array_type_name) (AS LOCATOR)?;
dbs_drop_built_in_type: (dbs_drop_bit_int | dbs_drop_bit_decimal | dbs_drop_bit_float | dbs_drop_bit_decfloat |
                        dbs_drop_bit_char | dbs_drop_bit_clob | dbs_drop_bit_varchar | dbs_drop_bit_graphic |
                        dbs_drop_bit_binary | DATE | TIME | dbs_drop_bit_timestamp | ROWID | XML);
dbs_drop_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_drop_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_drop_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_drop_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_drop_bit_char: (CHARACTER | CHAR) (VARYING dbs_drop_bit_varchara | LARGE OBJECT dbs_drop_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_drop_bit_charopts);
dbs_drop_bit_charopts: (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED | BIT) DATA)?;
dbs_drop_bit_varchar: VARCHAR dbs_drop_bit_varchara;
dbs_drop_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_drop_bit_charopts;
dbs_drop_bit_clob: CLOB dbs_drop_bit_cloba;
dbs_drop_bit_cloba: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED ) DATA)?;
dbs_drop_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR |
                        DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_drop_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR |
                    (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
dbs_drop_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_drop_specific: SPECIFIC FUNCTION dbs_specific_name RESTRICT?;
dbs_drop_index: INDEX dbs_index_name;
dbs_drop_mask: MASK dbs_mask_name;
dbs_drop_package: dbs_collection_id_package_name (VERSION? dbs_version_id)?;
dbs_drop_permission: PERMISSION dbs_permission_name;
dbs_drop_procedure: PROCEDURE dbs_procedure_name RESTRICT?;
dbs_drop_role: ROLE dbs_role_name RESTRICT?;
dbs_drop_sequence: SEQUENCE dbs_sequence_name RESTRICT?;
dbs_drop_stogroup: STOGROUP dbs_stogroup_name;
dbs_drop_synonym: SYNONYM dbs_synonym;
dbs_drop_table: TABLE (dbs_table_name | dbs_alias_name);
dbs_drop_tablespace: TABLESPACE dbs_database_name? dbs_table_space_name;
dbs_drop_trigger: TRIGGER dbs_trigger_name;
dbs_drop_trusted: TRUSTED CONTEXT dbs_context name;
dbs_drop_type: TYPE dbs_type_name RESTRICT?;
dbs_drop_variable: VARIABLE dbs_variable_name RESTRICT?;
dbs_drop_view: VIEW (dbs_view_name | dbs_alias_name);


/*END DECLARE SECTION */
dbs_end: END DECLARE SECTION;

/*EXCHANGE */
dbs_exchange: EXCHANGE DATA BETWEEN TABLE dbs_table_name AND dbs_table_name;

/*EXECUTE / EXECUTE IMMEDIATE - note LSQUAREBRACKET and RSQUAREBRACKET are new additions to the lexer!*/
dbs_execute: EXECUTE (dbs_execute_statement | dbs_execute_immediate);
dbs_execute_statement: dbs_statement_name (USING (dbs_execute_varloop | dbs_execute_hostloop | dbs_execute_descriptor))?;
dbs_execute_varloop: (dbs_variable | dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET) (COMMACHAR (dbs_variable |
                        dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET))*;
dbs_execute_hostloop: (dbs_host_variable_array | dbs_host_variable) (COMMACHAR (dbs_host_variable_array |
                        dbs_host_variable))* (FOR (dbs_host_variable | dbs_integer_constant) ROWS)?;
dbs_execute_descriptor: DESCRIPTOR dbs_descriptor_name (FOR (dbs_host_variable | dbs_integer_constant) ROWS)?;
dbs_execute_immediate: IMMEDIATE (dbs_variable | dbs_string_expression);


/*EXPLAIN */
dbs_explain: EXPLAIN (dbs_explain_plan | dbs_explain_stmtcache | dbs_explain_package | dbs_explain_stabilized);
dbs_explain_plan: (PLAN | ALL) (SET QUERYNO EQUALCHAR dbs_integer)? FOR dbs_explainable_sql_statement;
dbs_explain_stmtcache: STMTCACHE (ALL | STMTID (dbs_id_host_variable | dbs_integer_constant) | STMTTOKEN (dbs_token_host_variable | dbs_string_constant));
dbs_explain_package: PACKAGE COLLECTION dbs_collection_name PACKAGE dbs_package_name (VERSION dbs_version_name)? (COPY dbs_copy_id)?;
dbs_explain_stabilized: STABILIZED DYNAMIC QUERY STMTID (dbs_id_host_variable | dbs_integer_constant) (COPY SINGLEQUOTE (CURRENT | INVALID) SINGLEQUOTE)?;


/*FETCH */
dbs_fetch: FETCH (dbs_fetch_beforeafter | dbs_fetch_singlemulti);
dbs_fetch_beforeafter: (BEFORE | AFTER) FROM? dbs_cursor_name;
dbs_fetch_singlemulti: (INSENSITIVE | SENSITIVE)? (dbs_fetch_single | dbs_fetch_multi);
dbs_fetch_single: (WITH CONTINUE)? dbs_fetch_rowpos? FROM? dbs_cursor_name dbs_fetch_singlerow?;
dbs_fetch_rowpos: (NEXT | PRIOR | FIRST | LAST | CURRENT CONTINUE? | (ABSOLUTE | RELATIVE) (dbs_host_variable | dbs_integer_constant));
dbs_fetch_singlerow: INTO (DESCRIPTOR dbs_descriptor_name | dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET |
                    dbs_fetch_target_variable (COMMACHAR dbs_fetch_target_variable)*);
dbs_fetch_target_variable: (dbs_global_variable_name | dbs_host_variable_name | dbs_sql_parameter_name |
                    dbs_sql_variable_name | dbs_transition_variable_name);
dbs_fetch_multi: dbs_fetch_rowsetpos FROM? dbs_cursor_name dbs_fetch_multirow;
dbs_fetch_rowsetpos: (ROWSET STARTING AT (ABSOLUTE | RELATIVE) (dbs_host_variable | dbs_integer_constant) | (NEXT | PRIOR |
                    FIRST | LAST | CURRENT) ROWSET);
dbs_fetch_multirow: (FOR (dbs_host_variable | dbs_integer_constant) ROWS)? (INTO (DESCRIPTOR dbs_descriptor_name |
                    dbs_host_variable_array (COMMACHAR dbs_host_variable_array)*))?;


/*FREE LOCATOR */
dbs_free: FREE LOCATOR dbs_host_variable (COMMACHAR dbs_host_variable)*;

/*GET DIAGNOSTICS */
dbs_get: GET (CURRENT | STACKED)? DIAGNOSTICS (dbs_get_statement | dbs_get_condition | dbs_get_combi);
dbs_get_statement: dbs_variable EQUALCHAR (dbs_get_statement_loop (COMMACHAR dbs_variable EQUALCHAR dbs_get_statement_loop)* | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_SQL_NESTING_LEVEL);
dbs_get_statement_loop: dbs_get_statement_item (COMMACHAR dbs_get_statement_item)*;
dbs_get_statement_item: (DB2_LAST_ROW | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS | DB2_NUMBER_ROWS |
                        DB2_RETURN_STATUS | DB2_SQL_ATTR_CURSOR_HOLD | DB2_SQL_ATTR_CURSOR_ROWSET | DB2_SQL_ATTR_CURSOR_SCROLLABLE |
                        DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE | MORE | NUMBER | ROW_COUNT);
dbs_get_condition: CONDITION (dbs_variable | dbs_integer) dbs_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item) (COMMACHAR
                   dbs_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item)*);
dbs_get_condition_item: (CATALOG_NAME | CONDITION_NUMBER | CURSOR_NAME | DB2_ERROR_CODE1 | DB2_ERROR_CODE2 | DB2_ERROR_CODE3 |
                        DB2_ERROR_CODE4 | DB2_INTERNAL_ERROR_POINTER | DB2_LINE_NUMBER | DB2_MESSAGE_ID | DB2_MODULE_DETECTING_ERROR |
                        DB2_ORDINAL_TOKEN1 | DB2_ORDINAL_TOKEN2 |DB2_ORDINAL_TOKEN3 |DB2_ORDINAL_TOKEN4 | DB2_REASON_CODE |
                        DB2_RETURNED_SQLCODE | DB2_ROW_NUMBER | DB2_SQLERRD_SET | DB2_SQLERRD1 | DB2_SQLERRD2 | DB2_SQLERRD3 |
                        DB2_SQLERRD4 | DB2_SQLERRD5 | DB2_SQLERRD6 | DB2_TOKEN_COUNT | MESSAGE_TEXT | RETURNED_SQLSTATE | SERVER_NAME);
dbs_get_connection_item: (DB2_AUTHENTICATION_TYPE | DB2_AUTHORIZATION_ID | DB2_CONNECTION_STATE | DB2_CONNECTION_STATUS |
                        DB2_ENCRYPTION_TYPE | DB2_SERVER_CLASS_NAME | DB2_PRODUCT_ID);
dbs_get_combi: dbs_variable EQUALCHAR ALL dbs_get_combi_loop (COMMACHAR dbs_get_combi_loop)*;
dbs_get_combi_loop: (STATEMENT | (CONDITION | CONNECTION) (dbs_variable | dbs_integer)?);
/*the limitations of ANTLR don't allow for codifying the following rules:
1. STATEMENT can only be specified once,
2. CONDITION and CONNECTION can only be specified once if variable or integer is also not specified. */

/*GRANT (all) */
dbs_grant: literal+; //?

/*HOLD LOCATOR */
dbs_hold: HOLD LOCATOR dbs_host_variable (COMMACHAR dbs_host_variable)*;

/*INCLUDE */
dbs_include: INCLUDE (SQLCA | SQLDA | dbs_member_name);

/*INSERT */
dbs_insert: INSERT INTO (dbs_table_name | dbs_view_name) (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)?
            dbs_insert_include? (OVERRIDING USER VALUE)? (dbs_insert_values | dbs_insert_fullselect);
dbs_insert_include: INCLUDE LPARENCHAR dbs_column_name dbs_include_data_type (COMMACHAR dbs_column_name dbs_include_data_type)* RPARENCHAR;
//?
dbs_insert_data_type: (dbs_insert_built_in_type | dbs_distinct_type);
dbs_insert_built_in_type: (dbs_insert_bit_int | dbs_insert_bit_decimal | dbs_insert_bit_float | dbs_insert_bit_decfloat |
                            dbs_insert_bit_char | dbs_insert_bit_varchar | dbs_insert_bit_graphic | dbs_insert_bit_vargraphic |
                            dbs_insert_bit_binary | dbs_insert_bit_varbinary | DATE | TIME | dbs_insert_bit_timestamp );
dbs_insert_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_insert_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_insert_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_insert_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_insert_bit_char: (CHARACTER | CHAR) (VARYING dbs_insert_bit_varchara | LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?);
dbs_insert_bit_varchar: VARCHAR dbs_insert_bit_varchara;
dbs_insert_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?;
dbs_insert_bit_graphic: GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_insert_bit_vargraphic: VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR;
dbs_insert_bit_binary: BINARY (VARYING LPARENCHAR dbs_integer RPARENCHAR | (LPARENCHAR dbs_integer RPARENCHAR)?);
dbs_insert_bit_varbinary: VARBINARY LPARENCHAR dbs_integer RPARENCHAR;
dbs_insert_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_insert_values: VALUES (dbs_insert_values_single | dbs_insert_values_multi);
dbs_insert_values_single: (dbs_expression | DEFAULT | NULL | dbs_insert_values_sgloop);
dbs_insert_values_sgloop: LPARENCHAR (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))* RPARENCHAR;
dbs_insert_values_multi: (dbs_expression | dbs_host_variable_array | DEFAULT | NULL | dbs_insert_values_mloop) (FOR (dbs_host_variable |
                        dbs_integer_constant) ROWS)? (ATOMIC | NOT ATOMIC CONTINUE ON SQLEXCEPTION)?;
dbs_insert_values_mloop: LPARENCHAR (dbs_expression | dbs_host_variable_array | DEFAULT | NULL) (COMMACHAR (dbs_expression |
                        dbs_host_variable_array | DEFAULT | NULL))* RPARENCHAR;
dbs_insert_fullselect: (WITH dbs_common_table_expression (COMMACHAR dbs_common_table_expression)*)? dbs_fullselect (WITH (RR|RS|CS))? (QUERYNO dbs_integer)?;

/*LABEL */
dbs_label: LABEL ON (dbs_label_sing | dbs_label_loop);
dbs_label_sing: (dbs_label_table | dbs_label_alias | dbs_label_column) IS dbs_string_constant;
dbs_label_table: TABLE (dbs_table_name | dbs_view_name);
dbs_label_alias: ALIAS dbs_alias_name;
dbs_label_column: COLUMN (dbs_table_name | dbs_view_name) DOT dbs_column_name;
dbs_label_loop: (dbs_table_name | dbs_view_name) LPARENCHAR dbs_column_name IS dbs_string_constant (COMMACHAR dbs_column_name IS dbs_string_constant)* RPARENCHAR;

/*LOCK TABLE */
dbs_lock: LOCK TABLE dbs_table_name (PARTITION dbs_integer)? IN (SHARE | EXCLUSIVE) MODE;

/*MERGE */
dbs_merge: MERGE INTO (dbs_table_name | dbs_view_name) dbs_merge_correlation? dbs_merge_include? USING (dbs_table_reference |
        dbs_merge_values) ON dbs_search_condition (WHEN NOT? MATCHED (AND dbs_search_condition)? THEN (dbs_signal |
        dbs_merge_update | DELETE | dbs_merge_insert))+ (ELSE IGNORE)? (NOT ATOMIC CONTINUE ON SQLEXCEPTION)? (QUERYNO dbs_integer)?;
dbs_merge_correlation: AS? dbs_correlation_name (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)?;
dbs_merge_include: INCLUDE LPARENCHAR dbs_column_name (dbs_merge_built_in_type | dbs_distinct_type) (COMMACHAR
        dbs_column_name (dbs_merge_built_in_type | dbs_distinct_type))* RPARENCHAR;
dbs_merge_built_in_type: (dbs_merge_bit_int | dbs_merge_bit_decimal | dbs_merge_bit_float | dbs_merge_bit_decfloat | dbs_merge_bit_char |
        dbs_merge_bit_varchar | dbs_merge_bit_graphic | dbs_merge_bit_vargraphic | dbs_merge_bit_binary | dbs_merge_bit_varbinary | DATE | TIME | dbs_merge_bit_timestamp );
dbs_merge_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_merge_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_merge_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_merge_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_merge_bit_char: (CHARACTER | CHAR) (VARYING dbs_merge_bit_varchara | LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?);
dbs_merge_bit_varchar: VARCHAR dbs_merge_bit_varchara;
dbs_merge_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?;
dbs_merge_bit_graphic: GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_merge_bit_vargraphic: VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR;
dbs_merge_bit_binary: BINARY (VARYING LPARENCHAR dbs_integer RPARENCHAR | (LPARENCHAR dbs_integer RPARENCHAR)?);
dbs_merge_bit_varbinary: VARBINARY LPARENCHAR dbs_integer RPARENCHAR;
dbs_merge_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_merge_values: LPARENCHAR VALUES (dbs_merge_values_sing | dbs_merge_values_multi) RPARENCHAR AS? dbs_correlation_name
        LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR;
dbs_merge_values_sing: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (COMMACHAR (dbs_expression | NULL))* RPARENCHAR);
dbs_merge_values_multi: (dbs_expression | dbs_host_variable_array | NULL | LPARENCHAR (dbs_expression | dbs_host_variable_array |
        NULL) (COMMACHAR (dbs_expression | dbs_host_variable_array | NULL))* RPARENCHAR) FOR (dbs_host_variable | dbs_integer_constant) ROWS;
dbs_merge_update: UPDATE SET dbs_merge_assignment (COMMACHAR dbs_merge_assignment)*;
dbs_merge_assignment: (dbs_column_name EQUALCHAR (dbs_expression | DEFAULT | NULL) | LPARENCHAR dbs_column_name (COMMA dbs_column_name)*
        RPARENCHAR EQUALCHAR LPARENCHAR (dbs_row_fullselect | (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))*) RPARENCHAR);
dbs_merge_insert: INSERT (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)? VALUES (dbs_expression | DEFAULT | NULL |
        LPARENCHAR (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))* RPARENCHAR);

dbs_table_reference: literal+; //?

/*OPEN */
dbs_open: OPEN dbs_cursor_name (USING (DESCRIPTOR dbs_descriptor_name) | (dbs_variable | dbs_array_variable
        LSQUAREBRACKET dbs_array_index RSQUAREBRACKET) (COMMACHAR (dbs_variable | dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET))*);

/*PREPARE */
dbs_prepare: PREPARE dbs_statement_name (INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?)? (FROM dbs_string_expression | (ATTRIBUTES dbs_attr_host_variable)? FROM dbs_variable);

dbs_attr_host_variable: literal+; //?

/*REFRESH TABLE */
dbs_refresh: REFRESH TABLE dbs_table_name (QUERYNO dbs_integer);

/* RELEASE (both) */
dbs_release: RELEASE (dbs_location_name | dbs_host_variable | CURRENT | ALL SQL? | TO? SAVEPOINT dbs_savepoint_name);

dbs_savepoint_name: literal+; //?

/*RENAME */
dbs_rename: RENAME (TABLE? dbs_table_name TO dbs_table_identifier | INDEX dbs_index_name TO dbs_index_identifier);

dbs_table_identifier: literal+; //?
dbs_index_identifier: literal+; //?

/*REVOKE (all) */

/*ROLLBACK */
dbs_rollback: ROLLBACK WORK? (TO SAVEPOINT dbs_savepoint_name?)?;

/*SAVEPOINT */
dbs_savepoint: SAVEPOINT dbs_savepoint_name UNIQUE? ON ROLLBACK RETAIN (CURSORS (ON ROLLBACK RETAIN LOCKS)? | LOCKS ON ROLLBACK RETAIN CURSORS);

/*SELECT (both) */

/*SET (all) */
//?
dbs_revoke: literal+; //?
dbs_select: literal+; //?
dbs_set: literal+; //?

/*SIGNAL - this is a statement and is referenced in other rules*/
dbs_signal: dbs_label? SIGNAL (dbs_sql_condition_name | SQLSTATE VALUE? (dbs_sqlstate_string_constant | dbs_sql_variable_name |
            dbs_sql_parameter_name)) (SET MESSAGE_TEXT EQUALCHAR)? dbs_diagnostic_string_expression;

dbs_sql_condition_name: literal+; //?
dbs_sqlstate_string_constant: literal+; //?
dbs_diagnostic_string_expression: literal+; //?

/*TRANSFER OWNERSHIP */
dbs_transfer: TRANSFER OWNERSHIP OF (DATABASE dbs_database_name | INDEX dbs_index_name | STOGROUP dbs_stogroup_name |
                TABLE dbs_table_name | TABLESPACE dbs_database_name? dbs_table_space_name | VIEW dbs_view_name) TO (ROLE dbs_role_name |
                USER dbs_authorization_name | SESSION_USER) REVOKE PRIVELEGES;

/*TRUNCATE */
dbs_truncate: TRUNCATE TABLE? dbs_table_name ((DROP | REUSE) STORAGE)? ((IGNORE | RESTRICT WHEN) DELETE TRIGGERS)? IMMEDIATE?;

/*UPDATE */
dbs_update: UPDATE (dbs_table_name | dbs_view_name) (dbs_update_searched | dbs_update_positioned);
dbs_update_searched: dbs_update_period? dbs_correlation_name? dbs_update_include? SET dbs_update_assignment (COMMACHAR
                    dbs_update_assignment)* (WHERE dbs_search_condition)? (WITH (RR|RS|CS) | SKIP LOCKED DATA)* (QUERYNO dbs_integer);
dbs_update_period: FOR PORTION OF BUSINESS_TIME (FROM dbs_value TO dbs_value | BETWEEN dbs_value AND dbs_value);
dbs_update_include: INCLUDE LPARENCHAR dbs_column_name (dbs_update_built_in_type | dbs_distinct_type) (COMMACHAR
                    dbs_column_name (dbs_update_built_in_type | dbs_distinct_type))* RPARENCHAR;
dbs_update_built_in_type: (dbs_update_bit_int | dbs_update_bit_decimal | dbs_update_bit_float | dbs_update_bit_decfloat |
                    dbs_update_bit_char | dbs_update_bit_varchar | dbs_update_bit_graphic | dbs_update_bit_vargraphic |
                    dbs_update_bit_binary | dbs_update_bit_varbinary | DATE | TIME | dbs_update_bit_timestamp );
dbs_update_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_update_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_update_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_update_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_update_bit_char: (CHARACTER | CHAR) (VARYING dbs_update_bit_varchara | (LPARENCHAR dbs_integer RPARENCHAR)? (FOR BIT DATA)?);
dbs_update_bit_varchar: VARCHAR dbs_update_bit_varchara;
dbs_update_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?;
dbs_update_bit_graphic: GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_update_bit_vargraphic: VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR;
dbs_update_bit_binary: BINARY (VARYING LPARENCHAR dbs_integer RPARENCHAR | (LPARENCHAR dbs_integer RPARENCHAR)?);
dbs_update_bit_varbinary: VARBINARY LPARENCHAR dbs_integer RPARENCHAR;
dbs_update_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_update_assignment: (dbs_column_name EQUALCHAR (dbs_expression | DEFAULT | NULL) | LPARENCHAR dbs_column_name
                    (COMMA dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_row_fullselect | dbs_unpack_function_invocation |
                    (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))*) RPARENCHAR);
dbs_update_positioned: dbs_correlation_name? SET dbs_update_assignment (COMMACHAR dbs_update_assignment)* WHERE CURRENT OF
                    dbs_cursor_name (FOR ROW (dbs_host_variable | dbs_integer_constant) OF ROWSET)?;

/*VALUES (both) */
dbs_values: VALUES (dbs_values_null | dbs_values_into);
dbs_values_null: (dbs_expression | LPARENCHAR dbs_expression (COMMACHAR dbs_expression)* RPARENCHAR);
dbs_values_into: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (COMMACHAR (dbs_expression | NULL))* RPARENCHAR) INTO
                (dbs_values_target (COMMACHAR dbs_values_target)* |dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET);
dbs_values_target: (dbs_global_variable_name | dbs_host_variable_name | dbs_sql_parameter_name | dbs_sql_variable_name | dbs_transition_variable_name);

/*WHENEVER */
dbs_whenever: WHENEVER (NOT FOUND | SQLERROR | SQLWARNING) (CONTINUE | (GOTO | GO TO) COLONCHAR? dbs_host_label);

/*these bits are copied for future work */
/*EXAMPLE OPTION LIST (from CREATE FUNCTION)*/
//?
dbs_option_list: (LANGUAGE SQL)? (SPECIFIC dbs_specific_name)? (NOT? DETERMINISTIC)? (NO? EXTERNAL ACTION)? (READS SQL DATA |
                CONTAINS SQL | MODIFIES SQL DATA)? ((CALLED | RETURNS NULL) ON NULL INPUT)? (STATIC DISPATCH)? ((ALLOW | DISALLOW)
                PARALLEL)? ((ALLOW | DISALLOW | DISABLE) DEBUG MODE)? (PARAMETER CCSID (ASCII | EBCDIC | UNICODE))? (QUALIFIER
                dbs_schema_name)? (PACKAGE OWNER dbs_authorization_name)? (ASUTIME (LIMIT dbs_integer | NO LIMIT))? ((INHERIT | DEFAULT)
                SPECIAL REGISTERS)? (WLM ENVIRONMENT FOR DEBUG MODE dbs_name)? (CURRENT DATA (YES | NO))? (DEGREE (NUMBER_1 | ANY))?
                (CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME))? (DYNAMICRULES (RUN | BIND | DEFINEBIND |
                DEFINERUN | INVOKEBIND | INVOKERUN))? (APPLICATION ENCODING SCHEME (ASCII | EBCDIC | UNICODE))? ((WITH |
                WITHOUT) EXPLAIN)? ((WITH | WITHOUT) IMMEDIATE WRITE)? (ISOLATION LEVEL (CS | RS | RR | UR))? (OPTHINT
                (DOUBLEQUOTE | dbs_string_constant))? (QUERY ACCELERATION (NONE | ENABLE (WITH FAILBACK)? | ELIGIBLE |
                ALL))? (GET_ACCEL_ARCHIVE (YES | NO))? (ACCELERATION WAITFORDATA dbs_nnnn_m)? (ACCELERATOR dbs_accelerator_name)?
                (SQL PATH (dbs_schema_name (COMMACHAR dbs_schema_name)* | SYSTEM PATH | SESSION? USER))?(REOPT (NONE | ALWAYS | ONCE))?
                (VALIDATE (RUN | BIND))? (ROUNDING (DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN |
                DEC_ROUND_HALF_EVEN | DEC_ROUND_HALF_UP | DEC_ROUND_UP))? (DATE FORMAT (ISO | EUR | USA | JIS | LOCAL))? (DECIMAL
                LPARENCHAR (NUMBER_15 | NUMBER_31) (COMMACHAR dbs_s)? RPARENCHAR)? (FOR UPDATE CLAUSE (REQUIRED | OPTIONAL))? (TIME
                FORMAT (ISO | EUR | USA | JIS | LOCAL))? (NOT? SECURED)? (BUSINESS_TIME SENSITIVE (YES | NO))? (SYSTEM_TIME
                SENSITIVE (YES | NO))? (ARCHIVE SENSITIVE (YES | NO))? (APPLCOMPAT dbs_level)? (CONCENTRATE STATEMENTS (OFF | WITH LITERALS))?;



//Names
dbs_accelerator_name: literal+; //?
dbs_alias_name: literal+; //?
dbs_array_index: literal+; //?
dbs_array_type_name: literal+; //?
dbs_array_variable: literal+; //?
dbs_authorization_name: literal+; //?
dbs_collection_id_package_name: literal+; //?
dbs_collection_name: literal+; //?
dbs_column_name: literal+; //?
dbs_common_table_expression: literal+; //?
dbs_context: literal+; //?
dbs_copy_id: literal+; //?
dbs_correlation_name: literal+; //?
dbs_cursor_name: literal+; //?
dbs_database_name: literal+; //?
dbs_descriptor_name: literal+; //?
dbs_distinct_type: literal+; //?
dbs_distinct_type_name: literal+; //?
dbs_explainable_sql_statement: literal+; //?
dbs_expression: literal+; //?
dbs_fetch_clause: literal+; //?
dbs_fullselect: literal+; //?
dbs_function_name: literal+; //?
dbs_global_variable_name: literal+; //?
dbs_host_label: literal+; //?
dbs_host_variable: literal+; //?
dbs_host_variable_array: literal+; //?
dbs_host_variable_name: literal+; //?
dbs_id_host_variable: literal+; //?
dbs_include_data_type: literal+; //?
dbs_index_name: literal+; //?
dbs_integer: literal+; //?
dbs_integer_constant: literal+; //?
dbs_level: literal+; //?
dbs_location_name: literal+; //?
dbs_mask_name: literal+; //?
dbs_member_name: literal+; //?
dbs_name: literal+; //?
dbs_nnnn_m: literal+; //?
dbs_package_name: literal+; //?
dbs_permission_name: literal+; //?
dbs_plan_name: literal+; //?
dbs_procedure_name: literal+; //?
dbs_role_name: literal+; //?
dbs_routine_version_id: literal+; //?
dbs_row_fullselect: literal+; //?
dbs_rs_locator_variable: literal+; //?
dbs_s: literal+; //?
dbs_schema_name: literal+; //?
dbs_search_condition: literal+; //?
dbs_sequence_name: literal+; //?
dbs_specific_name: literal+; //?
dbs_sql_parameter_name: literal+; //?
dbs_sql_variable_name: literal+; //?
dbs_statement_name: literal+; //?
dbs_stogroup_name: literal+; //?
dbs_string_constant: literal+; //?
dbs_string_expression: literal+; //?
dbs_synonym: literal+; //?
dbs_table_name: literal+; //?
dbs_table_space_name: literal+; //?
dbs_token_host_variable: literal+; //?
dbs_transition_table_name: literal+; //?
dbs_transition_variable_name: literal+; //?
dbs_trigger_name: literal+; //?
dbs_type_name: literal+; //?
dbs_unpack_function_invocation: literal+; //?
dbs_value: literal+; //?
dbs_variable: literal+; //?
dbs_variable_name: literal+; //?
dbs_version_id: literal+; //?
dbs_version_name: literal+; //?
dbs_view_name: literal+; //?

/*STATEMENTS - */
