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

allSqlRules: dbs_allocate | dbs_alter | dbs_associate | dbs_begin | dbs_call | dbs_close | dbs_comment | dbs_commit |
          dbs_connect | dbs_create | dbs_declare | dbs_delete | dbs_describe | dbs_drop | dbs_end | dbs_exchange |
          dbs_execute | dbs_explain | dbs_fetch | dbs_free | dbs_get | dbs_grant | dbs_hold | dbs_include | dbs_insert |
          dbs_label | dbs_lock | dbs_merge | dbs_open | dbs_prepare | dbs_refresh | dbs_release | dbs_rename |
          dbs_revoke | dbs_rollback | dbs_savepoint | dbs_select | dbs_set | dbs_signal | dbs_transfer | dbs_truncate |
          dbs_update | dbs_values | dbs_whenever ;



/*ALLOCATE CURSOR */
dbs_allocate: ALLOCATE dbs_cursor_name CURSOR FOR RESULT SET dbs_rs_locator_variable;

/*ALTER (all) */
dbs_alter: ALTER (dbs_alter_database | dbs_alter_function | dbs_alter_index | dbs_alter_mask | dbs_alter_permission | dbs_alter_procedure | dbs_alter_sequence | dbs_alter_stogroup | dbs_alter_table | dbs_alter_tablespace | dbs_alter_trigger | dbs_alter_trusted | dbs_alter_view);
/*ALTER DATABASE */
dbs_alter_database: DATABASE dbs_database_name (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | STOGROUP dbs_stogroup_name | CCSID dbs_ccsid_value)+;
/*ALTER FUNCTION */
dbs_alter_function: (dbs_alter_function_external | dbs_alter_function_compiled | dbs_alter_function_inline);
dbs_alter_function_bit: (dbs_alter_function_bit_int | dbs_alter_function_bit_decimal | dbs_alter_function_bit_float | dbs_alter_function_bit_decfloat | dbs_alter_function_bit_char | dbs_alter_function_bit_clob | dbs_alter_function_bit_varchar | dbs_alter_function_bit_graphic | dbs_alter_function_bit_binary | DATE | TIME | dbs_alter_function_bit_timestamp | ROWID);
dbs_alter_function_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_function_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_alter_function_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_function_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_alter_function_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_function_bit_varchara | LARGE OBJECT dbs_alter_function_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_alter_function_bit_charopts);
dbs_alter_function_bit_charopts: (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED | BIT) DATA)?;
dbs_alter_function_bit_varchar: VARCHAR dbs_alter_function_bit_varchara;
dbs_alter_function_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_alter_function_bit_charopts;
dbs_alter_function_bit_clob: CLOB dbs_alter_function_bit_cloba;
dbs_alter_function_bit_cloba: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED ) DATA)?;
dbs_alter_function_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_alter_function_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
dbs_alter_function_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_alter_function_external: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((dbs_alter_function_bit | dbs_distinct_type_name) (AS LOCATOR)? (COMMACHAR (dbs_alter_function_bit | dbs_distinct_type_name) (AS LOCATOR)?)*)? RPARENCHAR)?) dbs_alter_function_extopts;
dbs_alter_function_extopts: (EXTERNAL NAME (dbs_external_program_name | dbs_identifier) | LANGUAGE (ASSEMBLE|C|COBOL|JAVA|PLI) | PARAMETER STYLE (SQL|JAVA) | NOT? DETERMINISTIC | (RETURNS NULL|CALLED) ON NULL INPUT | ((MODIFIES|READS) SQL DATA | (CONTAINS|NO) SQL) | NO? EXTERNAL ACTION | (PACKAGE PATH dbs_package_path | NO PACKAGE PATH) | (NO SCRATCHPAD | SCRATCHPAD dbs_length) | NO? FINAL CALL | (ALLOW|DISALLOW) PARALLEL | NO? DBINFO | CARDINALITY dbs_integer | (NO COLLID | COLLID dbs_collection_id) | WLM ENVIRONMENT | (dbs_name | LPARENCHAR dbs_name COMMACHAR ASTERISKCHAR RPARENCHAR) | ASUTIME (NO LIMIT | LIMIT dbs_integer) | STAY RESIDENT (YES|NO) | PROGRAM TYPE (SUB|MAIN) | SECURITY (DB2|USER|DEFINER) | (STOP AFTER (SYSTEM DEFAULT|dbs_integer) FAILURES | CONTINUE AFTER FAILURE) | RUN OPTIONS  dbs_run_time_options | (INHERIT|DEFAULT) SPECIAL REGISTERS | STATIC DISPATCH | NOT? SECURED)+; /*java fix required to add "one each" rule */
dbs_alter_function_compiled: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((dbs_alter_function_bit | XML | dbs_array_type_name | dbs_distinct_type_name) (COMMACHAR (dbs_alter_function_bit | XML | dbs_array_type_name | dbs_distinct_type_name))*)? RPARENCHAR)?) (dbs_alter_function_alter | dbs_alter_function_replace | dbs_alter_function_add | dbs_alter_function_activate | dbs_alter_function_regen | dbs_alter_function_drop);
dbs_alter_function_alter: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id) dbs_alter_function_compopts;
dbs_alter_function_replace: REPLACE (ACTIVE VERSION | VERSION dbs_routine_version_id) dbs_alter_function_routine;
dbs_alter_function_add: ADD VERSION dbs_routine_version_id dbs_alter_function_routine;
dbs_alter_function_activate: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_function_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id) (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;
dbs_alter_function_drop: DROP VERSION dbs_routine_version_id;
dbs_alter_function_routine: LPARENCHAR (dbs_parameter_name (dbs_alter_function_bit | dbs_distinct_type_name | dbs_array_type_name) (COMMACHAR (dbs_alter_function_bit | dbs_distinct_type_name | dbs_array_type_name))*)? RPARENCHAR RETURNS dbs_alter_function_bit dbs_alter_function_compopts? dbs_sql_control_statement ;
dbs_alter_function_compopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | ((READS|MODIFIES) SQL DATA | CONTAINS SQL) | (CALLED|RETURNS NULL) ON NULL INPUT | STATIC DISPATCH | (ALLOW|DISALLOW) PARALLEL | (DISALLOW|ALLOW|DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | (INHERIT|DEFAULT) SPECIAL REGISTERS | WLM ENVIRONMENT FOR DEBUG MODE dbs_name | CURRENT DATA (YES|NO) | DEGREE (NUMBER_1 | ANY) | CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND|DEFINEBIND|DEFINERUN|INVOKEBIND|INVOKERUN) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) | (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SESSION? USER | SYSTEM PATH) (COMMACHAR (dbs_schema_name | SESSION? USER | SYSTEM PATH))* | QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) | ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) | VALIDATE (RUN|BIND) | ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) | NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | (OFF | CONCENTRATE STATEMENTS (WITH LITERALS)?))+; /*java fix needed to add "one each" rule */
dbs_alter_function_inline: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((dbs_alter_function_bit | XML | dbs_distinct_type_name) (COMMACHAR (dbs_alter_function_bit | XML | dbs_distinct_type_name))*)? RPARENCHAR)?) dbs_alter_function_inlineopts; /*this is for both "inlined SQL scalar" and "SQL table" as they are basically identical - only two extra options in "table" */
dbs_alter_function_inlineopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | (CONTAINS SQL|READS SQL DATA) | STATIC DISPATCH | CALLED ON NULL INPUT | NOT? SECURED | INHERIT SPECIAL REGISTERS | CARDINALITY dbs_integer)+; /*java fix required to add "one each" rule */
/*ALTER INDEX */
dbs_alter_index: INDEX dbs_index_name (REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)? /*included as a separate piped option due to nb 2 in IBM doc*/ | (BUFFERPOOL dbs_bp_name | CLOSE (YES|NO) | COPY (YES|NO) | DSSIZE dbs_integer G | PIECESIZE dbs_integer (K|M|G) | dbs_alter_index_using | dbs_alter_index_free | dbs_alter_index_gbpcache | NOT? CLUSTER | NOT? PADDED | COMPRESS (YES|NO) | dbs_alter_index_add)+ dbs_alter_index_alter?);
dbs_alter_index_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) dbs_integer | ERASE (YES|NO))+;
dbs_alter_index_free: (FREEPAGE dbs_integer (PCTFREE dbs_integer)? | PCTFREE dbs_integer (FREEPAGE dbs_integer)?);
dbs_alter_index_gbpcache: GBPCACHE (CHANGED | ALL | NONE);
dbs_alter_index_add: ADD (COLUMN LPARENCHAR dbs_column_name (ASC | DESC | RANDOM)? RPARENCHAR | INCLUDE COLUMN LPARENCHAR dbs_column_name RPARENCHAR);
dbs_alter_index_alter: dbs_alter_index_loop (COMMACHAR dbs_alter_index_loop)*;
dbs_alter_index_loop: ALTER PARTITION dbs_integer dbs_alter_index_ending? (dbs_alter_index_using | dbs_alter_index_free | dbs_alter_index_gbpcache | DSSIZE dbs_integer G)*;
dbs_alter_index_ending:  ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?;
/*ALTER MASK */
dbs_alter_mask: MASK dbs_mask_name (ENABLE | DISABLE | REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?);
/*ALTER PERMISSION */
dbs_alter_permission: PERMISSION dbs_permission_name (ENABLE | DISABLE | REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?);
/*ALTER PROCEDURE */
dbs_alter_procedure: PROCEDURE dbs_procedure_name (dbs_alter_procedure_external | dbs_alter_procedure_alter | dbs_alter_procedure_replace | dbs_alter_procedure_add | dbs_alter_procedure_activate | dbs_alter_procedure_regen | dbs_alter_procedure_drop);
dbs_alter_procedure_external: (DYNAMIC RESULT SETS dbs_integer | EXTERNAL NAME (dbs_external_program_name | dbs_identifier) | LANGUAGE (ASSEMBLE | C | COBOL | JAVA | PLI | REXX) | PARAMETER STYLE (SQL | GENERAL (WITH NULLS)? | JAVA) | NOT? DETERMINISTIC | (PACKAGE PATH dbs_package_path | NO PACKAGE PATH) | ((MODIFIES|READS) SQL DATA | (CONTAINS|NO) SQL) | NO? DBINFO | (NO COLLID | COLLID dbs_collection_id) | WLM ENVIRONMENT (dbs_name | LPARENCHAR dbs_name COMMACHAR ASTERISKCHAR RPARENCHAR) | ASUTIME (NO LIMIT | LIMIT dbs_integer) | STAY RESIDENT (YES|NO) | PROGRAM TYPE (SUB|MAIN) | SECURITY (DB2|USER|DEFINER) | RUN OPTIONS dbs_run_time_options | COMMIT ON RETURN (YES|NO) | (INHERIT|DEFAULT) SPECIAL REGISTERS | CALLED ON NULL INPUT | (STOP AFTER (SYSTEM DEFAULT|dbs_integer) FAILURES | CONTINUE AFTER FAILURE) | (DISALLOW|ALLOW|DISABLE) DEBUG MODE)+; /*java fix needed to add "once each" rule */
dbs_alter_procedure_alter: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id)? dbs_alter_procedure_options;
dbs_alter_procedure_options: (NOT? DETERMINISTIC | ((MODIFIES|READS) SQL DATA | CONTAINS SQL) | CALLED ON NULL INPUT | DYNAMIC RESULT SETS dbs_integer | (DISALLOW|ALLOW|DISABLE) DEBUG MODE | PARAMETER CCSID (ASCII|EBCDIC|UNICODE) | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | ((COMMIT ON RETURN (YES|NO)) | AUTONOMOUS) | (INHERIT|DEFAULT) SPECIAL REGISTERS | WLM ENVIRONMENT FOR DEBUG MODE dbs_name | (DEFER|NODEFER) PREPARE | CURRENT DATA (YES|NO) | DEGREE (NUMBER_1|ANY) | CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND|DEFINERUN|DEFINEBIND|INVOKERUN|INVOKEBIND) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) | (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | (WITH|WITHOUT) KEEP DYNAMIC | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SYSTEM PATH | SESSION? USER) (COMMACHAR (dbs_schema_name | SYSTEM PATH | SESSION? USER))* | RELEASE AT (COMMIT | DEALLOCATE) | QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) | ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) | VALIDATE (RUN|BIND) | ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) | DECIMAL LPARENCHAR (NUMBER_15|NUMBER_31) (COMMACHAR dbs_s)? | FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | CONCENTRATE STATEMENTS (OFF|WITH LITERALS))*; /*java fix needed to add "one each" rule */ 
dbs_alter_procedure_replace: REPLACE (ACTIVE VERSION | VERSION dbs_routine_version_id)? (LPARENCHAR dbs_alter_procedure_paramdec (COMMACHAR dbs_alter_procedure_paramdec)* RPARENCHAR)? dbs_alter_procedure_options dbs_sql_routine_body; /*SQL-routine-body to be defined once all other statements are done */
dbs_alter_procedure_paramdec: (IN|OUT|INOUT)? dbs_parameter_name (dbs_alter_procedure_bit | dbs_distinct_type_name | dbs_array_type_name);
dbs_alter_procedure_bit: (dbs_alter_procedure_bit_int | dbs_alter_procedure_bit_decimal | dbs_alter_procedure_bit_float | dbs_alter_procedure_bit_decfloat | dbs_alter_procedure_bit_char | dbs_alter_procedure_bit_clob | dbs_alter_procedure_bit_varchar | dbs_alter_procedure_bit_graphic | dbs_alter_procedure_bit_binary | DATE | TIME | dbs_alter_procedure_bit_timestamp | XML);
dbs_alter_procedure_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_procedure_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_alter_procedure_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_procedure_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_alter_procedure_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_procedure_bit_varchara | LARGE OBJECT dbs_alter_procedure_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_alter_procedure_bit_charopts);
dbs_alter_procedure_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA)? (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_alter_procedure_bit_varchar: VARCHAR dbs_alter_procedure_bit_varchara;
dbs_alter_procedure_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_alter_procedure_bit_charopts;
dbs_alter_procedure_bit_clob: CLOB dbs_alter_procedure_bit_cloba;
dbs_alter_procedure_bit_cloba: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? (FOR (SBCS | MIXED ) DATA)? (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_alter_procedure_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_alter_procedure_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
dbs_alter_procedure_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_alter_procedure_add: ADD VERSION dbs_routine_version_id (LPARENCHAR dbs_alter_procedure_paramdec (COMMACHAR dbs_alter_procedure_paramdec)* RPARENCHAR)? dbs_alter_procedure_options dbs_sql_routine_body;
dbs_alter_procedure_activate: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_procedure_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id)? (USING APPLICATION COMPATIBILITY dbs_applcompat_value);
dbs_alter_procedure_drop: DROP VERSION dbs_routine_version_id;
/*ALTER SEQUENCE */
dbs_alter_sequence: SEQUENCE dbs_sequence_name dbs_alter_sequence_loop (COMMACHAR? dbs_alter_sequence_loop)*;
dbs_alter_sequence_loop: (RESTART (WITH dbs_numeric_constant)? | (INCREMENT BY|MINVALUE|MAXVALUE) dbs_numeric_constant | NO (MINVALUE|MAXVALUE) | NO? (CYCLE|ORDER) | NO CACHE | CACHE dbs_integer_constant);
/*ALTER STOGROUP */
dbs_alter_stogroup: STOGROUP dbs_stogroup_name (NO KEY LABEL | KEY LABEL dbs_key_label_name | (ADD|REMOVE) VOLUMES LPARENCHAR (dbs_volume_id (COMMACHAR dbs_volume_id)* | QUOTE ASTERISKCHAR QUOTE (COMMACHAR QUOTE ASTERISKCHAR QUOTE)*) RPARENCHAR)+ (DATACLAS dbs_dc_name)? (MGMTCLAS dbs_mc_name)? (STORCLAS dbs_sc_name)?;
/*ALTER TABLE */
dbs_alter_table: TABLE dbs_table_name (dbs_alter_table_add | dbs_alter_table_alter | dbs_alter_table_rename | dbs_alter_table_drop | dbs_alter_table_rotate | DATA CAPTURE (NONE|CHANGES) | NOT? VOLATILE CARDINALITY? | (ACTIVATE|DEACTIVATE) (ROW|COLUMN) ACCESS CONTROL | APPEND (NO|YES) | AUDIT (NONE|CHANGES|ALL) | VALIDPROC (dbs_program_name | NULL) | ENABLE ARCHIVE USE dbs_archive_table_name | DISABLE ARCHIVE | NO KEY LABEL | KEY LABEL dbs_key_label_name)+;
dbs_alter_table_add: ADD (COLUMN? dbs_alter_table_coldef | dbs_alter_table_unique | dbs_alter_table_referential | dbs_alter_table_check | PARTITION (BY dbs_alter_table_partitioning | dbs_alter_table_partition)? | SYSTEM? VERSIONING USE HISTORY TABLE dbs_history_table_name (ON DELETE ADD EXTRA ROW)? (MATERIALIZED? QUERY)? dbs_alter_table_mq | CLONE dbs_clone_table_name | RESTRICT ON DROP);
dbs_alter_table_coldef: dbs_column_name (dbs_distinct_type_name | dbs_alter_table_bit)? (dbs_alter_table_defclause | NOT NULL | dbs_alter_table_check | dbs_alter_table_refclause | dbs_alter_table_generated | IMPLICITLY HIDDEN | AS SECURITY LABEL | FIELDPROC dbs_program_name (LPARENCHAR dbs_constant (COMMACHAR dbs_constant)* RPARENCHAR)? | INLINE LENGTH dbs_integer)*;
dbs_alter_table_bit: (dbs_alter_table_bit_int | dbs_alter_table_bit_decimal | dbs_alter_table_bit_float | dbs_alter_table_bit_decfloat | dbs_alter_table_bit_char | dbs_alter_table_bit_clob | dbs_alter_table_bit_varchar | dbs_alter_table_bit_graphic | dbs_alter_table_bit_binary | DATE | TIME | dbs_alter_table_bit_timestamp | ROWID | dbs_alter_table_bit_xml);
dbs_alter_table_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_table_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_alter_table_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_table_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
dbs_alter_table_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_table_bit_varchara | LARGE OBJECT dbs_alter_table_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_alter_table_bit_charopts);
dbs_alter_table_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA | CCSID NUMBER_1208)?;
dbs_alter_table_bit_varchar: VARCHAR dbs_alter_table_bit_varchara;
dbs_alter_table_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_alter_table_bit_charopts;
dbs_alter_table_bit_clob: CLOB dbs_alter_table_bit_cloba;
dbs_alter_table_bit_cloba: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? dbs_alter_table_bit_charopts;
dbs_alter_table_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID NUMBER_1200)?;
dbs_alter_table_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
dbs_alter_table_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;
dbs_alter_table_bit_xml: XML (LPARENCHAR XMLSCHEMA dbs_alter_table_bit_xmlspec (ELEMENT dbs_element_name)? (COMMACHAR dbs_alter_table_bit_xmlspec (ELEMENT dbs_element_name)?)* RPARENCHAR)?;
dbs_alter_table_bit_xmlspec: (ID dbs_registered_xml_schema_name | (URL dbs_target_namespace | NO NAMESPACE) (LOCATION dbs_schema_location)?);
dbs_alter_table_defclause: WITH? DEFAULT (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL | dbs_cast_function_name LPARENCHAR (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL) RPARENCHAR)?;
dbs_alter_table_check: (CONSTRAINT dbs_constraint_name)? CHECK LPARENCHAR dbs_check_condition RPARENCHAR;
dbs_alter_table_refclause: REFERENCES dbs_table_name (LPARENCHAR dbs_column_name (PERIOD BUSINESS_TIME)? (COMMACHAR dbs_column_name (PERIOD BUSINESS_TIME)?)* RPARENCHAR)? (ON DELETE (RESTRICT|NO ACTION | CASCADE | SET NULL))? (NOT? ENFORCED)? (ENABLE QUERY OPTIMIZATION)?;
dbs_alter_table_generated: GENERATED ((ALWAYS | BY DEFAULT)? (dbs_alter_table_asid | FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP)? | ALWAYS? (AS TRANSACTION START ID | AS ROW (BEGIN|START|END) | AS LPARENCHAR dbs_non_deterministic_expression RPARENCHAR)?);
dbs_alter_table_asid: AS IDENTITY (LPARENCHAR dbs_alter_table_asid_loop (COMMACHAR? dbs_alter_table_asid_loop)* RPARENCHAR)?;
dbs_alter_table_asid_loop: (START WITH dbs_numeric_constant | INCREMENT BY dbs_numeric_constant | NO MINIVALUE | MINIVALUE dbs_numeric_constant | NO? CYCLE | NO CACHE | CACHE dbs_numeric_constant | NO? ORDER);
dbs_alter_table_unique: (CONSTRAINT dbs_constraint_name)? (PRIMARY KEY | UNIQUE) LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* (COMMACHAR BUSINESS_TIME WITHOUT OVERLAPS)? RPARENCHAR;
dbs_alter_table_referential: (CONSTRAINT dbs_constraint_name)? FOREIGN KEY LPARENCHAR dbs_column_name (PERIOD BUSINESS_TIME)? (COMMACHAR dbs_column_name (PERIOD BUSINESS_TIME)?)* RPARENCHAR dbs_alter_table_refclause;
dbs_alter_table_partitioning: RANGE? LPARENCHAR dbs_column_name (NULLS LAST)? (ASC|DESC)? (COMMACHAR dbs_column_name (NULLS LAST)? (ASC|DESC)?)* RPARENCHAR LPARENCHAR dbs_alter_table_partition (COMMACHAR dbs_alter_table_partition)* RPARENCHAR;
dbs_alter_table_partition: PARTITION dbs_integer ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?; 
dbs_alter_table_mq: LPARENCHAR dbs_fullselect RPARENCHAR DATA INITIALLY DEFERRED REFRESH DEFERRED (MAINTAINED BY (SYSTEM|USER) ((ENABLE|DISABLE) QUERY OPTIMIZATION)? | (ENABLE|DISABLE) QUERY OPTIMIZATION (MAINTAINED BY (SYSTEM|USER))?);
dbs_alter_table_alter: ALTER (COLUMN? dbs_alter_table_colalt | PARTITION dbs_integer dbs_alter_table_partition | MATERIALIZED? QUERY dbs_alter_table_mq);
dbs_alter_table_colalt: dbs_column_name (DROP DEFAULT | SET (DATA TYPE dbs_alter_table_bit (INLINE LENGTH dbs_integer)? | dbs_alter_table_defclause | INLINE LENGTH dbs_integer | dbs_alter_table_idalt | GENERATED ((ALWAYS | BY DEFAULT) dbs_alter_table_idalt? | ALWAYS? (AS TRANSACTION START ID | AS ROW (BEGIN|START|END)))));
dbs_alter_table_idalt: (RESTART (WITH dbs_numeric_constant)? | SET (INCREMENT BY dbs_numeric_constant | NO MINIVALUE | MINIVALUE dbs_numeric_constant | NO? CYCLE | NO CACHE | CACHE dbs_integer_constant | NO? ORDER))+;
dbs_alter_table_rename: RENAME COLUMN dbs_column_name TO dbs_column_name;
dbs_alter_table_drop: DROP (COLUMN? dbs_column_name RESTRICT | PRIMARY KEY | (UNIQUE|FOREIGN KEY|CHECK|CONSTRAINT) dbs_constraint_name | SYSTEM? VERSIONING | MATERIALIZED? QUERY | CLONE | RESTRICT ON DROP);
dbs_alter_table_rotate: ROTATE PARTITION (FIRST | dbs_integer) TO LAST ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE? RESET;
/*ALTER TABLESPACE */
dbs_alter_tablespace: TABLESPACE dbs_database_name? dbs_table_space_name (DROP PENDING CHANGES | DSSIZE dbs_integer G | SEGSIZE dbs_integer | PAGENUM RELATIVE | dbs_alter_tablespace_move /*these first five are piped separately from the big loop due to note 1 in IBM doc*/ | (BUFFERPOOL dbs_bp_name | CCSID dbs_ccsid_value | CLOSE (YES|NO) | COMPRESS (YES|NO) | INSERT ALGORITHM dbs_level | LOCKMAX (SYSTEM | dbs_integer) | LOCKSIZE (ANY | TABLESPACE | TABLE | PAGE | ROW | LOB) | NOT? LOGGED | MAXROWS dbs_integer | MAXPARTITIONS dbs_integer | MEMBER CLUSTER (YES|NO) | TRACKMOD (YES|NO) | dbs_alter_tablespace_using | dbs_alter_tablespace_free | dbs_alter_tablespace_gbpcache)+) dbs_alter_tablespace_alter?;
dbs_alter_tablespace_move: MOVE TABLE dbs_table_name TO TABLESPACE (dbs_database_name DOT)? dbs_table_space_name;
dbs_alter_tablespace_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) dbs_integer | ERASE (YES|NO))+;
dbs_alter_tablespace_free: (FREEPAGE dbs_integer | PCTFREE dbs_smallint? (FOR UPDATE dbs_smallint)?)+;
dbs_alter_tablespace_gbpcache: GBPCACHE (CHANGED | ALL | SYSTEM | NONE);
dbs_alter_tablespace_alter: (ALTER PARTITION dbs_integer dbs_alter_tablespace_loop)+;
dbs_alter_tablespace_loop: (dbs_alter_tablespace_using | dbs_alter_tablespace_free | dbs_alter_tablespace_gbpcache | COMPRESS (YES|NO) | DSSIZE dbs_integer G | TRACKMOD (YES|NO))+;
/*ALTER TRIGGER */
dbs_alter_trigger: TRIGGER dbs_trigger_name (dbs_alter_trigger_alter | dbs_alter_trigger_replace | dbs_alter_trigger_add | dbs_alter_trigger_activate | dbs_alter_trigger_regen | dbs_alter_trigger_drop)?;
dbs_alter_trigger_alter: ALTER? (ACTIVE VERSION | VERSION dbs_trigger_version_id)? dbs_alter_trigger_options;
dbs_alter_trigger_options: ((DISALLOW | ALLOW | DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | WLM ENVIRONMENT FOR DEBUG MODE dbs_name | CURRENT DATA (YES|NO) | CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND) | APPLICATION ENCODING SCHEME (ASCII | EBCDIC | UNICODE) | (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE | dbs_string_constant) | SQL PATH (SYSTEM PATH | SESSION? USER | dbs_schema_name) (COMMACHAR (SYSTEM PATH | SESSION? USER | dbs_schema_name))* | RELEASE AT (COMMIT|DEALLOCATE) | ROUNDING (DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN | DEC_ROUND_HALF_UP | DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) | DECIMAL LPARENCHAR (NUMBER_15 | NUMBER_31) (COMMACHAR dbs_s)? RPARENCHAR | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) | FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | CONCENTRATE STATEMENTS (OFF | WITH LITERALS))*; /*java fix needed to add "once each" rule */
dbs_alter_trigger_replace: REPLACE (ACTIVE VERSION | VERSION dbs_trigger_version_id)? dbs_alter_trigger_spec;
dbs_alter_trigger_spec: ((NO CASCADE)? BEFORE | AFTER | INSTEAD OF) (INSERT | DELETE | UPDATE (OF dbs_column_name (COMMACHAR dbs_column_name)*)?) ON (dbs_table_name | dbs_view_name) (REFERENCING ((OLD|NEW) ROW? AS? dbs_correlation_name | (OLD_TABLE | NEW_TABLE) AS? dbs_table_identifier)+)? (FOR EACH (STATEMENT|ROW))? dbs_alter_trigger_options (WHEN LPARENCHAR dbs_search_condition RPARENCHAR)? (dbs_sql_control_statement | dbs_triggered_sql_statement);
dbs_alter_trigger_add: ADD VERSION dbs_trigger_version_id dbs_alter_trigger_spec;
dbs_alter_trigger_activate: ACTIVATE VERSION dbs_trigger_version_id;
dbs_alter_trigger_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_trigger_version_id)? (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;
dbs_alter_trigger_drop: DROP VERSION dbs_trigger_version_id;
/*ALTER TRUSTED CONTEXT */
dbs_alter_trusted: TRUSTED CONTEXT dbs_context_name (dbs_alter_trusted_alter | dbs_alter_trusted_add | dbs_alter_trusted_drop | dbs_alter_trusted_replace)+;
dbs_alter_trusted_alter: ALTER (SYSTEM AUTHID dbs_authorization_name | NO DEFAULT ROLE | DEFAULT ROLE dbs_role_name (WITHOUT ROLE AS OBJECT OWNER | WITH ROLE AS OBJECT OWNER AND QUALIFIER) | ENABLE | DISABLE | NO DEFAULT SECURITY LABEL | DEFAULT SECURITY LABEL dbs_seclabel_name | ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value RPARENCHAR | (ADDRESS dbs_address_value | ENCRYPTION dbs_encryption_value | SERVAUTH dbs_servauth_value) (COMMACHAR (ADDRESS dbs_address_value | ENCRYPTION dbs_encryption_value | SERVAUTH dbs_servauth_value))* RPARENCHAR))+;
dbs_alter_trusted_add: ADD (dbs_alter_trusted_add_attributes | dbs_alter_trusted_add_use);
dbs_alter_trusted_add_attributes: ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value RPARENCHAR | (ADDRESS dbs_address_value | SERVAUTH dbs_servauth_value) (COMMACHAR (ADDRESS dbs_address_value | SERVAUTH dbs_servauth_value))* RPARENCHAR);
dbs_alter_trusted_add_use: USE FOR dbs_alter_trusted_useloop (COMMACHAR dbs_alter_trusted_useloop)*;
dbs_alter_trusted_useloop: (dbs_authorization_name dbs_alter_trusted_useopts? | EXTERNAL SECURITY PROFILE dbs_profile_name dbs_alter_trusted_useopts? |PUBLIC (WITH|WITHOUT) AUTHENTICATION);
dbs_alter_trusted_useopts: (ROLE dbs_role_name)? (SECURITY LABEL dbs_seclabel_name)? ((WITH|WITHOUT) AUTHENTICATION)?;
dbs_alter_trusted_drop: DROP (dbs_alter_trusted_drop_attributes | dbs_alter_trusted_drop_use);
dbs_alter_trusted_drop_attributes: ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value? RPARENCHAR | (ADDRESS dbs_address_value? | SERVAUTH dbs_servauth_value?) (COMMACHAR (ADDRESS dbs_address_value? | SERVAUTH dbs_servauth_value?))* RPARENCHAR);
dbs_alter_trusted_drop_use: USE FOR (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC) (COMMACHAR (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC))*;
dbs_alter_trusted_replace: REPLACE dbs_alter_trusted_add_use;
/*ALTER VIEW */
dbs_alter_view: VIEW dbs_view_name REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;

