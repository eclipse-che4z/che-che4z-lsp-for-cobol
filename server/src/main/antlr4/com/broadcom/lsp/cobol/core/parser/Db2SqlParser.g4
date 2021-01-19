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


@parser::members {
    private static final String MAXLENGHT_MSG = "Max length limit of %s bytes allowed for %s.";

    public void validateValue(String input, String value) {
      if(input!=null && !input.equals(value)) {
            notifyErrorListeners(input + " not allowed. It should be  " + value);
      }
    }

    public void validateLength(String input, String objectType, int validLength) {
      if(input!=null && input.length() > validLength) {
              notifyErrorListeners(String.format(MAXLENGHT_MSG, validLength, objectType));
      }
    }
}

allSqlRules: ((dbs_allocate | dbs_alter | dbs_associate | dbs_begin | dbs_call | dbs_close | dbs_comment | dbs_commit |
          dbs_connect | dbs_create | dbs_declare | dbs_delete | dbs_describe | dbs_drop | dbs_end | dbs_exchange |
          dbs_execute | dbs_explain | dbs_fetch | dbs_free | dbs_get | dbs_grant | dbs_hold | dbs_include | dbs_insert |
          dbs_label | dbs_lock | dbs_merge | dbs_open | dbs_prepare | dbs_refresh | dbs_release | dbs_rename |
          dbs_revoke | dbs_rollback | dbs_savepoint | dbs_select | dbs_set | dbs_signal | dbs_transfer | dbs_truncate |
          dbs_update | dbs_values | dbs_whenever) SEMICOLON_FS?)+;


/*ALLOCATE CURSOR */
dbs_allocate: ALLOCATE dbs_cursor_name CURSOR FOR RESULT SET dbs_rs_locator_variable;

/*ALTER (all) */
dbs_alter: ALTER (dbs_alter_database | dbs_alter_function | dbs_alter_index | dbs_alter_mask | dbs_alter_permission | dbs_alter_procedure | dbs_alter_sequence | dbs_alter_stogroup |
                 dbs_alter_table | dbs_alter_tablespace | dbs_alter_trigger | dbs_alter_trusted | dbs_alter_view);

/*ALTER DATABASE */
dbs_alter_database: DATABASE dbs_database_name (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | STOGROUP dbs_stogroup_name | CCSID dbs_ccsid_value)+;

/*ALTER FUNCTION */
dbs_alter_function: (dbs_alter_function_external | dbs_alter_function_compiled | dbs_alter_function_inline | dbs_alter_function_sqlTable);
dbs_alter_function_sqlTable : SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((common_built_in_type_source |
                              dbs_distinct_type_name) (COMMACHAR (common_built_in_type_source | dbs_distinct_type_name))*)? RPARENCHAR)?
                              RESTRICT dbs_alter_function_inlineopts;
dbs_alter_function_external: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((common_built_in_type_source |
                             dbs_distinct_type_name) (AS LOCATOR)? (COMMACHAR (common_built_in_type_source | dbs_distinct_type_name) (AS LOCATOR)?)*)? RPARENCHAR)?) dbs_alter_function_extopts;
dbs_alter_function_extopts: (EXTERNAL NAME (dbs_external_program_name | dbs_identifier) | LANGUAGE (ASSEMBLE| LANGUAGE_C |COBOL|JAVA|PLI) | PARAMETER STYLE (SQL|JAVA) | NOT? DETERMINISTIC |
                            (RETURNS NULL|CALLED) ON NULL INPUT | ((MODIFIES|READS) SQL DATA | (CONTAINS|NO) SQL) | NO? EXTERNAL ACTION | (PACKAGE PATH dbs_package_path | NO PACKAGE PATH) |
                            (NO SCRATCHPAD | SCRATCHPAD dbs_length) | NO? FINAL CALL | (ALLOW|DISALLOW) PARALLEL | NO? DBINFO | CARDINALITY dbs_integer | (NO COLLID | COLLID dbs_collection_id) | WLM ENVIRONMENT |
                            (dbs_name | LPARENCHAR dbs_name COMMACHAR ASTERISKCHAR RPARENCHAR) | ASUTIME (NO LIMIT | LIMIT dbs_integer) | STAY RESIDENT (YES|NO) | PROGRAM TYPE (SUB|MAIN) |
                            SECURITY (DB2|USER|DEFINER) | (STOP AFTER (SYSTEM DEFAULT|dbs_integer) FAILURES | CONTINUE AFTER FAILURE) | RUN OPTIONS  dbs_run_time_options | (INHERIT|DEFAULT) SPECIAL REGISTERS |
                            STATIC DISPATCH | NOT? SECURED)+; /*random ordering req */
dbs_alter_function_compiled: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR (dbs_generic_name (common_built_in_type_source | XML | data_type_arr_or_distinct) (COMMACHAR dbs_generic_name (common_built_in_type_source |
                             XML | data_type_arr_or_distinct))*)? RPARENCHAR)?) (dbs_alter_function_alter | dbs_alter_function_replace | dbs_alter_function_add | dbs_alter_function_activate | dbs_alter_function_regen | dbs_alter_function_drop);
dbs_alter_function_alter: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id) dbs_alter_function_compopts;
dbs_alter_function_replace: REPLACE (ACTIVE VERSION | VERSION dbs_routine_version_id) dbs_alter_function_routine;
dbs_alter_function_add: ADD VERSION dbs_routine_version_id dbs_alter_function_routine;
dbs_alter_function_activate: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_function_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id) (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;
dbs_alter_function_drop: DROP VERSION dbs_routine_version_id;
dbs_alter_function_routine: LPARENCHAR (dbs_parameter_name (common_built_in_type_source | data_type_arr_or_distinct) (COMMACHAR (common_built_in_type_source | data_type_arr_or_distinct))*)?
                            RPARENCHAR RETURNS common_built_in_type_source dbs_alter_function_compopts? dbs_sql_control_statement;
dbs_alter_function_compopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | ((READS|MODIFIES) SQL DATA | CONTAINS SQL) | (CALLED|RETURNS NULL) ON NULL INPUT | STATIC DISPATCH | (ALLOW|DISALLOW) PARALLEL |
                             (DISALLOW|ALLOW|DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | (INHERIT|DEFAULT) SPECIAL REGISTERS |
                             WLM ENVIRONMENT FOR DEBUG MODE dbs_name | CURRENT DATA (YES|NO) | option_degree | CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) |
                             DYNAMICRULES (RUN|BIND|DEFINEBIND|DEFINERUN|INVOKEBIND|INVOKERUN) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) | (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE |
                             ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SESSION? USER | SYSTEM PATH) (COMMACHAR (dbs_schema_name | SESSION? USER | SYSTEM PATH))* |
                             QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) | ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) |
                             VALIDATE (RUN|BIND) | ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                             NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | (OFF | CONCENTRATE STATEMENTS (WITH LITERALS)?))+; /*random ordering req*/
dbs_alter_function_inline: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((common_built_in_type_source | XML | dbs_distinct_type_name) (COMMACHAR (common_built_in_type_source |
                            XML | dbs_distinct_type_name))*)? RPARENCHAR)?) dbs_alter_function_inlineopts; /*this is for both "inlined SQL scalar" and "SQL table" as they are basically identical - only two extra options in "table" */
dbs_alter_function_inlineopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | (CONTAINS SQL|READS SQL DATA) | STATIC DISPATCH | CALLED ON NULL INPUT | NOT? SECURED | INHERIT SPECIAL REGISTERS | CARDINALITY dbs_integer)+; /*random ordering req */

/*ALTER INDEX */
dbs_alter_index: INDEX dbs_index_name (REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)? /*included as a separate piped option due to nb 2 in IBM doc*/ |
                 (BUFFERPOOL dbs_bp_name | CLOSE (YES|NO) | COPY (YES|NO) | DSSIZE dbs_integer G_CHAR | PIECESIZE dbs_pieceSize | dbs_alter_index_using | dbs_alter_index_free |
                 dbs_alter_index_gbpcache | NOT? CLUSTER | NOT? PADDED | COMPRESS (YES|NO) | dbs_alter_index_add)+ dbs_alter_index_alter?);
dbs_alter_index_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) dbs_integer | ERASE (YES|NO))+;
dbs_alter_index_free: (FREEPAGE dbs_integer (PCTFREE dbs_integer)? | PCTFREE dbs_integer (FREEPAGE dbs_integer)?);
dbs_alter_index_gbpcache: GBPCACHE (CHANGED | ALL | NONE);
dbs_alter_index_add: ADD (COLUMN LPARENCHAR dbs_column_name (ASC | DESC | RANDOM)? RPARENCHAR | INCLUDE COLUMN LPARENCHAR dbs_column_name RPARENCHAR);
dbs_alter_index_alter: dbs_alter_index_loop (COMMACHAR dbs_alter_index_loop)*;
dbs_alter_index_loop: ALTER PARTITION dbs_integer dbs_alter_index_ending? (dbs_alter_index_using | dbs_alter_index_free | dbs_alter_index_gbpcache | DSSIZE dbs_integer G_CHAR)*;
dbs_alter_index_ending:  ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?;

/*ALTER MASK */
dbs_alter_mask: MASK dbs_mask_name (ENABLE | DISABLE | REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?);

/*ALTER PERMISSION */
dbs_alter_permission: PERMISSION dbs_permission_name (ENABLE | DISABLE | REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?);

/*ALTER PROCEDURE */
dbs_alter_procedure: PROCEDURE dbs_procedure_name (dbs_alter_procedure_external | dbs_alter_procedure_alter | dbs_alter_procedure_replace | dbs_alter_procedure_add | dbs_alter_procedure_activate | dbs_alter_procedure_regen | dbs_alter_procedure_drop);
dbs_alter_procedure_external: (DYNAMIC RESULT SETS dbs_integer | EXTERNAL NAME (dbs_external_program_name | dbs_identifier) | LANGUAGE (ASSEMBLE | LANGUAGE_C | COBOL | JAVA | PLI | REXX) | PARAMETER STYLE (SQL |
                              GENERAL (WITH NULLS)? | JAVA) | NOT? DETERMINISTIC | (PACKAGE PATH dbs_package_path | NO PACKAGE PATH) | ((MODIFIES|READS) SQL DATA | (CONTAINS|NO) SQL) | NO? DBINFO | (NO COLLID |
                              COLLID dbs_collection_id) | WLM ENVIRONMENT (dbs_name | LPARENCHAR dbs_name COMMACHAR ASTERISKCHAR RPARENCHAR) | ASUTIME (NO LIMIT | LIMIT dbs_integer) | STAY RESIDENT (YES|NO) |
                              PROGRAM TYPE (SUB|MAIN) | SECURITY (DB2|USER|DEFINER) | RUN OPTIONS dbs_run_time_options | COMMIT ON RETURN (YES|NO) | (INHERIT|DEFAULT) SPECIAL REGISTERS | CALLED ON NULL INPUT |
                              (STOP AFTER (SYSTEM DEFAULT|dbs_integer) FAILURES | CONTINUE AFTER FAILURE) | (DISALLOW|ALLOW|DISABLE) DEBUG MODE)+; /*random ordering req */
dbs_alter_procedure_alter: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id)? dbs_alter_procedure_options;
dbs_alter_procedure_options: (NOT? DETERMINISTIC | ((MODIFIES|READS) SQL DATA | CONTAINS SQL) | CALLED ON NULL INPUT | DYNAMIC RESULT SETS dbs_integer | (DISALLOW|ALLOW|DISABLE) DEBUG MODE |
                                PARAMETER CCSID (ASCII|EBCDIC|UNICODE) | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | ((COMMIT ON RETURN (YES|NO)) |
                                AUTONOMOUS) | (INHERIT|DEFAULT) SPECIAL REGISTERS | WLM ENVIRONMENT FOR DEBUG MODE dbs_name | (DEFER|NODEFER) PREPARE | CURRENT DATA (YES|NO) | option_degree |
                                CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND|DEFINERUN|DEFINEBIND|INVOKERUN|INVOKEBIND) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) |
                                (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | (WITH|WITHOUT) KEEP DYNAMIC | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SYSTEM PATH |
                                SESSION? USER) (COMMACHAR (dbs_schema_name | SYSTEM PATH | SESSION? USER))* | RELEASE AT (COMMIT | DEALLOCATE) | QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) |
                                ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) | VALIDATE (RUN|BIND) |
                                ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                                DECIMAL LPARENCHAR (dbs_integer15 | dbs_integer31) (COMMACHAR dbs_s)? | FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) |
                                ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | CONCENTRATE STATEMENTS (OFF|WITH LITERALS))*; /*random ordering req */
dbs_alter_procedure_replace: REPLACE (ACTIVE VERSION | VERSION dbs_routine_version_id)? (LPARENCHAR dbs_alter_procedure_paramdec (COMMACHAR dbs_alter_procedure_paramdec)* RPARENCHAR)? dbs_alter_procedure_options dbs_sql_procedure_statement;
dbs_alter_procedure_paramdec: (IN|OUT|INOUT)? dbs_parameter_name (dbs_alter_procedure_bit | data_type_arr_or_distinct);
dbs_alter_procedure_bit: (dbs_alter_procedure_bit_int | dbs_alter_procedure_bit_decimal | dbs_alter_procedure_bit_float | dbs_alter_procedure_bit_decfloat | dbs_alter_procedure_bit_char | dbs_alter_procedure_bit_clob |
                            dbs_alter_procedure_bit_varchar | dbs_alter_procedure_bit_graphic | dbs_alter_procedure_bit_binary | DATE | TIME | dbs_alter_procedure_bit_timestamp | XML);
dbs_alter_procedure_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_procedure_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_alter_procedure_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_procedure_bit_decfloat: DECFLOAT (LPARENCHAR (dbs_integer34 | dbs_integer16) RPARENCHAR)?;
dbs_alter_procedure_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_procedure_bit_varchara | LARGE OBJECT dbs_alter_procedure_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_alter_procedure_bit_charopts);
dbs_alter_procedure_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA)? (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_varchar: VARCHAR dbs_alter_procedure_bit_varchara;
dbs_alter_procedure_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_alter_procedure_bit_charopts;
dbs_alter_procedure_bit_clob: CLOB dbs_alter_procedure_bit_cloba;
dbs_alter_procedure_bit_cloba: (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)? (FOR (SBCS | MIXED ) DATA)? (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?) (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?);
dbs_alter_procedure_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? option_timezone?;
dbs_alter_procedure_add: ADD VERSION dbs_routine_version_id (LPARENCHAR dbs_alter_procedure_paramdec (COMMACHAR dbs_alter_procedure_paramdec)* RPARENCHAR)? dbs_alter_procedure_options dbs_sql_procedure_statement;
dbs_alter_procedure_activate: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_procedure_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id)? (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;
dbs_alter_procedure_drop: DROP VERSION dbs_routine_version_id;

/*ALTER SEQUENCE */
dbs_alter_sequence: SEQUENCE dbs_sequence_name dbs_alter_sequence_loop (COMMACHAR? dbs_alter_sequence_loop)*;
dbs_alter_sequence_loop: (RESTART (WITH dbs_numeric_constant)? | (INCREMENT BY|MINVALUE|MAXVALUE) dbs_numeric_constant | NO (MINVALUE|MAXVALUE) | NO? (CYCLE|ORDER) | NO CACHE | CACHE dbs_integer_constant);

/*ALTER STOGROUP */
dbs_alter_stogroup: STOGROUP dbs_stogroup_name (NO KEY LABEL | KEY LABEL dbs_key_label_name | (ADD|REMOVE) VOLUMES LPARENCHAR (dbs_volume_id (COMMACHAR dbs_volume_id)* |
                    SINGLEQUOTE ASTERISKCHAR SINGLEQUOTE (COMMACHAR SINGLEQUOTE ASTERISKCHAR SINGLEQUOTE)*) RPARENCHAR)+ (DATACLAS dbs_dc_name)? (MGMTCLAS dbs_mc_name)? (STORCLAS dbs_sc_name)?;//*ALTER TABLE */
dbs_alter_table: TABLE dbs_table_name (dbs_alter_table_add | dbs_alter_table_alter | dbs_alter_table_rename | dbs_alter_table_drop | dbs_alter_table_rotate | DATA CAPTURE (NONE|CHANGES) | NOT? VOLATILE CARDINALITY? |
                (ACTIVATE|DEACTIVATE) (ROW|COLUMN) ACCESS CONTROL | APPEND (NO|YES) | AUDIT (NONE|CHANGES|ALL) | VALIDPROC (dbs_program_name | NULL) | ENABLE ARCHIVE USE dbs_table_name | DISABLE ARCHIVE | NO KEY LABEL | KEY LABEL dbs_key_label_name)+;
dbs_alter_table_add: ADD (COLUMN? dbs_alter_table_coldef | dbs_alter_table_unique | dbs_alter_table_check | PARTITION (BY dbs_alter_table_partitioning | dbs_alter_table_partition)? |
                     SYSTEM? VERSIONING USE HISTORY TABLE dbs_history_table_name (ON DELETE ADD EXTRA ROW)? | (MATERIALIZED? QUERY)? dbs_alter_table_mq | CLONE dbs_clone_table_name | RESTRICT ON DROP) | ADD? dbs_alter_table_referential;
dbs_alter_table_coldef: dbs_column_name (dbs_distinct_type_name | dbs_alter_table_bit)? (dbs_alter_table_defclause | NOT NULL | dbs_alter_table_check | common_reference_clause | dbs_alter_table_generated |
                        IMPLICITLY HIDDENCHAR | AS SECURITY LABEL | FIELDPROC dbs_program_name (LPARENCHAR dbs_constant (COMMACHAR dbs_constant)* RPARENCHAR)? | INLINE LENGTH dbs_integer)*;
dbs_alter_table_bit: (dbs_alter_table_bit_int | dbs_alter_table_bit_decimal | dbs_alter_table_bit_float | dbs_alter_table_bit_decfloat | dbs_alter_table_bit_char | dbs_alter_table_bit_clob | dbs_alter_table_bit_varchar |
                     dbs_alter_table_bit_graphic | dbs_alter_table_bit_binary | DATE | TIME | dbs_alter_table_bit_timestamp | ROWID | dbs_alter_table_bit_xml);
dbs_alter_table_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_table_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR dbs_integer (COMMACHAR dbs_integer)? RPARENCHAR)?;
dbs_alter_table_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_table_bit_decfloat: DECFLOAT (LPARENCHAR (dbs_integer34 | dbs_integer16) RPARENCHAR)?;
dbs_alter_table_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_table_bit_varchara | LARGE OBJECT dbs_alter_table_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR dbs_alter_table_bit_charopts);
dbs_alter_table_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA | CCSID dbs_integer1208)?;
dbs_alter_table_bit_varchar: VARCHAR dbs_alter_table_bit_varchara;
dbs_alter_table_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_alter_table_bit_charopts;
dbs_alter_table_bit_clob: CLOB dbs_alter_table_bit_cloba;
dbs_alter_table_bit_cloba: (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)? dbs_alter_table_bit_charopts;
dbs_alter_table_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?) (CCSID dbs_integer1200)?;
dbs_alter_table_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?);
dbs_alter_table_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? option_timezone?;
dbs_alter_table_bit_xml: XML (LPARENCHAR XMLSCHEMA dbs_alter_table_bit_xmlspec (ELEMENT dbs_element_name)? (COMMACHAR dbs_alter_table_bit_xmlspec (ELEMENT dbs_element_name)?)* RPARENCHAR)?;
dbs_alter_table_bit_xmlspec: (ID dbs_registered_xml_schema_name | (URL dbs_target_namespace | NO NAMESPACE) (LOCATION dbs_schema_location)?);
dbs_alter_table_defclause: WITH? DEFAULT (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL | dbs_cast_function_name LPARENCHAR (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL) RPARENCHAR)?;
dbs_alter_table_check: (CONSTRAINT dbs_constraint_name)? CHECK LPARENCHAR dbs_search_condition RPARENCHAR;
common_reference_clause: REFERENCES dbs_table_name (LPARENCHAR dbs_column_name (PERIOD BUSINESS_TIME)? (COMMACHAR dbs_column_name (PERIOD BUSINESS_TIME)?)* RPARENCHAR)? (ON DELETE (RESTRICT | NO ACTION | CASCADE |
                            SET NULL))? (NOT? ENFORCED)? (ENABLE QUERY OPTIMIZATION)?;