/*ASSOCIATE LOCATORS */
dbs_associate: ASSOCIATE (RESULT SET)? (LOCATOR | LOCATORS) dbs_rs_locator_variable (COMMACHAR dbs_rs_locator_variable)*
               WITH PROCEDURE (dbs_procedure_name | dbs_host_variable);


/*BEGIN DECLARE SECTION */
dbs_begin: BEGIN DECLARE SECTION;

/*CALL */
dbs_call: CALL (dbs_procedure_name | dbs_variable) (USING DESCRIPTOR dbs_descriptor_name | LPARENCHAR dbs_call_loop? RPARENCHAR)?;
dbs_call_loop: (dbs_expression | NULL | TABLE dbs_transition_table_name) (COMMACHAR (dbs_expression | NULL | TABLE dbs_transition_table_name))*;

/*CLOSE */
dbs_close: CLOSE dbs_cursor_name;

/*COMMENT */
dbs_comment: COMMENT ON (dbs_comment_multiple_column_list | (dbs_comment_alias_designator | dbs_comment_column |
             dbs_comment_function | dbs_comment_index | dbs_comment_package | dbs_comment_plan | dbs_comment_procedure |
             dbs_comment_role | dbs_comment_sequence | dbs_comment_table | dbs_comment_trigger | dbs_comment_trusted |
             dbs_comment_type | dbs_comment_mask | dbs_comment_permission | dbs_comment_variable) IS dbs_string_constant);
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
dbs_create: dbs_create_alias | dbs_create_aux_table | dbs_create_db | dbs_create_function_compiled_scalar | dbs_create_function_ext_scalar |
            dbs_create_function_ext_table | dbs_create_function_inline_scalar | dbs_create_function_sourced |
            dbs_create_function_sql_table | dbs_create_global_temp_table | dbs_create_index | dbs_create_lob_tablespace | dbs_create_mask |
            dbs_create_permission | dbs_create_procedure | dbs_create_procedure_ext | dbs_create_procedure_native_sql | dbs_create_role |
            dbs_create_sequence | dbs_create_stogroup | dbs_create_synonym | dbs_create_table | dbs_create_tablespace | dbs_create_trigger_advanced |
            dbs_create_trigger_basic | dbs_create_trusted_context | dbs_create_type | dbs_create_type_array | dbs_create_type_distinct |
            dbs_create_variable | dbs_create_view;

dbs_create_alias: CREATE PUBLIC? ALIAS (dbs_create_alias_table_alias | dbs_create_alias_sequence_alias);
dbs_create_alias_table_alias: dbs_alias_name FOR TABLE? (dbs_table_name | dbs_view_name | dbs_alias_name2);
dbs_create_alias_sequence_alias: dbs_alias_name FOR SEQUENCE dbs_sequence_name;
dbs_create_aux_table: CREATE (AUXILIARY | AUX) TABLE dbs_table_name IN dbs_database_name? dbs_table_space_name
                    STORIES dbs_table_name (APPEND NO | (APPEND YES)? )? COLUMN dbs_column_name (PART dbs_integer)?;

dbs_create_db: CREATE DATABASE (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | dbs_create_db_workfile | dbs_create_db_stogroup dbs_create_db_ccsid)?;
dbs_create_db_workfile: AS WORKFILE (FOR dbs_member_name)?;
dbs_create_db_stogroup: STOGROUP (SYSDEFLT | dbs_stogroup_name);
dbs_create_db_ccsid: CCSID (ASCII | EBCDIC | UNICODE);

dbs_create_function: CREATE FUNCTION;
dbs_create_function_compiled_scalar: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_param_decl
        (COMMACHAR dbs_create_function_param_decl)*)? RPARENCHAR (dbs_create_function_func_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_param_decl: dbs_parameter_name dbs_create_function_param_type;
dbs_create_function_param_type: (common_built_in_type | dbs_distinct_type_name | dbs_array_type_name) | (TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR);
dbs_create_function_func_def: RETURNS common_built_in_type (VERSION V1 | VERSION dbs_routine_version_id)? dbs_option_list? dbs_control_statement;
//AS LOCATOR can be specified only for a LOB

dbs_create_function_ext_scalar: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_ext_param_decl (COMMACHAR dbs_create_function_ext_param_decl)*)? RPARENCHAR
                            RETURNS (common_built_in_type (AS LOCATOR)?  | common_built_in_type CAST FROM common_built_in_type (AS LOCATOR)?) dbs_option_list_ext;