dbs_alter_table_generated: GENERATED ((ALWAYS | BY DEFAULT)? (common_as_identity_clause | FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP)? | ALWAYS? (AS TRANSACTION START ID |
                            AS ROW (BEGIN|START|END) | AS LPARENCHAR dbs_non_deterministic_expression RPARENCHAR)?);
common_as_identity_clause: AS IDENTITY (LPARENCHAR dbs_alter_table_asid_loop (COMMACHAR? dbs_alter_table_asid_loop)* RPARENCHAR)?;
dbs_alter_table_asid_loop: (START WITH dbs_numeric_constant | INCREMENT BY dbs_numeric_constant | NO MINVALUE | MINVALUE dbs_numeric_constant | NO? CYCLE | NO CACHE | CACHE dbs_numeric_constant | NO? ORDER);
dbs_alter_table_unique: (CONSTRAINT dbs_constraint_name)? (PRIMARY KEY | UNIQUE) LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* (COMMACHAR BUSINESS_TIME WITHOUT OVERLAPS)? RPARENCHAR;
dbs_alter_table_referential: (CONSTRAINT dbs_constraint_name)? FOREIGN KEY LPARENCHAR dbs_column_name (PERIOD BUSINESS_TIME)? (COMMACHAR dbs_column_name (PERIOD BUSINESS_TIME)?)* RPARENCHAR common_reference_clause;
dbs_alter_table_partitioning: RANGE? LPARENCHAR dbs_column_name (NULLS LAST)? (ASC|DESC)? (COMMACHAR dbs_column_name (NULLS LAST)? (ASC|DESC)?)* RPARENCHAR
                              LPARENCHAR dbs_alter_table_partition (COMMACHAR dbs_alter_table_partition)* RPARENCHAR;
dbs_alter_table_partition: PARTITION dbs_integer ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?;
dbs_alter_table_mq: LPARENCHAR dbs_fullselect RPARENCHAR DATA INITIALLY DEFERRED REFRESH DEFERRED (MAINTAINED BY (SYSTEM|USER) ((ENABLE|DISABLE) QUERY OPTIMIZATION)? |
                    (ENABLE|DISABLE) QUERY OPTIMIZATION (MAINTAINED BY (SYSTEM|USER))?);
dbs_alter_table_alter: ALTER (COLUMN? dbs_alter_table_colalt | PARTITION dbs_integer dbs_alter_table_partition | MATERIALIZED? QUERY dbs_alter_table_mq);
dbs_alter_table_colalt: dbs_column_name (DROP DEFAULT | SET (DATA TYPE dbs_alter_table_bit (INLINE LENGTH dbs_integer)? | dbs_alter_table_defclause | INLINE LENGTH dbs_integer | dbs_alter_table_idalt |
                        GENERATED ((ALWAYS | BY DEFAULT) dbs_alter_table_idalt? | ALWAYS? (AS TRANSACTION START ID | AS ROW (BEGIN|START|END)))));
dbs_alter_table_idalt: (RESTART (WITH dbs_numeric_constant)? | SET (INCREMENT BY dbs_numeric_constant | NO MINVALUE | MINVALUE dbs_numeric_constant | NO? CYCLE | NO CACHE | CACHE dbs_integer_constant | NO? ORDER))+;
dbs_alter_table_rename: RENAME COLUMN dbs_column_name TO dbs_column_name;
dbs_alter_table_drop: DROP (COLUMN? dbs_column_name RESTRICT | PRIMARY KEY | (UNIQUE|FOREIGN KEY|CHECK|CONSTRAINT) dbs_constraint_name | SYSTEM? VERSIONING | MATERIALIZED? QUERY | CLONE | RESTRICT ON DROP);
dbs_alter_table_rotate: ROTATE PARTITION (FIRST | dbs_integer) TO LAST ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (COMMACHAR (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE? RESET;

/*ALTER TABLESPACE */
dbs_alter_tablespace: TABLESPACE dbs_database_name? dbs_table_space_name (DROP PENDING CHANGES | DSSIZE dbs_integer G_CHAR | SEGSIZE dbs_integer | PAGENUM RELATIVE |
                      dbs_alter_tablespace_move /*these first five are piped separately from the big loop due to note 1 in IBM doc*/ | (BUFFERPOOL dbs_bp_name | CCSID dbs_ccsid_value | CLOSE (YES|NO) | COMPRESS (YES|NO) |
                      INSERT ALGORITHM dbs_level | LOCKMAX (SYSTEM | dbs_integer) | LOCKSIZE (ANY | TABLESPACE | TABLE | PAGE | ROW | LOB) | NOT? LOGGED | MAXROWS dbs_integer | MAXPARTITIONS dbs_integer |
                      MEMBER CLUSTER (YES|NO) | TRACKMOD (YES|NO) | dbs_alter_tablespace_using | dbs_alter_tablespace_free | dbs_alter_tablespace_gbpcache)+) dbs_alter_tablespace_alter?;

dbs_alter_tablespace_move: MOVE TABLE dbs_table_name TO TABLESPACE (dbs_database_name DOT)? dbs_table_space_name;
dbs_alter_tablespace_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) dbs_integer | ERASE (YES|NO))+;
dbs_alter_tablespace_free: (FREEPAGE dbs_integer | PCTFREE dbs_smallint? (FOR UPDATE dbs_smallint)?)+;
dbs_alter_tablespace_gbpcache: GBPCACHE (CHANGED | ALL | SYSTEM | NONE);
dbs_alter_tablespace_alter: (ALTER PARTITION dbs_integer dbs_alter_tablespace_loop)+;
dbs_alter_tablespace_loop: (dbs_alter_tablespace_using | dbs_alter_tablespace_free | dbs_alter_tablespace_gbpcache | COMPRESS (YES|NO) | DSSIZE dbs_integer G_CHAR | TRACKMOD (YES|NO))+;

/*ALTER TRIGGER */
dbs_alter_trigger: TRIGGER dbs_trigger_name (dbs_alter_trigger_alter | dbs_alter_trigger_replace? | dbs_alter_trigger_add | dbs_alter_trigger_activate | dbs_alter_trigger_regen | dbs_alter_trigger_drop?);
dbs_alter_trigger_alter: ALTER? (ACTIVE VERSION | VERSION dbs_trigger_version_id)? dbs_alter_trigger_options;
dbs_alter_trigger_options: ((DISALLOW | ALLOW | DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | ASUTIME (NO LIMIT | LIMIT dbs_integer) | WLM ENVIRONMENT FOR DEBUG MODE dbs_name | CURRENT DATA (YES|NO) |
                            CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND) | APPLICATION ENCODING SCHEME oneof_encoding | (WITH|WITHOUT) EXPLAIN |
                            (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE | dbs_string_constant) | SQL PATH (SYSTEM PATH | SESSION? USER | dbs_schema_name) (COMMACHAR (SYSTEM PATH |
                            SESSION? USER | dbs_schema_name))* | RELEASE AT (COMMIT|DEALLOCATE) | ROUNDING (DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN |
                            DEC_ROUND_HALF_UP | DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) | DECIMAL LPARENCHAR (dbs_integer15 | dbs_integer31) (COMMACHAR dbs_s)? RPARENCHAR | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                            FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value |
                            CONCENTRATE STATEMENTS (OFF | WITH LITERALS))*; /*random ordering req */
dbs_alter_trigger_replace: REPLACE (ACTIVE VERSION | VERSION dbs_trigger_version_id)? dbs_alter_trigger_spec;
dbs_alter_trigger_spec: ((NO CASCADE)? BEFORE | AFTER | INSTEAD OF) (INSERT | DELETE | UPDATE (OF dbs_column_name (COMMACHAR dbs_column_name)*)?) ON (dbs_table_name | dbs_view_name)
                        (REFERENCING ((OLD|NEW) ROW? AS? dbs_correlation_name | (OLD_TABLE | NEW_TABLE) AS? dbs_table_identifier)+)? (FOR EACH (STATEMENT|ROW))? dbs_alter_trigger_options
                        (WHEN LPARENCHAR dbs_search_condition RPARENCHAR)? (dbs_sql_control_statement | dbs_triggered_sql_statement);
dbs_alter_trigger_add: ADD VERSION dbs_trigger_version_id dbs_alter_trigger_spec;
dbs_alter_trigger_activate: ACTIVATE VERSION dbs_trigger_version_id;
dbs_alter_trigger_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_trigger_version_id)? (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;
dbs_alter_trigger_drop: DROP VERSION dbs_trigger_version_id;

/*ALTER TRUSTED CONTEXT */
dbs_alter_trusted: TRUSTED CONTEXT dbs_context_name (dbs_alter_trusted_alter | dbs_alter_trusted_add | dbs_alter_trusted_drop | dbs_alter_trusted_replace)+;
dbs_alter_trusted_alter: (ALTER (SYSTEM AUTHID dbs_authorization_name | NO DEFAULT ROLE | DEFAULT ROLE dbs_role_name (WITHOUT ROLE AS OBJECT OWNER | WITH ROLE AS OBJECT OWNER AND QUALIFIER)? |
                         NO DEFAULT SECURITY LABEL | DEFAULT SECURITY LABEL dbs_seclabel_name | ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value RPARENCHAR | (ADDRESS dbs_address_value |
                         ENCRYPTION dbs_encryption_value | SERVAUTH dbs_servauth_value) (COMMACHAR (ADDRESS dbs_address_value | ENCRYPTION dbs_encryption_value | SERVAUTH dbs_servauth_value))* RPARENCHAR))| ALTER? (ENABLE |DISABLE))+;
dbs_alter_trusted_add: ADD (dbs_alter_trusted_add_attributes | dbs_alter_trusted_add_use);
dbs_alter_trusted_add_attributes: ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value RPARENCHAR | (ADDRESS dbs_address_value |
                                    SERVAUTH dbs_servauth_value) (COMMACHAR (ADDRESS dbs_address_value | SERVAUTH dbs_servauth_value))* RPARENCHAR);
dbs_alter_trusted_add_use: USE FOR dbs_alter_trusted_useloop (COMMACHAR dbs_alter_trusted_useloop)*;
dbs_alter_trusted_useloop: (dbs_authorization_name dbs_alter_trusted_useopts | EXTERNAL SECURITY PROFILE dbs_profile_name dbs_alter_trusted_useopts | PUBLIC (WITH | WITHOUT) AUTHENTICATION);
dbs_alter_trusted_useopts: (ROLE dbs_role_name)? (SECURITY LABEL dbs_seclabel_name)? ((WITH|WITHOUT) AUTHENTICATION)?;
dbs_alter_trusted_drop: DROP (dbs_alter_trusted_drop_attributes | dbs_alter_trusted_drop_use);
dbs_alter_trusted_drop_attributes: ATTRIBUTES LPARENCHAR (JOBNAME dbs_jobname_value? RPARENCHAR | (ADDRESS dbs_address_value? | SERVAUTH dbs_servauth_value?) (COMMACHAR (ADDRESS dbs_address_value? |
                                    SERVAUTH dbs_servauth_value?))* RPARENCHAR);
dbs_alter_trusted_drop_use: USE FOR (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC) (COMMACHAR (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC))*;
dbs_alter_trusted_replace: REPLACE dbs_alter_trusted_add_use;

/*ALTER VIEW */
dbs_alter_view: VIEW dbs_view_name REGENERATE (USING APPLICATION COMPATIBILITY dbs_applcompat_value)?;

/*ASSOCIATE LOCATORS */
dbs_associate: ASSOCIATE (RESULT SET)? (LOCATOR | LOCATORS) LPARENCHAR dbs_rs_locator_variable (COMMACHAR dbs_rs_locator_variable)* RPARENCHAR
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
dbs_comment_column: COLUMN (dbs_table_name | dbs_view_name) DOT dbs_column_name;
dbs_comment_function: dbs_comment_function_designator (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_function_designator: (FUNCTION dbs_function_name (LPARENCHAR dbs_comment_parameter_type
                                 (COMMACHAR dbs_comment_parameter_type)* RPARENCHAR)? | SPECIFIC FUNCTION dbs_specific_name);
dbs_comment_parameter_type: (common_built_in_type_source | data_type_arr_or_distinct) (AS LOCATOR)?;
dbs_comment_index: INDEX dbs_index_name;
dbs_comment_package: dbs_collection_id_package_name (VERSION? dbs_version_id)?;
dbs_comment_plan: PLAN dbs_plan_name;
dbs_comment_procedure: PROCEDURE dbs_procedure_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_role: ROLE dbs_role_name;
dbs_comment_sequence: SEQUENCE dbs_sequence_name;
dbs_comment_table: TABLE (dbs_table_name | dbs_view_name);
dbs_comment_trigger: TRIGGER dbs_trigger_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_trusted: TRUSTED CONTEXT dbs_context NONNUMERICLITERAL;
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
dbs_create: CREATE (dbs_create_alias | dbs_create_aux_table | dbs_create_db | dbs_create_function | dbs_create_global_temp_table | dbs_create_index | dbs_create_lob_tablespace | dbs_create_mask |
            dbs_create_permission |  dbs_create_procedure_ext | dbs_create_procedure_native_sql | dbs_create_role |
            dbs_create_sequence | dbs_create_stogroup | dbs_create_table | dbs_create_tablespace | dbs_create_trigger_advanced |
            dbs_create_trigger_basic | dbs_create_trusted_context | dbs_create_type_array | dbs_create_type_distinct |
            dbs_create_variable | dbs_create_view);

//CREATE ALIAS
dbs_create_alias: PUBLIC? ALIAS (table_alias | sequence_alias);
table_alias: dbs_alias_name FOR TABLE? (dbs_table_name | dbs_view_name | dbs_alias_name);
sequence_alias: dbs_alias_name FOR SEQUENCE dbs_sequence_name;

//CREATE AUX TABLE
dbs_create_aux_table: (AUXILIARY | AUX) TABLE dbs_table_name IN dbs_database_name? dbs_table_space_name
                    STORES dbs_table_name (APPEND (YES|NO))? COLUMN dbs_column_name (PART dbs_integer)?;
//CREATE DB
dbs_create_db: DATABASE dbs_database_name (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | AS WORKFILE (FOR dbs_member_name)? | STOGROUP (SYSDEFLT | dbs_stogroup_name) | CCSID oneof_encoding)*;//1 same clause must not be specified more than one time

//CREATE FUNCTION (ALL)
dbs_create_function: FUNCTION dbs_function_name LPARENCHAR (dbs_create_function_compiled_scalar | dbs_create_function_ext_scalar | dbs_create_function_ext_table |
                                dbs_create_function_inline_scalar | dbs_create_function_sourced | dbs_create_function_sql_table);

//CREATE COMPILED SQL SCALAR FUNCTION
dbs_create_function_compiled_scalar: (dbs_create_function_param_decl
        (COMMACHAR dbs_create_function_param_decl)*)? RPARENCHAR (dbs_create_function_func_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_param_decl: dbs_parameter_name dbs_create_function_param_type;
dbs_create_function_param_type: data_type | (TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR);
dbs_create_function_func_def: RETURNS common_built_in_type (VERSION dbs_routine_version_id)? dbs_option_list? dbs_control_statement;

//CREATE EXTERNAL SQL SCALAR FUNCTION
dbs_create_function_ext_scalar: (function_param_decl (COMMACHAR function_param_decl)*)? RPARENCHAR
                            RETURNS (common_built_in_type_source (AS LOCATOR)?  | common_built_in_type_source CAST FROM common_built_in_type_source (AS LOCATOR)?) dbs_option_list_ext;
function_param_decl: dbs_parameter_name? (ext_data_type (AS LOCATOR)? | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR);
ext_data_type: common_built_in_type_source | dbs_distinct_type_name;

//CREATE EXTERNAL TABLE FUNCTION
dbs_create_function_ext_table: (function_param_decl (COMMACHAR function_param_decl)*)? RPARENCHAR
                            RETURNS (dbs_create_function_ext_table_desc  | GENERIC TABLE) dbs_option_list_ext_table;
dbs_create_function_ext_table_desc: TABLE LPARENCHAR dbs_create_function_ext_table_body  (COMMACHAR  dbs_create_function_ext_table_body)* RPARENCHAR;
dbs_create_function_ext_table_body: dbs_column_name common_built_in_type (AS LOCATOR)?;

//CREATE INLINE SQL SCALAR FUNCTION
dbs_create_function_inline_scalar: (function_param_decl (COMMACHAR function_param_decl)*)? RPARENCHAR
                                 (dbs_create_function_func_inl_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_func_inl_def: RETURNS common_built_in_type (LANGUAGE SQL)? dbs_option_list_inl_def dbs_create_function_func_inl_sql_routine;
dbs_create_function_func_inl_sql_routine: RETURN dbs_control_statement;

//CREATE SOURCED FUNCTION
dbs_create_function_sourced: (dbs_create_function_sourced_param_decl (COMMACHAR dbs_create_function_sourced_param_decl)*)? RPARENCHAR
                             RETURNS (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)? (SPECIFIC dbs_specific_name)? (PARAMETER CCSID oneof_encoding)?
                             SOURCE (dbs_function_name (LPARENCHAR (dbs_create_function_sourced_param_type (COMMACHAR dbs_create_function_sourced_param_type)*)? RPARENCHAR)? | SPECIFIC dbs_specific_name);
dbs_create_function_sourced_param_decl: (dbs_parameter_name)? dbs_create_function_sourced_param_type;
dbs_create_function_sourced_param_type: (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)?  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR;

//CREATE FUNCTION - SQL TABLE
dbs_create_function_sql_table: (dbs_create_function_sql_table_param_decl (COMMACHAR dbs_create_function_sql_table_param_decl)*)? RPARENCHAR
                                                             (dbs_create_function_sql_func_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_sql_table_param_decl: (dbs_parameter_name)? dbs_create_function_sql_table_param_type;
dbs_create_function_sql_table_param_type: (common_built_in_type | dbs_distinct_type_name)  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR;
dbs_create_function_sql_func_def: RETURNS TABLE LPARENCHAR  dbs_column_name common_built_in_type (COMMACHAR dbs_column_name common_built_in_type)* RPARENCHAR dbs_option_list_inl_def dbs_create_function_func_sql_routine;
dbs_create_function_func_sql_routine: RETURN dbs_control_statement | BEGIN ATOMIC RETURN dbs_control_statement END;

//CREATE GLOBAL TEMP TABLE
dbs_create_global_temp_table: GLOBAL TEMPORARY TABLE  dbs_table_name LPARENCHAR (dbs_create_global_temp_table_col_def (COMMACHAR dbs_create_global_temp_table_col_def)*) RPARENCHAR | LIKE (dbs_table_name | dbs_view_name)
                                (CCSID oneof_encoding)?;
dbs_create_global_temp_table_col_def: dbs_column_name  common_built_in_type4 (NOT NULL)?;

//CREATE INDEX
dbs_create_index: (UNIQUE (WHERE NOT NULL)?)? INDEX dbs_index_name ON (dbs_create_index_table_def | dbs_aux_table_name)  dbs_create_index_table_other_opt;
dbs_create_index_table_def: dbs_table_name LPARENCHAR dbs_create_index_table_def_body (COMMACHAR dbs_create_index_table_def_body)* (COMMACHAR BUSINESS_TIME  without_or_with OVERLAPS )? RPARENCHAR;
dbs_create_index_table_def_body: (dbs_column_name | dbs_expression) (ASC | DESC | RANDOM)?;
dbs_create_index_table_other_opt: xml_index_specification? (INCLUDE dbs_column_name LPARENCHAR (COMMACHAR dbs_column_name)* RPARENCHAR)? other_opt_part1 other_opt_part2 other_opt_part3;
xml_index_specification: GENERATE (KEY | KEYS) USING XMLPATTERN xml_pattern_clause AS sql_data_type;
xml_pattern_clause: prolog pattern_expression;
prolog: (DECLARE NAMESPACE NCNAME  EQUALCHAR dbs_namespace_name SEMICOLON_FS | DECLARE DEFAULT ELEMENT NAMESPACE dbs_namespace_name SEMICOLON_FS)*;
pattern_expression: ( (SLASHCHAR | DOUBLESLASHCHAR)  )*;
other_opt_part1: (NOT? CLUSTER | PARTITIONED | NOT? PADDED | using_specification | free_specification | gbpcache_specification | DEFINE yes_or_no |  COMPRESS yes_or_no | (INCLUDE | EXCLUDE) NULL KEYS)*;
other_opt_part2: (PARTITION BY (RANGE)? LPARENCHAR (partition_using_specification (COMMACHAR  partition_using_specification)*)? RPARENCHAR)?;
other_opt_part3: (BUFFERPOOL dbs_bp_name | CLOSE yes_or_no | DEFER no_or_yes | DSSIZE dbs_integer G_CHAR
               | PIECESIZE IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[MmGgKk]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in KB,MB or GB.");}}
               | COPY no_or_yes)*;
partition_using_specification: partition_element (using_specification | free_specification | gbpcache_specification | DSSIZE dbs_integer G_CHAR)*;
using_specification: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY dbs_integer? | SECQTY dbs_integer | ERASE yes_or_no?)*);
free_specification: (FREEPAGE dbs_integer (PCTFREE dbs_integer)? | PCTFREE  dbs_integer (FREEPAGE dbs_integer)?);
gbpcache_specification: GBPCACHE (CHANGED | ALL) | NONE;
partition_element: PARTITION dbs_integer (ENDING AT? partition_element_loop INCLUSIVE?)?;
partition_element_loop:  LPARENCHAR const_options (COMMACHAR const_options)*  RPARENCHAR;
const_options: dbs_string_constant | MAXVALUE | MINVALUE | INTEGERLITERAL;

//CREATE LOB TABLESPACE
dbs_create_lob_tablespace: LOB TABLESPACE dbs_table_space_name dbs_create_lob_tablespace_def;
dbs_create_lob_tablespace_def: (IN dbs_database_name | BUFFERPOOL dbs_bp_name | CLOSE yes_or_no | COMPRESS yes_or_no | DEFINE yes_or_no | DSSIZE dbs_integer G_CHAR | gbpcache_block |
                            LOCKMAX (SYSTEM | dbs_integer) | locksize_block | NOT? LOGGED | using_block)*; /*java fix */
gbpcache_block: GBPCACHE (CHANGED | ALL | SYSTEM | NONE);
locksize_block: LOCKSIZE (ANY | LOB);
using_block: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY dbs_integer | SECQTY dbs_integer | ERASE yes_or_no?)*);