dbs_create_function_ext_param_decl: dbs_parameter_name? (dbs_create_function_ext_param_type (AS LOCATOR)? | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR);
dbs_create_function_ext_param_type: common_built_in_type | dbs_distinct_type_name;

dbs_create_function_ext_table: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_ext_param_decl (COMMACHAR dbs_create_function_ext_param_decl)*)? RPARENCHAR
                            RETURNS (dbs_create_function_ext_table_desc  | GENERIC TABLE) dbs_option_list_ext_table;
dbs_create_function_ext_table_desc: TABLE LPARENCHAR dbs_create_function_ext_table_body  (COMMACHAR  dbs_create_function_ext_table_body)* RPARENCHAR;
dbs_create_function_ext_table_body: dbs_column_name common_built_in_type (AS LOCATOR)?;

dbs_create_function_inline_scalar: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_ext_param_decl (COMMACHAR dbs_create_function_ext_param_decl)*)? RPARENCHAR
                                 (dbs_create_function_func_inl_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_func_inl_def: RETURNS common_built_in_type (LANGUAGE SQL)? dbs_option_list_inl_def dbs_create_function_func_inl_sql_routine;
dbs_create_function_func_inl_sql_routine: RETRUN dbs_control_statement;//TODO

dbs_create_function_sourced: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_sourced_param_decl (COMMACHAR dbs_create_function_sourced_param_decl)*)? RPARENCHAR
                             RETURNS common_built_in_type (AS LOCATOR)? (SPECIFIC dbs_specific_name)? (PARAMETER CCSID (ASCII | EBCDIC | UNICODE))
                             (SOURCE ( dbs_function_name (dbs_create_function_sourced_param_type (COMMACHAR dbs_create_function_sourced_param_type)*)?  | SPECIFIC dbs_specific_name));
dbs_create_function_sourced_param_decl: (dbs_parameter_name)? dbs_create_function_sourced_param_type;
dbs_create_function_sourced_param_type: (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)?  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR;

dbs_create_function_sql_table: dbs_create_function dbs_function_name LPARENCHAR (dbs_create_function_sql_table_param_decl (COMMACHAR dbs_create_function_sql_table_param_decl)*)? RPARENCHAR
                                                             (dbs_create_function_sql_func_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_sql_table_param_decl: (dbs_parameter_name)? dbs_create_function_sql_table_param_type;
dbs_create_function_sql_table_param_type: (common_built_in_type | dbs_distinct_type_name)  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR;
dbs_create_function_sql_func_def: RETURNS TABLE LPARENCHAR  dbs_column_name common_built_in_type (COMMACHAR dbs_column_name common_built_in_type)* RPARENCHAR dbs_option_list_inl_def dbs_create_function_func_sql_routine;
dbs_create_function_func_sql_routine: RETRUN dbs_control_statement | BEGIN ATOMIC RETURN dbs_control_statement END;//TODO

dbs_create_global_temp_table: dbs_create_function dbs_function_name (LPARENCHAR (dbs_create_global_temp_table_col_def (COMMACHAR dbs_create_global_temp_table_col_def)*) RPARENCHAR | LIKE (dbs_table_name | dbs_view_name))
                                (CCSID (ASCII | EBCDIC | UNICODE))?;
dbs_create_global_temp_table_col_def: dbs_column_name  common_built_in_type (NOT NULL);//common_built_in_type2

dbs_create_index: CREATE (UNIQUE (WHERE NOT NULL)?)? INDEX dbs_index_name ON (dbs_create_index_table_def | dbs_aux_table_name)  dbs_create_index_table_other_opt;
dbs_create_index_table_def: dbs_table_name LPARENCHAR dbs_create_index_table_def_body (COMMACHAR dbs_create_index_table_def_body)* (COMMACHAR BUSINESS_TIME  (WITHOUT | WITH) OVERLAPS ) RPARENCHAR;
dbs_create_index_table_def_body: (dbs_column_name | dbs_expression) (ASC | DESC | RANDOM);
dbs_create_index_table_other_opt: xml_index_specification? (INCLUDE dbs_column_name LPARENCHAR (COMMACHAR dbs_column_name)* RPARENCHAR) dbs_create_index_table_other_opt_part1 dbs_create_index_table_other_opt_part2 dbs_create_index_table_other_opt_part3;
xml_index_specification: GENERATE (KEY | KEYS) USING XMLPATTERN xml_pattern_clause AS sql_data_type;
xml_pattern_clause: prolog? pattern_expression;
prolog: (DECLARE NAMESPACE NCNAME  EQUALCHAR dbs_namespace_name SEMICOLONCHAR | DECLARE DEFAULT ELEMENT NAMESPACE dbs_namespace_name SEMICOLONCHAR)*;
pattern_expression: ( (SLASHCHAR | DOUBLESLASHCHAR)  )*; //TBD ?
dbs_create_index_table_other_opt_part1: ((NOT)? CLUSTER | PARTITIONED | (NOT)? PADDED using_specification free_specification gbpcache_specification (DEFINE (YES | NO)  COMPRESS (YES | NO) (INCLUDE | EXCLUDE) NULL KEYS))*;
dbs_create_index_table_other_opt_part2: (PARTITION BY (RANGE)? LPARENCHAR (partition_using_specification (COMMACHAR  partition_using_specification))* RPARENCHAR)?;
dbs_create_index_table_other_opt_part3: (BUFFERPOOL dbs_bp_name | CLOSE (YES | NO) | DEFER (NO | YES) | DSSIZE INTEGER G | PIECESIZE INTEGER (K | M | G) | COPY (NO | YES))*;
partition_using_specification: partition_element (using_specification | free_specification | gbpcache_specification | DSSIZE INTEGER G)?;
using_specification: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY (NUMBER_12 | INTEGER)? | SECQTY INTEGER | ERASE (YES | NO)?)*);
free_specification: ( (FREEPAGE (NUMBER_0 | INTEGER) | PCTFREE  (NUMBER_10 | INTEGER)))*;
gbpcache_specification: GBPCACHE (CHANGED | ALL) | NONE;
partition_element: PARTITION INTEGER (ENDING (AT)? LPARENCHAR (dbs_string_constant | MAXVALUE | MINVALUE)*  RPARENCHAR (INCLUSIVE)? )?;

dbs_create_lob_tablespace: CREATE LOB  dbs_table_space_name dbs_create_lob_tablespace_def*;
dbs_create_lob_tablespace_def: IN (DSNDB04 | dbs_database_name) (BUFFERPOOL dbs_bp_name)? CLOSE (YES | NO) COMPRESS (YES | NO) | DEFINE  (YES | NO) DSSIZE (NUMBER_4 G | INTEGER G) gbpcache_block?
                            LOCKMAX (SYSTEM | INTEGER) locksize_block?  NOT? LOGGED using_block?;
gbpcache_block: (GBPCACHE (CHANGED | ALL | SYSTEM | NONE))?;
locksize_block: (LOCKSIZE (ANY | LOB))?;
using_block: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY INTEGER | SECQTY INTEGER | ERASE (YES | NO)?)*);

dbs_create_mask: CREATE MASK dbs_mask_name ON dbs_table_name ((AS)? dbs_correlation_name)? FOR COLUMN dbs_column_name RETURN dbs_case_expression (DISABLE | ENABLE);
dbs_create_permission: CREATE PERMISSION dbs_permission_name ON dbs_table_name ((AS)? dbs_correlation_name)? FOR ROWS WHERE dbs_search_condition ENFORCED FOR ALL ACCESS  (DISABLE | ENABLE);
dbs_create_procedure: literal+; //?
dbs_create_procedure_ext: literal+; //?
dbs_create_procedure_native_sql: literal+; //?
dbs_create_role: literal+; //?
dbs_create_sequence: literal+; //?
dbs_create_stogroup: literal+; //?
dbs_create_synonym: literal+; //?
dbs_create_table: literal+; //?
dbs_create_tablespace: literal+; //?
dbs_create_trigger_advanced: literal+; //?
dbs_create_trigger_basic: literal+; //?
dbs_create_trusted_context: literal+; //?
dbs_create_type: literal+; //?
dbs_create_type_array: literal+; //?
dbs_create_type_distinct: literal+; //?
dbs_create_variable: literal+; //?
dbs_create_view: literal+; //?



dbs_create_distinct_type : CREATE DISTINCT TYPE SQL_IDENTIFIER AS dbs_distinct_type;

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
dbs_delete_assignment_clause_part: LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | (dbs_expression |
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
dbs_drop_parameter_type: (common_built_in_type | dbs_distinct_type_name | dbs_array_type_name) (AS LOCATOR)?;
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
        RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))*) RPARENCHAR);
dbs_merge_insert: INSERT (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)? VALUES (dbs_expression | DEFAULT | NULL |
        LPARENCHAR (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))* RPARENCHAR);


/*OPEN */
dbs_open: OPEN dbs_cursor_name (USING (DESCRIPTOR dbs_descriptor_name) | (dbs_variable | dbs_array_variable
        LSQUAREBRACKET dbs_array_index RSQUAREBRACKET) (COMMACHAR (dbs_variable | dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET))*);

/*PREPARE */
dbs_prepare: PREPARE dbs_statement_name (INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?)? (FROM dbs_string_expression | (ATTRIBUTES dbs_attr_host_variable)? FROM dbs_variable);


/*REFRESH TABLE */
dbs_refresh: REFRESH TABLE dbs_table_name (QUERYNO dbs_integer);

/* RELEASE (both) */
dbs_release: RELEASE (dbs_location_name | dbs_host_variable | CURRENT | ALL SQL? | TO? SAVEPOINT dbs_savepoint_name);

dbs_savepoint_name: literal+; //?

/*RENAME */
dbs_rename: RENAME (TABLE? dbs_table_name TO dbs_table_identifier | INDEX dbs_index_name TO dbs_index_identifier);


/*REVOKE (all) */

/*ROLLBACK */
dbs_rollback: ROLLBACK WORK? (TO SAVEPOINT dbs_savepoint_name?)?;

/*SAVEPOINT */
dbs_savepoint: SAVEPOINT dbs_savepoint_name UNIQUE? ON ROLLBACK RETAIN (CURSORS (ON ROLLBACK RETAIN LOCKS)? | LOCKS ON ROLLBACK RETAIN CURSORS);

/*SELECT (both) */

/*SET (all) */
//?
dbs_revoke: literal+; //?

/*SET (all)*/
dbs_select: dbs_select_unpack_function_invocation | dbs_select_row_fullselect;

/*Queries Subselects (all)*/
dbs_select_unpack_function_invocation: UNPACK LPARENCHAR dbs_expression RPARENCHAR DOT ASTERISKCHAR AS LPARENCHAR dbs_field_name db2sql_data_types (COMMACHAR dbs_field_name db2sql_data_types)* RPARENCHAR;
dbs_select_row_fullselect: literal+; //TBD



dbs_set: literal+; //?

/*SIGNAL - this is a statement and is referenced in other rules*/
dbs_signal: dbs_label? SIGNAL (dbs_sql_condition_name | SQLSTATE VALUE? (dbs_sqlstate_string_constant | dbs_sql_variable_name |
            dbs_sql_parameter_name)) (SET MESSAGE_TEXT EQUALCHAR)? dbs_diagnostic_string_expression;


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
                    (COMMA dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | dbs_select_unpack_function_invocation |
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


common_built_in_type: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat |
                        common_bit_char | common_bit_clob | common_bit_varchar | common_bit_graphic |
                        common_bit_binary | DATE | TIME | common_bit_timestamp | ROWID | XML);
common_built_in_type2: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat |
                        common_bit_char | common_bit_clob | common_bit_varchar | common_bit_graphic |
                        common_bit_binary | DATE | TIME | common_bit_timestamp | ROWID | XML);

common_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
common_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
common_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
common_bit_decfloat: DECFLOAT (LPARENCHAR (NUMBER_34 | NUMBER_16) RPARENCHAR)?;
common_bit_char: (CHARACTER | CHAR) (VARYING common_bit_varandchar | LARGE OBJECT common_bit_clobandobj | LPARENCHAR dbs_integer RPARENCHAR common_bit_charopts);
common_bit_charopts: (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED | BIT) DATA)?;
common_bit_varchar: VARCHAR common_bit_varandchar;
common_bit_varandchar: LPARENCHAR dbs_integer RPARENCHAR common_bit_charopts;
common_bit_clob: CLOB common_bit_clobandobj;
common_bit_clobandobj: (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)? (CCSID (ASCII | EBCDIC | UNICODE))? (FOR (SBCS | MIXED ) DATA)?;
common_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR |
                        DBCLOB (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?) (CCSID (ASCII | EBCDIC | UNICODE))?;
common_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR |
                    (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer (K | M | G)? RPARENCHAR)?);
common_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? ((WITHOUT | WITH) TIME ZONE)?;

sql_data_type: SQL (VARCHAR (LPARENCHAR dbs_integer RPARENCHAR) | DECFLOAT (LPARENCHAR (NUMBER_34) RPARENCHAR)? | DATE | TIMESTAMP (LPARENCHAR (NUMBER_12) RPARENCHAR)? );


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

dbs_option_list_ext: (SPECIFIC dbs_specific_name)? (PARAMETER ( CCSID (ASCII | EBCDIC | UNICODE) | VARCHAR (NULTERM | STRUCTURE) )*)? |
                EXTERNAL ( NAME( dbs_ext_program_name | SQL_IDENTIFIER))? LANGUAGE (ASSEMBLE | C | COBOL | JAVA | PLI) PARAMETER STYLE (SQL | JAVA)
                (NOT)? DETERMINISTIC FENCED? (RETURNS NULL | CALLED) ON NULL INPUT ((READS | MODIFIES ) SQL DATA | (CONTAINS | NO) SQL)? ( (NO)? EXTERNAL ACTION)?
                (NO PACKAGE PATH | PACKAGE PATH dbs_package_path )? (NO SCRATCHPAD | SCRATCHPAD (NUMBER_100 | INTEGER)?)? ((NO)? FINAL CALL)?
                ((ALLOW | DISALLOW) PARALLEL)? ((NO)? DBINFO)? (NO COLLID | COLLID dbs_collection_id_package_name)? (WLM ENVIRONMENT (dbs_wlm_env_name | LPARENCHAR dbs_wlm_env_name RPARENCHAR ))?
                 (ASUTIME NO LIMIT | ASUTIME LIMIT INTEGER)? (STAY RESIDENT (YES | NO)?)? (PROGRAM TYPE (SUB | MAIN))? (SECURITY (DB2 | (USER | DEFINER)))?
                 (STOP AFTER (SYSTEM DEFAULT FAILURES | INTEGER FAILURES) | CONTINUE AFTER FAILURE)? (RUN OPTIONS dbs_runtime_options)?
                  ((INHERIT | DEFAULT)  SPECIAL REGISTERS)? (STATIC DISPATCH)? ((NOT)? SECURED)? ;


dbs_option_list_ext_table: dbs_option_list_ext; //TBD

dbs_option_list_inl_def:  (SPECIFIC dbs_specific_name)? (PARAMETER CCSID (ASCII | EBCDIC | UNICODE)) ((NOT)? DETERMINISTIC)? ( (NO)? EXTERNAL ACTION)?
                          (READ SQL DATA | CONTAINS SQL)? (STATIC DISPATCH)? (CALLED ON NULL INPUT)? ((NOT)? SECURED)?;


/// STATEMENTS ///
//TODO
dbs_control_statement: all_words+;
//                        assignment_statement | dbs_call | case_statement | compund_statement | get_diagnostics_statement |
//                        goto_statement | if_statement | iterate_statement | leave_statement | loop_statement | repeat_statement |
//                        resignal_statement |return_statement | signal_statement | while_statement;
/// End STATEMENTS ///