//CREATE MASK
dbs_create_mask: MASK dbs_mask_name ON dbs_table_name (AS? dbs_correlation_name)? FOR COLUMN dbs_column_name RETURN dbs_case_expression (DISABLE | ENABLE)?;

//CREATE PERMISSION
dbs_create_permission: PERMISSION dbs_permission_name ON dbs_table_name (AS? dbs_correlation_name)? FOR ROWS WHERE dbs_search_condition ENFORCED FOR ALL ACCESS  (DISABLE | ENABLE)?;

//CREATE PROCEDURE - EXTERNAL
dbs_create_procedure_ext: (OR REPLACE)? PROCEDURE? dbs_procedure_name  (LPARENCHAR dbs_create_procedure_ext_pdecl (COMMACHAR dbs_create_procedure_ext_pdecl)* RPARENCHAR)? dbs_option_list_proc_ext;
dbs_create_procedure_ext_pdecl: (IN | OUT | INOUT)? dbs_parameter_name? dbs_create_procedure_ext_ptype;
dbs_create_procedure_ext_ptype:  (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)?  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR; //built-in-type change

//CCREATE PROCEDURE - NATIVE
dbs_create_procedure_native_sql: (OR REPLACE)? PROCEDURE dbs_procedure_name  (LPARENCHAR dbs_create_procedure_native_pdecl (COMMACHAR dbs_create_procedure_native_pdecl)* RPARENCHAR)?
                                    procedure_def | WRAPPED dbs_obfuscated_statement_text;
dbs_create_procedure_native_pdecl: (IN OUT INOUT)? (dbs_parameter_name) dbs_create_procedure_native_ptype;
dbs_create_procedure_native_ptype: data_type  | TABLE LIKE (dbs_table_name | dbs_view_name) AS LOCATOR;//built-in-type change
procedure_def: (VERSION dbs_routine_version_id)?  dbs_option_list_proc_native? dbs_sql_procedure_statement;

//CREATE ROLE
dbs_create_role: ROLE dbs_role_name;

//CREATE SEQUENCE
dbs_create_sequence: SEQUENCE dbs_sequence_name dbs_create_sequence_body*;
dbs_create_sequence_body: AS (INTEGER | dbs_distinct_type_name | common_bit_int | common_bit_decimal) | START WITH dbs_numeric_constant | INCREMENT BY dbs_numeric_constant |
                (NO MINVALUE | MINVALUE dbs_numeric_constant) | (NO MAXVALUE | MAXVALUE dbs_numeric_constant) | NO? CYCLE | (CACHE dbs_integer_constant | NO CACHE) | NO? ORDER;
//CREATE STOGROUP
dbs_create_stogroup: STOGROUP dbs_stogroup_name (VOLUMES LPARENCHAR dbs_volume_loop RPARENCHAR)? VCAT dbs_volume_cat;
dbs_volume_loop:  dbs_volume_id (COMMACHAR dbs_volume_id)* | ASTERISKCHAR (COMMACHAR ASTERISKCHAR)*;
dbs_volume_cat: dbs_catalog_name (DATACLAS dbs_dc_name)? (MGMTCLAS dbs_mc_name)? (STORCLAS dbs_sc_name)? (NO KEY LABEL | KEY LABEL dbs_key_label_name)?;

//CREATE SYNONYM deprecated, use CREATE ALIAS

//CREATE TABLE
dbs_create_table: TABLE dbs_table_name ( LPARENCHAR dbs_create_table_elements_def (COMMACHAR dbs_create_table_elements_def)* RPARENCHAR | LIKE (dbs_table_name | dbs_view_name) copy_options? |
    as_result_table copy_options? | materialized_query_def) dbs_create_table_data_def*;
dbs_create_table_elements_def: columnn_def | period_def | unique_constraint | referential_constraint | check_constraint;
columnn_def: dbs_column_name (common_built_in_type_core3 | dbs_distinct_type_name )? // Data type is optional if as-row-change-timestamp-clause is specified
             (NOT NULL | generated_clause | column_constraint | column_def_clause | FIELDPROC  dbs_program_name
             (LPARENCHAR dbs_constant (COMMACHAR dbs_constant)* RPARENCHAR)? |  AS SECURITY LABEL | IMPLICITLY HIDDENCHAR | INLINE LENGTH dbs_integer)*;//built-in-type change
column_def_clause : WITH? DEFAULT default_options?;
xml_type_modifier: XMLSCHEMA  xml_type_modifier_body (COMMACHAR xml_type_modifier_body)*;
xml_type_modifier_body: xml_schema_spec (ELEMENT dbs_element_name)?;
xml_schema_spec: ID dbs_registered_xml_schema_name | (URL dbs_target_namespace | NO NAMESPACE) (LOCATION dbs_schema_location)?;
generated_clause: GENERATED (ALWAYS | BY DEFAULT)?  (common_as_identity_clause | as_row_change_timestamp_clause)? | GENERATED  ALWAYS? (as_row_transaction_start_id_clause |
                    as_row_transaction_timestamp_clause |  as_generated_expression_clause);
as_row_change_timestamp_clause: FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP;
as_row_transaction_start_id_clause: AS TRANSACTION START ID;
as_row_transaction_timestamp_clause: AS ROW (BEGIN | START | END);
as_generated_expression_clause: AS LPARENCHAR non_deterministic_expression RPARENCHAR;
non_deterministic_expression: DATA CHANGE OPERATION | special_register | session_variable;
special_register: CURRENT CLIENT_ACCTNG | CURRENT CLIENT_APPLNAME | CURRENT CLIENT_CORR_TOKEN | CURRENT CLIENT_USERID | CURRENT CLIENT_WRKSTNNAME | CURRENT SERVER | CURRENT SQLID | SESSION_USER | USER;
session_variable: SYSIBM DOT (PACKAGE_NAME | PACKAGE_SCHEMA | PACKAGE_VERSION);
default_options: default_options_vals | dbs_cast_function_name LPARENCHAR default_options_vals RPARENCHAR;
default_options_vals: dbs_constant | (SESSION_USER | USER) | CURRENT | CURRENT SQLID | NULL;
column_constraint: CONSTRAINT dbs_constraint_name (PRIMARY KEY | UNIQUE | common_reference_clause | CHECK LPARENCHAR  dbs_search_condition RPARENCHAR)?;
period_def: PERIOD FOR? ( SYSTEM_TIME LPARENCHAR dbs_begin_column_name COMMACHAR dbs_end_column_name   RPARENCHAR |
            BUSINESS_TIME LPARENCHAR dbs_begin_column_name COMMACHAR dbs_end_column_name (EXCLUSIVE | INCLUSIVE)?  RPARENCHAR  );
unique_constraint: (CONSTRAINT dbs_constraint_name)? (PRIMARY KEY | UNIQUE) LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* (COMMACHAR BUSINESS_TIME WITHOUT OVERLAPS )? RPARENCHAR;
referential_constraint: (CONSTRAINT dbs_constraint_name)?  FOREIGN KEY LPARENCHAR referential_constraint_body  RPARENCHAR common_reference_clause;
referential_constraint_body:  dbs_column_name (COMMACHAR PERIOD BUSINESS_TIME)? (COMMACHAR dbs_column_name (COMMACHAR PERIOD BUSINESS_TIME)?)* ;
check_constraint: (CONSTRAINT dbs_constraint_name)? CHECK LPARENCHAR  dbs_search_condition RPARENCHAR;
copy_options: ( (EXCLUDING | INCLUDING) IDENTITY (COLUMN ATTRIBUTES)? | (EXCLUDING | INCLUDING) ROW CHANGE TIMESTAMP (COLUMN ATTRIBUTES)?  |
                ((EXCLUDING|INCLUDING) COLUMN? DEFAULTS | USING TYPE DEFAULTS) | EXCLUDING XML TYPE MODIFIERS)+;
as_result_table: common_loop_and_fullselect RPARENCHAR WITH NO DATA;
common_loop_and_fullselect: column_loop?  AS LPARENCHAR dbs_fullselect RPARENCHAR;
column_loop: LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR;
materialized_query_def: common_loop_and_fullselect refreshable_table_options;
refreshable_table_options: DATA INITIALLY DEFERRED REFRESH DEFERRED ( MAINTAINED (BY SYSTEM | BY USER) | (ENABLE | DISABLE) QUERY OPTIMIZATION)*;
dbs_create_table_data_def: in_clause_def | partitioning_clause | organization_clause | EDITPROC dbs_program_name (WITH | WITHOUT) ROW ATTRIBUTES  | VALIDPROC  dbs_program_name | AUDIT (NONE | CHANGES | ALL)
                    | OBID dbs_integer | DATA CAPTURE (NONE | CHANGES)? | WITH RESTRICT ON DROP | CCSID oneof_encoding |  NOT? VOLATILE CARDINALITY? |
                    NOT? LOGGED | COMPRESS no_or_yes | APPEND no_or_yes | DSSIZE dbs_integer G_CHAR | BUFFERPOOL dbs_bp_name |  MEMBER CLUSTER |
                    TRACKMOD (yes_or_no | dbs_imptkmod_param)  | PAGENUM (dbs_pageset_pagenum_param | RELATIVE | ABSOLUTE) | (NO KEY LABEL | KEY LABEL dbs_key_label_name) ;
in_clause_def: (IN dbs_table_name? dbs_table_space_name | IN DATABASE dbs_database_name | IN ACCELERATOR dbs_accelerator_name);
partitioning_clause:  PARTITION BY (RANGE? LPARENCHAR partition_expression (COMMACHAR partition_expression)*  RPARENCHAR
                        LPARENCHAR partitioning_element (COMMACHAR partitioning_element)*  RPARENCHAR
                        |  SIZE (EVERY IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[Gg]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in GB.");}})?);
partition_expression: dbs_column_name (NULLS LAST)? (ASC | DESC)?;
partitioning_element: PARTITION dbs_integer ENDING AT? partition_element_loop partition_hash_space? INCLUSIVE?;
partition_hash_space: HASH SPACE dbs_integer k_m_g;
organization_clause: ORGANIZE BY HASH UNIQUE column_loop partition_hash_space?;

//CREATE TABLESPACE
dbs_create_tablespace: TABLESPACE dbs_table_space_name dbs_create_tablespace_opts*;
dbs_create_tablespace_opts : IN (DSNDB04  | dbs_database_name) | BUFFERPOOL dbs_bp_name | partition_by_growth_spec  | partition_by_range_spec | dbs_dpsegsz_param |
               SEGSIZE dbs_integer | DSSIZE dbs_integer G_CHAR  | CCSID oneof_encoding | CLOSE yes_or_no | COMPRESS no_or_yes | DEFINE no_or_yes | free_block  |  gbpcache_block
               | INSERT ALGORITHM (ZERO_DIGIT | dbs_integer1 | dbs_integer2) | LOCKMAX (SYSTEM | dbs_integer) | locksize_block_tbl  | TRACKMOD (yes_or_no | dbs_imptkmod_param) | using_block;
partition_by_growth_spec: MAXPARTITIONS (dbs_integer256 | dbs_integer (NUMPARTS dbs_integer)?);
partition_by_range_spec: NUMPARTS dbs_integer partition_by_range_spec_body*;
partition_by_range_spec_body: LPARENCHAR partitions_opts (COMMACHAR partitions_opts)*  RPARENCHAR | PAGENUM (dbs_pageset_pagenum_param | ABSOLUTE | RELATIVE);
partitions_opts: PARTITION dbs_integer (using_block | free_block | gbpcache_block | COMPRESS  yes_or_no | ERASE yes_or_no?  | dbs_imptkmod_param | TRACKMOD yes_or_no
               | DSSIZE (dbs_integer G_CHAR | IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[Gg]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in GB.");}}))+;
free_block: (FREEPAGE  dbs_integer | PCTFREE (dbs_smallint (FOR UPDATE dbs_smallint)?)?)+;
locksize_block_tbl: LOCKSIZE (ANY | TABLESPACE | PAGE | ROW);

//CREATE TRIGGER ADVANCED
dbs_create_trigger_advanced: (OR REPLACE)? TRIGGER dbs_trigger_name (trigger_definition | WRAPPED dbs_obfuscated_statement_text);
trigger_definition: (VERSION (V1 | dbs_trigger_version_id))? trigger_activation_time trigger_event ON (dbs_table_name | dbs_view_name)
            referencing_opts?  trigger_granularity dbs_option_list_trigger? triggered_action;
referencing_opts: REFERENCING (OLD ROW? AS? dbs_correlation_name | NEW ROW? AS? dbs_correlation_name | OLD_TABLE AS? dbs_table_identifier | NEW_TABLE AS? dbs_identifier)+;
trigger_activation_time: (NO CASCADE)? BEFORE | AFTER | INSTEAD OF;
trigger_event: INSERT | DELETE | UPDATE (OF dbs_column_name (COMMACHAR dbs_column_name)*)?;
trigger_granularity: (FOR EACH (STATEMENT | ROW))?;
triggered_action: (WHEN LPARENCHAR dbs_search_condition RPARENCHAR)? sql_trigger_body;
sql_trigger_body: dbs_sql_control_statement | dbs_triggered_sql_statement_adv;

//CREATE TRIGGER BASIC
dbs_create_trigger_basic: TRIGGER dbs_trigger_name (trigger_definition_basic | WRAPPED dbs_obfuscated_statement_text);
trigger_definition_basic: trigger_activation_time trigger_event ON (dbs_table_name | dbs_view_name) referencing_opts?  trigger_granularity MODE DB2SQL ( NOT? SECURED)? triggered_action_basic;
triggered_action_basic: (WHEN dbs_search_condition)? sql_trigger_body_basic;
sql_trigger_body_basic:  (dbs_triggered_sql_statement_basic | BEGIN ATOMIC (dbs_triggered_sql_statement_basic SEMICOLON_FS)+ END);

//CREATE TRUSTED CONTEXT
dbs_create_trusted_context: TRUSTED CONTEXT dbs_context_name BASED UPON CONNECTION USING SYSTEM AUTHID dbs_authorization_name (NO DEFAULT ROLE |
           DEFAULT ROLE dbs_role_name (WITHOUT ROLE AS OBJECT OWNER | WITH ROLE AS OBJECT OWNER AND QUALIFIER)? |
           DISABLE | ENABLE | NO DEFAULT SECURITY LABEL | DEFAULT SECURITY LABEL dbs_seclabel_name | ATTRIBUTES attributes_opt | with_user_opt)+;
attributes_opt: LPARENCHAR (attributes_opt_loop_body (COMMACHAR attributes_opt_loop_body)* | jobname_opt_loop_body (COMMACHAR jobname_opt_loop_body)*) RPARENCHAR;
attributes_opt_loop_body: ADDRESS dbs_address_value | ENCRYPTION dbs_encryption_value | SERVAUTH dbs_jobname_value;
jobname_opt_loop_body: JOBNAME dbs_jobname_value;
with_user_opt:  (WITH USE FOR with_user_loop_body (COMMACHAR with_user_loop_body)*);
with_user_loop_body: dbs_authorization_name user_options | EXTERNAL SECURITY PROFILE dbs_profile_name user_options | PUBLIC without_or_with AUTHENTICATION;
user_options: ((ROLE dbs_role_name)? ( dbs_seclabel_name)? (without_or_with AUTHENTICATION)?);

//CREATE TYPE ARRAY
dbs_create_type_array: TYPE dbs_array_type_name AS common_built_in_type_core ARRAY LSQUAREBRACKET (dbs_integer_max | dbs_integer_constant | common_built_in_type2)? RSQUAREBRACKET  ;

//CREATE TYPE DISTINCT
dbs_create_type_distinct: TYPE dbs_distinct_type_name AS common_built_in_type_source (INLINE LENGTH dbs_integer)?;

//CREATE VARIABLE
dbs_create_variable: VARIABLE dbs_variable_name (common_built_in_type_core | dbs_array_type_name) (DEFAULT NULL | DEFAULT (dbs_constant | dbs_special_register) )?;

//CREATE VIEW
dbs_create_view: VIEW dbs_view_name column_loop? AS tbl_expr_loop?  dbs_fullselect (WITH (CASCADED | LOCAL)? CHECK OPTION)?;
tbl_expr_loop: WITH dbs_select_statement_common_table_expression COMMACHAR dbs_select_statement_common_table_expression*;

/*DECLARE (all) */
dbs_declare: DECLARE (dbs_declare_cursor | dbs_declare_global | dbs_declare_statement | dbs_declare_table | dbs_declare_variable);

dbs_declare_cursor: dbs_cursor_name ((NO|ASENSITIVE|INSENSITIVE|SENSITIVE (DYNAMIC|STATIC)?) SCROLL)? CURSOR ((WITH|WITHOUT) HOLD |
                    (WITHOUT RETURN|WITH RETURN TO (CALLER|CLIENT)) | (WITH|WITHOUT) ROWSET POSITIONING)* /*random ordering req*/
                    FOR (dbs_select | dbs_statement_name);

dbs_declare_global: GLOBAL TEMPORARY TABLE dbs_table_name (LPARENCHAR dbs_declare_global_coldef (COMMACHAR dbs_declare_global_coldef)* RPARENCHAR |
                    (LIKE (dbs_table_name | dbs_view_name) | AS LPARENCHAR dbs_fullselect RPARENCHAR WITH NO DATA) dbs_declare_global_copyopts) (CCSID (ASCII|EBCDIC|UNICODE) |
                    ON COMMIT ((DELETE|PRESERVE) ROWS | DROP TABLE) | (LOGGED | NOT LOGGED (ON ROLLBACK (DELETE|PRESERVE) ROWS)?))*; /*random ordering req */
dbs_declare_global_coldef: dbs_column_name (dbs_distinct_type_name | dbs_declare_global_bit) (WITH? DEFAULT (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL)? |
                        GENERATED (ALWAYS|BY DEFAULT) (AS IDENTITY (LPARENCHAR dbs_declare_global_idopts (COMMACHAR? dbs_declare_global_idopts)* RPARENCHAR)?)? | NOT NULL)*; /*random ordering req "one each" rule */
dbs_declare_global_bit: (dbs_declare_global_bit_int | dbs_declare_global_bit_decimal | dbs_declare_global_bit_float | dbs_declare_global_bit_decfloat | dbs_declare_global_bit_char |
                            dbs_declare_global_bit_varchar | dbs_declare_global_bit_graphic | dbs_declare_global_bit_binary | DATE | TIME | dbs_declare_global_bit_timestamp );
dbs_declare_global_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_declare_global_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR (dbs_integer (COMMACHAR dbs_integer)? | NUMERICLITERAL) RPARENCHAR)?;
dbs_declare_global_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_declare_global_bit_decfloat: DECFLOAT (LPARENCHAR (dbs_integer34 | dbs_integer16) RPARENCHAR)?;
dbs_declare_global_bit_char: (CHARACTER | CHAR) (VARYING dbs_declare_global_bit_varchara | LPARENCHAR dbs_integer RPARENCHAR) dbs_declare_global_bit_charopts?;
dbs_declare_global_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA | CCSID dbs_integer1208);
dbs_declare_global_bit_varchar: VARCHAR dbs_declare_global_bit_varchara;
dbs_declare_global_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR dbs_declare_global_bit_charopts?;
dbs_declare_global_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR) (CCSID dbs_integer1200)?;
dbs_declare_global_bit_binary: (BINARY VARYING? | VARBINARY) (LPARENCHAR dbs_integer RPARENCHAR)?;
dbs_declare_global_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? option_timezone?;
dbs_declare_global_idopts: (START WITH dbs_numeric_constant | INCREMENT BY dbs_numeric_constant |  NO (MAXVALUE|MINVALUE|CACHE) | (MAXVALUE|MINVALUE) dbs_numeric_constant | NO? CYCLE |  CACHE dbs_integer_constant);
dbs_declare_global_copyopts: (dbs_declare_global_identity dbs_declare_global_defaults? | dbs_declare_global_defaults dbs_declare_global_identity?)?;
dbs_declare_global_defaults: (USING TYPE DEFAULTS | (INCLUDING|EXCLUDING) COLUMN? DEFAULTS);
dbs_declare_global_identity: (EXCLUDING|INCLUDING) IDENTITY (COLUMN ATTRIBUTES)?;

dbs_declare_statement: dbs_statement_name (COMMACHAR dbs_statement_name)* STATEMENT;

dbs_declare_table: (dbs_table_name | dbs_view_name) TABLE LPARENCHAR dbs_declare_table_loop (COMMACHAR dbs_declare_table_loop)* RPARENCHAR;
dbs_declare_table_loop: dbs_column_name (dbs_distinct_type_name | dbs_declare_table_bit) (NOT NULL (WITH DEFAULT)?)?;
dbs_declare_table_bit: (dbs_declare_table_bit_int | dbs_declare_table_bit_decimal | dbs_declare_table_bit_float | dbs_declare_table_bit_decfloat | dbs_declare_table_bit_char |
                        dbs_declare_table_bit_clob | dbs_declare_table_bit_varchar | dbs_declare_table_bit_graphic | dbs_declare_table_bit_binary | DATE | TIME | TIMESTAMP | ROWID | XML);
dbs_declare_table_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_declare_table_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR (dbs_integer (COMMACHAR dbs_integer)? | NUMERICLITERAL) RPARENCHAR)?;
dbs_declare_table_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_declare_table_bit_decfloat: DECFLOAT (LPARENCHAR (dbs_integer34 | dbs_integer16) RPARENCHAR)?;
dbs_declare_table_bit_char: (CHARACTER | CHAR) (VARYING dbs_declare_table_bit_varchara | LARGE OBJECT dbs_declare_table_bit_cloba | LPARENCHAR dbs_integer RPARENCHAR);
dbs_declare_table_bit_varchar: VARCHAR dbs_declare_table_bit_varchara;
dbs_declare_table_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR;
dbs_declare_table_bit_clob: CLOB dbs_declare_table_bit_cloba;
dbs_declare_table_bit_cloba: (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?;
dbs_declare_table_bit_graphic: (GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR | DBCLOB (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?);
dbs_declare_table_bit_binary: (BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?);

dbs_declare_variable: dbs_host_variable (COMMACHAR dbs_host_variable)* VARIABLE (CCSID (dbs_integer_constant | (EBCDIC|ASCII|UNICODE) (FOR (SBCS|MIXED|BIT) DATA)?))?;

/*DELETE */
dbs_delete: DELETE FROM (dbs_table_name | dbs_view_name) (dbs_delete_period | dbs_delete_noperiod | dbs_delete_positioned);
dbs_delete_period: dbs_delete_period_clause dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)?
                    (WHERE dbs_search_condition)? (dbs_delete_isolation_clause | SKIPCHAR LOCKED DATA)* (QUERYNO dbs_integer)?;
dbs_delete_period_clause: FOR PORTION OF BUSINESS_TIME (FROM dbs_value TO dbs_value | BETWEEN dbs_value AND dbs_value)?;
dbs_delete_include_column: INCLUDE LPARENCHAR dbs_column_name dbs_delete_data_type (COMMACHAR dbs_column_name dbs_delete_data_type)* RPARENCHAR;
dbs_delete_data_type: (common_short_built_in_type | dbs_distinct_type);
dbs_delete_assignment_clause: (dbs_delete_assignment_clause_whole | dbs_delete_assignment_clause_part);
dbs_delete_assignment_clause_whole: dbs_column_name EQUALCHAR (dbs_expression | NULL) (COMMACHAR dbs_column_name EQUALCHAR (dbs_expression | NULL))*;
dbs_delete_assignment_clause_part: LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | (dbs_expression |
                                   NULL) (COMMACHAR (dbs_expression | NULL)*)) RPARENCHAR;