//TODO
//dbs_expression: dbs_expr_list | expr_in | expr_out | expr_inout;
//expr_in : IN LPARENCHAR? SQL_IDENTIFIER (COMMACHAR SQL_IDENTIFIER)* RPARENCHAR?;
//expr_out : OUT LPARENCHAR? SQL_IDENTIFIER (COMMACHAR SQL_IDENTIFIER)* RPARENCHAR?;
//expr_inout : INOUT LPARENCHAR? SQL_IDENTIFIER (COMMACHAR dbs_expression)* RPARENCHAR?;
//dbs_expr_list: LPARENCHAR? SQL_IDENTIFIER (COMMACHAR SQL_IDENTIFIER)* RPARENCHAR?;
///////////////// DBS EXPRESSION STARTS/////////////
dbs_expression: ('+'|'-')? (dbs_function_invocation |
 LPARENCHAR dbs_expression RPARENCHAR  |
 dbs_constant |
 dbs_column_name |
 dbs_variable | //? fix this immediately: all_word+ ruin
 dbs_special_register |
 dbs_scalar_fullselect |
 dbs_time_zone_specific_expression |
 dbs_labeled_duration |
 dbs_case_expression |
 dbs_cast_specification |
 dbs_XMLCAST_specification |
 dbs_array_element_specification |
 dbs_array_constructor |
 dbs_OLAP_specification |
 dbs_row_change_expression |
 dbs_sequence_reference);

dbs_expression_operator: (CONCAT | PIPECHAR | SLASHCHAR | ASTERISKCHAR | PLUSCHAR | MINUSCHAR);

dbs_expressions: dbs_expression (dbs_expression_operator dbs_expression)*;
//https://www.ibm.com/support/knowledgecenter/SSEPEK_11.0.0/sqlref/src/tpc/db2z_predicatesoverview.html
dbs_basic_predicate: dbs_expression (EQUALCHAR|NOTEQUALCHAR|LESSTHANCHAR |MORETHANCHAR |MORETHANOREQUAL|LESSTHANOREQUAL) dbs_expression;
// TODO: predicates
//dbs_predicate: (dbs_basic_predicate | dbs_quantified_predicate | dbs_array_exists_predicate | dbs_between_predicate | dbs_distinct_predicate | dbs_exist_predicate | dbs_in_predicate | dbs_like_predicate | dbs_null_predicate| dbs_xml_exist_predicate ) ;
dbs_searched_when_clause : (WHEN dbs_basic_predicate THEN (dbs_result_expression1 | NULL))+;

dbs_function_invocation : dbs_function_name LPARENCHAR (ALL | DISTINCT)? (TABLE dbs_transition_table_name |
dbs_expression (COMMACHAR dbs_expression)*)? RPARENCHAR;
dbs_cast_specification: CAST LPARENCHAR (dbs_expression | NULL | dbs_parameter_marker) AS dbs_comment_parameter_type RPARENCHAR;
dbs_time_zone_expression : ( dbs_function_invocation | LPARENCHAR dbs_expression RPARENCHAR | dbs_constant |
dbs_column_name | dbs_variable | dbs_special_register | dbs_scalar_fullselect | dbs_case_expression | dbs_cast_specification);

dbs_time_zone_specific_expression : dbs_time_zone_expression ( AT LOCAL | AT TIME ZONE dbs_time_zone_expression);
dbs_time_unit: (YEAR | YEARS | MONTH | MONTHS | DAY | DAYS | HOUR | HOURS | MINUTE | MINUTES | SECOND | SECONDS | MICROSECOND | MICROSECONDS );
dbs_labeled_duration: (dbs_function_invocation | LPARENCHAR dbs_expression RPARENCHAR | dbs_constant |
dbs_column_name | dbs_variable) dbs_time_unit;

dbs_XMLCAST_specification: XMLCAST LPARENCHAR (dbs_expression | NULL | dbs_parameter_marker) AS dbs_comment_parameter_type RPARENCHAR;
dbs_array_element_specification: dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET ;
dbs_array_constructor: ARRAY LSQUAREBRACKET (QUESTIONMARK | dbs_fullselect | (dbs_array_element_specification | NULL)
(COMMACHAR (dbs_array_element_specification | NULL))*) RSQUAREBRACKET;

dbs_lag_lead_expression: LPARENCHAR dbs_expression (COMMACHAR dbs_integer (COMMACHAR dbs_integer (COMMACHAR '\'' RESPECT NULLS '\'' |
 COMMACHAR'\'' IGNORE NULLS '\'')?)?)? RPARENCHAR;
dbs_lag_function: LAG dbs_lag_lead_expression;

dbs_lead_function: LEAD dbs_lag_lead_expression;
dbs_partitioning_expression: DOLLARCHAR INTEGERLITERAL? '\'' N '\'' (PLUSCHAR INTEGERLITERAL (PERCENT INTEGERLITERAL)? | PERCENT INTEGERLITERAL (PLUSCHAR INTEGERLITERAL)?)?;
dbs_window_partition_clause: PARTITION BY dbs_partitioning_expression (COMMACHAR dbs_partitioning_expression)*
;
dbs_sort_key_expression: dbs_column_name (dbs_expression_operator dbs_column_name)* | dbs_integer;
dbs_window_each_order_clause: dbs_sort_key_expression (ASC (NULLS LAST)? | ASC NULLS FIRST | DESC (NULLS FIRST)? | DESC NULLS LAST )?;

dbs_window_order_clause: ORDER BY dbs_window_each_order_clause (COMMACHAR dbs_window_each_order_clause)*;

dbs_ordered_OLAP_specification: (CUME_DIST LPARENCHAR RPARENCHAR| PERCENT_RANK LPARENCHAR RPARENCHAR | RANK LPARENCHAR RPARENCHAR|
DENSE_RANK LPARENCHAR RPARENCHAR | NTILE LPARENCHAR INTEGERLITERAL RPARENCHAR | dbs_lag_function | dbs_lead_function)
OVER LPARENCHAR dbs_window_partition_clause? dbs_window_order_clause RPARENCHAR;

dbs_numbering_specification: ROW_NUMBER LPARENCHAR RPARENCHAR OVER LPARENCHAR dbs_window_partition_clause? dbs_window_order_clause? RPARENCHAR;

dbs_aggregate_function: dbs_single_expression_aggregate_function | dbs_correlation_function | dbs_covariance_function;
dbs_correlation_function: CORRELATION LPARENCHAR dbs_expression COMMACHAR dbs_expression RPARENCHAR;
dbs_covariance_function: COVARIANCE LPARENCHAR dbs_expression COMMACHAR dbs_expression RPARENCHAR;

dbs_single_expression_aggregate_function: (AVG|COUNT|COUNT_BIG|MAX|MIN|STDDEV|SUM|VARIANCE) LPARENCHAR (ALL|DISTINCT)?
dbs_expression RPARENCHAR;

dbs_value_function: (FIRST_VALUE | LAST_VALUE | NTH_VALUE) LPARENCHAR dbs_expression (COMMACHAR '\'' RESPECT NULLS '\'' |
COMMACHAR '\'' IGNORE NULLS '\'') RPARENCHAR;
dbs_ratio_to_report_function: RATIO_TO_REPORT LPARENCHAR dbs_expression RPARENCHAR;
dbs_OLAP_column_function: dbs_value_function | dbs_ratio_to_report_function
;
dbs_group_start: (UNBOUNDED PRECEDING | CURRENT ROW | dbs_integer PRECEDING);
dbs_group_bound: (dbs_integer PRECEDING | dbs_integer FOLLOWING | CURRENT ROW);
dbs_group_bound1: (UNBOUNDED PRECEDING | dbs_group_bound);
dbs_group_bound2: (UNBOUNDED FOLLOWING | dbs_group_bound);
dbs_group_between: BETWEEN dbs_group_bound1 AND dbs_group_bound2;
dbs_group_end: (UNBOUNDED FOLLOWING | dbs_integer FOLLOWING);
dbs_window_aggregation_group_clause: (ROWS | RANGE) (dbs_group_start | dbs_group_between | dbs_group_end);

dbs_aggregation_specification : (dbs_aggregate_function | dbs_OLAP_column_function) OVER LPARENCHAR dbs_window_partition_clause?
( RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING | dbs_window_order_clause (RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW |
dbs_window_aggregation_group_clause )?)? RPARENCHAR;
dbs_OLAP_specification: dbs_ordered_OLAP_specification |
 dbs_numbering_specification |
 dbs_aggregation_specification
;
dbs_table_designator: all_words+; //?
dbs_row_change_expression: ROW CHANGE (TIMESTAMP | TOKEN) FOR dbs_table_designator;
dbs_sequence_reference: (NEXT| PREVIOUS) VALUE FOR dbs_sequence_name;
/////////////////DBS EXPRESSION ENDS///////////////////




/////// Variables /////////////
all_words: NONNUMERICLITERAL | NUMERICLITERAL | integerLiteral | generalIdentifier |
            cobolWord | cics_cobol_intersected_words | db2sql_intersected_words | db2sql_only_words;


db2sql_words: db2sql_only_words | db2sql_intersected_words;


db2sql_intersected_words: ACCESS | ALL | ANY | APPLY | ARE | AS | ASCII | AT | AUXILIARY | BEFORE | BINARY | BIT | BLOB | BY |
                            CALL | CHANGED | CHARACTER | CLOB | COBOL | CONTAINS | CONTINUE | CONTROL | COPY | CORR |
                            CORRESPONDING | COUNT | CURSOR | DATA | DATE | DAY | DB | DBCLOB | DEFAULT | DEFINITION |
                            DELETE | DISABLE | DOUBLE | DYNAMIC | EBCDIC | ELSE | ENABLE | END | END_EXEC | ERASE |
                            ESCAPE | EVENT | EXCEPTION | VARYING | EXCLUSIVE | EXEC | EXTENDED | EXTERNAL | FALSE | FILE | FIRST |
                            FOR | FROM | FUNCTION | GENERATE | GLOBAL | GO | IF | IN | INDEX | INTEGER | INTO | KEY |
                            LANGUAGE | LAST | LEADING | LEFT | LENGTH | LIBRARY | LOCAL | LOCK | MERGE | MODE | NAMED |
                            NATIONAL | NEXT | NO | NOT | NULL | NULLS | NUMERIC |OF | OFF | ON | OPTIONAL | OR | ORDER |
                            OUTPUT | PASSWORD | POSITION | PROCEDURE | PROGRAM | READ | REAL | REF | REFERENCE | REFERENCES |
                            RELATIVE | RELEASE | REPLACE | RESET | RETURN RIGHT | RUN | SEARCH | SECTION | SELECT | SET | SPACE |
                            SQL | START | THEN | TIME | TO TRAILING | TRUE | TYPE | UNTIL | USAGE | USE | USING | VALUE |
                            VALUES | VARYING | WHEN | WITH | WRITE | XML | YEAR;