dbs_delete_isolation_clause: WITH (RR | RS | CS);
dbs_delete_noperiod: dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)? (WHERE dbs_search_condition)?
                        dbs_fetch_clause? (dbs_delete_isolation_clause | SKIPCHAR LOCKED DATA)* (QUERYNO dbs_integer)?;
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
dbs_drop_package: PACKAGE dbs_collection_id_package_name (VERSION? dbs_version_id)?;
dbs_drop_permission: PERMISSION dbs_permission_name;
dbs_drop_procedure: PROCEDURE dbs_procedure_name RESTRICT?;
dbs_drop_role: ROLE dbs_role_name RESTRICT?;
dbs_drop_sequence: SEQUENCE dbs_sequence_name RESTRICT?;
dbs_drop_stogroup: STOGROUP dbs_stogroup_name;
dbs_drop_synonym: SYNONYM dbs_synonym;
dbs_drop_table: TABLE (dbs_table_name | dbs_alias_name);
dbs_drop_tablespace: TABLESPACE dbs_database_name? dbs_table_space_name;
dbs_drop_trigger: TRIGGER dbs_trigger_name;
dbs_drop_trusted: TRUSTED CONTEXT dbs_context;
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
dbs_fetch_multi: dbs_fetch_rowsetpos? FROM? dbs_cursor_name dbs_fetch_multirow;
dbs_fetch_rowsetpos: (ROWSET STARTING AT (ABSOLUTE | RELATIVE) (dbs_host_variable | dbs_integer_constant) | (NEXT | PRIOR |
                    FIRST | LAST | CURRENT) ROWSET);
dbs_fetch_multirow: (FOR (dbs_host_variable | dbs_integer_constant) ROWS)? ((INTO | USING) (DESCRIPTOR dbs_descriptor_name |
                    dbs_host_variable_array (COMMACHAR dbs_host_variable_array)*))?;


/*FREE LOCATOR */
dbs_free: FREE LOCATOR dbs_host_variable (COMMACHAR dbs_host_variable)*;

/*GET DIAGNOSTICS */
dbs_get: GET (CURRENT | STACKED)? DIAGNOSTICS (dbs_get_statement | dbs_get_condition | dbs_get_combi);
dbs_get_statement: dbs_variable EQUALCHAR (dbs_get_statement_loop (COMMACHAR dbs_variable EQUALCHAR dbs_get_statement_loop)* | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_SQL_NESTING_LEVEL);
dbs_get_statement_loop: dbs_get_statement_item (COMMACHAR dbs_get_statement_item)*;
dbs_get_statement_item: (DB2_LAST_ROW | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS | DB2_NUMBER_ROWS |
                        DB2_RETURN_STATUS | DB2_SQL_ATTR_CURSOR_HOLD | DB2_SQL_ATTR_CURSOR_ROWSET | DB2_SQL_ATTR_CURSOR_SCROLLABLE |
                        DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE | MORECHAR | NUMBER | ROW_COUNT);
dbs_get_condition: CONDITION (dbs_variable | dbs_integer) dbs_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item) (COMMACHAR
                   dbs_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item))*;
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
dbs_grant: GRANT (dbs_grant_null | dbs_grant_collection | dbs_grant_database | dbs_grant_function | dbs_grant_package | dbs_grant_plan | dbs_grant_schema | dbs_grant_sequence |
                dbs_grant_system | dbs_grant_table | dbs_grant_type | dbs_grant_variable | dbs_grant_use);
dbs_grant_authloop: (dbs_authorization_name | ROLE dbs_role_name | PUBLIC);
dbs_grant_null: dbs_authorization_specification TO dbs_grant_authloop (COMMACHAR (dbs_authorization_name | ROLE dbs_role_name | PUBLIC))* (WITH GRANT OPTION)?;
dbs_grant_collection: (CREATE|PACKADM) (ON|IN) COLLECTION (ASTERISKCHAR | dbs_collection_id (COMMACHAR dbs_collection_id)*) TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_database: db2sql_db_privileges (COMMACHAR db2sql_db_privileges)* ON DATABASE dbs_database_name (COMMACHAR dbs_database_name)* TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_function: EXECUTE ON (PROCEDURE (ASTERISKCHAR | dbs_procedure_name (COMMACHAR dbs_procedure_name)*) | SPECIFIC FUNCTION dbs_specific_name (COMMACHAR dbs_specific_name)* |
                    FUNCTION dbs_grant_function_loop (COMMACHAR dbs_grant_function_loop)*) TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_function_loop: dbs_function_name (LPARENCHAR (data_type (AS LOCATOR)? (COMMACHAR data_type (AS LOCATOR)?)*)? RPARENCHAR)?;
dbs_grant_package: (ALL | (BIND|COPY|EXECUTE|RUN) (COMMACHAR (BIND|COPY|EXECUTE|RUN))*) ON PACKAGE (FILENAME | dbs_collection_id SELECT_ALL)
                    (COMMACHAR (FILENAME | dbs_collection_id SELECT_ALL))* TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_plan: (BIND|EXECUTE) (COMMACHAR (BIND|EXECUTE))* ON PLAN dbs_plan_name (COMMACHAR dbs_plan_name)* TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_schema: (ALTERIN|CREATEIN|DROPIN) (COMMACHAR (ALTERIN|CREATEIN|DROPIN))* ON SCHEMA (ASTERISKCHAR|dbs_schema_name (COMMACHAR dbs_schema_name)*) TO dbs_grant_authloop
                    (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_sequence: (ALTER|USAGE|SELECT) (COMMACHAR (ALTER|USAGE|SELECT))* ON SEQUENCE dbs_sequence_name (COMMACHAR dbs_sequence_name)* TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_system: db2sql_system_privileges (COMMACHAR db2sql_system_privileges)* (ON SYSTEM)? TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_table: (ALL PRIVILEGES? | db2sql_table_view_privileges (COMMACHAR db2sql_table_view_privileges)*) ON TABLE? (dbs_table_name | dbs_view_name)
                    (COMMACHAR (dbs_table_name | dbs_view_name))* TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_type: USAGE ON (TYPE dbs_type_name (COMMACHAR dbs_type_name)* | JAR dbs_jar_name (COMMACHAR dbs_jar_name)*) TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_variable: (ALL PRIVILEGES? | (READ|WRITE) (COMMACHAR (READ|WRITE))*) ON VARIABLE dbs_variable_name TO dbs_grant_authloop (COMMACHAR dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_use: USE OF (BUFFERPOOL dbs_bp_name  (COMMACHAR dbs_bp_name)* | ALL BUFFERPOOLS | STOGROUP dbs_stogroup_name (COMMACHAR dbs_stogroup_name)* |
                TABLESPACE (dbs_database_name DOT)? dbs_table_space_name (COMMACHAR (dbs_database_name DOT)? dbs_table_space_name)*)
                TO (dbs_authorization_name | ROLE dbs_role_name | PUBLIC) (COMMACHAR (dbs_authorization_name | ROLE dbs_role_name | PUBLIC))*
                (WITH GRANT OPTION)?;


/*HOLD LOCATOR */
dbs_hold: HOLD LOCATOR dbs_host_variable (COMMACHAR dbs_host_variable)*;

/*INCLUDE */
dbs_include: INCLUDE (SQLCA | SQLDA | dbs_member_name);

/*INSERT */
dbs_insert: INSERT INTO (dbs_table_name | dbs_view_name) (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)?
            dbs_insert_include? (OVERRIDING USER VALUE)? (dbs_insert_values | dbs_insert_fullselect);
dbs_insert_include: INCLUDE LPARENCHAR dbs_column_name dbs_include_data_type (COMMACHAR dbs_column_name dbs_include_data_type)* RPARENCHAR;
//?
dbs_insert_data_type: (common_short_built_in_type | dbs_distinct_type);
//dbs_insert_values: VALUES LPARENCHAR (dbs_insert_values_single | dbs_insert_values_multi) RPARENCHAR;
dbs_insert_values: VALUES ((dbs_expression | DEFAULT | NULL) | LPARENCHAR dbs_insert_values_sgloop RPARENCHAR) | (FOR (dbs_host_variable | dbs_integer_constant) ROWS)? VALUES dbs_insert_values_multi;
dbs_insert_values_sgloop: (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL) | NUMERICLITERAL)*;
dbs_insert_values_multi: (dbs_expression | dbs_host_variable_array | DEFAULT | NULL | LPARENCHAR dbs_insert_values_mloop RPARENCHAR)
                        (FOR (dbs_host_variable | T=dbs_integer_constant {if(!(Integer.parseInt($T.text) > 0 && Integer.parseInt($T.text) <= 32767)) { notifyErrorListeners( $T.text+" not allowed. Allowed range is 0<k<=32767.");}}) ROWS)?
                        (ATOMIC | NOT ATOMIC CONTINUE ON SQLEXCEPTION)?;
dbs_insert_values_mloop: (dbs_expression | dbs_host_variable_array | DEFAULT | NULL) (COMMACHAR (dbs_expression |
                        dbs_host_variable_array | DEFAULT | NULL))*;
dbs_insert_fullselect: (WITH dbs_select_statement_common_table_expression (COMMACHAR dbs_select_statement_common_table_expression)*)? dbs_fullselect (WITH (RR|RS|CS))? (QUERYNO dbs_integer)?;

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
dbs_merge: MERGE INTO (dbs_table_name | dbs_view_name) dbs_merge_correlation? dbs_merge_include? USING (dbs_table_reference | dbs_joined_table |
        dbs_merge_values) ON dbs_search_condition (WHEN NOT? MATCHED (AND dbs_search_condition)? THEN (dbs_signal |
        dbs_merge_update | DELETE | dbs_merge_insert))+ (ELSE IGNORE)? (NOT ATOMIC CONTINUE ON SQLEXCEPTION)? (QUERYNO dbs_integer)?;
dbs_merge_correlation: AS? dbs_correlation_name (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)?;
dbs_merge_include: INCLUDE LPARENCHAR dbs_column_name (common_short_built_in_type | dbs_distinct_type) (COMMACHAR
        dbs_column_name (common_short_built_in_type | dbs_distinct_type))* RPARENCHAR;
dbs_merge_values: LPARENCHAR VALUES (dbs_merge_values_sing | dbs_merge_values_multi) RPARENCHAR AS? dbs_correlation_name
        LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR;
dbs_merge_values_sing: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (COMMACHAR (dbs_expression | NULL))* RPARENCHAR);
dbs_merge_values_multi: (dbs_expression | dbs_host_variable_array | NULL | LPARENCHAR (dbs_expression | dbs_host_variable_array |
        NULL) (COMMACHAR (dbs_expression | dbs_host_variable_array | NULL))* RPARENCHAR) FOR (dbs_host_variable | dbs_integer_constant) ROWS;
dbs_merge_update: UPDATE SET dbs_merge_assignment (COMMACHAR dbs_merge_assignment)*;
dbs_merge_assignment: (dbs_column_name EQUALCHAR (dbs_expressions | DEFAULT | NULL) | LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)*
        RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))*) RPARENCHAR);
dbs_merge_insert: INSERT (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)? VALUES (dbs_expression | DEFAULT | NULL |
        LPARENCHAR (dbs_expression | DEFAULT | NULL) (COMMACHAR (dbs_expression | DEFAULT | NULL))* RPARENCHAR);


/*OPEN */
dbs_open: OPEN dbs_cursor_name (USING (DESCRIPTOR dbs_descriptor_name) | (dbs_variable | dbs_array_variable
        LSQUAREBRACKET dbs_array_index RSQUAREBRACKET) (COMMACHAR (dbs_variable | dbs_array_variable LSQUAREBRACKET dbs_array_index RSQUAREBRACKET))*)?;

/*PREPARE */
dbs_prepare: PREPARE dbs_statement_name (INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?)? (FROM dbs_string_expression | (ATTRIBUTES dbs_attr_host_variable)? FROM dbs_variable);


/*REFRESH TABLE */
dbs_refresh: REFRESH TABLE dbs_table_name (QUERYNO dbs_integer)?;

/* RELEASE (both) */
dbs_release: RELEASE (dbs_location_name | dbs_host_variable | CURRENT | ALL SQL? | TO? SAVEPOINT dbs_savepoint_name);

dbs_savepoint_name: T=dbs_savepoint_name_rule {validateLength($T.text, "savepoint name", 128);};
dbs_savepoint_name_rule: (NONNUMERICLITERAL | NUMERICLITERAL)+ | IDENTIFIER;

/*RENAME */
dbs_rename: RENAME (TABLE? dbs_table_name TO dbs_table_identifier | INDEX dbs_index_name TO dbs_index_identifier);


/*REVOKE (all) */
dbs_revoke: REVOKE (dbs_revoke_authorized_spec | dbs_revoke_coll_prvg | dbs_revoke_db_prvg | dbs_revoke_func_or_proc_prvg | dbs_revoke_pack_prvg | dbs_revoke_plan_prvg |
            dbs_revoke_schema_prvg | dbs_revoke_seq_prvg  | dbs_revoke_system_prvg | dbs_revoke_table_or_view_prvg |  dbs_revoke_type_or_jar_prvg  | dbs_revoke_var_prvg | dbs_revoke_use_prvg);

//REVOKE
dbs_revoke_authorized_spec: dbs_authorization_specification FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
auth_name_loop_pub: (auth_name_or_role | PUBLIC) (COMMACHAR auth_name_loop_pub | PUBLIC)*;
auth_name_loop_all: BY (ALL | auth_name_or_role (COMMACHAR auth_name_or_role)*);
auth_name_or_role: dbs_authorization_name | ROLE dbs_role_name;
dependent_privileges: NOT? INCLUDING DEPENDENT PRIVILEGES;

//REVOKE COLLECTION PRIVILEGES
dbs_revoke_coll_prvg : (CREATE | PACKADM) (IN | ON) COLLECTION (db_coll_id_loop | ASTERISKCHAR) FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
db_coll_id_loop: dbs_collection_id (COMMACHAR dbs_collection_id)*;

//REVOKE DATABASE PRIVILEGES
dbs_revoke_db_prvg: db2sql_db_privileges (COMMACHAR db2sql_db_privileges)* ON DATABASE db_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
db_name_loop: dbs_database_name (COMMACHAR dbs_database_name)*;