db2sql_only_words: ABSOLUTE | ACCELERATION | ACCELERATOR | ACTIVATE | ACTIVE | ADA | ALIAS | ALLOW | ALTERIN | ALWAYS | APPEND |
                            APPLCOMPAT | APPLICATION | ARCHIVE | ASC | ASSERTION | ASSOCIATE | ASUTIME | ATOMIC | AUTHID |
                            AUTHORIZATION | AUTOMATIC | AVG | AUX | BEGIN | BETWEEN | BIGINT | BIND | BINDADD | BIT_LENGTH | BLOCKED |
                            BOTH | BUFFERPOOL | BUFFERPOOLS | BUSINESS_TIME | CACHE | CALLED | CALLER | CAPTURE | CARDINALITY |
                            CASCADE | CASE | CAST | CATALOG | CATALOG_NAME | CHANGES | CHAR_LENGTH | CHARACTER_LENGTH |
                            CHECKED | CLAUSE | CLUSTER | COLLATE | COLLATION | COLLECT | COLLECTION | COLLID | COLUMN | COMMENT |
                            COMMIT | COMMITTED | COMPARISONS | CONCAT | CONCENTRATE | CONCURRENT | CONDITION_NUMBER | CONNECTION |
                            CONNECTION_NAME | CONSERVATIVE | CONSTRAINT | CONSTRAINTS | CONTEXT | CONVERT | CORRELATION | COUNT_BIG |
                            CPU | CREATEIN | C R E A T E I N | CREATETAB | CROSS | CS | CUBE | CURRENT_DATE | CURRENT_PATH |
                            CURRENT_SCHEMA | CURRENT_SERVER | CURRENT_SQLID | CURRENT_TIME | CURRENT_TIMESTAMP | CURRENT_TIMEZONE |
                            CURRENT_USER | CURRENTLY | CURSOR_NAME | CURSORS | CYCLE | DATABASE | DATALINK | DB2_AUTHENTICATION_TYPE |
                            DB2_AUTHORIZATION_ID | DB2_CONNECTION_STATE | DB2_CONNECTION_STATUS | DB2_ENCRYPTION_TYPE | DB2_ERROR_CODE1 |
                            DB2_ERROR_CODE2 | DB2_ERROR_CODE3 | DB2_ERROR_CODE4 | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_INTERNAL_ERROR_POINTER |
                            DB2_LAST_ROW | DB2_LINE_NUMBER | DB2_MESSAGE_ID | DB2_MODULE_DETECTING_ERROR | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS |
                            DB2_NUMBER_ROWS | DB2_ORDINAL_TOKEN1 | DB2_ORDINAL_TOKEN2 | DB2_ORDINAL_TOKEN3 | DB2_ORDINAL_TOKEN4 | DB2_PRODUCT_ID |
                            DB2_REASON_CODE | DB2_RETURN_STATUS | DB2_RETURNED_SQLCODE | DB2_ROW_NUMBER | DB2_SERVER_CLASS_NAME | DB2_SQL_ATTR_CURSOR_HOLD |
                            DB2_SQL_ATTR_CURSOR_ROWSET | DB2_SQL_ATTR_CURSOR_SCROLLABLE | DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE |
                            DB2_SQL_NESTING_LEVEL | DB2_SQLERRD1 | DB2_SQLERRD2 | DB2_SQLERRD3 | DB2_SQLERRD4 | DB2_SQLERRD5 | DB2_SQLERRD6 |
                            DB2_SQLERRD_SET | DB2_TOKEN_COUNT | DB2DARI | DB2GENERAL | DB2GENRL | DB2SQL | DBADM | DBINFO | DEADLOCKS | DEALLOCATE |
                            DEBUG | DEC | DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN |
                            DEC_ROUND_HALF_UP | DEC_ROUND_UP | DECFLOAT | DECIMAL | DECLARE | DEFAULTS | DEFER | DEFERRABLE | DEFERRED | DEFINEBIND |
                            DEFINERUN | DEGREE | DESC | DESCRIBE | DESCRIPTOR | DETERMINISTIC | DIAGNOSTICS | DIMENSIONS | DISALLOW |
                            DISPATCH | DISTINCT | DO | DOMAIN | DOUBLEQUOTE | DROP | DROPIN | DYNAMICRULES | EACH | ELIGIBLE |
                            ELSEIF | EMPTY | ENCODING | ENVIRONMENT | EQUALCHAR | EUR | EXACT | EXCEPT | EXCHANGE | EXCLUDE | EXCLUDING |
                            EXECUTE | EXISTS | EXIT | EXPLAIN | EXTENSION | FAILBACK | FEDERATED | FENCED | FETCH | FINAL | FIRST | FLOAT |
                            FLUSH | FOLLOWING | FOREIGN | FORMAT | FORTRAN | FOUND | FREEPAGE | FS | FULL | GBPCACHE | GENERAL | GENERATED |
                            GET_ACCEL_ARCHIVE | GOTO | GRANT | GRAPHIC | GROUP | GROUPING | HANDLER | HAVING | HOUR | IDENTITY | IMPLICIT_SCHEMA |
                            INCLUDE | INCLUDING | INDEXES | INDICATOR | INHERIT | INITIAL_INSTS | INITIAL_IOS | INITIALLY | INNER | INOUT |
                            INSENSITIVE | INSTEAD | INSTS_PER_ARGBYTE | INSTS_PER_INVOC | INT | INTEGRITY | INTERSECT | INVALID | INVOKEBIND |
                            INVOKERUN | IOS_PER_ARGBYTE | IOS_PER_INVOC | IS | ISO | ISOLATION | ITERATE | JAVA | JIS | JOIN | KEYS |
                            LABELS | LARGE | LEAVE | LIKE | LIMIT | LINKTYPE | LITERALS | LOCATOR | LOCATORS | LOCKED | LOCKS | LOCKSIZE |
                            LOGGED | LONG | LONGVAR | LOOP | LOWER | MAINTAINED | MAPPING | MASK | MATCH | MAX | MAXVALUE | MESSAGE_TEXT | MICROSECOND |
                            MICROSECONDS | MINUTE | MINVALUE | MIXED | MODIFIES | MODULE | MONTHS | NAMES | NATURAL | NCHAR | NEW | NEW_TABLE |
                            NEXTVAL | NICKNAME | NOCACHE | NOCYCLE | NODE | NOMINVALUE | NOORDER | NULLABLE | NUMBER | OBJECT | OCTETS |
                            CODEUNITS32 | OLD | OLD_TABLE | OLE | OLEDB | ONCE | ONLINE | ONLY | OPTHINT | OPTIMIZATION | OPTIMIZE | OUT |
                            OUTCOME | OUTER | OVER | OVERLAPS | OVERRIDING | PACKAGE | PAD | PARALLEL | PARAMETER | PART | PARTIAL | PARTITION |
                            PARTITIONING | PASCAL | PASSTHRU | PCTFREE | PERCENT_ARGBYTES | PERMISSION | PIECESIZE | PIPE | PLAN | PLI | PORTION |
                            PRECEDING | PRECISION | PRESERVE | PRIMARY | PRIOR | PRIQTY | PRIVILEGES | PROTOCOL | PUBLIC | QUALIFIER | QUERYNO |
                            RANGE | READS | RECOMMEND | RECOVERY | REFERENCING | REFRESH | REGISTERS | RENAME | REOPT | REPEAT | REPLICATED |
                            REQUIRED | RESIDENT | RESIGNAL | RESOLUTION | RESOLVE | RESTORE | RESTRICT | RESULT_SET_LOCATOR | RETURN_STATUS |
                            RETURNED_SQLSTATE | RETURNS | REVOKE | ROLLUP | ROUNDING | ROUTINE | ROW | ROW_COUNT | ROWID | ROWS | ROWSET |
                            RR | RS | SAVEPOINT | SBCS | SCALE | SCHEMA | SCRATCHPAD | SCROLL | SECOND | SECQTY | SECURED | SELECTIVITY |
                            SELF | SENSITIVE | SEQUENCE | SERIALIZABLE | SERVER_NAME | SESSION_USER | SETS | SHARE | SHRLEVEL | SIGNAL |
                            SIMPLE | SIZE | SMALLINT | SNAPSHOT | SOME | SPECIAL | SPECIFIC | SQLCA | SQLCODE | SQLDA | SQLERROR | SQLEXCEPTION |
                            SQLID | SQLSTATE | SQLWARNING | STABILIZED | STACKED | STARTING | STATEMENT | STATEMENTS | STATIC | STATISTICS |
                            STAY | STMTCACHE | STMTID | STMTTOKEN | STOGROUP | STORED | STORES | STYLE | SUB | SUBSTR | SUBSTRING | SUMMARY |
                            SWITCH | SYNONYM | SYSTEM | SYSTEM_TIME | SYSTEM_USER | TABLE | TABLE_NAME | TABLESPACE | TABLESPACES | TEMPORARY |
                            THREADSAFE | TIMESTAMP | TIMEZONE | TIMEZONE_HOUR | TIMEZONE_MINUTE | TRANSLATE | TRANSLATION | TREAT | TRIM |
                            TRUSTED | UNBOUNDED | UNDER | UNDO | UNICODE | UNION | UNIQUE | UNKNOWN | UNPACK | UPPER | USA | USER | VALIDATE | VARBINARY |
                            VARCHAR | VARGRAPHIC | VARIABLE | VARIANT | VCAT | VERSION | VIEW | VOLATILE | WAITFORDATA | WHENEVER | WHERE |
                            WHILE | WITHOUT | WLM | WORK | WRAPPER | YEARS | YES | ZONE;


db2sql_data_types: db2sql_unpack_data_types | VARCHAR | GRAPHIC | VARBINARY CLOB | BLOB | DBCLOB |  INT |
                    FLOAT | DEC | NUMERIC | DECFLOAT | NATIONAL | ASCII | EBCDIC | DBCLOB | ROWID;

db2sql_unpack_data_types: SMALLINT | INTEGER | BIGINT | REAL | DOUBLE | DECIMAL | CHAR | CHARACTER | VARBINARY | BINARY | TIMESTAMP | DATE | TIME;

dbs_special_register : ( CURRENT ACCELERATOR | CURRENT APPLICATION COMPATIBILITY | CURRENT APPLICATION ENCODING SCHEME |
(CURRENT CLIENT_ACCTNG | CLIENT ACCTNG) | (CURRENT CLIENT_APPLNAME|CLIENT APPLNAME) | CURRENT CLIENT_CORR_TOKEN |
(CURRENT CLIENT_USERID | CLIENT USERID) | ( CURRENT CLIENT_WRKSTNNAME | CLIENT WRKSTNNAME) | (CURRENT DATE | CURRENT_DATE) |
CURRENT DEBUG MODE | CURRENT DECFLOAT ROUNDING MODE | CURRENT DEGREE | CURRENT EXPLAIN MODE | CURRENT GET_ACCEL_ARCHIVE |
(CURRENT_LC_CTYPE | CURRENT LOCALE? LC_CTYPE) | CURRENT MAINTAINED TABLE? TYPES (FOR OPTIMIZATION)? | CURRENT MEMBER |
CURRENT OPTIMIZATION HINT | CURRENT PACKAGE PATH | CURRENT PACKAGESET | (CURRENT PATH | CURRENT_PATH) | CURRENT PRECISION |
CURRENT QUERY ACCELERATION | CURRENT QUERY ACCELERATION WAITFORDATA | CURRENT REFRESH AGE | CURRENT ROUTINE VERSION |
CURRENT RULES | (CURRENT SCHEMA | CURRENT_SCHEMA) | (CURRENT SERVER | CURRENT_SERVER) | CURRENT SQLID |
CURRENT TEMPORAL BUSINESS_TIME | CURRENT TEMPORAL SYSTEM_TIME | (CURRENT TIME | CURRENT_TIME) |
((CURRENT TIMESTAMP| CURRENT_TIMESTAMP) (LPARENCHAR integerLiteral RPARENCHAR)? (WITHOUT TIME ZONE|WITH TIME ZONE)? ) |
(CURRENT TIME ZONE| CURRENT TIMEZONE | CURRENT_TIMEZONE) | ENCRYPTION PASSWORD | (SESSION TIME ZONE | SESSION TIMEZONE) |
(SESSION_USER | USER) );


db2sql_data_value: all_words+;//
dbs_accelerator_name: all_words+; //?
dbs_address_value: all_words+;//?
dbs_alias_name2: SQL_IDENTIFIER; //must not be an alias that exists at the current server
dbs_alias_name: SQL_IDENTIFIER;
dbs_applcompat_value: all_words+; //?
dbs_archive_table_name: all_words+;//?
dbs_array_index: INTEGER;
dbs_array_type_name: SQL_IDENTIFIER;
dbs_array_variable: all_words+; //?
dbs_attr_host_variable: literal+; //?
dbs_authorization_name: SQL_IDENTIFIER;
dbs_aux_table_name: SQL_IDENTIFIER;
dbs_binary_string_constant: BXNUMBER;
dbs_bp_name: SQL_IDENTIFIER;
dbs_case_expression : CASE (dbs_simple_when_clause | dbs_searched_when_clause) (ELSE NULL | ELSE dbs_result_expression1)? END ;
dbs_cast_function_name: all_words+;//?
dbs_catalog_name: SQL_IDENTIFIER;
dbs_ccsid_value: all_words+; //?
dbs_character_string_constant: HEXNUMBER | STRINGLITERAL;
dbs_check_condition: all_words+;//?
dbs_clone_table_name: all_words+;//?
dbs_collection_id: all_words+; //?
dbs_collection_id_package_name: FILENAME;
dbs_collection_name: all_words+; //?
dbs_column_name: SQL_IDENTIFIER;
dbs_common_table_expression: all_words+; //?
dbs_constant : (dbs_string_constant | dbs_integer_constant);
dbs_constraint_name: all_words+;//?
dbs_context: SQL_IDENTIFIER;
dbs_context_name: all_words+;//?
dbs_copy_id: all_words+; //?
dbs_correlation_name: SQL_IDENTIFIER;
dbs_cursor_name: SQL_IDENTIFIER;
dbs_database_name: all_words+; //?
dbs_dc_name: all_words+;//?
dbs_descriptor_name: SQLD | SQLDABC | SQLN | SQLVAR; //SQLDA
dbs_diagnostic_string_expression: literal+; //?
dbs_distinct_type: db2sql_data_types+;
dbs_distinct_type_name: SQL_IDENTIFIER;
dbs_element_name: all_words+;//?
dbs_encryption_value: all_words+;//?;
dbs_explainable_sql_statement: all_words+; //?
dbs_ext_program_name: SQL_IDENTIFIER;//If LANGUAGE is JAVA
dbs_external_program_name:all_words+; //?
dbs_fetch_clause: all_words+; //?
dbs_field_name: SQL_IDENTIFIER;
dbs_fullselect: all_words+; //?
dbs_function_name: SQL_IDENTIFIER; //must not be any of the following system-reserved keywords
dbs_global_variable_name: all_words+; //?
dbs_graphic_string_constant: GRAPHICUNICODE | GRAHICCHAR;
dbs_history_table_name: all_words+;//?
dbs_host_label: all_words+; //?
dbs_host_variable: FILENAME;
dbs_host_variable_array: all_words+; //?
dbs_host_variable_name: all_words+; //?
dbs_id_host_variable: all_words+; //?
dbs_identifier: all_words+; //?
dbs_include_data_type: all_words+; //?
dbs_index_identifier: literal+; //?
dbs_index_name: SQL_IDENTIFIER;
dbs_integer: INTEGER;
dbs_integer_constant: INTEGERLITERAL; //range 1 - 32767
dbs_jobname_value: all_words+;//?
dbs_key_label_name: all_words+;//?
dbs_length: all_words+; //?
dbs_level: all_words+; //?
dbs_location_name: VARCHAR | CHAR; //not greater than 16
dbs_mask_name: SQL_IDENTIFIER;
dbs_mc_name: all_words+;//?
dbs_member_name: SQL_IDENTIFIER;
dbs_name: all_words+; //?
dbs_namespace_name: VARCHAR;
dbs_namespace_prefix: VARCHAR;
dbs_namespace_url: VARCHAR;
dbs_nnnn_m: all_words+; //?
dbs_non_deterministic_expression: all_words+;//?
dbs_numeric_constant: all_words+;//?
dbs_obfuscated_statement_text: ALPHANUMERIC_TEXT;
dbs_package_name: all_words+; //?
dbs_package_path: FILENAME+; //If package-path contains SESSION_USER (or USER), PATH, or PACKAGE PATH
dbs_parameter_marker: ( QUESTIONMARK | COLONCHAR dbs_variable);
dbs_parameter_name: SQL_IDENTIFIER;
dbs_permission_name: SQL_IDENTIFIER;
dbs_plan_name: SQL_IDENTIFIER;
dbs_procedure_name: SQL_IDENTIFIER;
dbs_profile_name: all_words+;//?
dbs_program_name: all_words+;//?
dbs_registered_xml_schema_name: all_words+;//?
dbs_result_expression1: NONNUMERICLITERAL | NUMERICLITERAL;
dbs_role_name: SQL_IDENTIFIER+;
dbs_routine_version_id: ALPHANUMERIC_TEXT;
dbs_rs_locator_variable: SQL_IDENTIFIER;
dbs_run_time_options: all_words+; //?
dbs_runtime_options: VARCHAR; //no longer than 254 bytes
dbs_s: all_words+; //?
dbs_sc_name: all_words+;//?
dbs_scalar_fullselect : LPARENCHAR dbs_fullselect RPARENCHAR;
dbs_schema_location: all_words+;//?
dbs_schema_name: all_words+; //?
dbs_search_condition: all_words+; //?
dbs_seclabel_name: all_words+;//?
dbs_sequence_name: SQL_IDENTIFIER;
dbs_servauth_value: all_words+;//?
dbs_simple_when_clause: (WHEN dbs_expression THEN (dbs_result_expression1 | NULL))+;
dbs_smallint: all_words+;//?
dbs_specific_name: SQL_IDENTIFIER;
dbs_sql_condition_name: literal+; //?
dbs_sql_control_statement: all_words+; //?
dbs_sql_parameter_name: all_words+; //?
dbs_sql_routine_body: all_words+;//?
dbs_sql_variable_name: all_words+; //?
dbs_sqlstate_string_constant: literal+; //?
dbs_statement_name: all_words+; //?
dbs_stogroup_name: SQL_IDENTIFIER;
dbs_string_constant: dbs_binary_string_constant | dbs_character_string_constant | dbs_graphic_string_constant;
dbs_string_expression: all_words+; //?
dbs_synonym: all_words+; //?
dbs_table_identifier: literal+; //?
dbs_table_name: SQL_IDENTIFIER;
dbs_table_reference: literal+; //?
dbs_table_space_name: all_words+;//
dbs_target_namespace: all_words+;//?
dbs_token_host_variable: all_words+; //?
dbs_transition_table_name: SQL_IDENTIFIER;
dbs_transition_variable_name: all_words+; //?
dbs_trigger_name: SQL_IDENTIFIER;
dbs_trigger_version_id: all_words+;//?
dbs_triggered_sql_statement: all_words+;//?;
dbs_type_name: ALPHANUMERIC_TEXT;
dbs_value: db2sql_data_value;
dbs_variable : ( dbs_host_variable | dbs_transition_variable_name | dbs_sql_variable_name | dbs_global_variable_name );
dbs_variable_name: SQL_IDENTIFIER;
dbs_version_id: VERSION_ID;
dbs_version_name: ALPHANUMERIC_TEXT | FILENAME;
dbs_view_name: SQL_IDENTIFIER;
dbs_volume_id: all_words+;//?
dbs_wlm_env_name: SQL_IDENTIFIER;
/////// End Variables /////////////