//REVOKE FUNCTION OR PROCEDURE PRIVILEGES
dbs_revoke_func_or_proc_prvg:  EXECUTE ON function_or_procedure  FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
function_or_procedure: (FUNCTION (db_function_name_body_loop | ASTERISKCHAR) | SPECIFIC FUNCTION db_specific_name_loop | PROCEDURE db_procedure_name_loop);
db_function_name_body_loop: dbs_function_name param_loop? (COMMACHAR dbs_function_name param_loop?)*;
param_loop: LPARENCHAR param_type (COMMACHAR param_type)*  RPARENCHAR;
param_type: data_type (AS LOCATOR)?; //AS LOCATOR can be specified only for a LOB data type
db_specific_name_loop: dbs_specific_name (COMMACHAR dbs_specific_name)*;
db_procedure_name_loop: dbs_procedure_name (COMMACHAR dbs_procedure_name)*;

//REVOKE PACKAGE PRIVILEGES
dbs_revoke_pack_prvg: (ALL | revoke_opt_loop) ON PACKAGE package_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
revoke_opt_loop: revoke_opt (COMMACHAR revoke_opt)*;
revoke_opt: BIND | COPY | EXECUTE | RUN;
package_name_loop: package_name (COMMACHAR package_name)*;
package_name: dbs_collection_id SELECT_ALL? | FILENAME;

//REVOKE PLAN PRIVILEGES
dbs_revoke_plan_prvg: (BIND | EXECUTE) (COMMACHAR (BIND | EXECUTE))* ON PLAN plan_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
plan_name_loop: dbs_plan_name (COMMACHAR dbs_plan_name)*;

//REVOKE SCHEMA PRIVILEGES
dbs_revoke_schema_prvg: revoke_schema_opt_loop ON SCHEMA schema_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
revoke_schema_opt_loop: revoke_schema_opt (COMMACHAR revoke_schema_opt)*;
revoke_schema_opt: ALTERIN | CREATEIN | DROPIN;
schema_name_loop: dbs_schema_name (COMMACHAR dbs_schema_name)*;

//REVOKE SEQUENCE PRIVILEGES
dbs_revoke_seq_prvg: revoke_seq_opt_loop ON SEQUENCE seq_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
revoke_seq_opt_loop: revoke_seq_opt (COMMACHAR revoke_seq_opt)*;
revoke_seq_opt: ALTER | USAGE | SELECT;
seq_name_loop: dbs_sequence_name (COMMACHAR dbs_sequence_name)*;

//REVOKE SYSTEM PRIVILEGES
dbs_revoke_system_prvg: db2sql_system_privileges (COMMACHAR db2sql_system_privileges)*  (ON SYSTEM)? FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
//REVOKE TABLE OR VIEW PRIVILEGES
dbs_revoke_table_or_view_prvg: (ALL PRIVILEGES? | db2sql_table_view_privileges (COMMACHAR db2sql_table_view_privileges)*)  ON TABLE? table_or_view_name_loop
                                FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
table_or_view_name_loop: (dbs_table_name | dbs_view_name) (COMMACHAR (dbs_table_name | dbs_view_name))*;

//REVOKE TYPE OR JAR PRIVILEGES
dbs_revoke_type_or_jar_prvg: USAGE ON (TYPE type_name_loop | JAR jar_name_loop)  FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
type_name_loop: dbs_type_name  (COMMACHAR dbs_type_name)*;
jar_name_loop: dbs_jar_name (COMMACHAR dbs_jar_name)*;

//REVOKE VARIABLE PRIVILEGES
dbs_revoke_var_prvg: (ALL PRIVILEGES? | read_write_loop) ON VARIABLE FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
read_write_loop: READ WRITE (COMMACHAR READ WRITE)*;

//REVOKE USE PRIVILEGES
dbs_revoke_use_prvg: USE OF (BUFFERPOOL bpname_loop | ALL BUFFERPOOLS | STOGROUP stogroup_name_loop | TABLESPACE tblspace_name_loop) FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
bpname_loop: dbs_bp_name (COMMACHAR dbs_bp_name)*;
stogroup_name_loop: dbs_stogroup_name (COMMACHAR dbs_stogroup_name)*;
tblspace_name_loop: tblspace_name_name (COMMACHAR tblspace_name_name)*;
tblspace_name_name: (dbs_database_name DOT)? dbs_table_space_name;

/*ROLLBACK */
dbs_rollback: ROLLBACK WORK? (TO SAVEPOINT dbs_savepoint_name?)?;

/*SAVEPOINT */
dbs_savepoint: SAVEPOINT dbs_savepoint_name UNIQUE? ON ROLLBACK RETAIN (CURSORS (ON ROLLBACK RETAIN LOCKS)? | LOCKS ON ROLLBACK RETAIN CURSORS);

/*SELECT (both) */


dbs_select: dbs_select_unpack_function_invocation | dbs_fullselect;

/*Queries Subselects (all)*/
dbs_select_unpack_function_invocation: UNPACK LPARENCHAR dbs_expression RPARENCHAR DOT ASTERISKCHAR AS LPARENCHAR dbs_field_name db2sql_data_types (COMMACHAR dbs_field_name db2sql_data_types)* RPARENCHAR;
dbs_select_row_fullselect: (NONNUMERICLITERAL | NUMERICLITERAL)+ ;
dbs_subselect: dbs_select_clause dbs_from_clause dbs_where_clause? dbs_groupby_clause? dbs_having_clause?
dbs_orderby_clause? dbs_offset_clause? dbs_fetch_clause?;
dbs_select_clause: SELECT (ALL | DISTINCT)? ( ASTERISKCHAR | dbs_select_item (COMMACHAR dbs_select_item)*);
dbs_select_item: (dbs_expressions AS? dbs_sql_identifier? | dbs_unpacked_row | dbs_generic_name SELECT_ALL);
dbs_unpacked_row: dbs_select_unpack_function_invocation SELECT_ALL AS LPARENCHAR (dbs_generic_name db2sql_data_types)
(COMMACHAR dbs_generic_name db2sql_data_types)* RPARENCHAR;
dbs_from_clause: FROM (dbs_table_reference | dbs_joined_table) (COMMACHAR (dbs_table_reference | dbs_joined_table))*;
dbs_where_clause: WHERE (dbs_search_condition | LPARENCHAR dbs_search_condition RPARENCHAR);
dbs_groupby_alternatives: (dbs_grouping_expression| dbs_groupingset_alternative);
dbs_groupby_clause: GROUP BY dbs_groupby_alternatives (COMMACHAR dbs_groupby_alternatives)*;
dbs_groupingset_alternative: (dbs_grouping_sets | dbs_super_group);
dbs_groupingset_alternative_list: dbs_groupingset_alternative (COMMACHAR dbs_groupingset_alternative)* ;
dbs_grouping_sets: GROUPING SETS LPARENCHAR (dbs_groupingset_alternative_list | LPARENCHAR dbs_groupingset_alternative_list RPARENCHAR)  RPARENCHAR;
dbs_super_group: (ROLLUP | CUBE) LPARENCHAR dbs_grouping_expression_list? RPARENCHAR;
dbs_grouping_expression_alternative: dbs_grouping_expression | LPARENCHAR dbs_grouping_expression (COMMACHAR dbs_grouping_expression)* RPARENCHAR;
dbs_grouping_expression_list: dbs_grouping_expression_alternative (COMMACHAR dbs_grouping_expression_alternative)*;
dbs_grouping_expression: dbs_expression;
dbs_having_clause: HAVING dbs_search_condition;
dbs_orderby_clause: ORDER BY (INPUT SEQUENCE | ORDER OF dbs_table_designator | dbs_sort_key (ASC | DESC)? (COMMACHAR dbs_sort_key (ASC | DESC)?)*);
dbs_sort_key:  INTEGERLITERAL | dbs_sort_key_expression;
dbs_offset_clause: OFFSET INTEGERLITERAL (ROW | ROWS);

dbs_fullselect: (dbs_subselect | LPARENCHAR dbs_fullselect RPARENCHAR | dbs_value_clause | dbs_select_into)
((UNION|EXCEPT|INTERSECT) (DISTINCT|ALL)? (dbs_subselect | LPARENCHAR dbs_fullselect RPARENCHAR))*
dbs_orderby_clause? dbs_offset_clause? dbs_fetch_clause?;
dbs_value_clause: VALUES dbs_sequence_reference | LPARENCHAR dbs_sequence_reference (COMMACHAR dbs_sequence_reference)* RPARENCHAR;

/*SET (all) */
dbs_set: SET  (dbs_set_connection | dbs_set_assign | dbs_set_current_accel | dbs_set_current_app_compatibility | dbs_set_current_app_enc_schema |
         dbs_set_current_debug_mode |dbs_set_decfloat_round_mode | dbs_set_current_degree | dbs_set_current_explain_mode | dbs_set_current_get_accel_archive | dbs_set_current_local_ctype |
         dbs_set_current_maintained_table_type_optmz | dbs_set_current_optmz_hint | dbs_set_current_pckg_path | dbs_set_current_pckg_set | dbs_set_current_precision |
         dbs_set_current_query_accel | dbs_set_current_query_accel_wfdata | dbs_set_current_refresh_age | dbs_set_current_routine_version | dbs_set_current_rules | dbs_set_current_sqlid |
         dbs_set_current_temp_business_time | dbs_set_current_temp_system_time | dbs_set_current_enc_pwd | dbs_set_path | dbs_set_schema | dbs_set_session_tz);

//SET CONNECTION
dbs_set_connection: CONNECTION (dbs_location_name | dbs_host_variable);

//SET ASSIGNMENT STATEMENT
dbs_set_assign: (target_variable EQUALCHAR CURRENT (PACKAGESET | PACKAGE PATH |  SERVER) | dbs_array_variable_name
                LSQUAREBRACKET dbs_array_variable_name RSQUAREBRACKET EQUALCHAR (dbs_expression | NULL) | target_variable_loop);
target_variable: (dbs_global_variable_name | dbs_host_variable_name | dbs_sql_parameter_name | dbs_sql_variable_name | dbs_transition_variable_name);
target_variable_eq_opt:  (dbs_expressions | NULL | DEFAULT);
target_variable_eq_opt_loop:  target_variable_eq_opt (COMMACHAR target_variable_eq_opt)*;
target_variable_val_loop: LPARENCHAR target_variable (COMMACHAR target_variable)*  RPARENCHAR;
target_variable_vals_loop: LPARENCHAR (target_variable_eq_opt_loop | dbs_subselect | VALUES (target_variable_eq_opt | LPARENCHAR target_variable_eq_opt_loop RPARENCHAR)) RPARENCHAR;//1 2 3
target_variable_opts: (target_variable EQUALCHAR target_variable_eq_opt | target_variable_val_loop  EQUALCHAR target_variable_vals_loop);
target_variable_loop: target_variable_opts (COMMACHAR target_variable_opts)*;

//SET CURRENT ACCELERATOR
dbs_set_current_accel: CURRENT ACCELERATOR EQUALCHAR (dbs_accelerator_name | dbs_host_variable);

//SET CURRENT APPLICATION COMPATIBILITY
dbs_set_current_app_compatibility: CURRENT APPLICATION COMPATIBILITY EQUALCHAR? (dbs_string_constant | dbs_variable);

//SET CURRENT APPLICATION ENCODING SCHEMA
dbs_set_current_app_enc_schema: CURRENT APPLICATION? ENCODING SCHEME EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT DEBUG MODE
dbs_set_current_debug_mode: CURRENT DEBUG MODE EQUALCHAR? (dbs_host_variable | DISALLOW | ALLOW | DISABLE);

//SET CURRENT DECFLOAT ROUNDING MODE
dbs_set_decfloat_round_mode: CURRENT DECFLOAT ROUNDING MODE EQUALCHAR? (dbs_rounding_mode | dbs_string_constant | dbs_host_variable);
dbs_rounding_mode: ROUND_CEILING | ROUND_DOWN | ROUND_FLOOR | ROUND_HALF_DOWN | ROUND_HALF_EVEN | ROUND_HALF_UP | ROUND_UP;

//SET CURRENT DEGREE
dbs_set_current_degree: CURRENT DEGREE EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT EXPLAIN MODE
dbs_set_current_explain_mode: CURRENT EXPLAIN MODE EQUALCHAR? dbs_mod_opts;
dbs_mod_opts: (NO | YES | EXPLAIN | dbs_host_variable);

//SET CURRENT GET_ACCEL_ARCHIVE
dbs_set_current_get_accel_archive: CURRENT GET_ACCEL_ARCHIVE EQUALCHAR? dbs_mod_opts;

//SET CURRENT LOCALE LC_TYPE
dbs_set_current_local_ctype: (CURRENT LOCALE? LC_CTYPE | CURRENT_LC_CTYPE) EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT MAINTAINED TABLE TYPES FOR OPTIMIZATION
dbs_set_current_maintained_table_type_optmz: CURRENT MAINTAINED TABLE? TYPES (FOR OPTIMIZATION)? EQUALCHAR? (ALL | NONE | SYSTEM | USER | dbs_host_variable);

//SET CURRENT OPTIMIZATION HINT
dbs_set_current_optmz_hint: CURRENT OPTIMIZATION HINT EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT PACKAGE PATH
dbs_set_current_pckg_path: CURRENT PACKAGE PATH EQUALCHAR? pckg_path_opts_loop;
pckg_path_opts: (dbs_collection_id | (SESSION_USER | USER) | CURRENT PACKAGE PATH | CURRENT PATH | dbs_host_variable | dbs_string_constant);
pckg_path_opts_loop: pckg_path_opts (COMMACHAR pckg_path_opts)*;

//SET CURRENT PACKAGE SET
dbs_set_current_pckg_set: CURRENT PACKAGESET EQUALCHAR? ((SESSION_USER | USER) | dbs_string_constant | dbs_host_variable);

//SET CURRENT PRECISION
dbs_set_current_precision:  CURRENT PRECISION EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT QUERY ACCELERATION
dbs_set_current_query_accel: CURRENT QUERY ACCELERATION EQUALCHAR? (NONE | ENABLE | ENABLE WITH FAILBACK | ELIGIBLE | ALL | dbs_host_variable);

//SET CURRENT QUERY ACCELARATION WAITFORDATA
dbs_set_current_query_accel_wfdata: CURRENT QUERY ACCELERATION WAITFORDATA EQUALCHAR?
                               (NUMERICLITERAL {if(!$NUMERICLITERAL.text.matches("\\d{1,4}.\\d\\b")) {notifyErrorListeners($NUMERICLITERAL.text+ " not valid. Must be of format %d%d%d%d.%d");}}
                               | dbs_variable);

//SET CURRENT REFRESH AGE
dbs_set_current_refresh_age: CURRENT REFRESH AGE EQUALCHAR? (dbs_numeric_constant | ANY | dbs_host_variable);

//SET CURRENT ROUTINE VERSION
dbs_set_current_routine_version: CURRENT ROUTINE VERSION EQUALCHAR? (dbs_routine_version_id | dbs_host_variable | dbs_string_constant);

//SET CURRENT RULES
dbs_set_current_rules: CURRENT RULES EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT SQLID
dbs_set_current_sqlid: CURRENT SQLID EQUALCHAR? (SESSION_USER | USER | dbs_string_constant | dbs_host_variable);

//SET CURRENT TEMPORAL BUSINESS_TIME
dbs_set_current_temp_business_time: CURRENT TEMPORAL BUSINESS_TIME EQUALCHAR? (NULL | dbs_expressions);

//SET CURRENT TEMPORAL SYSTEM_TIME
dbs_set_current_temp_system_time: CURRENT TEMPORAL SYSTEM_TIME EQUALCHAR? (NULL | dbs_expression);

//SET CURRENT ENCRIPTION PASSWORD
dbs_set_current_enc_pwd: ENCRYPTION PASSWORD EQUALCHAR? (dbs_password_variable | dbs_password_string_constant) (WITH HINT EQUALCHAR? (dbs_hint_variable | dbs_hint_string_constant))?;

//SET PATH
dbs_set_path: (CURRENT)? PATH EQUALCHAR? set_path_opts_loop;
set_path_opts: (dbs_schema_name | SYSTEM PATH | (SESSION_USER | USER) | CURRENT? PATH | CURRENT PACKAGE PATH | dbs_host_variable | dbs_string_constant);
set_path_opts_loop: set_path_opts (COMMACHAR set_path_opts)*;

//SET SCHEMA
dbs_set_schema: (CURRENT? SCHEMA | CURRENT_SCHEMA) EQUALCHAR? (dbs_schema_name | (SESSION_USER | USER) | dbs_host_variable | dbs_string_constant | DEFAULT);

//SET SESSION TIME ZONE
dbs_set_session_tz : SESSION? TIME ZONE EQUALCHAR? (dbs_string_constant | dbs_variable);

/*SIGNAL - this is a statement and is referenced in other rules*/
dbs_signal: dbs_label? SIGNAL (dbs_sql_condition_name | SQLSTATE VALUE? (dbs_sqlstate_string_constant | dbs_sql_variable_name |
            dbs_sql_parameter_name)) (SET MESSAGE_TEXT EQUALCHAR)? dbs_diagnostic_string_expression;


/*TRANSFER OWNERSHIP */
dbs_transfer: TRANSFER OWNERSHIP OF (DATABASE dbs_database_name | INDEX dbs_index_name | STOGROUP dbs_stogroup_name |
                TABLE dbs_table_name | TABLESPACE dbs_database_name? dbs_table_space_name | VIEW dbs_view_name) TO (ROLE dbs_role_name |
                USER dbs_authorization_name | SESSION_USER) REVOKE PRIVILEGES;

/*TRUNCATE */
dbs_truncate: TRUNCATE TABLE? dbs_table_name ((DROP | REUSE) STORAGE)? ((IGNORE | RESTRICT WHEN) DELETE TRIGGERS)? IMMEDIATE?;

/*UPDATE */
dbs_update: UPDATE (dbs_table_name | dbs_view_name) (dbs_update_searched | dbs_update_positioned);
dbs_update_searched: dbs_update_period? dbs_correlation_name? dbs_update_include? SET dbs_update_assignment (COMMACHAR
                    dbs_update_assignment)* (WHERE dbs_search_condition)? (WITH (RR|RS|CS) | SKIPCHAR LOCKED DATA)* (QUERYNO dbs_integer)?;
dbs_update_period: FOR PORTION OF BUSINESS_TIME (FROM dbs_value TO dbs_value | BETWEEN dbs_value AND dbs_value);
dbs_update_include: INCLUDE LPARENCHAR dbs_column_name (common_short_built_in_type | dbs_distinct_type) (COMMACHAR
                    dbs_column_name (common_short_built_in_type | dbs_distinct_type))* RPARENCHAR;
dbs_update_assignment: (dbs_column_name EQUALCHAR (dbs_expressions | DEFAULT | NULL) | LPARENCHAR dbs_column_name
                    (COMMACHAR dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_select_row_fullselect | dbs_select_unpack_function_invocation |
                    (dbs_expressions | DEFAULT | NULL) (COMMACHAR (dbs_expressions | DEFAULT | NULL))*) RPARENCHAR);
dbs_update_positioned: dbs_correlation_name? SET dbs_update_assignment (COMMACHAR dbs_update_assignment)* WHERE CURRENT OF
                    dbs_cursor_name (FOR ROW (dbs_host_variable | dbs_integer_constant) OF ROWSET)?;

/*VALUES (both) */
dbs_values: VALUES (dbs_values_null | dbs_values_into);
dbs_values_null: (dbs_expression | LPARENCHAR dbs_expression (COMMACHAR dbs_expression)* RPARENCHAR);
dbs_values_into: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (COMMACHAR (dbs_expression | NULL))* RPARENCHAR) INTO
                (dbs_values_target (COMMACHAR dbs_values_target)* | dbs_array_variable);
dbs_values_target: (dbs_global_variable_name | dbs_host_variable_name | dbs_sql_parameter_name | dbs_sql_variable_name | dbs_transition_variable_name);

/*WHENEVER */
dbs_whenever: WHENEVER (NOT FOUND | SQLERROR | SQLWARNING) (CONTINUE | (GOTO | GO TO) COLONCHAR? dbs_host_label);

/*data types*/
data_type: (common_built_in_type | data_type_arr_or_distinct);
data_type_arr_or_distinct: dbs_array_type_name | dbs_distinct_type_name | ROWID | XML;
/*built in types*/
common_built_in_type_core: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat |
                        common_bit_char | common_bit_clob | common_bit_varchar | common_bit_graphic |
                        common_bit_binary | common_bit_date_time);
common_built_in_type: common_built_in_type_core;
common_built_in_type_source: common_built_in_type_core | ROWID;
common_built_in_type2:  common_bit_integer | (VARCHAR | (CHARACTER | CHAR) VARYING) LPARENCHAR dbs_integer  RPARENCHAR (CCSID oneof_encoding)? common_bit_fordata?;
common_built_in_type_core3: common_built_in_type_core | common_bit_date_time |  ROWID | XML (LPARENCHAR xml_type_modifier RPARENCHAR)?;
common_built_in_type4: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat |
                       common_bit_char2 | common_bit_graphic2 | common_bit_binary_core  | common_bit_date_time);

common_bit_integer: INTEGER | INT;
common_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
common_bit_decimal_opt: (DECIMAL | DEC | NUMERIC);
common_bit_decimal: common_bit_decimal_opt  (LPARENCHAR (dbs_integer (COMMACHAR dbs_integer)? | NUMERICLITERAL) RPARENCHAR)?;
common_bit_float: (FLOAT (LPARENCHAR dbs_integer RPARENCHAR)? | REAL | DOUBLE PRECISION?);
common_bit_decfloat: DECFLOAT (LPARENCHAR (dbs_integer34
             | LEVEL_NUMBER {if(! (Integer.parseInt($LEVEL_NUMBER.text) == 34 || Integer.parseInt($LEVEL_NUMBER.text) == 16)) {notifyErrorListeners($LEVEL_NUMBER.text+" not allowed. 34 or 16 are only allowed.");}}
             | dbs_integer16) RPARENCHAR)?;
common_bit_char: (CHARACTER | CHAR) (VARYING common_bit_varandchar | LARGE OBJECT common_bit_clobandobj | LPARENCHAR dbs_integer RPARENCHAR common_bit_charopts);
common_bit_char2: ((CHARACTER | CHAR) (LPARENCHAR dbs_integer RPARENCHAR)? | (VARCHAR | (CHARACTER | CHAR) VARYING) (LPARENCHAR dbs_integer RPARENCHAR)) (common_bit_fordata | CCSID dbs_integer1208)?;
common_bit_fordata: (FOR (SBCS | MIXED | BIT) DATA);
common_bit_charopts: (CCSID oneof_encoding)? common_bit_fordata?;
common_bit_varchar: VARCHAR common_bit_varandchar;
common_bit_varandchar: LPARENCHAR dbs_integer RPARENCHAR common_bit_charopts;
common_bit_clob: CLOB common_bit_clobandobj;
common_bit_clobandobj: (LPARENCHAR (IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[MmGgKk]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in KB,MB or GB.");}})? RPARENCHAR)?
                        (CCSID oneof_encoding)? (FOR (SBCS | MIXED ) DATA)?;
common_bit_graphic_core: GRAPHIC (LPARENCHAR dbs_integer RPARENCHAR)? | VARGRAPHIC LPARENCHAR dbs_integer RPARENCHAR;
common_bit_graphic: (common_bit_graphic_core | DBCLOB (LPARENCHAR dbs_integer k_m_g? RPARENCHAR)?) (CCSID oneof_encoding)?;
common_bit_graphic2: common_bit_graphic_core CCSID dbs_integer256;
common_bit_binary_core: BINARY (LPARENCHAR dbs_integer RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR dbs_integer RPARENCHAR;
common_bit_binary: (common_bit_binary_core | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR (IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[MmGgKk]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in KB,MB or GB.");}})? RPARENCHAR)?);
common_bit_timestamp: TIMESTAMP (LPARENCHAR dbs_integer RPARENCHAR)? (without_or_with TIME ZONE)?;
common_bit_date_time: (DATE |  TIME | common_bit_timestamp);

/*built in type with no LOBs used in DELETE, INSERT, MERGE, UPDATE */
common_short_built_in_type: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat | common_short_bit_char |
                            common_short_bit_varchar | common_short_bit_graphic | common_short_bit_binary | DATE | TIME | common_bit_timestamp );
common_short_bit_char: (CHARACTER | CHAR) (VARYING common_short_bit_varchara | LPARENCHAR dbs_integer RPARENCHAR) (FOR BIT DATA)?;
common_short_bit_varchar: VARCHAR common_short_bit_varchara;
common_short_bit_varchara: LPARENCHAR dbs_integer RPARENCHAR (FOR BIT DATA)?;
common_short_bit_graphic: (GRAPHIC | VARGRAPHIC) (LPARENCHAR dbs_integer RPARENCHAR)?;
common_short_bit_binary: (BINARY VARYING? | VARBINARY) (LPARENCHAR dbs_integer RPARENCHAR)?;

sql_data_type: SQL (VARCHAR (LPARENCHAR dbs_integer RPARENCHAR) | DECFLOAT (LPARENCHAR (dbs_integer34) RPARENCHAR)? | DATE | TIMESTAMP (LPARENCHAR (dbs_integer12) RPARENCHAR)? );

/*option lists*/
dbs_option_list: ((LANGUAGE SQL) | option_specific | option_deterministic | option_action | option_sqldata2 | (option_returned_null | option_called)| option_dispatch| option_allow_parallel| option_debug_mode|
                 option_parameter_enc | option_qualifier| option_package_owner | option_asutime | option_registers| (wlm_env dbs_name)| option_current_data| option_degree| option_concurrency|
                 option_dynamic_rules | option_app_enc| option_explain| option_query_accl |  option_get_accel | option_acceleration| option_accelerator| option_sql_path|
                 option_reopt| option_validate | option_rounding | option_format_date | option_decimal | option_for_update | option_format_time| option_secured| option_sensitive_business|
                 option_sensitive_system | option_sensitive_archive | option_app_compat | option_concentrate_statements)+;

dbs_option_list_ext: (option_specific| option_parameter | EXTERNAL option_name? | option_language | parameter_style (JAVA | SQL) | option_deterministic |  FENCED | (option_returned_null | option_called) |
                     option_sqldata3 | option_action | option_package_path | option_scratch| option_final_call| option_allow_parallel| option_dbinfo | option_collid |  option_wlm_env_short | option_asutime |
                     option_stay_resident | option_program_type | option_security | option_after | option_run | option_registers | option_dispatch | option_secured)+;

dbs_option_list_proc_ext: (option_specific | option_dynamic | option_parameter| EXTERNAL option_name| option_language | option_sql| option_parameter_style| option_deterministic|
                          option_package_path | FENCED| option_dbinfo| option_collid | option_wlm_env | option_asutime | option_stay_resident|  option_program_type| option_security|
                          option_after | option_run | option_commit |  option_registers | option_called | option_debug_mode)+;

dbs_option_list_ext_table: (option_specific | option_parameter | EXTERNAL option_name | option_language | parameter_style SQL | option_deterministic| FENCED| (option_returned_null | option_called)|
                           option_sqldata| option_action | option_package_path| option_scratch | option_final_call | DISALLOW PARALLEL | option_dbinfo| option_cardinality| option_collid|
                           option_wlm_env_short | option_asutime | option_stay_resident |  option_program_type | option_security| option_run | option_registers | option_dispatch | option_after | option_secured)+;
dbs_option_list_proc_native: (LANGUAGE SQL | option_specific | option_deterministic | option_sqldata2 | option_called | option_dynamic |
                             option_debug_mode |  option_parameter_enc option_qualifier | option_package_owner | option_asutime |
                             option_commit_aut |  option_registers | option_wlm_env_debug | option_defer | option_current_data | option_degree |
                             option_concurrency | option_dynamic_rules | option_app_enc | option_explain | option_write_imd | option_isolation_level |
                             option_dynamic_keep | option_opthint | option_sql_path | option_query_accl | option_get_accel | option_acceleration | option_accelerator |
                             option_release | option_reopt | option_validate | option_rounding | option_format_date | option_decimal |
                             option_for_update | option_format_time | option_sensitive_business | option_sensitive_system | option_sensitive_archive | option_concentrate_statements)+;

dbs_option_list_trigger: (option_debug_mode | option_qualifier | option_asutime | option_wlm_env_debug | option_current_data | option_concurrency | option_dynamic_rules | (DYNAMICRULES (RUN | BIND)) |
                         option_app_enc | option_explain | option_write_imd | option_isolation_level | option_opthint | option_sql_path | option_release |
                         option_rounding | option_format_date | option_decimal | option_format_time | option_for_update | option_secured |  option_sensitive_business |
                         option_sensitive_system | option_sensitive_archive | option_app_compat | option_concentrate_statements)+;

dbs_option_list_inl_def:  (option_specific | option_parameter | option_deterministic| option_action| option_sqldata_common| option_dispatch| option_called| option_secured | LANGUAGE SQL)+;
option_acceleration: ACCELERATION WAITFORDATA NUMERICLITERAL {if(!$NUMERICLITERAL.text.matches("\\d{1,4}.\\d\\b")) {notifyErrorListeners($NUMERICLITERAL.text+ " not valid. Must be of format %d%d%d%d.%d");}};
option_accelerator: ACCELERATOR dbs_accelerator_name;
option_action: NO?  EXTERNAL ACTION;
option_after: (STOP AFTER (SYSTEM DEFAULT FAILURES | dbs_integer FAILURES) | CONTINUE AFTER FAILURE);
option_allow_parallel: (ALLOW | DISALLOW) PARALLEL;
option_asutime: ASUTIME (NO LIMIT | LIMIT dbs_integer);
option_app_enc: APPLICATION ENCODING SCHEME oneof_encoding;
option_app_compat: APPLCOMPAT dbs_applcompat_value;
option_called: CALLED ON NULL INPUT;
option_cardinality: CARDINALITY dbs_integer;
option_collid: (NO COLLID | COLLID dbs_collection_id);
option_commit: COMMIT ON RETURN  no_or_yes;
option_commit_aut: (option_commit | AUTONOMOUS);
option_concentrate_statements: CONCENTRATE STATEMENTS (OFF | WITH LITERALS);
option_concurrency: CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME);
option_current_data: CURRENT DATA no_or_yes;
option_format_date: DATE option_format_opts;
option_format_time: TIME option_format_opts;
option_format_opts: FORMAT (ISO | EUR | USA | JIS | LOCAL);
option_dbinfo: NO? DBINFO;
option_debug_mode: (DISALLOW | ALLOW | DISABLE) DEBUG MODE;
option_decimal: DECIMAL LPARENCHAR (dbs_integer15 (COMMACHAR dbs_s)? | dbs_integer31 (COMMACHAR dbs_s)?);
option_defer: (DEFER | NODEFER) PREPARE;
option_degree: DEGREE  (LEVEL_NUMBER  {if(! ($LEVEL_NUMBER.text.equals("1") || $LEVEL_NUMBER.text.equals("ANY"))) {notifyErrorListeners( $LEVEL_NUMBER.text+" not allowed. It should be 1 or ANY.");}} | ANY);
option_deterministic: NOT? DETERMINISTIC;
option_dispatch: STATIC DISPATCH;
option_dynamic: DYNAMIC RESULT SETS (ZERO_DIGIT | dbs_integer);
option_dynamic_keep: without_or_with KEEP DYNAMIC;
option_dynamic_rules: DYNAMICRULES (RUN | BIND | DEFINEBIND | DEFINERUN | INVOKEBIND | INVOKERUN);
option_explain: without_or_with EXPLAIN;
option_final_call: NO? FINAL CALL;
option_for_update: OR UPDATE CLAUSE (REQUIRED |  OPTIONAL);
option_get_accel: GET_ACCEL_ARCHIVE no_or_yes;
option_isolation_level: ISOLATION LEVEL cs_rs_rr_ur;
option_language: LANGUAGE oneof_lang;
option_name: NAME ( dbs_ext_program_name | dbs_sql_identifier);
option_opthint: OPTHINT ( DOUBLEQUOTE | dbs_string_constant);
option_package_owner: PACKAGE OWNER dbs_authorization_name;
option_package_path: (NO PACKAGE PATH | PACKAGE PATH dbs_package_path);
option_parameter_enc: PARAMETER CCSID oneof_encoding;
option_parameter: PARAMETER (CCSID oneof_encoding | VARCHAR (NULTERM | STRUCTURE))*;
option_parameter_style: parameter_style ( SQL | GENERAL | GENERAL WITH NULLS | JAVA);
option_qualifier: QUALIFIER dbs_schema_name;
option_query_accl: QUERY ACCELERATION ( NONE | ENABLE (WITH FAILBACK)? |  ELIGIBLE | ALL);
option_program_type: program_type (SUB | MAIN);
option_release: RELEASE AT (COMMIT |  DEALLOCATE);
option_registers: (INHERIT | DEFAULT ) SPECIAL REGISTERS;
option_returned_null: RETURNS NULL ON NULL INPUT;
option_reopt: REOPT (NONE | ALWAYS | ONCE);
option_rounding: ROUNDING (DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN | DEC_ROUND_HALF_UP | DEC_ROUND_UP);
option_run: RUN OPTIONS dbs_run_time_options;
option_scratch: (NO SCRATCHPAD | SCRATCHPAD (dbs_integer100 | dbs_length)?);
option_security: SECURITY (DB2 | (USER | DEFINER));
option_secured: NOT? SECURED;
option_sensitive_archive: ARCHIVE SENSITIVE SENSITIVE no_or_yes;
option_sensitive_business: BUSINESS_TIME SENSITIVE no_or_yes;
option_sensitive_system: SYSTEM_TIME SENSITIVE SENSITIVE no_or_yes;
option_specific: SPECIFIC dbs_specific_name;
option_sqldata_common: (READS SQL DATA | CONTAINS SQL);
option_sqldata: (option_sqldata_common | NO SQL);
option_sqldata2: (MODIFIES SQL DATA | option_sqldata_common);
option_sqldata3: (option_sqldata2 | NO (SQL | EXTERNAL ACTION));
option_sql: (MODIFIES SQL DATA | READS SQL DATA | CONTAINS SQL | NO SQL);
option_sql_body: (dbs_schema_name | SYSTEM PATH | SESSION? USER);
option_sql_path: SQL PATH option_sql_body (COMMACHAR option_sql_body)*;
option_stay_resident: STAY RESIDENT no_or_yes;
option_timezone: without_or_with TIME ZONE;
option_validate: VALIDATE  (RUN | BIND);
option_write_imd: without_or_with IMMEDIATE WRITE;
option_wlm_env: wlm_env (dbs_name | LPARENCHAR dbs_name COMMACHAR ASTERISKCHAR RPARENCHAR);
option_wlm_env_short: wlm_env (dbs_name | LPARENCHAR dbs_name RPARENCHAR);
option_wlm_env_debug: wlm_env FOR DEBUG MODE dbs_name;

k_m_g: (K_CHAR | M_CHAR | G_CHAR);
no_or_yes: (NO | YES);
oneof_encoding: (ASCII | EBCDIC | UNICODE);
oneof_lang: (ASSEMBLE | LANGUAGE_C | COBOL | JAVA | PLI | REXX | SQL);
parameter_style: PARAMETER STYLE;
program_type: PROGRAM TYPE;
wlm_env: WLM ENVIRONMENT;
without_or_with: (WITHOUT | WITH);
yes_or_no: (YES | NO);
cs_rs_rr_ur: (CS | RS | RR | UR);

/// STATEMENTS ///
dbs_control_statement: dbs_assignment_statement | dbs_call_control | dbs_case_statement_pl_sql | dbs_compund_statement | dbs_for_statement | dbs_get |
                        dbs_goto_statement | dbs_if_statement | dbs_iterate_statement | dbs_leave_statement | dbs_loop_statement | dbs_repeat_statement |
                        dbs_resignal_statement |dbs_return_statement | dbs_signal_statement | dbs_while_statement | dbs_fullselect | dbs_select_into | dbs_signal;

dbs_assignment_statement : SET (dbs_sql_parameter_name | dbs_sql_variable_name) EQUALCHAR (CURRENT SERVER | CURRENT PACKAGESET | CURRENT PACKAGE PATH | dbs_expression | NULL);
dbs_procedure_argument_list : dbs_sql_variable_name| dbs_sql_parameter_name | dbs_expression| NULL;
dbs_call_control : (dbs_key_label_name COLONCHAR)? CALL dbs_procedure_name (LPARENCHAR dbs_procedure_argument_list (COMMACHAR dbs_procedure_argument_list)*  RPARENCHAR)?;
dbs_case_statement_pl_sql: (dbs_key_label_name COLONCHAR)? CASE (dbs_simple_when_clause_pl_sql | dbs_searched_when_clause_pl_sql) ELSE (dbs_sql_procedure_statement SEMICOLON_FS)+ END CASE;
dbs_simple_when_clause_pl_sql: dbs_expressions (WHEN dbs_expressions THEN (dbs_sql_procedure_statement SEMICOLON_FS)+)+;
dbs_searched_when_clause_pl_sql: (WHEN dbs_search_condition THEN (dbs_sql_procedure_statement SEMICOLON_FS)+)+;
dbs_compund_statement: (dbs_key_label_name COLONCHAR)? BEGIN (NOT ATOMIC | ATOMIC)? ((dbs_sql_variable_declaration|dbs_sql_condition_declaration
                        | dbs_return_code_declaration) SEMICOLON_FS)* (dbs_declare_statement SEMICOLON_FS)*
                        (DECLARE dbs_declare_cursor SEMICOLON_FS)* (dbs_handler_declaration SEMICOLON_FS)*
                        (dbs_sql_procedure_statement SEMICOLON_FS)* END dbs_key_label_name?; // check the labelname matches.
dbs_sql_variable_declaration: DECLARE dbs_sql_variable_name (COMMACHAR dbs_sql_variable_name)* (RESULT_SET_LOCATOR VARYING | dbs_insert_data_type (DEFAULT NULL | CONSTANT NULL | (DEFAULT | CONSTANT) dbs_constant)?) ;
dbs_sql_condition_declaration: DECLARE dbs_sql_condition_name CONDITION FOR (SQLSTATE VALUE?)? dbs_string_constant;
dbs_return_code_declaration: DECLARE (SQLSTATE (CHAR LPARENCHAR dbs_integer5 RPARENCHAR | CHARACTER LPARENCHAR dbs_integer5 RPARENCHAR) (DEFAULT dbs_string_constant)? | SQLCODE (INTEGER | INT) (DEFAULT dbs_integer_constant)?);
dbs_handler_declaration: DECLARE (CONTINUE | EXIT) HANDLER FOR (dbs_specific_condition_value | dbs_general_condition_value) dbs_sql_procedure_statement;
dbs_specific_condition_value: (SQLSTATE VALUE? dbs_string_constant | dbs_sql_condition_name) (COMMACHAR (SQLSTATE VALUE? dbs_string_constant | dbs_sql_condition_name))*;
dbs_general_condition_value: (SQLEXCEPTION | SQLWARNING | NOT FOUND) (COMMACHAR  (SQLEXCEPTION | SQLWARNING | NOT FOUND))*;
dbs_for_statement: (dbs_key_label_name COLONCHAR)? FOR (dbs_for_loop_name AS)? (dbs_cursor_name CURSOR (WITHOUT HOLD | WITH HOLD) FOR)?
                    dbs_select_clause DO (dbs_sql_procedure_statement SEMICOLON_FS)+ END FOR  dbs_key_label_name; // check label name matches
dbs_for_loop_name: dbs_generic_name;
dbs_goto_statement: (dbs_key_label_name COLONCHAR)? GOTO dbs_key_label_name;
dbs_if_else_conditional_statement: dbs_search_condition THEN (dbs_sql_procedure_statement SEMICOLON_FS)+;
dbs_if_statement: (dbs_key_label_name COLONCHAR)? IF dbs_if_else_conditional_statement (ELSEIF dbs_if_else_conditional_statement )* (ELSE (dbs_sql_procedure_statement SEMICOLON_FS)+)? END IF;
dbs_iterate_statement: (dbs_key_label_name COLONCHAR)? ITERATE dbs_key_label_name;
dbs_leave_statement: (dbs_key_label_name COLONCHAR)? LEAVE dbs_key_label_name;
dbs_loop_statement:  (dbs_key_label_name COLONCHAR)? LOOP (dbs_sql_procedure_statement SEMICOLON_FS)+ END LOOP dbs_key_label_name?; // label name should match
dbs_repeat_statement:  (dbs_key_label_name COLONCHAR)? REPEAT (dbs_sql_procedure_statement SEMICOLON_FS)+ UNTIL dbs_search_condition END REPEAT dbs_key_label_name?; // check that label name matches.
dbs_signal_arg1: (SQLSTATE VALUE? (dbs_sqlstate_string_constant | dbs_sql_variable_name | dbs_sql_parameter_name)| dbs_sql_condition_name);
dbs_resignal_statement: (dbs_key_label_name COLONCHAR)? RESIGNAL (dbs_signal_arg1 dbs_signal_information? )?;
dbs_signal_information:SET MESSAGE_TEXT EQUALCHAR dbs_diagnostic_string_expression | LPARENCHAR dbs_diagnostic_string_expression RPARENCHAR;
dbs_return_statement: (dbs_key_label_name COLONCHAR)? RETURN (dbs_expressions | NULL | dbs_fullselect);
dbs_signal_statement: (dbs_key_label_name COLONCHAR)?  SIGNAL dbs_signal_arg1 dbs_signal_information;
dbs_while_statement: (dbs_key_label_name COLONCHAR)? WHILE dbs_search_condition DO (dbs_sql_procedure_statement SEMICOLON_FS)+ END WHILE dbs_key_label_name?;
/// End STATEMENTS ///

///SQL-routine-body: DB2 SQL PROCEDURE STATEMENT
// ref - https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_sqlprocedurestatement4nativesqlpl.html#db2z_sqlprocedurestatement4nativesqlpl//
dbs_sql_procedure_statement: (dbs_sql_control_statement | dbs_allocate | ALTER (dbs_alter_database | dbs_alter_function | dbs_alter_index | dbs_alter_mask | dbs_alter_permission
 | dbs_alter_procedure | dbs_alter_sequence | dbs_alter_stogroup | dbs_alter_table | dbs_alter_tablespace | dbs_alter_trigger | dbs_alter_trusted | dbs_alter_view)
 | dbs_associate | dbs_call | dbs_close | dbs_comment | dbs_commit | dbs_connect | CREATE (dbs_create_alias | dbs_create_db |
 dbs_create_function | dbs_create_global_temp_table | dbs_create_index | dbs_create_procedure_ext | dbs_create_role | dbs_create_sequence
 | dbs_create_stogroup | dbs_create_alias | dbs_create_table | dbs_create_tablespace | dbs_create_trusted_context | dbs_create_type_array |
 dbs_create_type_distinct | dbs_create_variable | dbs_create_view) | DECLARE (dbs_declare_cursor | dbs_declare_global) | dbs_delete | dbs_drop |
 dbs_exchange | dbs_execute | dbs_fetch | dbs_get | dbs_grant | dbs_insert | dbs_label |
 dbs_lock | dbs_merge | dbs_open | dbs_prepare | dbs_refresh | dbs_release | dbs_rename | dbs_revoke | dbs_rollback | dbs_savepoint |
 dbs_select_into | dbs_set | dbs_truncate | dbs_update | VALUES dbs_values_into);

dbs_select_into: (WITH common_table_expression_loop)?  dbs_select_clause INTO (target_variable_names_loop | dbs_array_variable) dbs_from_clause dbs_where_clause? dbs_groupby_clause? dbs_having_clause?
                 dbs_orderby_clause? dbs_offset_clause?  dbs_fetch_clause?  (dbs_select_statement_isolation_clause | dbs_select_statement_skip_locked_data)* dbs_select_statement_queryno_clause?;
common_table_expression_loop: dbs_select_statement_common_table_expression (COMMACHAR dbs_select_statement_common_table_expression)*;
target_variable_names_loop: target_variable_names_opts (COMMACHAR target_variable_names_opts)*;
target_variable_names_opts: dbs_global_variable_name | dbs_host_variable_name | dbs_sql_parameter_name | dbs_sql_variable_name | dbs_transition_variable_name;
dbs_select_statement_common_table_expression: dbs_sql_identifier LPARENCHAR dbs_sql_identifier (COMMACHAR dbs_sql_identifier)* RPARENCHAR AS dbs_fullselect;
dbs_select_statement_isolation_clause: WITH (RR dbs_select_statement_isolation_clause_lock_clause | RS dbs_select_statement_isolation_clause_lock_clause | CS | UR );
dbs_select_statement_isolation_clause_lock_clause: USE AND KEEP (EXCLUSIVE | UPDATE | SHARE) LOCKS;
dbs_select_statement_queryno_clause: QUERYNO dbs_integer;
dbs_select_statement_skip_locked_data: SKIPCHAR LOCKED DATA;
/// END SQL PROCEDURE STATEMENT ///


///////////////// DBS EXPRESSION STARTS/////////////
dbs_expression: (PLUSCHAR | MINUSCHAR)? (dbs_function_invocation |
 LPARENCHAR dbs_expressions RPARENCHAR  |
 dbs_constant |
 dbs_column_name |
 dbs_variable |
 dbs_special_register |
 dbs_scalar_fullselect |
 dbs_time_zone_specific_expression |
 dbs_labeled_duration |
 dbs_case_expression |
 dbs_cast_specification |
 dbs_XMLCAST_specification |
 dbs_XMLQUERY_func|
 dbs_array_element_specification |
 dbs_array_constructor |
 dbs_OLAP_specification |
 dbs_row_change_expression |
 dbs_sequence_reference);

dbs_expression_operator: (CONCAT | PIPECHAR | SLASHCHAR | ASTERISKCHAR | PLUSCHAR | MINUSCHAR);

dbs_expressions: (dbs_expression| LPARENCHAR dbs_expressions RPARENCHAR) (dbs_expression_operator dbs_expression)* (AS common_built_in_type_core)?;
//https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_predicatesoverview.html
dbs_predicate_condition: (EQUALCHAR | ERRORCHAR EQUALCHAR | LESSTHANCHAR | MORETHANCHAR | MORETHANOREQUAL | LESSTHANOREQUAL);
dbs_basic_predicate: dbs_expressions dbs_predicate_condition dbs_expressions | dbs_expressions IS NULL;
dbs_quantified_predicate: dbs_expression dbs_predicate_condition (SOME|ANY|ALL)  LPARENCHAR dbs_select RPARENCHAR;
dbs_array_exists_predicate: ARRAY_EXISTS LPARENCHAR dbs_sql_identifier COMMACHAR INTEGERLITERAL RPARENCHAR;
dbs_between_predicate: dbs_expressions NOT? BETWEEN (dbs_expressions AND dbs_expressions | dbs_between_date_predicate);
dbs_between_date_predicate: DATELITERAL AND DATELITERAL;
dbs_distinct_predicate: dbs_expressions IS NOT? DISTINCT FROM dbs_expressions;
dbs_exist_predicate: EXISTS LPARENCHAR dbs_select RPARENCHAR;
dbs_in_predicate: dbs_expressions NOT? IN LPARENCHAR (dbs_select| dbs_expressions (COMMACHAR dbs_expressions)*) RPARENCHAR;
dbs_like_predicate: dbs_sql_identifier NOT? LIKE dbs_expressions (ESCAPE dbs_expressions)?;
dbs_null_predicate: dbs_expression IS NOT? NULL;
dbs_predicate: (dbs_basic_predicate | dbs_quantified_predicate | dbs_array_exists_predicate | dbs_between_predicate |
 dbs_distinct_predicate | dbs_exist_predicate | dbs_in_predicate | dbs_like_predicate | dbs_null_predicate ) ;
dbs_searched_when_clause : (WHEN LPARENCHAR dbs_predicate RPARENCHAR THEN (dbs_result_expression1 | NULL))+;

dbs_function_invocation : dbs_function_name LPARENCHAR (ALL | DISTINCT)? (TABLE dbs_transition_table_name |
(dbs_expressions | DATELITERAL) (COMMACHAR (dbs_expressions | DATELITERAL) | NUMERICLITERAL)*)? RPARENCHAR;
dbs_cast_specification: CAST LPARENCHAR (dbs_expression | NULL | dbs_parameter_marker) AS dbs_comment_parameter_type RPARENCHAR;
dbs_time_zone_expression : ( dbs_function_invocation | LPARENCHAR dbs_expression RPARENCHAR | dbs_constant |
dbs_column_name | dbs_variable | dbs_special_register | dbs_scalar_fullselect | dbs_case_expression | dbs_cast_specification);

dbs_time_zone_specific_expression : dbs_time_zone_expression ( AT LOCAL | AT TIME ZONE dbs_time_zone_expression);
dbs_time_unit: (YEAR | YEARS | MONTH | MONTHS | DAY | DAYS | HOUR | HOURS | MINUTE | MINUTES | SECOND | SECONDS | MICROSECOND | MICROSECONDS );
dbs_labeled_duration: (dbs_function_invocation | LPARENCHAR dbs_expression RPARENCHAR | dbs_constant |
dbs_column_name | dbs_variable) dbs_time_unit;

dbs_XMLCAST_specification: XMLCAST LPARENCHAR (dbs_expression | NULL | dbs_parameter_marker) AS dbs_comment_parameter_type RPARENCHAR;
dbs_array_element_specification: dbs_array_variable;
dbs_XMLQUERY_func: XMLQUERY LPARENCHAR  dbs_xquery_expression_constant (PASSING (BY REF)? dbs_row_xquery_argument  (COMMACHAR dbs_row_xquery_argument)*)? (RETURNING SEQUENCE (BY REF)?)? (EMPTY ON EMPTY)? RPARENCHAR;
dbs_xquery_expression_constant: (dbs_expression|COLONCHAR|LSQUAREBRACKET|RSQUAREBRACKET|LPARENCHAR|RPARENCHAR|SLASHCHAR|EQUALCHAR|DOLLARCHAR)+; //TODO: https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/xml/src/tpc/db2z_xpxqprologexpression.html
dbs_array_constructor: ARRAY LSQUAREBRACKET (QUESTIONMARK | dbs_fullselect | (dbs_array_element_specification | NULL)
(COMMACHAR (dbs_array_element_specification | NULL))*) RSQUAREBRACKET;

dbs_lag_lead_expression: LPARENCHAR dbs_expression (COMMACHAR dbs_integer (COMMACHAR dbs_integer (COMMACHAR SINGLEQUOTE RESPECT NULLS SINGLEQUOTE |
 COMMACHAR SINGLEQUOTE IGNORE NULLS SINGLEQUOTE)?)?)? RPARENCHAR;
dbs_lag_function: LAG dbs_lag_lead_expression;

dbs_lead_function: LEAD dbs_lag_lead_expression;
dbs_partitioning_expression: DOLLARCHAR INTEGERLITERAL? dbs_char_n (PLUSCHAR INTEGERLITERAL (PERCENT INTEGERLITERAL)? | PERCENT INTEGERLITERAL (PLUSCHAR INTEGERLITERAL)?)? | dbs_expression;
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

dbs_value_function: (FIRST_VALUE | LAST_VALUE | NTH_VALUE) LPARENCHAR dbs_expression (COMMACHAR SINGLEQUOTE RESPECT NULLS SINGLEQUOTE |
COMMACHAR SINGLEQUOTE IGNORE NULLS SINGLEQUOTE) RPARENCHAR;
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

dbs_aggregation_specification : (dbs_aggregate_function | dbs_OLAP_column_function) (OVER LPARENCHAR dbs_window_partition_clause?
( RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING | dbs_window_order_clause (RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW |
dbs_window_aggregation_group_clause )?)? RPARENCHAR)?;
dbs_OLAP_specification: dbs_ordered_OLAP_specification |
 dbs_numbering_specification |
 dbs_aggregation_specification
;
dbs_table_designator: all_words+; //?
dbs_row_change_expression: ROW CHANGE (TIMESTAMP | TOKEN) FOR dbs_table_designator;
dbs_sequence_reference: (NEXT| PREVIOUS) VALUE FOR dbs_sequence_name;

/////////////////DBS EXPRESSION ENDS///////////////////




/////// Variables /////////////
all_words: NONNUMERICLITERAL | NUMERICLITERAL | INTEGERLITERAL | db2sql_intersected_words | db2sql_only_words;

db2sql_db_privileges: DBADM | DBCTRL | DBMAINT | CREATETAB | CREATETS | DISPLAYDB | DROP | IMAGCOPY | LOAD | RECOVERDB | REORG | REPAIR | STARTDB | STATS | STOPDB;
db2sql_system_privileges: ACCESSCTRL | ARCHIVE | BINDADD | BINDAGENT | BSDS | CREATEALIAS | CREATEDBA | CREATEDBC | CREATESG | CREATETMTAB | CREATE_SECURE_OBJECT |
                         DATAACCESS | DBADM ((WITH | WITHOUT) ACCESSCTRL )? ((WITH | WITHOUT) DATAACCESS)? | DEBUGSESSION | DISPLAY | EXPLAIN | MONITOR1 | MONITOR2 | RECOVER | SQLADM | STOPALL | STOSPACE | SYSADM | SYSCTRL | SYSOPR | TRACE;

db2sql_table_view_privileges: ALTER | DELETE | INDEX | INSERT | REFERENCES | SELECT | TRIGGER | UPDATE;

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

dbs_inbuild_functions : ASCII  | AVG | BLOB | BIGINT | BINARY | CARDINALITY | CHAR | CHARACTER_LENGTH | CAST | CHAR_LENGTH | CLOB | COALESCE
                            | CONCAT | CONTAINS | CORR | CORRELATION | COUNT | COUNT_BIG | COVARIANCE | CUME_DIST | DATE | DAY
                            | DAYOFMONTH | DAYOFWEEK | DAYOFYEAR | DAYS | DBCLOB |  DECIMAL | DEC | DECFLOAT | DOUBLE | EXTRACT | FLOAT
                            | GRAPHIC | GROUPING | HASH | HEX | HOUR | INSERT | INTEGER | INT | LEFT | LENGTH | LOWER | MAX | MICROSECOND
                            | MIN | MINUTE | MONTH | PERCENT_RANK | POSITION | RANDOM | REAL | REPEAT | REPLACE | RIGHT | ROWID | SECOND
                            | SMALLINT | SPACE | STDDEV | SUBSTR | SUBSTRING | SUM | TIME | TIMESTAMP | ROW_NUMBER | TRANSLATE | TRIM
                            | TRUNCATE | UNICODE | UNPACK | UPPER | VALUE | VARBINARY | VARCHAR | VARGRAPHIC | VARIANCE | XMLNAMESPACES
                            | XMLTABLE | YEAR;
db2sql_only_words: db2sql_only_words1 | IS;
db2sql_only_words1: ABSOLUTE | ACCELERATION | ACCELERATOR | ACTIVATE | ACTIVE | ADA | AGE | ALIAS | ALLOW | ALTERIN | ALWAYS | APPEND |
                            APPLCOMPAT | APPLICATION | ARCHIVE | ASC | ASSERTION | ASSOCIATE | ASUTIME | ATOMIC | AUTHID |
                            AUTHORIZATION | AUTOMATIC | AVG | AUX | BEGIN | BETWEEN | BIGINT | BIND | BINDADD | BIT_LENGTH | BLOCKED |
                            BOTH | BUFFERPOOL | BUFFERPOOLS | BUSINESS_TIME | CACHE | CALLED | CALLER | CAPTURE | CARDINALITY |
                            CASCADE | CASE | CAST | CATALOG | CATALOG_NAME | CHANGES | CHAR_LENGTH | CHARACTER_LENGTH |
                            CHECKED | CLAUSE | CLUSTER | COLLATE | COLLATION | COLLECT | COLLECTION | COLLID | COLUMN | COMMENT |
                            COMMIT | COMMITTED | COMPARISONS | CONCAT | CONCENTRATE | CONCURRENT | CONDITION_NUMBER | CONNECTION |
                            CONNECTION_NAME | CONSERVATIVE | CONSTRAINT | CONSTRAINTS | CONTEXT | CONVERT | CORRELATION | COUNT_BIG |
                            CPU | CREATEIN | CREATEIN | CREATETAB | CROSS | CS | CUBE | CURRENT_DATE | CURRENT_PATH |
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
                            INVOKERUN | IOS_PER_ARGBYTE | IOS_PER_INVOC | ISO | ISOLATION | ITERATE | JAVA | JIS | JOBNAME | JOIN | KEYS |
                            LABELS | LARGE | LEAVE | LIKE | LIMIT | LINKTYPE | LITERALS | LOCATOR | LOCATORS | LOCATION | LOCKED | LOCKS | LOCKSIZE |
                            LOGGED | LONG | LONGVAR | LOOP | LOWER | MAINTAINED | MAPPING | MASK | MATCH | MAX | MAXVALUE | MESSAGE_TEXT | MICROSECOND |
                            MICROSECONDS | MINUTE | MINVALUE | MIXED | MODIFIES | MODULE | MONTHS | NAMES | NATURAL | NCHAR | NEW | NEW_TABLE |
                            NEXTVAL | NICKNAME | NOCACHE | NOCYCLE | NODE | NOMINVALUE | NOORDER | NULLABLE | NUMBER | OBJECT | OCTETS |
                            CODEUNITS32 | OLD | OLD_TABLE | OLE | OLEDB | ONCE | ONLINE | ONLY | OFFSET | OPTHINT | OPTIMIZATION | OPTIMIZE | OUT |
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
                            STAY | STMTCACHE | STMTID | STMTTOKEN | STRUCTURE | STOGROUP | STORED | STORES | STYLE | SUB | SUBSTR | SUBSTRING | SUMMARY |
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
((CURRENT TIMESTAMP| CURRENT_TIMESTAMP) (LPARENCHAR INTEGERLITERAL RPARENCHAR)? (WITHOUT TIME ZONE|WITH TIME ZONE)? ) |
(CURRENT TIME ZONE| CURRENT TIMEZONE | CURRENT_TIMEZONE) | ENCRYPTION PASSWORD | (SESSION TIME ZONE | SESSION TIMEZONE) |
(SESSION_USER | USER) );


db2sql_data_value: DATELITERAL;
dbs_accelerator_name: IDENTIFIER; // - 1
dbs_hostname_identifier : (IDENTIFIER | (DOT | COLONCHAR | SLASHCHAR))+;
dbs_quad: (ZERO_DIGIT  HEX_NUMBERS+ | ZERO_DIGIT OCTDIGITS+) | INTEGERLITERAL;
dbs_ip4: dbs_quad DOT dbs_quad DOT dbs_quad DOT dbs_quad+;
dbs_address_value: dbs_ip4 | dbs_hostname_identifier | NONNUMERICLITERAL ;
dbs_alias_name: T=dbs_sql_identifier { validateLength($T.text, "alias name", 128); }; //must not be an alias that exists at the current server
dbs_applcompat_value: FUNCTION_LEVEL_10 | FUNCTION_LEVEL_11 | FUNCTION_LEVEL_12;
dbs_array_index: dbs_integer;
dbs_array_type_name: dbs_sql_identifier;
dbs_array_variable: dbs_sql_identifier LSQUAREBRACKET (dbs_expressions) RSQUAREBRACKET;
dbs_array_variable_name: all_words+;
dbs_attr_host_variable: dbs_hostname_identifier | NUMERICLITERAL ; // VARCHAR(128)
dbs_authorization_name: dbs_sql_identifier;
dbs_authorization_specification: IDENTIFIER;
dbs_aux_table_name: T=dbs_sql_identifier {validateLength($T.text, "auxiliary table name", 128);};
dbs_begin_column_name: dbs_generic_name;
dbs_binary_string_constant: BINARY_STRING_CONSTANT;
dbs_bp_name: T=dbs_sql_identifier {validateLength($T.text, "buffer pool name", 8);};
dbs_case_expression : CASE (dbs_simple_when_clause | dbs_searched_when_clause) (ELSE NULL | ELSE dbs_result_expression1)? END ;
dbs_cast_function_name: dbs_sql_identifier;
dbs_catalog_name: T=dbs_sql_identifier {validateLength($T.text, "catalog name", 8);};
dbs_ccsid_value: INTEGERLITERAL;
dbs_character_string_constant: CHAR_STRING_CONSTANT;
dbs_clone_table_name: T=dbs_sql_identifier {validateLength($T.text, "clone table name", 128);};
dbs_collection_id: IDENTIFIER;
dbs_collection_id_package_name: FILENAME;
dbs_collection_name: T=dbs_sql_identifier {validateLength($T.text, "collection name", 128);}; // SQLIDENTIFIER are case sensitive. allows only uppercase or quoted string as per doc.
dbs_generic_name: ACTIVITY | ADDRESS |AVG | COLOR | COUNT | COMMENT | DOCUMENT | FILENAME | GROUP | HOUR | HOURS | ID | IN | IDENTIFIER | LOCATION | LOCATOR | MAX | MIN | MONTH | NAME | NONNUMERICLITERAL | YEAR | DATE | DAY | SERVER | STATE | SQLCODE | TRANSACTION | TYPE | V1 ; //TODO try to include all cics_cobol_intersected_words/ cics_only_words
dbs_column_name: (dbs_generic_name DOT)? T=dbs_generic_name {validateLength($T.text, "column name", 30);};
dbs_constant : (dbs_string_constant | dbs_integer_constant | DATELITERAL);
dbs_constraint_name: T=dbs_sql_identifier {validateLength($T.text, "constraint name", 128);};
dbs_context: dbs_sql_identifier;
dbs_context_name: T=dbs_sql_identifier {validateLength($T.text, "profile name", 127);};
dbs_copy_id: CURRENT | PREVIOUS | ORIGINAL;
dbs_correlation_name: T=dbs_generic_name {validateLength($T.text, "correlation name", 128);};
dbs_cursor_name: T=dbs_sql_identifier {validateLength($T.text, "cursor name", 128);};
dbs_database_name: T=dbs_sql_identifier {validateLength($T.text, "database name", 8);};
dbs_dc_name: dbs_sql_identifier;// JAVA - lenght must be < 9
dbs_descriptor_name: COLONCHAR? (SQLD | SQLDABC | SQLN | SQLVAR | SQLDA | IDENTIFIER);
dbs_diagnostic_string_expression: dbs_expressions;
dbs_distinct_type: db2sql_data_types+;
dbs_distinct_type_name: T=dbs_sql_identifier {validateLength($T.text, "distinct type name", 128);};
dbs_dpsegsz_param: SINGLEDIGITLITERAL? (ZERO_DIGIT | dbs_integer2 | dbs_integer4 | dbs_integer6 | dbs_integer8);// DPSEGSZ value, divisible by 4. Range [0,64], must be checked in code.
dbs_end_column_name: dbs_generic_name;
dbs_element_name: IDENTIFIER;
dbs_encryption_value: QUOTED_NONE | LOW | HIGH;
dbs_explainable_sql_statement: ( dbs_allocate | dbs_alter | dbs_associate | dbs_fetch | dbs_insert | dbs_label | dbs_lock | dbs_merge | dbs_open |
 dbs_prepare | dbs_refresh | dbs_release | dbs_rename | dbs_select | dbs_truncate | dbs_select | dbs_set | dbs_delete | dbs_drop); // RE-CHECK
dbs_ext_program_name: dbs_sql_identifier;
dbs_external_program_name: IDENTIFIER;
dbs_hint_variable:  dbs_variable;
dbs_hint_string_constant:  IDENTIFIER;
dbs_fetch_clause: FETCH (FIRST | NEXT) (PLUSCHAR? INTEGERLITERAL)? (ROW | ROWS) ONLY;
dbs_field_name: dbs_sql_identifier;
dbs_function_name: T=dbs_sql_identifier {validateLength($T.text, "function name", 128);} | dbs_inbuild_functions; //must not be any of the  system-reserved keywords
dbs_global_variable_name: dbs_generic_name | ROWID;
dbs_graphic_string_constant: GRAPHIC_CONSTANT;
dbs_history_table_name: dbs_table_name;
dbs_host_label: IDENTIFIER | HANDLER;
dbs_host_variable: COLONCHAR? (FILENAME | IDENTIFIER) (INDICATOR? COLONCHAR (FILENAME | IDENTIFIER))? ;
dbs_host_variable_array: IDENTIFIER; // variable array must be defined in the application program
dbs_host_variable_name: T=dbs_host_var_identifier {validateLength($T.text, "host variable name", 128);};
dbs_host_var_identifier: COLONCHAR dbs_generic_name (INDICATOR? COLONCHAR dbs_generic_name)?;
dbs_id_host_variable: NUMERICLITERAL;
dbs_identifier: dbs_sql_identifier;
dbs_imptkmod_param: YES | NO;
dbs_include_data_type: dbs_alter_procedure_bit_int | dbs_alter_procedure_bit_decimal | dbs_alter_procedure_bit_float | dbs_alter_procedure_bit_decfloat | dbs_alter_procedure_bit_char | dbs_alter_procedure_bit_graphic | dbs_alter_procedure_bit_varchar | DATE | TIME | dbs_alter_procedure_bit_timestamp;
dbs_index_identifier: IDENTIFIER;
dbs_index_name: T=dbs_sql_identifier {validateLength($T.text, "index name", 128);};
dbs_integer: INTEGERLITERAL | LEVEL_NUMBER | LEVEL_NUMBER_66 | LEVEL_NUMBER_77 | LEVEL_NUMBER_88;
dbs_integer_constant: dbs_integer | NUMERICLITERAL; //range 1 - 32767
dbs_jar_name: T=dbs_hostname_identifier {validateLength($T.text, "jar name", 128);};
dbs_jobname_value: IDENTIFIER | NONNUMERICLITERAL;
dbs_key_label_name: IDENTIFIER;
dbs_length: INTEGERLITERAL; //length must be between 1 and 32767. The default value is 100 bytes.
dbs_level: dbs_integer0 | dbs_integer1 dbs_integer2;
dbs_location_name: IDENTIFIER {validateLength($IDENTIFIER.text, "location name", 16);}; //not greater than 16
dbs_mask_name: dbs_sql_identifier;
dbs_mc_name: IDENTIFIER;// must be 1-8 characters in length
dbs_member_name: dbs_sql_identifier;
dbs_name: dbs_sql_identifier; // name of the WLM environment is an SQL identifier
dbs_namespace_name: VARCHAR;
dbs_nnnn_m: SINGLEDIGITLITERAL SINGLEDIGITLITERAL? SINGLEDIGITLITERAL? SINGLEDIGITLITERAL? DOT SINGLEDIGITLITERAL;
dbs_non_deterministic_expression: DATA CHANGE OPERATION | dbs_special_register | dbs_session_variable;
dbs_session_variable : SYSIBM DOT PACKAGE_NAME | SYSIBM DOT PACKAGE_SCHEMA | SYSIBM DOT PACKAGE_VERSION;
dbs_numeric_constant: dbs_integer;// numeric literal without non-zero digits to the right of the decimal point.
dbs_obfuscated_statement_text: all_words+ ;
dbs_package_name: NONNUMERICLITERAL {validateLength($NONNUMERICLITERAL.text, "package name", 8);};
dbs_password_variable: COLONCHAR? (all_words | dbs_generic_name)+;
dbs_password_string_constant: IDENTIFIER;
dbs_package_path: FILENAME+;
dbs_pageset_pagenum_param: ABSOLUTE | dbs_char_a | RELATIVE | dbs_char_r ;
dbs_parameter_marker: ( QUESTIONMARK | COLONCHAR dbs_variable);
dbs_parameter_name: T=dbs_sql_identifier {validateLength($T.text, "parameter name", 128);};
dbs_permission_name: dbs_sql_identifier;
dbs_plan_name: T=dbs_sql_identifier {validateLength($T.text, "plan name", 8);} ;
dbs_procedure_name: T=dbs_sql_identifier {validateLength($T.text, "procedure name", 128);};
dbs_profile_name: NONNUMERICLITERAL;//
dbs_program_name: IDENTIFIER {validateLength($IDENTIFIER.text, "program name", 8);};
dbs_registered_xml_schema_name: dbs_sql_identifier;
dbs_result_expression1: dbs_expressions;
dbs_role_name: T=dbs_sql_identifier+ {validateLength($T.text, "role name", 128);};
dbs_routine_version_id: IDENTIFIER {validateLength($IDENTIFIER.text, "Routine version identifier in UTF-8", 122);};
dbs_rs_locator_variable: COLONCHAR? dbs_sql_identifier;
dbs_run_time_options: NONNUMERICLITERAL; // a character string that is no longer than 254 bytes
dbs_s: SINGLEDIGITLITERAL ; // a number between 1 and 9
dbs_sc_name: IDENTIFIER;// must be from 1-8 characters in length
dbs_scalar_fullselect : LPARENCHAR dbs_fullselect RPARENCHAR;
dbs_schema_location: dbs_hostname_identifier;
dbs_schema_name: IDENTIFIER {validateLength($IDENTIFIER.text, "schema name", 128);} | SYSIBM;
dbs_search_condition: (NOT? dbs_predicate (SELECTIVITY dbs_integer_constant)? | LPARENCHAR dbs_search_condition RPARENCHAR) ((AND|OR) NOT?
                      (dbs_predicate | dbs_search_condition))* ;
dbs_seclabel_name: IDENTIFIER {validateLength($IDENTIFIER.text, "security label", 8);};
dbs_sequence_name: T=dbs_sql_identifier {validateLength($T.text, "sequence name", 128);};
dbs_servauth_value: NONNUMERICLITERAL;
dbs_simple_when_clause: (WHEN (dbs_basic_predicate | dbs_expressions) THEN (dbs_result_expression1 | NULL))+;
dbs_smallint: T=dbs_integer_constant {if(!(Integer.parseInt($T.text) > -2 && Integer.parseInt($T.text) < 100)) { notifyErrorListeners($T.text+" not allowed. Values must range from -1 to 99");}};//MINUSCHAR? SINGLEDIGITLITERAL SINGLEDIGITLITERAL?;// java ref - -1 to 99
dbs_specific_name: T=dbs_sql_identifier {validateLength($T.text, "specific name", 128);};
dbs_sql_condition_name: T=dbs_generic_name {validateLength($T.text, "SQL condition name", 128);}; // No particular spec found in doc. Specifies the name of the condition.
dbs_sql_control_statement: dbs_control_statement;
dbs_sql_parameter_name: T=dbs_sql_parameter_name_rule {validateLength($T.text, "SQL parameter name", 128);};
dbs_sql_parameter_name_rule: COLONCHAR? dbs_generic_name;
dbs_sql_variable_name: dbs_sql_parameter_name | ASTERISKCHAR;
dbs_sqlstate_string_constant: NONNUMERICLITERAL;
dbs_statement_name: T=dbs_generic_name {validateLength($T.text, "statement name", 128);};
dbs_stogroup_name: T=dbs_sql_identifier {validateLength($T.text, "storage group name", 128);};
dbs_string_constant: dbs_binary_string_constant | dbs_character_string_constant | dbs_graphic_string_constant | NONNUMERICLITERAL;
dbs_string_expression: DOUBLEQUOTE (dbs_allocate | dbs_alter | dbs_associate | dbs_comment | dbs_commit | dbs_create | dbs_declare_global |
  dbs_delete | dbs_drop | dbs_explain | dbs_free | dbs_grant |dbs_hold |dbs_insert | dbs_label | dbs_lock | dbs_merge | dbs_refresh | dbs_release|
  dbs_rename | dbs_revoke | dbs_rollback | dbs_savepoint | dbs_set | dbs_signal |dbs_truncate | dbs_update) DOUBLEQUOTE; // ref- https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_sql_executeimmediate.html
dbs_synonym: T=dbs_sql_identifier {validateLength($T.text, "synonym name", 128);};
dbs_table_identifier: dbs_sql_identifier;
dbs_table_name: T=dbs_sql_identifier {validateLength($T.text, "table name", 128);};
dbs_table_reference : dbs_single_table_ref | dbs_single_view_ref | dbs_nested_table_expression | dbs_data_change_table_ref | dbs_table_function_ref |
 dbs_table_locator_ref | dbs_xmltable_expression | dbs_collection_derived_table;
dbs_single_table_ref : dbs_table_name dbs_period_specification* dbs_correlation_clause?;
dbs_period_specification : FOR (SYSTEM_TIME | BUSINESS_TIME) (AS OF dbs_value | FROM dbs_value TO dbs_value  | BETWEEN dbs_value AND dbs_value);
dbs_correlation_clause : AS? dbs_correlation_name (LPARENCHAR dbs_column_name (COMMACHAR dbs_column_name)* RPARENCHAR)?;
dbs_single_view_ref : dbs_single_table_ref;
dbs_nested_table_expression : TABLE? LPARENCHAR dbs_fullselect RPARENCHAR dbs_correlation_clause?;
dbs_data_change_table_ref : (FINAL TABLE LPARENCHAR dbs_insert RPARENCHAR | (FINAL | OLD) TABLE LPARENCHAR dbs_update RPARENCHAR |
 OLD TABLE LPARENCHAR dbs_delete RPARENCHAR | FINAL TABLE LPARENCHAR dbs_merge RPARENCHAR) dbs_correlation_clause?;
dbs_table_function_ref : TABLE LPARENCHAR  dbs_function_name LPARENCHAR ((dbs_expression | TABLE dbs_transition_table_name) (COMMACHAR (dbs_expression |
                        TABLE dbs_transition_table_name))*)* RPARENCHAR dbs_table_udf_cardinality_clause? RPARENCHAR (dbs_correlation_clause | dbs_type_correlation_clause)?;
dbs_table_udf_cardinality_clause : CARDINALITY dbs_integer_constant | CARDINALITY MULTIPLIER dbs_numeric_constant;
dbs_type_correlation_clause : AS? dbs_correlation_name LPARENCHAR (dbs_column_name dbs_insert_data_type (COMMACHAR dbs_column_name dbs_insert_data_type)*) RPARENCHAR;
dbs_table_locator_ref : TABLE LPARENCHAR dbs_rs_locator_variable LIKE dbs_table_name RPARENCHAR dbs_correlation_name?;
dbs_xmltable_expression : dbs_xmltable_function dbs_correlation_clause?;
dbs_xmltable_function : XMLTABLE LPARENCHAR (dbs_xml_namespace_declaration COMMACHAR)? dbs_row_query_expression_constant (PASSING (BY REF)?
                        dbs_row_xquery_argument (COMMACHAR dbs_row_xquery_argument)*)? (COLUMNS (dbs_xml_table_regular_column_defn |
                        dbs_xml_table_ordinality_column_defn) (COMMACHAR (dbs_xml_table_regular_column_defn | dbs_xml_table_ordinality_column_defn))* RPARENCHAR)?;
dbs_xml_namespace_args : dbs_namespace_uri AS dbs_namespace_prefix | DEFAULT  dbs_namespace_uri | NO DEFAULT;
dbs_namespace_uri : NONNUMERICLITERAL;
dbs_namespace_prefix : NONNUMERICLITERAL;
dbs_xquery_context_item_expression : dbs_generic_name ;
dbs_xquery_variable_expression : dbs_expression;
dbs_xml_namespace_declaration : XMLNAMESPACES LPARENCHAR  dbs_xml_namespace_args (COMMACHAR dbs_xml_namespace_args)* RPARENCHAR;
dbs_row_query_expression_constant: NONNUMERICLITERAL; //  must not contain an empty string or a string of all blanks.
dbs_column_xquery_expression_constant: NONNUMERICLITERAL; // must not be an empty string or a string of all blanks
dbs_row_xquery_argument : dbs_xquery_context_item_expression | dbs_xquery_variable_expression AS (NONNUMERICLITERAL | IDENTIFIER) (BY REF)?;
dbs_xml_table_regular_column_defn : dbs_column_name dbs_insert_data_type (column_def_clause | PATH dbs_column_xquery_expression_constant)?;
dbs_xml_table_ordinality_column_defn: dbs_column_name FOR ORDINALITY;
dbs_collection_derived_table :  UNNEST LPARENCHAR (dbs_ordinary_array_expression (COMMACHAR dbs_ordinary_array_expression)* | dbs_assosiative_array_expression) RPARENCHAR (WITH ORDINALITY)? dbs_correlation_clause?;
dbs_ordinary_array_expression : IDENTIFIER;
dbs_assosiative_array_expression : NONNUMERICLITERAL;
dbs_joined_table : (dbs_table_reference (INNER | (LEFT | RIGHT | FULL) OUTER?)? JOIN dbs_table_reference ON dbs_join_condition | dbs_table_reference CROSS JOIN dbs_table_reference | LPARENCHAR dbs_joined_table RPARENCHAR);
dbs_join_condition: dbs_inner_left_outer_join | dbs_full_join_expression;
dbs_inner_left_outer_join : dbs_search_condition;
dbs_full_join_expression : (dbs_column_name | dbs_cast_specification) | COALESCE LPARENCHAR (dbs_column_name | dbs_cast_specification) (COMMACHAR dbs_column_name | COMMACHAR dbs_cast_specification)+ RPARENCHAR;
dbs_table_space_name: T=dbs_sql_identifier {if($T.text.split("\\.").length > 1){validateLength($T.text.split("\\.")[0], "database name", 8);validateLength($T.text.split("\\.")[1], "table space name", 8);} else {validateLength($T.text, "table space name", 8);}};
dbs_target_namespace: dbs_hostname_identifier;
dbs_token_host_variable: dbs_generic_name;
dbs_transition_table_name: dbs_sql_identifier;
dbs_transition_variable_name: COLONCHAR? dbs_generic_name;
dbs_trigger_name: T=dbs_sql_identifier {validateLength($T.text, "trigger name", 128);};
dbs_trigger_version_id: dbs_sql_identifier;
dbs_triggered_sql_statement : dbs_call | dbs_delete | dbs_select_statement_common_table_expression | dbs_fullselect | dbs_insert | dbs_merge | dbs_refresh |
                               dbs_set | dbs_signal | dbs_truncate | dbs_update | dbs_values_statement;
dbs_values_statement : VALUES  (LPARENCHAR dbs_expression (COMMACHAR dbs_expression)* RPARENCHAR | dbs_expression) ;
dbs_triggered_sql_statement_adv: dbs_call | dbs_delete | dbs_get | dbs_insert | dbs_merge | dbs_refresh |
                                 dbs_set | dbs_signal | dbs_truncate | dbs_update | dbs_values_into;
dbs_triggered_sql_statement_basic: dbs_triggered_sql_statement;
dbs_type_name: IDENTIFIER | DOCUMENT;
dbs_value: db2sql_data_value;
dbs_variable : ( dbs_host_variable | dbs_transition_variable_name | dbs_sql_variable_name | dbs_global_variable_name ) INTEGERLITERAL*;
dbs_variable_name: dbs_sql_identifier;
dbs_version_id: dbs_hostname_identifier | FILENAME | NONNUMERICLITERAL;
dbs_version_name: IDENTIFIER | FILENAME;
dbs_view_name: dbs_hostname_identifier? T=dbs_sql_identifier {validateLength($T.text, "view name", 128);};
dbs_volume_id: IDENTIFIER;
dbs_pieceSize : IDENTIFIER {if(!$IDENTIFIER.text.matches("\\d+[MmGgKk]")) { notifyErrorListeners( $IDENTIFIER.text+" not allowed. Piecesize should be in KB,MB or GB.");}};
dbs_sql_identifier: NONNUMERICLITERAL | IDENTIFIER | FILENAME | FILENAME (DOT IDENTIFIER)* | DSNDB04 | TRANSACTION | RECORDS;

dbs_integer0: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "0");};
dbs_integer1: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "1");};
dbs_integer2: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "2");};
dbs_integer4: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "4");};
dbs_integer5: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "5");};
dbs_integer6: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "6");};
dbs_integer8: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "8");};
dbs_integer12: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "12");};
dbs_integer15: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "15");};
dbs_integer16: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "16");};
dbs_integer31: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "31");};
dbs_integer34: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "34");};
dbs_integer100: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "100");};
dbs_integer256: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "256");};
dbs_integer1200: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "1200");};
dbs_integer1208: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "1208");};
dbs_integer_max: LEVEL_NUMBER  {validateValue($LEVEL_NUMBER.text, "2147483647");};
dbs_char_a: NONNUMERICLITERAL  {validateValue($NONNUMERICLITERAL.text, "A");};
dbs_char_n: NONNUMERICLITERAL  {validateValue($NONNUMERICLITERAL.text, "N");};
dbs_char_r: NONNUMERICLITERAL  {validateValue($NONNUMERICLITERAL.text, "R");};
/////// End Variables /////////////
