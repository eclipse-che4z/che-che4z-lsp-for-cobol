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

parser grammar Db2SqlExecParser;
options {tokenVocab = Db2SqlExecLexer; superClass = MessageServiceParser;}

startSqlRule : (dataDivisionRules | procedureDivisionRules | rulesAllowedInDataDivisionAndProcedureDivision)+ EOF;

/*Allowable SQL statements for COBOL program specific dvisions or sections*/
dataDivisionRules: dbs_declare_variable+ | rulesAllowedInWorkingStorageAndLinkageSection;

procedureDivisionRule: dbs_allocate
    | dbs_alter
    | dbs_associate
    | dbs_call
    | dbs_close
    | dbs_comment
    | dbs_commit
    | dbs_connect
    | dbs_create
    | dbs_declare
    | dbs_delete
    | dbs_describe
    | dbs_drop
    | dbs_exchange
    | dbs_execute
    | dbs_explain
    | dbs_fetch
    | dbs_free
    | dbs_get_diagnostics_statement
    | dbs_grant
    | dbs_hold
    | dbs_insert
    | dbs_label
    | dbs_lock
    | dbs_merge
    | dbs_open
    | dbs_prepare
    | dbs_refresh
    | dbs_release
    | dbs_rename
    | dbs_revoke
    | dbs_rollback
    | dbs_savepoint
    | dbs_select_unpack_function_invocation
    | dbs_with_clause_for_select?
        (
        (dbs_value_clause dbs_offset_clause? | LPARENCHAR dbs_fullselect RPARENCHAR dbs_full_select_base_suffix) dbs_fullselect_suffix*
         | dbs_select_clause (dbs_subselect_suffix dbs_full_select_base_suffix dbs_fullselect_suffix* |  dbs_select_into_suffix)
         )
    | dbs_set
    | dbs_signal
    | dbs_transfer
    | dbs_truncate
    | dbs_update
    | dbs_values
    ;

procedureDivisionRules: (procedureDivisionRule dbs_semicolon_end?)+;

rulesAllowedInDataDivisionAndProcedureDivision: ((dbs_declare_cursor | dbs_whenever | dbs_declare_table | dbs_include | DECLARE dbs_declare_statement) dbs_semicolon_end?)+;

rulesAllowedInWorkingStorageAndLinkageSection: ((dbs_begin | dbs_end | dbs_include_sqlca | dbs_include_sqlda) dbs_semicolon_end?)+;

//used in working-storage section of cobol program
dbs_declare_variable: DECLARE dbs_host_variable (dbs_comma_separator dbs_host_variable)*
    VARIABLE (
        CCSID (dbs_integer_constant | (EBCDIC|ASCII|UNICODE) dbs_declare_variable_for?) | dbs_declare_variable_for
    )? dbs_semicolon_end?;

dbs_declare_variable_for: FOR (SBCS|MIXED|BIT) DATA;

/*ALLOCATE CURSOR */
dbs_allocate: ALLOCATE dbs_cursor_name CURSOR FOR RESULT SET dbs_host_variable;

/*ALTER (all) */
dbs_alter: ALTER ( dbs_alter_database
                 | dbs_alter_function
                 | dbs_alter_index
                 | dbs_alter_mask
                 | dbs_alter_permission
                 | dbs_alter_procedure
                 | dbs_alter_sequence
                 | dbs_alter_stogroup
                 | dbs_alter_table
                 | dbs_alter_tablespace
                 | dbs_alter_trigger
                 | dbs_alter_trusted
                 | dbs_alter_view );

/*ALTER DATABASE */
dbs_alter_database: DATABASE dbs_database_name (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | STOGROUP dbs_stogroup_name | CCSID INTEGERLITERAL)+;

/*ALTER FUNCTION */
dbs_alter_function: (dbs_alter_function_external | dbs_alter_function_compiled | dbs_alter_function_inline | dbs_alter_function_sqlTable);
dbs_alter_function_sqlTable : SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((common_built_in_type_source |
                              dbs_distinct_type_name) (dbs_comma_separator (common_built_in_type_source | dbs_distinct_type_name))*)? RPARENCHAR)?
                              RESTRICT dbs_alter_function_inlineopts;
dbs_alter_function_external: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR (ext_data_type (AS LOCATOR)? (dbs_comma_separator ext_data_type (AS LOCATOR)?)*)? RPARENCHAR)?) (EXTERNAL NAME dbs_external_program_name | dbs_options_list_ext_common_in_create_alter)+;
dbs_alter_function_inline: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR ((common_built_in_type_source | XML | dbs_distinct_type_name) (dbs_comma_separator (common_built_in_type_source |
                            XML | dbs_distinct_type_name))*)? RPARENCHAR)?) dbs_alter_function_inlineopts; /*this is for both "inlined SQL scalar" and "SQL table" as they are basically identical - only two extra options in "table" */
dbs_alter_function_inlineopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | (CONTAINS SQL | READS SQL DATA) | STATIC DISPATCH | CALLED ON NULL INPUT | NOT? SECURED | INHERIT SPECIAL REGISTERS | CARDINALITY INTEGERLITERAL)+; /*random ordering req */

dbs_alter_function_compiled: (SPECIFIC FUNCTION dbs_specific_name | FUNCTION dbs_function_name (LPARENCHAR (dbs_generic_name (common_built_in_type_source | XML | data_type_arr_or_distinct) (dbs_comma_separator dbs_generic_name (common_built_in_type_source |
                             XML | data_type_arr_or_distinct))*)? RPARENCHAR)?) (dbs_alter_function_alter | dbs_alter_function_activate | dbs_alter_function_regen | dbs_alter_function_drop);
dbs_alter_function_alter: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id) dbs_alter_function_compopts;
dbs_alter_function_activate: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_function_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id) (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?;
dbs_alter_function_drop: DROP VERSION dbs_routine_version_id;

dbs_alter_function_compopts: (NOT? DETERMINISTIC | NO? EXTERNAL ACTION | ((READS|MODIFIES) SQL DATA | CONTAINS SQL) | (CALLED|RETURNS NULL) ON NULL INPUT | STATIC DISPATCH | (ALLOW|DISALLOW) PARALLEL |
                             (DISALLOW|ALLOW|DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT INTEGERLITERAL) | (INHERIT|DEFAULT) SPECIAL REGISTERS |
                             WLM ENVIRONMENT FOR DEBUG MODE dbs_sql_identifier | CURRENT DATA (YES|NO) | option_degree | CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) |
                             DYNAMICRULES (RUN|BIND|DEFINEBIND|DEFINERUN|INVOKEBIND|INVOKERUN) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) | (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE |
                             ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SESSION? USER | SYSTEM PATH) (dbs_comma_separator (dbs_schema_name | SESSION? USER | SYSTEM PATH))* |
                             QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) | ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) |
                             VALIDATE (RUN|BIND) | ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                             NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | (OFF | CONCENTRATE STATEMENTS (WITH LITERALS)?))+; /*random ordering req*/
dbs_nnnn_m: NUMERICLITERAL {validateTokenWithRegex($NUMERICLITERAL.text, "^\\d{4}\\.\\d$", "a DECIMAL(5,1) numeric-constant is only allowed");};
/*ALTER INDEX */
dbs_alter_index: INDEX dbs_index_name (REGENERATE (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)? /*included as a separate piped option due to nb 2 in IBM doc*/ |
                 ( dbs_index_create_alter_opts_common | dbs_alter_index_add)+ dbs_alter_index_alter?);
dbs_alter_index_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) INTEGERLITERAL | ERASE (YES|NO))+;
dbs_alter_index_add: ADD (COLUMN LPARENCHAR dbs_column_name_without_alias (ASC | DESC | RANDOM)? RPARENCHAR | INCLUDE COLUMN LPARENCHAR dbs_column_name RPARENCHAR);
dbs_alter_index_alter: dbs_alter_index_loop (dbs_comma_separator dbs_alter_index_loop)*;
dbs_alter_index_loop: ALTER PARTITION INTEGERLITERAL dbs_alter_index_ending? (dbs_alter_index_using | free_specification | gbpcache_specification | DSSIZE dbs_dsize_parameter)*;
dbs_alter_index_ending:  ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (dbs_comma_separator (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?;

/*ALTER MASK */
dbs_alter_mask: MASK dbs_mask_name (ENABLE | DISABLE | REGENERATE (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?);

/*ALTER PERMISSION */
dbs_alter_permission: PERMISSION dbs_permission_name (ENABLE | DISABLE | REGENERATE (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?);

/*ALTER PROCEDURE */
dbs_alter_procedure: PROCEDURE dbs_procedure_name (dbs_procedure_alter_external
                    | dbs_alter_procedure_alter_sql_native
                    | dbs_alter_procedure_activate_sql_native
                    | dbs_alter_procedure_regen_sql_native
                    | dbs_alter_procedure_drop_sql_native);

dbs_procedure_alter_external: dbs_option_list_proc_ext_altr_create+;
dbs_alter_procedure_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_procedure_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL)? RPARENCHAR)?;
dbs_alter_procedure_bit_float: (FLOAT (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_procedure_bit_decfloat: DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)?;
dbs_alter_procedure_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_procedure_bit_varchara | LARGE OBJECT dbs_alter_procedure_bit_cloba | LPARENCHAR INTEGERLITERAL RPARENCHAR dbs_alter_procedure_bit_charopts);
dbs_alter_procedure_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA)? (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_varchar: VARCHAR dbs_alter_procedure_bit_varchara;
dbs_alter_procedure_bit_varchara: LPARENCHAR INTEGERLITERAL RPARENCHAR dbs_alter_procedure_bit_charopts;
dbs_alter_procedure_bit_cloba: (LPARENCHAR kmg_blob_parameter RPARENCHAR)? (FOR (SBCS | MIXED ) DATA)? (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_graphic: (GRAPHIC (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | VARGRAPHIC LPARENCHAR INTEGERLITERAL RPARENCHAR | DBCLOB (LPARENCHAR kmg_blob_parameter RPARENCHAR)?) (CCSID oneof_encoding)?;
dbs_alter_procedure_bit_timestamp: TIMESTAMP (LPARENCHAR INTEGERLITERAL RPARENCHAR)? option_timezone?;

dbs_alter_procedure_alter_sql_native: ALTER? (ACTIVE VERSION | ALL VERSIONS | VERSION dbs_routine_version_id)? dbs_alter_procedure_options;
dbs_alter_procedure_activate_sql_native: ACTIVATE VERSION dbs_routine_version_id;
dbs_alter_procedure_regen_sql_native: REGENERATE (ACTIVE VERSION | VERSION dbs_routine_version_id)? (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?;
dbs_alter_procedure_drop_sql_native: DROP VERSION dbs_routine_version_id;
dbs_alter_procedure_options: (NOT? DETERMINISTIC | ((MODIFIES|READS) SQL DATA | CONTAINS SQL) | CALLED ON NULL INPUT | DYNAMIC RESULT SETS INTEGERLITERAL | (DISALLOW|ALLOW|DISABLE) DEBUG MODE |
                                PARAMETER CCSID (ASCII|EBCDIC|UNICODE) | QUALIFIER dbs_schema_name | PACKAGE OWNER dbs_authorization_name | ASUTIME (NO LIMIT | LIMIT INTEGERLITERAL) | ((COMMIT ON RETURN (YES|NO)) |
                                AUTONOMOUS) | (INHERIT|DEFAULT) SPECIAL REGISTERS | WLM ENVIRONMENT FOR DEBUG MODE dbs_sql_identifier | (DEFER|NODEFER) PREPARE | CURRENT DATA (YES|NO) | option_degree |
                                CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND|DEFINERUN|DEFINEBIND|INVOKERUN|INVOKEBIND) | APPLICATION ENCODING SCHEME (ASCII|EBCDIC|UNICODE) |
                                (WITH|WITHOUT) EXPLAIN | (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | (WITH|WITHOUT) KEEP DYNAMIC | OPTHINT (DOUBLEQUOTE|dbs_string_constant) | SQL PATH (dbs_schema_name | SYSTEM PATH |
                                SESSION? USER) (dbs_comma_separator (dbs_schema_name | SYSTEM PATH | SESSION? USER))* | RELEASE AT (COMMIT | DEALLOCATE) | QUERY ACCELERATION (NONE|ELIGIBLE|ALL|ENABLE (WITH FAILBACK)?) | GET_ACCEL_ARCHIVE (YES|NO) |
                                ACCELERATION WAITFORDATA dbs_nnnn_m | ACCELERATOR dbs_accelerator_name | REOPT (NONE|ALWAYS|ONCE) | VALIDATE (RUN|BIND) |
                                ROUNDING (DEC_ROUND_CEILING|DEC_ROUND_DOWN|DEC_ROUND_FLOOR|DEC_ROUND_HALF_DOWN|DEC_ROUND_HALF_EVEN|DEC_ROUND_HALF_UP|DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                                option_decimal | FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) |
                                ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value | CONCENTRATE STATEMENTS (OFF|WITH LITERALS))*; /*random ordering req */
/*ALTER SEQUENCE */
dbs_alter_sequence: SEQUENCE dbs_sequence_name dbs_alter_sequence_loop (dbs_comma_separator? dbs_alter_sequence_loop)*;
dbs_alter_sequence_loop: (RESTART (WITH INTEGERLITERAL)? | dbs_sequence_create_alter_opts);

/*ALTER STOGROUP */
dbs_alter_stogroup: STOGROUP dbs_stogroup_name ((ADD|REMOVE) VOLUMES LPARENCHAR dbs_volume_loop RPARENCHAR | dbs_volume_cat)+;//*ALTER TABLE */
dbs_alter_table: TABLE dbs_table_name (dbs_alter_table_add | dbs_alter_table_alter | dbs_alter_table_rename | dbs_alter_table_drop | dbs_alter_table_rotate | DATA CAPTURE (NONE|CHANGES) | NOT? VOLATILE CARDINALITY? |
                (ACTIVATE|DEACTIVATE) (ROW|COLUMN) ACCESS CONTROL | APPEND (NO|YES) | AUDIT (NONE|CHANGES|ALL) | VALIDPROC (dbs_program_name | NULL)
                | ENABLE ARCHIVE USE dbs_table_name | DISABLE ARCHIVE | NO KEY LABEL | KEY LABEL dbs_sql_identifier)+;
dbs_alter_table_add: ADD (COLUMN? columnn_def | check_constraint | period_def | PARTITION (BY dbs_alter_table_partitioning | partitioning_element_clause?) |
                     SYSTEM? VERSIONING USE HISTORY TABLE dbs_alias_name (ON DELETE ADD EXTRA ROW)? | (MATERIALIZED? QUERY)? dbs_alter_table_mq | CLONE dbs_clone_table_name | RESTRICT ON DROP)
                     | ADD? (unique_constraint | referential_constraint)
                     ;
dbs_alter_table_bit: (dbs_alter_table_bit_int | dbs_alter_table_bit_decimal | dbs_alter_table_bit_float | dbs_alter_table_bit_decfloat | dbs_alter_table_bit_char | dbs_alter_table_bit_clob | dbs_alter_table_bit_varchar |
                     dbs_alter_table_bit_graphic | dbs_alter_table_bit_binary | DATE | TIME | dbs_alter_table_bit_timestamp | ROWID | dbs_alter_table_bit_xml);
dbs_alter_table_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_alter_table_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL)? RPARENCHAR)?;
dbs_alter_table_bit_float: (FLOAT (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_alter_table_bit_decfloat: DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)?;
dbs_alter_table_bit_char: (CHARACTER | CHAR) (VARYING dbs_alter_table_bit_varchara | LARGE OBJECT dbs_alter_table_bit_cloba | LPARENCHAR INTEGERLITERAL RPARENCHAR dbs_alter_table_bit_charopts);
dbs_alter_table_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA | CCSID dbs_integer1208)?;
dbs_alter_table_bit_varchar: VARCHAR dbs_alter_table_bit_varchara;
dbs_alter_table_bit_varchara: LPARENCHAR INTEGERLITERAL RPARENCHAR dbs_alter_table_bit_charopts;
dbs_alter_table_bit_clob: CLOB dbs_alter_table_bit_cloba;
dbs_alter_table_bit_cloba: (LPARENCHAR kmg_blob_parameter RPARENCHAR)? dbs_alter_table_bit_charopts;
dbs_alter_table_bit_graphic: (GRAPHIC (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | VARGRAPHIC LPARENCHAR INTEGERLITERAL RPARENCHAR | DBCLOB (LPARENCHAR kmg_blob_parameter RPARENCHAR)?) (CCSID dbs_integer1200)?;
dbs_alter_table_bit_binary: (BINARY (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR INTEGERLITERAL RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR kmg_blob_parameter RPARENCHAR)?);
dbs_alter_table_bit_timestamp: TIMESTAMP (LPARENCHAR INTEGERLITERAL RPARENCHAR)? option_timezone?;
dbs_alter_table_bit_xml: XML (LPARENCHAR XMLSCHEMA dbs_alter_table_bit_xmlspec (ELEMENT dbs_sql_identifier)? (dbs_comma_separator dbs_alter_table_bit_xmlspec (ELEMENT dbs_sql_identifier)?)* RPARENCHAR)?;
dbs_alter_table_bit_xmlspec: (ID dbs_registered_xml_schema_name | (URL dbs_host_variable | NO NAMESPACE) (LOCATION dbs_schema_location)?);
dbs_alter_table_defclause: WITH? DEFAULT (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL | dbs_cast_function_name LPARENCHAR (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL) RPARENCHAR)?;
common_reference_clause: REFERENCES dbs_table_name (LPARENCHAR dbs_column_name_without_alias  (PERIOD BUSINESS_TIME)?  (dbs_comma_separator dbs_column_name_without_alias (PERIOD BUSINESS_TIME)? )* RPARENCHAR)? (ON DELETE (RESTRICT | NO ACTION | CASCADE |
                            SET NULL))? (NOT? ENFORCED)? (ENABLE QUERY OPTIMIZATION)?;
generated_clause: GENERATED dbs_alter_table_generated_options;
dbs_alter_table_generated_options: ALWAYS? dbs_alter_table_generated_options_always_subclause
                                    | BY DEFAULT dbs_generated_opts;
dbs_alter_table_generated_options_always_subclause: dbs_generated_opts
                                    | as_row_transaction_start_id_clause
                                    | as_row_transaction_timestamp_clause
                                    | as_generated_expression_clause
                                    |
                                    ;
dbs_generated_opts: common_as_identity_clause | as_row_change_timestamp_clause;
common_as_identity_clause: AS IDENTITY (LPARENCHAR dbs_alter_table_asid_loop (dbs_comma_separator? dbs_alter_table_asid_loop)* RPARENCHAR)?;
dbs_alter_table_asid_loop: (START WITH INTEGERLITERAL | INCREMENT BY INTEGERLITERAL | NO MINVALUE | MINVALUE INTEGERLITERAL | NO? CYCLE | NO CACHE | CACHE INTEGERLITERAL | NO? ORDER);
dbs_alter_table_partitioning: RANGE? partitioning_clause_arguments;
dbs_alter_table_partition: PARTITION INTEGERLITERAL ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (dbs_comma_separator (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE?;
dbs_alter_table_mq: LPARENCHAR dbs_fullselect RPARENCHAR refreshable_table_options;
dbs_alter_table_alter: ALTER (COLUMN? dbs_alter_table_colalt | dbs_alter_table_partition | MATERIALIZED? QUERY dbs_alter_table_mq | PARTITIONING TO PARTITION BY dbs_alter_table_partitioning);
dbs_alter_table_colalt: dbs_column_name_without_alias (DROP DEFAULT | dbs_alter_table_idalt | SET (DATA TYPE dbs_alter_table_bit (INLINE LENGTH INTEGERLITERAL)? | dbs_alter_table_defclause | INLINE LENGTH INTEGERLITERAL |
                        GENERATED ((ALWAYS | BY DEFAULT) dbs_alter_table_idalt? | ALWAYS? (AS TRANSACTION START ID | AS ROW (BEGIN|START|END)))));
dbs_alter_table_idalt: (RESTART (WITH INTEGERLITERAL)? | SET (INCREMENT BY INTEGERLITERAL | NO MINVALUE | MINVALUE INTEGERLITERAL | NO? CYCLE | NO CACHE | CACHE dbs_integer_constant | NO? ORDER))+;
dbs_alter_table_rename: RENAME COLUMN dbs_column_name_without_alias TO dbs_column_name_without_alias;
dbs_alter_table_drop: DROP (COLUMN? dbs_column_name_without_alias RESTRICT | PRIMARY KEY | (UNIQUE|FOREIGN KEY|CHECK|CONSTRAINT) dbs_constraint_name | SYSTEM? VERSIONING | MATERIALIZED? QUERY | CLONE | RESTRICT ON DROP);
dbs_alter_table_rotate: ROTATE PARTITION (FIRST | INTEGERLITERAL) TO LAST ENDING AT? LPARENCHAR (dbs_constant | MAXVALUE | MINVALUE) (dbs_comma_separator (dbs_constant | MAXVALUE | MINVALUE))* RPARENCHAR INCLUSIVE? RESET;

/*ALTER TABLESPACE */
dbs_alter_tablespace: TABLESPACE (dbs_database_name DOT_FS)? dbs_table_space_name (dbs_alter_tablespace_unique_options |  dbs_alter_tablespace_mul_opts);
dbs_alter_tablespace_unique_options: DROP PENDING CHANGES | DSSIZE dbs_dsize_parameter | SEGSIZE INTEGERLITERAL | PAGENUM RELATIVE | dbs_alter_tablespace_move;
dbs_alter_tablespace_mul_opts: (
                                 dbs_create_alter_tablespace_opts_common
                                 | LOCKSIZE (TABLE | LOB)
                                 | MAXPARTITIONS dbs_maxPartition
                                 | MEMBER CLUSTER yes_or_no
                                 | PAGENUM RELATIVE
                                 | CCSID INTEGERLITERAL
                                 | dbs_alter_tablespace_using
                                )+ dbs_alter_tablespace_alter?;

dbs_alter_tablespace_move: MOVE TABLE dbs_table_name TO TABLESPACE (dbs_database_name DOT_FS)? dbs_table_space_name;
dbs_alter_tablespace_using: (USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name) | (PRIQTY | SECQTY) (INTEGERLITERAL |  dbs_minus_one) | ERASE (YES|NO))+;
dbs_alter_tablespace_free: (FREEPAGE INTEGERLITERAL | PCTFREE dbs_smallint? (FOR UPDATE dbs_smallint)?)+;
dbs_alter_tablespace_gbpcache: GBPCACHE (CHANGED | ALL | SYSTEM | NONE);
dbs_alter_tablespace_alter: (ALTER PARTITION INTEGERLITERAL dbs_alter_tablespace_loop)+;
dbs_alter_tablespace_loop: (dbs_alter_tablespace_using | dbs_alter_tablespace_free | dbs_alter_tablespace_gbpcache | compress_opt | DSSIZE dbs_dsize_parameter | TRACKMOD (YES|NO))+;
/*ALTER TRIGGER */
dbs_alter_trigger: TRIGGER dbs_trigger_name (dbs_alter_trigger_alter
                                           | dbs_alter_trigger_activate
                                           | dbs_alter_trigger_regen
                                           | dbs_alter_trigger_drop);
dbs_alter_trigger_alter: ALTER? (ACTIVE VERSION | VERSION dbs_trigger_version_id)? dbs_alter_trigger_options;
dbs_alter_trigger_options: ((DISALLOW | ALLOW | DISABLE) DEBUG MODE | QUALIFIER dbs_schema_name | ASUTIME (NO LIMIT | LIMIT INTEGERLITERAL) | WLM ENVIRONMENT FOR DEBUG MODE dbs_sql_identifier | CURRENT DATA (YES|NO) |
                            CONCURRENT ACCESS RESOLUTION (USE CURRENTLY COMMITTED | WAIT FOR OUTCOME) | DYNAMICRULES (RUN|BIND) | APPLICATION ENCODING SCHEME oneof_encoding | (WITH|WITHOUT) EXPLAIN |
                            (WITH|WITHOUT) IMMEDIATE WRITE | ISOLATION LEVEL (CS|RS|RR|UR) | OPTHINT (DOUBLEQUOTE | dbs_string_constant) | SQL PATH (SYSTEM PATH | SESSION? USER | dbs_schema_name) (dbs_comma_separator (SYSTEM PATH |
                            SESSION? USER | dbs_schema_name))* | RELEASE AT (COMMIT|DEALLOCATE) | ROUNDING (DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN |
                            DEC_ROUND_HALF_UP | DEC_ROUND_UP) | DATE FORMAT (ISO|EUR|USA|JIS|LOCAL) | DECIMAL LPARENCHAR dbs_decimal_15_31 (dbs_comma_separator INTEGERLITERAL)? RPARENCHAR | TIME FORMAT (ISO|EUR|USA|JIS|LOCAL) |
                            FOR UPDATE CLAUSE (REQUIRED|OPTIONAL) | NOT? SECURED | BUSINESS_TIME SENSITIVE (YES|NO) | SYSTEM_TIME SENSITIVE (YES|NO) | ARCHIVE SENSITIVE (YES|NO) | APPLCOMPAT dbs_applcompat_value |
                            CONCENTRATE STATEMENTS (OFF | WITH LITERALS))*; /*random ordering req */
dbs_alter_trigger_activate: ACTIVATE VERSION dbs_trigger_version_id;
dbs_alter_trigger_regen: REGENERATE (ACTIVE VERSION | VERSION dbs_trigger_version_id)? (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?;
dbs_alter_trigger_drop: DROP VERSION dbs_trigger_version_id;

/*ALTER TRUSTED CONTEXT */
dbs_alter_trusted: TRUSTED CONTEXT dbs_context_name (dbs_alter_trusted_alter | dbs_alter_trusted_add | dbs_alter_trusted_drop | dbs_alter_trusted_replace)+;
dbs_alter_trusted_alter: ALTER (SYSTEM AUTHID dbs_authorization_name | dbs_trusted_context_create_alter_opts)+;
dbs_alter_trusted_add: ADD (dbs_alter_trusted_add_attributes | dbs_alter_trusted_add_use);
dbs_alter_trusted_add_attributes: ATTRIBUTES LPARENCHAR (jobname_opt_loop_body (dbs_comma_separator jobname_opt_loop_body)* | attribute_addr_serverauth (dbs_comma_separator attribute_addr_serverauth)* RPARENCHAR);
dbs_alter_trusted_add_use: USE FOR dbs_alter_trusted_useloop (dbs_comma_separator dbs_alter_trusted_useloop)*;
dbs_alter_trusted_useloop: (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name) trusted_context_user_options? | PUBLIC (WITH | WITHOUT) AUTHENTICATION;
dbs_alter_trusted_drop: DROP (dbs_alter_trusted_add_attributes | dbs_alter_trusted_drop_use);
dbs_alter_trusted_drop_use: USE FOR (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC) (dbs_comma_separator (dbs_authorization_name | EXTERNAL SECURITY PROFILE dbs_profile_name | PUBLIC))*;
dbs_alter_trusted_replace: REPLACE dbs_alter_trusted_add_use;

/*ALTER VIEW */
dbs_alter_view: VIEW dbs_view_name REGENERATE (USING (APPLICATION COMPATIBILITY | APPLCOMPAT) dbs_applcompat_value)?;

/*ASSOCIATE LOCATORS */
dbs_associate: ASSOCIATE (RESULT SET)? (LOCATOR | LOCATORS) LPARENCHAR dbs_host_variable (dbs_comma_separator dbs_host_variable)* RPARENCHAR
               WITH PROCEDURE (dbs_procedure_name | dbs_host_variable);


/*BEGIN DECLARE SECTION */
dbs_begin: BEGIN DECLARE SECTION;

/*CALL */
dbs_call: CALL (dbs_procedure_name | dbs_host_variable) (USING DESCRIPTOR dbs_descriptor_name | LPARENCHAR dbs_call_loop? RPARENCHAR)?;
dbs_call_loop: (dbs_expression | NULL | TABLE dbs_transition_table_name) (dbs_comma_separator (dbs_expression | NULL | TABLE dbs_transition_table_name))*;

/*CLOSE */
dbs_close: CLOSE dbs_cursor_name;

/*COMMENT */
dbs_comment: COMMENT ON (dbs_comment_multiple_column_list | (dbs_comment_alias_designator | dbs_comment_column |
             dbs_comment_function | dbs_comment_index | dbs_comment_package | dbs_comment_plan | dbs_comment_procedure |
             dbs_comment_role | dbs_comment_sequence | dbs_comment_table | dbs_comment_trigger | dbs_comment_trusted |
             dbs_comment_type | dbs_comment_mask | dbs_comment_permission | dbs_comment_variable) IS dbs_string_constant);
dbs_comment_multiple_column_list: dbs_alias_name LPARENCHAR dbs_column_name_without_alias IS
                                  dbs_string_constant_column_list (dbs_comma_separator dbs_column_name_without_alias IS dbs_string_constant_column_list)* RPARENCHAR;
dbs_string_constant_column_list: CHAR_STRING_LITERAL_DOUBLE_QUOTE | HEXSTRING | BXSTRING | GRAPHIC_CONSTANT;
dbs_comment_alias_designator: (dbs_comment_public_alias_designator | dbs_comment_nonpub_alias_designator);
dbs_comment_public_alias_designator: PUBLIC ALIAS dbs_alias_name FOR SEQUENCE;
dbs_comment_nonpub_alias_designator: ALIAS dbs_alias_name (FOR (TABLE | SEQUENCE))?;
dbs_comment_column: COLUMN dbs_alias_name DOT_FS dbs_sql_identifier;
dbs_comment_function: dbs_comment_function_designator (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_function_designator: (FUNCTION dbs_function_name (LPARENCHAR dbs_comment_parameter_type
                                 (dbs_comma_separator dbs_comment_parameter_type)* RPARENCHAR)? | SPECIFIC FUNCTION dbs_specific_name);
dbs_comment_parameter_type: (common_built_in_type_source | data_type_arr_or_distinct) (AS LOCATOR)?;
dbs_comment_index: INDEX dbs_index_name;
dbs_comment_package: dbs_package_name (VERSION? dbs_version_id)?;
dbs_comment_plan: PLAN dbs_plan_name;
dbs_comment_procedure: PROCEDURE dbs_procedure_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_role: ROLE dbs_role_name;
dbs_comment_sequence: SEQUENCE dbs_sequence_name;
dbs_comment_table: TABLE dbs_alias_name;
dbs_comment_trigger: TRIGGER dbs_trigger_name (ACTIVE VERSION | VERSION dbs_routine_version_id)?;
dbs_comment_trusted: TRUSTED CONTEXT dbs_context_name dbs_sql_identifier;
dbs_comment_type: TYPE dbs_object_name;
dbs_comment_mask: MASK dbs_mask_name;
dbs_comment_permission: PERMISSION dbs_permission_name;
dbs_comment_variable: VARIABLE dbs_object_name;


/*COMMIT */
dbs_commit: COMMIT WORK?;

/*CONNECT */
dbs_connect: CONNECT (TO (dbs_location_name | dbs_host_variable) dbs_connect_authorization? | RESET | dbs_connect_authorization)?;
dbs_connect_authorization: USER dbs_host_variable USING dbs_host_variable;

/*CREATE (all) */
dbs_create: CREATE (dbs_create_alias
            | dbs_create_aux_table
            | dbs_create_db
            | dbs_create_function
            | dbs_create_global_temp_table
            | dbs_create_index
            | dbs_create_lob_tablespace
            | dbs_create_mask
            | dbs_create_permission
            | dbs_create_procedure_ext
            | dbs_create_role
            | dbs_create_sequence
            | dbs_create_stogroup
            | dbs_create_table
            | dbs_create_tablespace
            | dbs_create_trigger_basic
            | dbs_create_trusted_context
            | dbs_create_type_array
            | dbs_create_type_distinct
            | dbs_create_variable
            | dbs_create_view);

//CREATE ALIAS
dbs_create_alias: PUBLIC? ALIAS table_seq_alias;
table_seq_alias: dbs_alias_name FOR (SEQUENCE | TABLE?) dbs_alias_name;

//CREATE AUX TABLE
dbs_create_aux_table: (AUXILIARY | AUX) TABLE dbs_table_name IN (dbs_database_name DOT_FS)? dbs_table_space_name
                    STORES dbs_table_name (APPEND (YES|NO))? COLUMN dbs_column_name_without_alias (PART INTEGERLITERAL)?;
//CREATE DB
dbs_create_db: DATABASE dbs_database_name (BUFFERPOOL dbs_bp_name | INDEXBP dbs_bp_name | AS WORKFILE (FOR dbs_sql_identifier)? | STOGROUP (SYSDEFLT | dbs_stogroup_name) | CCSID oneof_encoding)*;//1 same clause must not be specified more than one time

//CREATE FUNCTION (ALL)
dbs_create_function: FUNCTION dbs_function_name LPARENCHAR (dbs_create_function_ext_scalar | dbs_create_function_ext_table |
                                dbs_create_function_inline_scalar | dbs_create_function_sourced );

//CREATE EXTERNAL SQL SCALAR FUNCTION
dbs_create_function_ext_scalar: (function_param_decl (dbs_comma_separator function_param_decl)*)? RPARENCHAR
                            RETURNS (common_built_in_type_source (AS LOCATOR)?  | common_built_in_type_source CAST FROM common_built_in_type_source (AS LOCATOR)?) dbs_option_list_ext;
function_param_decl: dbs_parameter_name? (ext_data_type (AS LOCATOR)? | TABLE LIKE dbs_alias_name AS LOCATOR);
ext_data_type: common_built_in_type_source | dbs_distinct_type_name;

//CREATE EXTERNAL TABLE FUNCTION
dbs_create_function_ext_table: (function_param_decl (dbs_comma_separator function_param_decl)*)? RPARENCHAR
                            RETURNS (dbs_create_function_ext_table_desc  | GENERIC TABLE) dbs_option_list_ext_table;
dbs_create_function_ext_table_desc: TABLE LPARENCHAR dbs_create_function_ext_table_body  (dbs_comma_separator  dbs_create_function_ext_table_body)* RPARENCHAR;
dbs_create_function_ext_table_body: dbs_column_name_without_alias common_built_in_type (AS LOCATOR)?;

//CREATE INLINE SQL SCALAR FUNCTION
dbs_create_function_inline_scalar: (function_param_decl (dbs_comma_separator function_param_decl)*)? RPARENCHAR
                                 (dbs_create_function_func_inl_def | WRAPPED dbs_obfuscated_statement_text);
dbs_create_function_func_inl_def: RETURNS common_built_in_type dbs_option_list_inl_def dbs_create_function_func_inl_sql_routine;
dbs_create_function_func_inl_sql_routine: RETURN (dbs_sql_identifier COLONCHAR)? (dbs_expressions | NULL | dbs_fullselect) ;

//CREATE SOURCED FUNCTION
dbs_create_function_sourced: (dbs_create_function_sourced_param_decl (dbs_comma_separator dbs_create_function_sourced_param_decl)*)? RPARENCHAR
                             RETURNS (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)? (SPECIFIC dbs_specific_name)? (PARAMETER CCSID oneof_encoding)?
                             SOURCE (dbs_function_name (LPARENCHAR (dbs_create_function_sourced_param_type (dbs_comma_separator dbs_create_function_sourced_param_type)*)? RPARENCHAR)? | SPECIFIC dbs_specific_name);
dbs_create_function_sourced_param_decl: (dbs_parameter_name)? dbs_create_function_sourced_param_type;
dbs_create_function_sourced_param_type: (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)?  | TABLE LIKE dbs_alias_name AS LOCATOR;

//CREATE GLOBAL TEMP TABLE
dbs_create_global_temp_table: GLOBAL TEMPORARY TABLE  dbs_table_name
                            (LPARENCHAR (dbs_create_global_temp_table_col_def (dbs_comma_separator dbs_create_global_temp_table_col_def)*) RPARENCHAR
                            | LIKE dbs_alias_name)
                            (CCSID oneof_encoding)?;
dbs_create_global_temp_table_col_def: dbs_column_name_without_alias  common_built_in_type4 (NOT NULL)?;

//CREATE INDEX
dbs_create_index: (UNIQUE (WHERE NOT NULL)?)? INDEX dbs_index_name ON dbs_create_index_table_def  dbs_create_index_table_other_opt;
dbs_create_index_table_def: dbs_table_name (LPARENCHAR dbs_create_index_table_def_body (dbs_comma_separator dbs_create_index_table_def_body)* (dbs_comma_separator BUSINESS_TIME  without_or_with OVERLAPS )? RPARENCHAR)?;
dbs_create_index_table_def_body: (dbs_column_name_without_alias | dbs_expression) (ASC | DESC | RANDOM)?;
dbs_create_index_table_other_opt: xml_index_specification? (INCLUDE dbs_column_name_without_alias LPARENCHAR (dbs_comma_separator dbs_column_name_without_alias)* RPARENCHAR)? (dbs_index_create_opts | dbs_index_create_alter_opts_common)*;
xml_index_specification: GENERATE (KEY | KEYS) USING XMLPATTERN CHAR_STRING_LITERAL_DOUBLE_QUOTE AS sql_data_type;
dbs_index_create_opts: PARTITIONED
              | DEFINE yes_or_no
              | (INCLUDE | EXCLUDE) NULL KEYS
              | PARTITION BY RANGE? LPARENCHAR (partition_using_specification (dbs_comma_separator  partition_using_specification)*)? RPARENCHAR
              | DEFER no_or_yes
              ;
dbs_index_create_alter_opts_common: BUFFERPOOL dbs_bp_name
        | CLOSE yes_or_no
        | COPY no_or_yes
        | DSSIZE dbs_dsize_parameter
        | PIECESIZE dbs_pieceSize
        | using_specification
        | free_specification
        | gbpcache_specification
        | NOT? CLUSTER
        | NOT? PADDED
        | COMPRESS yes_or_no;
partition_using_specification: partition_element (using_specification | free_specification | gbpcache_specification | DSSIZE dbs_dsize_parameter)*;
using_specification: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY (INTEGERLITERAL | dbs_minus_one) | SECQTY (INTEGERLITERAL | dbs_minus_one) | ERASE yes_or_no)*);
free_specification: FREEPAGE INTEGERLITERAL |  PCTFREE INTEGERLITERAL;
gbpcache_specification: GBPCACHE (CHANGED | ALL) | NONE;
partition_element: PARTITION INTEGERLITERAL (ENDING AT? partition_element_loop INCLUSIVE?)?;
partition_element_loop:  LPARENCHAR const_options (dbs_comma_separator const_options)*  RPARENCHAR;
const_options: dbs_string_constant | MAXVALUE | MINVALUE | INTEGERLITERAL;

//CREATE LOB TABLESPACE
dbs_create_lob_tablespace: LOB TABLESPACE dbs_table_space_name dbs_create_lob_tablespace_def;
dbs_create_lob_tablespace_def: (IN dbs_database_name | BUFFERPOOL dbs_bp_name | CLOSE yes_or_no | COMPRESS yes_or_no | DEFINE yes_or_no | DSSIZE dbs_dsize_parameter | gbpcache_block |
                            LOCKMAX (SYSTEM | INTEGERLITERAL) | locksize_block | NOT? LOGGED | using_block)*; /*java fix */
gbpcache_block: GBPCACHE (CHANGED | ALL | SYSTEM | NONE);
locksize_block: LOCKSIZE (ANY | LOB);
using_block: USING (VCAT dbs_catalog_name | STOGROUP dbs_stogroup_name (PRIQTY (INTEGERLITERAL | dbs_minus_one) | SECQTY (INTEGERLITERAL | dbs_minus_one) | ERASE yes_or_no?)*);

//CREATE MASK
dbs_create_mask: MASK dbs_mask_name ON dbs_table_name (AS? dbs_correlation_name)? FOR COLUMN dbs_column_name_without_alias RETURN dbs_case_expression (DISABLE | ENABLE)?;

//CREATE PERMISSION
dbs_create_permission: PERMISSION dbs_permission_name ON dbs_table_name (AS? dbs_correlation_name)? FOR ROWS WHERE dbs_search_condition ENFORCED FOR ALL ACCESS  (DISABLE | ENABLE)?;

//CREATE PROCEDURE - EXTERNAL
dbs_create_procedure_ext: (OR REPLACE)? PROCEDURE dbs_procedure_name  (LPARENCHAR dbs_create_procedure_ext_args_signature? RPARENCHAR)? dbs_option_list_proc_ext;
dbs_create_procedure_ext_args_signature: dbs_create_procedure_ext_pdecl (dbs_comma_separator dbs_create_procedure_ext_pdecl)*;
dbs_create_procedure_ext_pdecl: (IN | OUT | INOUT)? dbs_parameter_name? dbs_create_procedure_ext_ptype;
dbs_create_procedure_ext_ptype:  (common_built_in_type | dbs_distinct_type_name) (AS LOCATOR)?  | TABLE LIKE dbs_alias_name AS LOCATOR; //built-in-type change

//CREATE ROLE
dbs_create_role: ROLE dbs_role_name;

//CREATE SEQUENCE
dbs_create_sequence: SEQUENCE dbs_sequence_name dbs_create_sequence_body*;
dbs_create_sequence_body: AS (INTEGER | dbs_distinct_type_name | common_bit_int | common_bit_decimal) | START WITH INTEGERLITERAL | dbs_sequence_create_alter_opts;
dbs_sequence_create_alter_opts: (INCREMENT BY|MINVALUE|MAXVALUE) INTEGERLITERAL | NO (MINVALUE|MAXVALUE) | NO? (CYCLE|ORDER) | NO CACHE | CACHE INTEGERLITERAL;
//CREATE STOGROUP
dbs_create_stogroup: STOGROUP dbs_stogroup_name (VOLUMES LPARENCHAR dbs_volume_loop RPARENCHAR)? VCAT dbs_catalog_name dbs_volume_cat*;
dbs_volume_loop:  dbs_sql_identifier (dbs_comma_separator dbs_sql_identifier)* | SINGLEQUOTE ASTERISKCHAR SINGLEQUOTE (dbs_comma_separator SINGLEQUOTE ASTERISKCHAR SINGLEQUOTE)*;
dbs_volume_cat: DATACLAS dbs_sql_identifier| MGMTCLAS dbs_sql_identifier | STORCLAS dbs_sql_identifier | NO KEY LABEL | KEY LABEL dbs_sql_identifier;

//CREATE SYNONYM deprecated, use CREATE ALIAS

//CREATE TABLE
dbs_create_table: TABLE dbs_table_name ( LPARENCHAR dbs_create_table_elements_def (dbs_comma_separator dbs_create_table_elements_def)* RPARENCHAR | LIKE dbs_alias_name copy_options? |
    as_result_table copy_options? | materialized_query_def) dbs_create_table_data_def*;
dbs_create_table_elements_def: columnn_def | period_def | unique_constraint | referential_constraint | check_constraint;
columnn_def: dbs_column_name_without_alias (common_built_in_type_core3 | dbs_distinct_type_name )? // Data type is optional if as-row-change-timestamp-clause is specified
             (NOT NULL | generated_clause | column_constraint | column_def_clause | FIELDPROC  dbs_program_name
             (LPARENCHAR dbs_constant (dbs_comma_separator dbs_constant)* RPARENCHAR)? |  AS SECURITY LABEL | IMPLICITLY HIDDENCHAR | INLINE LENGTH INTEGERLITERAL)*;//built-in-type change
column_def_clause : WITH? DEFAULT default_options?;
xml_type_modifier: XMLSCHEMA  xml_type_modifier_body (dbs_comma_separator xml_type_modifier_body)*;
xml_type_modifier_body: xml_schema_spec (ELEMENT dbs_sql_identifier)?;
xml_schema_spec: ID dbs_registered_xml_schema_name | (URL dbs_host_variable | NO NAMESPACE) (LOCATION dbs_schema_location)?;
as_row_change_timestamp_clause: FOR EACH ROW ON UPDATE AS ROW CHANGE TIMESTAMP;
as_row_transaction_start_id_clause: AS TRANSACTION START ID;
as_row_transaction_timestamp_clause: AS ROW (BEGIN | START | END);
as_generated_expression_clause: AS LPARENCHAR dbs_non_deterministic_expression RPARENCHAR;
default_options: default_options_vals | dbs_cast_function_name LPARENCHAR default_options_vals RPARENCHAR;
default_options_vals: dbs_constant | (SESSION_USER | USER) | CURRENT | CURRENT SQLID | NULL;
column_constraint: CONSTRAINT dbs_constraint_name (PRIMARY KEY | UNIQUE | common_reference_clause | CHECK LPARENCHAR  dbs_search_condition RPARENCHAR)?;
period_def: PERIOD FOR? ( SYSTEM_TIME LPARENCHAR period_def_params   RPARENCHAR |
            BUSINESS_TIME LPARENCHAR period_def_params (EXCLUSIVE | INCLUSIVE)?  RPARENCHAR);
period_def_params: dbs_column_name_without_alias dbs_comma_separator dbs_column_name_without_alias;
unique_constraint: (CONSTRAINT dbs_constraint_name)? (PRIMARY KEY | UNIQUE) LPARENCHAR dbs_column_name_without_alias (dbs_comma_separator dbs_column_name_without_alias)* (dbs_comma_separator BUSINESS_TIME WITHOUT OVERLAPS )? RPARENCHAR;
referential_constraint: (CONSTRAINT dbs_constraint_name)? FOREIGN KEY LPARENCHAR referential_constraint_body  RPARENCHAR common_reference_clause;
referential_constraint_body:  dbs_column_name_without_alias (PERIOD BUSINESS_TIME)? (dbs_comma_separator dbs_column_name_without_alias (PERIOD BUSINESS_TIME)?)* ;
check_constraint: (CONSTRAINT dbs_constraint_name)? CHECK LPARENCHAR  dbs_search_condition RPARENCHAR;
copy_options: ( (EXCLUDING | INCLUDING) IDENTITY (COLUMN ATTRIBUTES)? | (EXCLUDING | INCLUDING) ROW CHANGE TIMESTAMP (COLUMN ATTRIBUTES)?  |
                ((EXCLUDING|INCLUDING) COLUMN? DEFAULTS | USING TYPE DEFAULTS) | EXCLUDING XML TYPE MODIFIERS)+;
as_result_table: common_loop_and_fullselect  WITH NO DATA;
common_loop_and_fullselect: column_loop?  AS LPARENCHAR dbs_fullselect RPARENCHAR;
column_loop: LPARENCHAR dbs_column_name_without_alias (dbs_comma_separator dbs_column_name_without_alias)* RPARENCHAR;
materialized_query_def: common_loop_and_fullselect refreshable_table_options;
refreshable_table_options: DATA INITIALLY DEFERRED REFRESH DEFERRED ( MAINTAINED BY(SYSTEM |USER) | (ENABLE | DISABLE) QUERY OPTIMIZATION)*;
dbs_create_table_data_def: in_clause_def | partitioning_clause | organization_clause | EDITPROC dbs_program_name (WITH | WITHOUT) ROW ATTRIBUTES  | VALIDPROC  dbs_program_name | AUDIT (NONE | CHANGES | ALL)
                    | OBID INTEGERLITERAL | DATA CAPTURE (NONE | CHANGES)? | WITH RESTRICT ON DROP | CCSID oneof_encoding |  NOT? VOLATILE CARDINALITY? |
                    NOT? LOGGED | compress_opt | APPEND no_or_yes | DSSIZE dbs_dsize_parameter | BUFFERPOOL dbs_bp_name |  MEMBER CLUSTER |
                    TRACKMOD yes_or_no  | PAGENUM dbs_pageset_pagenum_param | (NO KEY LABEL | KEY LABEL dbs_sql_identifier) ;
in_clause_def: (IN (dbs_database_name DOT_FS)? dbs_table_space_name | IN DATABASE dbs_database_name | IN ACCELERATOR dbs_accelerator_name);
partitioning_clause:  PARTITION BY (RANGE? partitioning_clause_arguments
                        |  SIZE (EVERY dbs_dsize_parameter)?);
partitioning_clause_arguments: LPARENCHAR partition_expression (dbs_comma_separator partition_expression)*  RPARENCHAR
                              LPARENCHAR partitioning_element (dbs_comma_separator partitioning_element)*  RPARENCHAR;
partition_expression: dbs_column_name_without_alias (NULLS LAST)? (ASC | DESC)?;
partitioning_element: PARTITION INTEGERLITERAL partitioning_element_clause;
partitioning_element_clause: ENDING AT? partition_element_loop partition_hash_space? INCLUSIVE?;
partition_hash_space: HASH SPACE kmg_blob_parameter;
organization_clause: ORGANIZE BY HASH UNIQUE column_loop partition_hash_space?;

//CREATE TABLESPACE
dbs_create_tablespace: TABLESPACE dbs_table_space_name dbs_create_tablespace_opts*;
dbs_create_tablespace_opts : IN dbs_database_name
               | partition_by_growth_spec
               | partition_by_range_spec
               | DEFINE no_or_yes
               | locksize_block_tbl
               | MEMBER CLUSTER
               | DSSIZE dbs_dsize_parameter
               | CCSID oneof_encoding
               | SEGSIZE INTEGERLITERAL
               | dbs_create_alter_tablespace_opts_common
               | using_block;
dbs_create_alter_tablespace_opts_common: BUFFERPOOL dbs_bp_name
               | CLOSE yes_or_no
               | compress_opt
               | INSERT ALGORITHM dbs_create_algorithm_level
               | LOCKMAX (SYSTEM | INTEGERLITERAL)
               | locksize_block_tbl
               | MAXROWS INTEGERLITERAL
               | NOT? LOGGED
               | TRACKMOD yes_or_no
               | free_block
               | gbpcache_block
               | LOCKPART yes_or_no;
partition_by_growth_spec: MAXPARTITIONS dbs_maxPartition (NUMPARTS INTEGERLITERAL)?;
partition_by_range_spec: NUMPARTS INTEGERLITERAL partition_by_range_spec_body*;
partition_by_range_spec_body: LPARENCHAR partitions_opts (dbs_comma_separator partitions_opts)*  RPARENCHAR | PAGENUM (dbs_pageset_pagenum_param | ABSOLUTE | RELATIVE);
partitions_opts: PARTITION INTEGERLITERAL (using_block | free_block | gbpcache_block | compress_opt | ERASE yes_or_no? | TRACKMOD yes_or_no
               | DSSIZE dbs_dsize_parameter)+;
free_block: (FREEPAGE  INTEGERLITERAL | PCTFREE (dbs_smallint (FOR UPDATE dbs_smallint)?)?)+;
locksize_block_tbl: LOCKSIZE (ANY | TABLESPACE | PAGE | ROW);
compress_opt: COMPRESS (NO | YES (FIXEDLENGTH | HUFFMAN)?);

//CREATE TRIGGER ADVANCED
referencing_opts: REFERENCING (OLD ROW? AS? dbs_correlation_name | NEW ROW? AS? dbs_correlation_name | OLD_TABLE AS? dbs_table_name | NEW_TABLE AS? dbs_sql_identifier)+;
trigger_activation_time: (NO CASCADE)? BEFORE | AFTER | INSTEAD OF;
trigger_event: INSERT | DELETE | UPDATE (OF dbs_column_name (dbs_comma_separator dbs_column_name)*)?;
trigger_granularity: (FOR EACH (STATEMENT | ROW))?;

//CREATE TRIGGER BASIC
dbs_create_trigger_basic: TRIGGER dbs_trigger_name (trigger_definition_basic | WRAPPED dbs_obfuscated_statement_text);
trigger_definition_basic: trigger_activation_time trigger_event ON dbs_alias_name referencing_opts?  trigger_granularity MODE DB2SQL ( NOT? SECURED)? triggered_action_basic;
triggered_action_basic: (WHEN dbs_search_condition)? sql_trigger_body_basic;
sql_trigger_body_basic:  (dbs_triggered_sql_statement_basic | BEGIN ATOMIC (dbs_triggered_sql_statement_basic dbs_semicolon_end)+ END);

//CREATE TRUSTED CONTEXT
dbs_create_trusted_context: TRUSTED CONTEXT dbs_context_name BASED UPON CONNECTION USING SYSTEM AUTHID dbs_authorization_name (dbs_trusted_context_create_alter_opts | with_user_opt)+;
dbs_trusted_context_create_alter_opts: NO DEFAULT ROLE
                            | DEFAULT ROLE dbs_role_name (WITHOUT ROLE AS OBJECT OWNER | WITH ROLE AS OBJECT OWNER AND QUALIFIER)?
                            | DISABLE
                            | ENABLE
                            | NO DEFAULT SECURITY LABEL
                            | DEFAULT SECURITY LABEL dbs_seclabel_name
                            | ATTRIBUTES attributes_opt;
attributes_opt: LPARENCHAR (attributes_opt_loop_body (dbs_comma_separator attributes_opt_loop_body)* | jobname_opt_loop_body (dbs_comma_separator jobname_opt_loop_body)*) RPARENCHAR;
attributes_opt_loop_body: attribute_addr_serverauth | ENCRYPTION dbs_encryption_value;
attribute_addr_serverauth: (ADDRESS | SERVAUTH) CHAR_STRING_LITERAL_DOUBLE_QUOTE;
jobname_opt_loop_body: JOBNAME dbs_jobname_value;
with_user_opt:  (WITH USE FOR with_user_loop_body (dbs_comma_separator with_user_loop_body)*);
with_user_loop_body: dbs_authorization_name trusted_context_user_options* | EXTERNAL SECURITY PROFILE dbs_profile_name trusted_context_user_options* | PUBLIC without_or_with AUTHENTICATION;
trusted_context_user_options: ROLE dbs_role_name |  SECURITY LABEL dbs_seclabel_name | without_or_with AUTHENTICATION;

//CREATE TYPE ARRAY
dbs_create_type_array: TYPE dbs_array_type_name AS common_built_in_type_core ARRAY LSQUAREBRACKET (dbs_integer_constant | common_built_in_type2)? RSQUAREBRACKET  ; //TODO: Add validation for max value of 2147483647

//CREATE TYPE DISTINCT
dbs_create_type_distinct: TYPE dbs_distinct_type_name AS common_built_in_type_source (INLINE LENGTH INTEGERLITERAL)?;

//CREATE VARIABLE
dbs_create_variable: VARIABLE dbs_object_name (common_built_in_type_core | dbs_array_type_name) (DEFAULT NULL | DEFAULT (dbs_constant | dbs_special_register) )?;

//CREATE VIEW
dbs_create_view: VIEW dbs_view_name column_loop? AS tbl_expr_loop?  dbs_fullselect (WITH (CASCADED | LOCAL)? CHECK OPTION)?;
tbl_expr_loop: WITH dbs_select_statement_common_table_expression (dbs_comma_separator dbs_select_statement_common_table_expression)*;

/*DECLARE (all) */
dbs_declare: DECLARE dbs_declare_global;

dbs_declare_cursor: DECLARE dbs_cursor_name ((NO|ASENSITIVE|INSENSITIVE|SENSITIVE (DYNAMIC|STATIC)?) SCROLL)? CURSOR ((WITH|WITHOUT) HOLD |
                    (WITHOUT RETURN|WITH RETURN TO (CALLER|CLIENT)) | (WITH|WITHOUT) ROWSET POSITIONING)* /*random ordering req*/
                    FOR (dbs_select | dbs_sql_identifier);

dbs_declare_global: GLOBAL TEMPORARY TABLE dbs_table_name (LPARENCHAR dbs_declare_global_coldef (dbs_comma_separator dbs_declare_global_coldef)* RPARENCHAR |
                    (LIKE dbs_alias_name | AS LPARENCHAR dbs_fullselect RPARENCHAR WITH NO DATA) dbs_declare_global_copyopts) (CCSID (ASCII|EBCDIC|UNICODE) |
                    ON COMMIT ((DELETE|PRESERVE) ROWS | DROP TABLE) | (LOGGED | NOT LOGGED (ON ROLLBACK (DELETE|PRESERVE) ROWS)?))*; /*random ordering req */
dbs_declare_global_coldef: dbs_column_name (dbs_distinct_type_name | dbs_declare_global_bit) (WITH? DEFAULT (dbs_constant | SESSION_USER | USER | CURRENT SQLID | NULL)? |
                        GENERATED (ALWAYS|BY DEFAULT) (AS IDENTITY (LPARENCHAR dbs_declare_global_idopts (dbs_comma_separator? dbs_declare_global_idopts)* RPARENCHAR)?)? | NOT NULL)*; /*random ordering req "one each" rule */
dbs_declare_global_bit: (dbs_declare_global_bit_int | dbs_declare_global_bit_decimal | dbs_declare_global_bit_float | dbs_declare_global_bit_decfloat | dbs_declare_global_bit_char |
                            dbs_declare_global_bit_varchar | dbs_declare_global_bit_graphic | dbs_declare_global_bit_binary | DATE | TIME | dbs_declare_global_bit_timestamp );
dbs_declare_global_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_declare_global_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR (INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL)? | NUMERICLITERAL) RPARENCHAR)?;
dbs_declare_global_bit_float: (FLOAT (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_declare_global_bit_decfloat: DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)?;
dbs_declare_global_bit_char: (CHARACTER | CHAR) (VARYING dbs_declare_global_bit_varchara | LPARENCHAR INTEGERLITERAL RPARENCHAR) dbs_declare_global_bit_charopts?;
dbs_declare_global_bit_charopts: (FOR (SBCS | MIXED | BIT) DATA | CCSID dbs_integer1208);
dbs_declare_global_bit_varchar: VARCHAR dbs_declare_global_bit_varchara;
dbs_declare_global_bit_varchara: LPARENCHAR INTEGERLITERAL RPARENCHAR dbs_declare_global_bit_charopts?;
dbs_declare_global_bit_graphic: (GRAPHIC (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | VARGRAPHIC LPARENCHAR INTEGERLITERAL RPARENCHAR) (CCSID dbs_integer1200)?;
dbs_declare_global_bit_binary: (BINARY VARYING? | VARBINARY) (LPARENCHAR INTEGERLITERAL RPARENCHAR)?;
dbs_declare_global_bit_timestamp: TIMESTAMP (LPARENCHAR INTEGERLITERAL RPARENCHAR)? option_timezone?;
dbs_declare_global_idopts: (START WITH INTEGERLITERAL | INCREMENT BY INTEGERLITERAL |  NO (MAXVALUE|MINVALUE|CACHE) | (MAXVALUE|MINVALUE) INTEGERLITERAL | NO? CYCLE |  CACHE dbs_integer_constant);
dbs_declare_global_copyopts: (dbs_declare_global_identity dbs_declare_global_defaults? | dbs_declare_global_defaults dbs_declare_global_identity?)?;
dbs_declare_global_defaults: (USING TYPE DEFAULTS | (INCLUDING|EXCLUDING) COLUMN? DEFAULTS);
dbs_declare_global_identity: (EXCLUDING|INCLUDING) IDENTITY (COLUMN ATTRIBUTES)?;

dbs_declare_statement: dbs_sql_identifier (dbs_comma_separator dbs_sql_identifier)* STATEMENT; // WHAT DOES THIS REPRESENT????

dbs_declare_table: DECLARE dbs_alias_name TABLE LPARENCHAR dbs_declare_table_loop (dbs_comma_separator dbs_declare_table_loop)* RPARENCHAR;
dbs_declare_table_loop: dbs_column_name (dbs_distinct_type_name | dbs_declare_table_bit) (NOT NULL (WITH DEFAULT)?)?;
dbs_declare_table_bit: (dbs_declare_table_bit_int | dbs_declare_table_bit_decimal | dbs_declare_table_bit_float | dbs_declare_table_bit_decfloat | dbs_declare_table_bit_char |
                        dbs_declare_table_bit_clob | dbs_declare_table_bit_varchar | dbs_declare_table_bit_graphic | dbs_declare_table_bit_binary | DATE | TIME |
                        dbs_declare_table_bit_timestamp | ROWID | XML);
dbs_declare_table_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
dbs_declare_table_bit_decimal: (DECIMAL | DEC | NUMERIC) (LPARENCHAR (INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL)? | NUMERICLITERAL) RPARENCHAR)?;
dbs_declare_table_bit_float: (FLOAT (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | REAL | DOUBLE PRECISION?);
dbs_declare_table_bit_decfloat: DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)?;
dbs_declare_table_bit_char: (CHARACTER | CHAR) (VARYING dbs_declare_table_bit_varchara | LARGE OBJECT dbs_declare_table_bit_cloba | LPARENCHAR INTEGERLITERAL RPARENCHAR);
dbs_declare_table_bit_varchar: VARCHAR dbs_declare_table_bit_varchara;
dbs_declare_table_bit_varchara: LPARENCHAR INTEGERLITERAL RPARENCHAR;
dbs_declare_table_bit_clob: CLOB dbs_declare_table_bit_cloba;
dbs_declare_table_bit_cloba: (LPARENCHAR kmg_blob_parameter RPARENCHAR)?;
dbs_declare_table_bit_graphic: (GRAPHIC (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | VARGRAPHIC LPARENCHAR INTEGERLITERAL RPARENCHAR | DBCLOB (LPARENCHAR kmg_blob_parameter RPARENCHAR)?);
dbs_declare_table_bit_binary: (BINARY (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR INTEGERLITERAL RPARENCHAR | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR kmg_blob_parameter RPARENCHAR)?);
dbs_declare_table_bit_timestamp: TIMESTAMP (LPARENCHAR INTEGERLITERAL RPARENCHAR)? ((WITH|WITHOUT) (TIME ZONE|TIMEZONE))?;
/*DELETE */
dbs_delete: DELETE FROM dbs_alias_name (dbs_delete_period | dbs_delete_noperiod | dbs_delete_positioned);
dbs_delete_period: dbs_delete_period_clause dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)?
                    (WHERE dbs_search_condition)? (dbs_delete_isolation_clause | SKIPCHAR LOCKED DATA)* (QUERYNO INTEGERLITERAL)?;
dbs_delete_period_clause: FOR PORTION OF BUSINESS_TIME (FROM dbs_expressions TO dbs_expressions | BETWEEN dbs_expressions AND dbs_expressions)?;
dbs_delete_include_column: INCLUDE LPARENCHAR dbs_column_name dbs_data_type_2(dbs_comma_separator dbs_column_name dbs_data_type_2)* RPARENCHAR;
dbs_delete_assignment_clause: (dbs_delete_assignment_clause_whole | dbs_delete_assignment_clause_part);
dbs_delete_assignment_clause_whole: dbs_column_name EQUALCHAR (dbs_expression | NULL) (dbs_comma_separator dbs_column_name EQUALCHAR (dbs_expression | NULL))*;
dbs_delete_assignment_clause_part: LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_fullselect | (dbs_expression |
                                   NULL) (dbs_comma_separator (dbs_expression | NULL)*)) RPARENCHAR;
dbs_delete_isolation_clause: WITH (RR | RS | CS);
dbs_delete_noperiod: dbs_correlation_name? dbs_delete_include_column? (SET dbs_delete_assignment_clause)? (WHERE dbs_search_condition)?
                        dbs_fetch_clause? (dbs_delete_isolation_clause | SKIPCHAR LOCKED DATA)* (QUERYNO INTEGERLITERAL)?;
dbs_delete_positioned: dbs_correlation_name? WHERE CURRENT OF dbs_cursor_name (FOR ROW (dbs_host_variable | dbs_integer_constant) OF ROWSET)?;


 /*DESCRIBE (all) */
dbs_describe: DESCRIBE (dbs_describe_cursor | dbs_describe_input | dbs_describe_output | dbs_describe_procedure | dbs_describe_table);
dbs_describe_cursor: CURSOR (dbs_cursor_name | dbs_host_variable) INTO dbs_descriptor_name;
dbs_describe_input: INPUT dbs_sql_identifier INTO dbs_descriptor_name;
dbs_describe_output: OUTPUT? dbs_sql_identifier INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?;
dbs_describe_procedure: PROCEDURE (dbs_procedure_name | dbs_host_variable) INTO dbs_descriptor_name;
dbs_describe_table: TABLE dbs_sql_variable_reference INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?;


/*DROP */
dbs_drop: DROP (dbs_drop_alias_designator | dbs_drop_database | dbs_drop_function | dbs_drop_specific |
            dbs_drop_index | dbs_drop_mask | dbs_drop_package | dbs_drop_permission | dbs_drop_procedure | dbs_drop_role |
            dbs_drop_sequence | dbs_drop_stogroup | dbs_drop_synonym | dbs_drop_table | dbs_drop_tablespace |
            dbs_drop_trigger | dbs_drop_trusted | dbs_drop_type | dbs_drop_variable | dbs_drop_view);
dbs_drop_alias_designator: (dbs_drop_public_alias_designator | dbs_drop_nonpub_alias_designator);
dbs_drop_public_alias_designator: PUBLIC ALIAS dbs_alias_name FOR SEQUENCE;
dbs_drop_nonpub_alias_designator: ALIAS dbs_alias_name (FOR (TABLE | SEQUENCE))?;
dbs_drop_database: DATABASE dbs_database_name;
dbs_drop_function: FUNCTION dbs_function_name (LPARENCHAR (dbs_drop_parameter_type (dbs_comma_separator dbs_drop_parameter_type)*)? RPARENCHAR)? RESTRICT?;
dbs_drop_parameter_type: (common_built_in_type | dbs_distinct_type_name | dbs_array_type_name) (AS LOCATOR)?;
dbs_drop_specific: SPECIFIC FUNCTION dbs_specific_name RESTRICT?;
dbs_drop_index: INDEX dbs_index_name;
dbs_drop_mask: MASK dbs_mask_name;
dbs_drop_package: PACKAGE dbs_package_name (VERSION? dbs_version_id)?;
dbs_drop_permission: PERMISSION dbs_permission_name;
dbs_drop_procedure: PROCEDURE dbs_procedure_name RESTRICT?;
dbs_drop_role: ROLE dbs_role_name RESTRICT?;
dbs_drop_sequence: SEQUENCE dbs_sequence_name RESTRICT?;
dbs_drop_stogroup: STOGROUP dbs_stogroup_name;
dbs_drop_synonym: SYNONYM dbs_synonym;
dbs_drop_table: TABLE (dbs_table_name | dbs_alias_name);
dbs_drop_tablespace: TABLESPACE (dbs_database_name DOT_FS)? dbs_table_space_name;
dbs_drop_trigger: TRIGGER dbs_trigger_name;
dbs_drop_trusted: TRUSTED CONTEXT dbs_context_name;
dbs_drop_type: TYPE dbs_object_name RESTRICT?;
dbs_drop_variable: VARIABLE dbs_object_name RESTRICT?;
dbs_drop_view: VIEW (dbs_view_name | dbs_alias_name);


/*END DECLARE SECTION */
dbs_end: END DECLARE SECTION;

/*EXCHANGE */
dbs_exchange: EXCHANGE DATA BETWEEN TABLE dbs_table_name AND dbs_table_name;

/*EXECUTE / EXECUTE IMMEDIATE - note LSQUAREBRACKET and RSQUAREBRACKET are new additions to the lexer!*/
dbs_execute: EXECUTE (dbs_execute_statement | dbs_execute_immediate);
dbs_execute_statement: dbs_sql_identifier (USING (dbs_execute_varloop | dbs_execute_hostloop | dbs_execute_descriptor))?;
dbs_execute_varloop: (dbs_host_variable | dbs_array_variable LSQUAREBRACKET INTEGERLITERAL RSQUAREBRACKET) (dbs_comma_separator (dbs_host_variable |
                        dbs_array_variable LSQUAREBRACKET INTEGERLITERAL RSQUAREBRACKET))*;
dbs_execute_hostloop: (dbs_array_type_name | dbs_host_variable) (dbs_comma_separator (dbs_array_type_name |
                        dbs_host_variable))* (FOR (dbs_host_variable | dbs_integer_constant) ROWS)?;
dbs_execute_descriptor: DESCRIPTOR dbs_descriptor_name (FOR (dbs_host_variable | dbs_integer_constant) ROWS)?;
dbs_execute_immediate: IMMEDIATE (dbs_sql_variable_reference | dbs_string_expression) ;


/*EXPLAIN */
dbs_explain: EXPLAIN (dbs_explain_plan | dbs_explain_stmtcache | dbs_explain_package | dbs_explain_stabilized);
dbs_explain_plan: (PLAN | ALL) (SET QUERYNO EQUALCHAR INTEGERLITERAL)? FOR dbs_explainable_sql_statement;
dbs_explain_stmtcache: STMTCACHE (ALL | STMTID (NUMERICLITERAL | dbs_integer_constant) | STMTTOKEN (dbs_token_host_variable | dbs_string_constant));
dbs_token_host_variable: dbs_sql_variable_reference | INTEGERLITERAL;
dbs_explain_package: PACKAGE COLLECTION dbs_collection_name PACKAGE dbs_package_name (VERSION dbs_version_name)? (COPY dbs_copy_id)?;
dbs_explain_stabilized: STABILIZED DYNAMIC QUERY STMTID (NUMERICLITERAL | dbs_integer_constant) (COPY SINGLEQUOTE (CURRENT | INVALID) SINGLEQUOTE)?;


/*FETCH */
//ref: https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-fetch
dbs_fetch: FETCH (
                (BEFORE | AFTER) FROM? dbs_cursor_name
                |  (INSENSITIVE | SENSITIVE)? (WITH CONTINUE dbs_fetch_rowpos? FROM? dbs_cursor_name dbs_fetch_singlerow?
                                                | (
                                                     (dbs_fetch_rowpos? FROM? dbs_cursor_name dbs_fetch_singlerow?)
                                                     | (dbs_fetch_rowsetpos FROM? dbs_cursor_name dbs_fetch_multirow)
                                                   )
                                                )
                );
dbs_fetch_rowpos: (NEXT | PRIOR | FIRST | LAST | CURRENT CONTINUE? | (ABSOLUTE | RELATIVE) (dbs_host_variable | dbs_integer_constant));
dbs_fetch_singlerow: INTO (DESCRIPTOR dbs_descriptor_name | dbs_array_variable LSQUAREBRACKET INTEGERLITERAL RSQUAREBRACKET |
                    dbs_sql_variable_reference (dbs_comma_separator dbs_sql_variable_reference)*);
dbs_fetch_multirow: (FOR (dbs_host_variable | dbs_integer_constant) ROWS)? (INTO (DESCRIPTOR dbs_descriptor_name | dbs_sql_variable_reference (dbs_comma_separator dbs_sql_variable_reference)*))?;
dbs_fetch_rowsetpos: (ROWSET STARTING AT (ABSOLUTE | RELATIVE) (dbs_host_variable | dbs_integer_constant) | (NEXT | PRIOR |
                    FIRST | LAST | CURRENT) ROWSET);
/*FREE LOCATOR */
dbs_free: FREE LOCATOR dbs_host_variable (dbs_comma_separator dbs_host_variable)*;

/*GET DIAGNOSTICS */
dbs_get_diagnostics_statement: GET (CURRENT | STACKED)? DIAGNOSTICS (dbs_get_statement | dbs_get_condition | dbs_get_combi);
dbs_get_statement: dbs_host_variable EQUALCHAR (dbs_get_statement_loop (dbs_comma_separator dbs_host_variable EQUALCHAR dbs_get_statement_loop)* | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_SQL_NESTING_LEVEL);
dbs_get_statement_loop: dbs_get_statement_item (dbs_comma_separator dbs_get_statement_item)*;
dbs_get_statement_item: (DB2_LAST_ROW | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS | DB2_NUMBER_ROWS |
                        DB2_RETURN_STATUS | DB2_SQL_ATTR_CURSOR_HOLD | DB2_SQL_ATTR_CURSOR_ROWSET | DB2_SQL_ATTR_CURSOR_SCROLLABLE |
                        DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE | MORECHAR | NUMBER | ROW_COUNT);
dbs_get_condition: CONDITION (dbs_host_variable | INTEGERLITERAL) dbs_host_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item) (dbs_comma_separator
                   dbs_host_variable EQUALCHAR (dbs_get_condition_item | dbs_get_connection_item))*;
dbs_get_condition_item: (CATALOG_NAME | CONDITION_NUMBER | CURSOR_NAME | DB2_ERROR_CODE1 | DB2_ERROR_CODE2 | DB2_ERROR_CODE3 |
                        DB2_ERROR_CODE4 | DB2_INTERNAL_ERROR_POINTER | DB2_LINE_NUMBER | DB2_MESSAGE_ID | DB2_MODULE_DETECTING_ERROR |
                        DB2_ORDINAL_TOKEN1 | DB2_ORDINAL_TOKEN2 |DB2_ORDINAL_TOKEN3 |DB2_ORDINAL_TOKEN4 | DB2_REASON_CODE |
                        DB2_RETURNED_SQLCODE | DB2_ROW_NUMBER | DB2_SQLERRD_SET | DB2_SQLERRD1 | DB2_SQLERRD2 | DB2_SQLERRD3 |
                        DB2_SQLERRD4 | DB2_SQLERRD5 | DB2_SQLERRD6 | DB2_TOKEN_COUNT | MESSAGE_TEXT | RETURNED_SQLSTATE | SERVER_NAME);
dbs_get_connection_item: (DB2_AUTHENTICATION_TYPE | DB2_AUTHORIZATION_ID | DB2_CONNECTION_STATE | DB2_CONNECTION_STATUS |
                        DB2_ENCRYPTION_TYPE | DB2_SERVER_CLASS_NAME | DB2_PRODUCT_ID);
dbs_get_combi: dbs_host_variable EQUALCHAR ALL dbs_get_combi_loop (dbs_comma_separator dbs_get_combi_loop)*;
dbs_get_combi_loop: (STATEMENT | (CONDITION | CONNECTION) (dbs_host_variable | INTEGERLITERAL)?);
/*the limitations of ANTLR don't allow for codifying the following rules:
1. STATEMENT can only be specified once,
2. CONDITION and CONNECTION can only be specified once if variable or integer is also not specified. */

/*GRANT (all) */
dbs_grant: GRANT (dbs_grant_collection | dbs_grant_database | dbs_grant_function | dbs_grant_package | dbs_grant_plan | dbs_grant_schema | dbs_grant_sequence |
                dbs_grant_system | dbs_grant_table | dbs_grant_type | dbs_grant_variable | dbs_grant_use);
dbs_grant_authloop: (dbs_authorization_name | ROLE dbs_role_name | PUBLIC);
dbs_grant_collection: (CREATE|PACKADM) (ON|IN) COLLECTION (ASTERISKCHAR | dbs_collection_id (dbs_comma_separator dbs_collection_id)*) TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_database: db2sql_db_privileges (dbs_comma_separator db2sql_db_privileges)* ON DATABASE dbs_database_name (dbs_comma_separator dbs_database_name)* TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_function: EXECUTE ON (PROCEDURE (ASTERISKCHAR | dbs_procedure_name (dbs_comma_separator dbs_procedure_name)*) | SPECIFIC FUNCTION dbs_specific_name (dbs_comma_separator dbs_specific_name)* |
                    FUNCTION dbs_grant_function_loop (dbs_comma_separator dbs_grant_function_loop)*) TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_function_loop: dbs_function_name (LPARENCHAR (data_type (AS LOCATOR)? (dbs_comma_separator data_type (AS LOCATOR)?)*)? RPARENCHAR)?;
dbs_grant_package: (ALL | (BIND|COPY|EXECUTE|RUN) (dbs_comma_separator (BIND|COPY|EXECUTE|RUN))*) ON PACKAGE (dbs_collection_id DOT_FS (dbs_package_name | ASTERISKCHAR))
                    (dbs_comma_separator (dbs_collection_id DOT_FS (dbs_package_name | ASTERISKCHAR)))* TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_plan: (BIND|EXECUTE) (dbs_comma_separator (BIND|EXECUTE))* ON PLAN dbs_plan_name (dbs_comma_separator dbs_plan_name)* TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_schema: (ALTERIN|CREATEIN|DROPIN) (dbs_comma_separator (ALTERIN|CREATEIN|DROPIN))* ON SCHEMA (ASTERISKCHAR|dbs_schema_name (dbs_comma_separator dbs_schema_name)*) TO dbs_grant_authloop
                    (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_sequence: (ALTER|USAGE|SELECT) (dbs_comma_separator (ALTER|USAGE|SELECT))* ON SEQUENCE dbs_sequence_name (dbs_comma_separator dbs_sequence_name)* TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_system: db2sql_system_privileges (dbs_comma_separator db2sql_system_privileges)* (ON SYSTEM)? TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_table: (ALL PRIVILEGES? | db2sql_table_view_privileges (dbs_comma_separator db2sql_table_view_privileges)*) ON TABLE? (dbs_host_variable | dbs_alias_name)
                    (dbs_comma_separator (dbs_host_variable | dbs_alias_name))* TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_type: USAGE ON (TYPE dbs_object_name (dbs_comma_separator dbs_object_name)* | JAR dbs_host_identifier (dbs_comma_separator dbs_host_identifier)*) TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_variable: (ALL PRIVILEGES? | (READ|WRITE) (dbs_comma_separator (READ|WRITE))*) ON VARIABLE dbs_object_name TO dbs_grant_authloop (dbs_comma_separator dbs_grant_authloop)* (WITH GRANT OPTION)?;
dbs_grant_use: USE OF (BUFFERPOOL dbs_bp_name  (dbs_comma_separator dbs_bp_name)* | ALL BUFFERPOOLS | STOGROUP dbs_stogroup_name (dbs_comma_separator dbs_stogroup_name)* |
                TABLESPACE (dbs_database_name DOT_FS)? dbs_table_space_name (dbs_comma_separator (dbs_database_name DOT_FS)? dbs_table_space_name)*)
                TO (dbs_authorization_name | ROLE dbs_role_name | PUBLIC) (dbs_comma_separator (dbs_authorization_name | ROLE dbs_role_name | PUBLIC))*
                (WITH GRANT OPTION)?;


/*HOLD LOCATOR */
dbs_hold: HOLD LOCATOR dbs_host_variable (dbs_comma_separator dbs_host_variable)*;

/*INCLUDE */
dbs_include: INCLUDE dbs_sql_identifier;
dbs_include_sqlca: INCLUDE SQLCA;
dbs_include_sqlda: INCLUDE SQLDA;

/*INSERT */
dbs_insert: INSERT INTO dbs_alias_name (LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR)?
            dbs_insert_include? (OVERRIDING USER VALUE)? dbs_insert_values;

// ref: https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-insert
dbs_insert_include: INCLUDE LPARENCHAR dbs_column_name dbs_include_data_type (dbs_comma_separator dbs_column_name dbs_include_data_type)* RPARENCHAR;

dbs_data_type_2: common_short_built_in_type | dbs_distinct_type;
dbs_insert_values: (VALUES dbs_insert_values_single
                    (FOR (dbs_host_variable | T=dbs_integer_constant {validateDb2MaxInt($T.text);}) ROWS)?
                    (ATOMIC | NOT ATOMIC CONTINUE ON SQLEXCEPTION)?)| dbs_insert_fullselect;
dbs_insert_values_single: (dbs_expression | DEFAULT | NULL) | LPARENCHAR dbs_insert_values_sgloop RPARENCHAR;
dbs_insert_values_sgloop: (dbs_expressions | DEFAULT | NULL) (dbs_comma_separator (dbs_expressions | DEFAULT | NULL) | NUMERICLITERAL)*;
dbs_insert_fullselect: (WITH dbs_select_statement_common_table_expression (dbs_comma_separator dbs_select_statement_common_table_expression)*)? dbs_fullselect (WITH (RR|RS|CS))? (QUERYNO INTEGERLITERAL)?;

/*LABEL */
dbs_label: LABEL ON (dbs_label_sing | dbs_label_loop);
dbs_label_sing: (dbs_label_table | dbs_label_alias | dbs_label_column) IS dbs_string_constant;
dbs_label_table: TABLE dbs_alias_name;
dbs_label_alias: ALIAS dbs_alias_name;
dbs_label_column: COLUMN dbs_alias_name DOT_FS dbs_sql_identifier;
dbs_label_loop: dbs_alias_name LPARENCHAR dbs_column_name IS dbs_string_constant (dbs_comma_separator dbs_column_name IS dbs_string_constant)* RPARENCHAR;

/*LOCK TABLE */
dbs_lock: LOCK TABLE dbs_table_name (PARTITION INTEGERLITERAL)? IN (SHARE | EXCLUSIVE) MODE;

/*MERGE */
dbs_merge: MERGE INTO dbs_alias_name dbs_merge_correlation? dbs_merge_include? USING (dbs_table_reference |
        dbs_merge_values) ON dbs_search_condition (WHEN NOT? MATCHED (AND dbs_search_condition)? THEN (dbs_signal |
        dbs_merge_update | DELETE | dbs_merge_insert))+ (ELSE IGNORE)? (NOT ATOMIC CONTINUE ON SQLEXCEPTION)? (QUERYNO INTEGERLITERAL)?;
dbs_merge_correlation: AS? dbs_correlation_name (LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR)?;
dbs_merge_include: INCLUDE LPARENCHAR dbs_column_name dbs_data_type_2 (dbs_comma_separator
        dbs_column_name dbs_data_type_2)* RPARENCHAR;
dbs_merge_values: LPARENCHAR VALUES (dbs_merge_values_sing | dbs_merge_values_multi) RPARENCHAR AS? dbs_correlation_name
        LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR;
dbs_merge_values_sing: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (dbs_comma_separator (dbs_expression | NULL))* RPARENCHAR);
dbs_merge_values_multi: (dbs_expression | dbs_array_type_name | NULL | LPARENCHAR (dbs_expression | dbs_array_type_name |
        NULL) (dbs_comma_separator (dbs_expression | dbs_array_type_name | NULL))* RPARENCHAR) FOR (dbs_host_variable | dbs_integer_constant) ROWS;
dbs_merge_update: UPDATE SET dbs_merge_assignment (dbs_comma_separator dbs_merge_assignment)*;
dbs_merge_assignment: (dbs_column_name EQUALCHAR (dbs_expressions | DEFAULT | NULL) | LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)*
        RPARENCHAR EQUALCHAR LPARENCHAR (dbs_fullselect | (dbs_expression | DEFAULT | NULL) (dbs_comma_separator (dbs_expression | DEFAULT | NULL))*) RPARENCHAR);
dbs_merge_insert: INSERT (LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR)? VALUES (dbs_expression | DEFAULT | NULL |
        LPARENCHAR (dbs_expression | DEFAULT | NULL) (dbs_comma_separator (dbs_expression | DEFAULT | NULL))* RPARENCHAR);


/*OPEN */
dbs_open: OPEN dbs_cursor_name (USING (DESCRIPTOR dbs_descriptor_name) | (dbs_host_variable | dbs_array_variable
        LSQUAREBRACKET INTEGERLITERAL RSQUAREBRACKET) (dbs_comma_separator (dbs_host_variable | dbs_array_variable LSQUAREBRACKET INTEGERLITERAL RSQUAREBRACKET))*)?;

/*PREPARE */
// removing dbs_string_expression as per doc https://www.ibm.com/docs/en/db2-for-zos/13?topic=statements-prepare
// string-expression is only supported for PLI.
dbs_prepare: PREPARE dbs_statement_name (INTO dbs_descriptor_name (USING (NAMES | LABELS | ANY | BOTH))?)?
            (ATTRIBUTES dbs_attr_host_variable)? FROM dbs_host_variable;


/*REFRESH TABLE */
dbs_refresh: REFRESH TABLE dbs_table_name (QUERYNO INTEGERLITERAL)?;

/* RELEASE (both) */
dbs_release: RELEASE (dbs_location_name | CURRENT | ALL SQL? | TO? SAVEPOINT dbs_savepoint_name | dbs_host_variable);

dbs_savepoint_name: T=dbs_savepoint_name_rule {validateLength($T.text, "Savepoint name", 128);};
dbs_savepoint_name_rule: NUMERICLITERAL+ | dbs_sql_identifier;

/*RENAME */
dbs_rename: RENAME (TABLE? dbs_table_name TO dbs_table_name | INDEX dbs_index_name TO dbs_sql_identifier);


/*REVOKE (all) */
dbs_revoke: REVOKE (dbs_revoke_coll_prvg | dbs_revoke_db_prvg | dbs_revoke_func_or_proc_prvg | dbs_revoke_pack_prvg | dbs_revoke_plan_prvg |
            dbs_revoke_schema_prvg | dbs_revoke_seq_prvg  | dbs_revoke_system_prvg | dbs_revoke_table_or_view_prvg |  dbs_revoke_type_or_jar_prvg  | dbs_revoke_var_prvg | dbs_revoke_use_prvg);

//REVOKE
auth_name_loop_pub: (auth_name_or_role | PUBLIC) (dbs_comma_separator auth_name_loop_pub | PUBLIC)*;
auth_name_loop_all: BY (ALL | auth_name_or_role (dbs_comma_separator auth_name_or_role)*);
auth_name_or_role: dbs_authorization_name | ROLE dbs_role_name;
dependent_privileges: NOT? INCLUDING DEPENDENT PRIVILEGES;

//REVOKE COLLECTION PRIVILEGES
dbs_revoke_coll_prvg : (CREATE | PACKADM) (IN | ON) COLLECTION (db_coll_id_loop | ASTERISKCHAR) FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
db_coll_id_loop: dbs_collection_id (dbs_comma_separator dbs_collection_id)*;

//REVOKE DATABASE PRIVILEGES
dbs_revoke_db_prvg: db2sql_db_privileges (dbs_comma_separator db2sql_db_privileges)* ON DATABASE db_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
db_name_loop: dbs_database_name (dbs_comma_separator dbs_database_name)*;

//REVOKE FUNCTION OR PROCEDURE PRIVILEGES
dbs_revoke_func_or_proc_prvg:  EXECUTE ON function_or_procedure  FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
function_or_procedure: (FUNCTION (db_function_name_body_loop | ASTERISKCHAR) | SPECIFIC FUNCTION db_specific_name_loop | PROCEDURE db_procedure_name_loop);
db_function_name_body_loop: dbs_function_name param_loop? (dbs_comma_separator dbs_function_name param_loop?)*;
param_loop: LPARENCHAR param_type (dbs_comma_separator param_type)*  RPARENCHAR;
param_type: data_type (AS LOCATOR)?; //AS LOCATOR can be specified only for a LOB data type
db_specific_name_loop: dbs_specific_name (dbs_comma_separator dbs_specific_name)*;
db_procedure_name_loop: dbs_procedure_name (dbs_comma_separator dbs_procedure_name)*;

//REVOKE PACKAGE PRIVILEGES
dbs_revoke_pack_prvg: (ALL | revoke_opt_loop) ON PACKAGE package_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
revoke_opt_loop: revoke_opt (dbs_comma_separator revoke_opt)*;
revoke_opt: BIND | COPY | EXECUTE | RUN;
package_name_loop: dbs_collection_id DOT_FS (dbs_package_name | ASTERISKCHAR) (dbs_comma_separator dbs_collection_id DOT_FS (dbs_package_name | ASTERISKCHAR))*;

//REVOKE PLAN PRIVILEGES
dbs_revoke_plan_prvg: (BIND | EXECUTE) (dbs_comma_separator (BIND | EXECUTE))* ON PLAN plan_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
plan_name_loop: dbs_plan_name (dbs_comma_separator dbs_plan_name)*;

//REVOKE SCHEMA PRIVILEGES
dbs_revoke_schema_prvg: revoke_schema_opt_loop ON SCHEMA schema_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
revoke_schema_opt_loop: revoke_schema_opt (dbs_comma_separator revoke_schema_opt)*;
revoke_schema_opt: ALTERIN | CREATEIN | DROPIN;
schema_name_loop: dbs_schema_name (dbs_comma_separator dbs_schema_name)*;

//REVOKE SEQUENCE PRIVILEGES
dbs_revoke_seq_prvg: revoke_seq_opt_loop ON SEQUENCE seq_name_loop FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
revoke_seq_opt_loop: revoke_seq_opt (dbs_comma_separator revoke_seq_opt)*;
revoke_seq_opt: ALTER | USAGE | SELECT;
seq_name_loop: dbs_sequence_name (dbs_comma_separator dbs_sequence_name)*;

//REVOKE SYSTEM PRIVILEGES
dbs_revoke_system_prvg: db2sql_system_privileges (dbs_comma_separator db2sql_system_privileges)*  (ON SYSTEM)? FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
//REVOKE TABLE OR VIEW PRIVILEGES
dbs_revoke_table_or_view_prvg: (ALL PRIVILEGES? | db2sql_table_view_privileges (dbs_comma_separator db2sql_table_view_privileges)*)  ON TABLE? table_or_view_name_loop
                                FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
table_or_view_name_loop: dbs_alias_name (dbs_comma_separator dbs_alias_name)*;

//REVOKE TYPE OR JAR PRIVILEGES
dbs_revoke_type_or_jar_prvg: USAGE ON (TYPE type_name_loop | JAR jar_name_loop)  FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges? RESTRICT?;
type_name_loop: dbs_object_name  (dbs_comma_separator dbs_object_name)*;
jar_name_loop: dbs_host_identifier (dbs_comma_separator dbs_host_identifier)*;

//REVOKE VARIABLE PRIVILEGES
dbs_revoke_var_prvg: (ALL PRIVILEGES? | read_write_loop) ON VARIABLE FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
read_write_loop: READ WRITE (dbs_comma_separator READ WRITE)*;

//REVOKE USE PRIVILEGES
dbs_revoke_use_prvg: USE OF (BUFFERPOOL bpname_loop | ALL BUFFERPOOLS | STOGROUP stogroup_name_loop | TABLESPACE tblspace_name_loop) FROM auth_name_loop_pub  auth_name_loop_all? dependent_privileges?;
bpname_loop: dbs_bp_name (dbs_comma_separator dbs_bp_name)*;
stogroup_name_loop: dbs_stogroup_name (dbs_comma_separator dbs_stogroup_name)*;
tblspace_name_loop: tblspace_name_name (dbs_comma_separator tblspace_name_name)*;
tblspace_name_name: (dbs_database_name DOT_FS)? dbs_table_space_name;

/*ROLLBACK */
dbs_rollback: ROLLBACK WORK? (TO SAVEPOINT dbs_savepoint_name?)?;

/*SAVEPOINT */
dbs_savepoint: SAVEPOINT dbs_savepoint_name UNIQUE? ON ROLLBACK RETAIN (CURSORS (ON ROLLBACK RETAIN LOCKS)? | LOCKS ON ROLLBACK RETAIN CURSORS);

/*SELECT (both) */

dbs_with_clause_for_select : WITH common_table_expression_loop;
dbs_select: dbs_select_unpack_function_invocation | dbs_with_clause_for_select? dbs_select_without_with_clause;
dbs_select_without_with_clause: dbs_fullselect dbs_fullselect_suffix*;
dbs_fullselect_suffix: dbs_select_update
                       | dbs_select_readOnly
                       | dbs_select_optimize
                       | dbs_select_statement_isolation_clause
                       | QUERYNO INTEGERLITERAL
                       | SKIPCHAR LOCKED DATA
                       ;
dbs_select_update: FOR UPDATE (OF dbs_column_name (dbs_comma_separator dbs_column_name)*)? ;
dbs_select_readOnly: FOR (READ | FETCH) ONLY;
dbs_select_optimize:OPTIMIZE FOR INTEGERLITERAL (ROWS | ROW);
/*Queries Subselects (all)*/
dbs_select_unpack_function_invocation: UNPACK LPARENCHAR dbs_expression RPARENCHAR DOT_FS ASTERISKCHAR AS LPARENCHAR dbs_sql_identifier db2sql_data_types (dbs_comma_separator dbs_sql_identifier db2sql_data_types)* RPARENCHAR;
dbs_subselect: dbs_select_clause dbs_subselect_suffix; // dbs_orderby_offset_fetch;
dbs_subselect_suffix: dbs_from_clause dbs_where_clause? dbs_groupby_clause? dbs_having_clause?;
dbs_orderby_offset_fetch: dbs_orderby_clause? dbs_offset_fetch_clause?;
dbs_select_clause: SELECT (ALL | DISTINCT)? ( ASTERISKCHAR | dbs_select_item (dbs_comma_separator dbs_select_item)*);
dbs_select_item: (dbs_expressions AS? dbs_sql_identifier? | dbs_unpacked_row | dbs_alias_name DOT_FS ASTERISKCHAR);
dbs_unpacked_row: dbs_select_unpack_function_invocation DOT_FS ASTERISKCHAR AS LPARENCHAR (dbs_generic_name db2sql_data_types)
(dbs_comma_separator dbs_generic_name db2sql_data_types)* RPARENCHAR;
dbs_from_clause: FROM dbs_table_reference  (dbs_comma_separator dbs_table_reference)*;
dbs_where_clause: WHERE dbs_search_condition;
dbs_groupby_alternatives: (dbs_grouping_expression| dbs_groupingset_alternative);
dbs_groupby_clause: GROUP BY dbs_groupby_alternatives (dbs_comma_separator dbs_groupby_alternatives)*;
dbs_groupingset_alternative: (dbs_grouping_sets | dbs_super_group);
dbs_groupingset_alternative_list: dbs_groupingset_alternative (dbs_comma_separator dbs_groupingset_alternative)* ;
dbs_grouping_sets: GROUPING SETS LPARENCHAR (dbs_groupingset_alternative_list | LPARENCHAR dbs_groupingset_alternative_list RPARENCHAR)  RPARENCHAR;
dbs_super_group: (ROLLUP | CUBE) LPARENCHAR dbs_grouping_expression_list? RPARENCHAR;
dbs_grouping_expression_alternative: dbs_grouping_expression | LPARENCHAR dbs_grouping_expression (dbs_comma_separator dbs_grouping_expression)* RPARENCHAR;
dbs_grouping_expression_list: dbs_grouping_expression_alternative (dbs_comma_separator dbs_grouping_expression_alternative)*;
dbs_grouping_expression: dbs_expression;
dbs_having_clause: HAVING dbs_search_condition;
dbs_orderby_clause: ORDER BY (INPUT SEQUENCE | ORDER OF dbs_table_designator | dbs_sort_key_expression (ASC | DESC)? (dbs_comma_separator dbs_sort_key_expression (ASC | DESC)?)*);
dbs_offset_clause: OFFSET INTEGERLITERAL (ROW | ROWS);
dbs_fetch_clause: FETCH (FIRST | NEXT) (PLUSCHAR? INTEGERLITERAL)? (ROW | ROWS) ONLY;
dbs_limit_clause: LIMIT (NUMERICLITERAL {validateTokenWithRegex($NUMERICLITERAL.text, "\\d+,\\d++", "offset,limit form expected");} | INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL | OFFSET INTEGERLITERAL)?);
dbs_offset_fetch_clause: dbs_offset_clause dbs_fetch_clause?
                       | dbs_fetch_clause
                       | dbs_limit_clause
                       ;

dbs_fullselect: (dbs_value_clause dbs_offset_clause?)
        | dbs_full_select_base dbs_full_select_base_suffix; //TODO: remove ambiguity with dbs_subselect based on https://www.ibm.com/docs/en/db2-for-zos/13?topic=subselect-order-by-clause


dbs_full_select_base : (LPARENCHAR dbs_fullselect RPARENCHAR | dbs_subselect) ;
dbs_full_select_base_suffix: ((UNION|EXCEPT|INTERSECT) (DISTINCT|ALL)? dbs_full_select_base)* dbs_orderby_offset_fetch;
dbs_value_clause: VALUES dbs_sequence_reference | LPARENCHAR dbs_sequence_reference (dbs_comma_separator dbs_sequence_reference)* RPARENCHAR;

/*SET (all) */
dbs_set: SET  (dbs_set_connection | dbs_set_current_accel | dbs_set_current_app_compatibility | dbs_set_current_app_enc_schema |
         dbs_set_current_debug_mode |dbs_set_decfloat_round_mode | dbs_set_current_degree | dbs_set_current_explain_mode | dbs_set_current_get_accel_archive | dbs_set_current_local_ctype |
         dbs_set_current_maintained_table_type_optmz | dbs_set_current_optmz_hint | dbs_set_current_pckg_path | dbs_set_current_pckg_set | dbs_set_current_precision |
         dbs_set_current_query_accel | dbs_set_current_query_accel_wfdata | dbs_set_current_refresh_age | dbs_set_current_routine_version | dbs_set_current_rules | dbs_set_current_sqlid |
         dbs_set_current_temp_business_time | dbs_set_current_temp_system_time | dbs_set_current_enc_pwd | dbs_set_path | dbs_set_schema | dbs_set_session_tz | dbs_set_assign);

//SET CONNECTION
dbs_set_connection: CONNECTION (dbs_location_name | dbs_host_variable);

//SET ASSIGNMENT STATEMENT
dbs_set_assign: (dbs_sql_variable_reference EQUALCHAR CURRENT (PACKAGESET | PACKAGE PATH |  SERVER) | dbs_array_type_name
                LSQUAREBRACKET dbs_array_type_name RSQUAREBRACKET EQUALCHAR (dbs_expression | NULL) | target_variable_loop); // TODO [array-index] adjust array-index , could be a query-expr arith-expr, sub-query etc
//target_variable: (dbs_global_variable_name | dbs_host_variable | dbs_sql_parameter_name | dbs_sql_variable_reference | dbs_object_name);
target_variable_eq_opt:  (dbs_expressions | NULL | DEFAULT);
target_variable_eq_opt_loop:  target_variable_eq_opt (dbs_comma_separator target_variable_eq_opt)*;
target_variable_val_loop: LPARENCHAR dbs_sql_variable_reference (dbs_comma_separator dbs_sql_variable_reference)*  RPARENCHAR;
target_variable_vals_loop:
    LPARENCHAR (
        target_variable_eq_opt_loop
        | dbs_subselect
        | VALUES
            (
                target_variable_eq_opt | LPARENCHAR target_variable_eq_opt_loop RPARENCHAR
            )
    ) RPARENCHAR;//1 2 3
target_variable_opts: (dbs_sql_variable_reference EQUALCHAR target_variable_eq_opt | target_variable_val_loop  EQUALCHAR target_variable_vals_loop);
target_variable_loop: target_variable_opts (dbs_comma_separator target_variable_opts)*;

//SET CURRENT ACCELERATOR
dbs_set_current_accel: CURRENT ACCELERATOR EQUALCHAR (dbs_accelerator_name | dbs_host_variable);

//SET CURRENT APPLICATION COMPATIBILITY
dbs_set_current_app_compatibility: CURRENT APPLICATION COMPATIBILITY EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT APPLICATION ENCODING SCHEMA
dbs_set_current_app_enc_schema: CURRENT APPLICATION? ENCODING SCHEME EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT DEBUG MODE
dbs_set_current_debug_mode: CURRENT DEBUG MODE EQUALCHAR? (DISALLOW | ALLOW | DISABLE | dbs_host_variable);

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
pckg_path_opts_loop: pckg_path_opts (dbs_comma_separator pckg_path_opts)*;

//SET CURRENT PACKAGE SET
dbs_set_current_pckg_set: CURRENT PACKAGESET EQUALCHAR? ((SESSION_USER | USER) | dbs_string_constant | dbs_host_variable);

//SET CURRENT PRECISION
dbs_set_current_precision:  CURRENT PRECISION EQUALCHAR? (dbs_string_constant | dbs_host_variable);

//SET CURRENT QUERY ACCELERATION
dbs_set_current_query_accel: CURRENT QUERY ACCELERATION EQUALCHAR? (NONE | ENABLE | ENABLE WITH FAILBACK | ELIGIBLE | ALL | dbs_host_variable);

//SET CURRENT QUERY ACCELARATION WAITFORDATA
dbs_set_current_query_accel_wfdata: CURRENT QUERY ACCELERATION WAITFORDATA EQUALCHAR?
                               (NUMERICLITERAL {validateTokenWithRegex($NUMERICLITERAL.text, "\\d{1,4}.\\d\\b", "db2SqlParser.currentQueryAcceleration");}
                               | dbs_host_variable);

//SET CURRENT REFRESH AGE
dbs_set_current_refresh_age: CURRENT REFRESH AGE EQUALCHAR? (INTEGERLITERAL | ANY | dbs_host_variable);

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
dbs_set_current_enc_pwd: ENCRYPTION PASSWORD EQUALCHAR? (dbs_sql_variable_reference | dbs_constant) (WITH HINT EQUALCHAR? (dbs_host_variable | dbs_sql_identifier))?;

//SET PATH
dbs_set_path: (CURRENT)? PATH EQUALCHAR? set_path_opts_loop;
set_path_opts: (dbs_schema_name | SYSTEM PATH | (SESSION_USER | USER) | CURRENT? PATH | CURRENT PACKAGE PATH | dbs_host_variable | dbs_string_constant);
set_path_opts_loop: set_path_opts (dbs_comma_separator set_path_opts)*;

//SET SCHEMA
dbs_set_schema: (CURRENT? SCHEMA | CURRENT_SCHEMA) EQUALCHAR? (dbs_schema_name | (SESSION_USER | USER) | dbs_host_variable | dbs_string_constant | DEFAULT);

//SET SESSION TIME ZONE
dbs_set_session_tz : SESSION? TIME ZONE EQUALCHAR? (dbs_string_constant | dbs_host_variable);

/*SIGNAL - this is a statement and is referenced in other rules*/
dbs_signal: dbs_label? SIGNAL
            (
                  dbs_constraint_name
                | SQLSTATE VALUE? (
                                     dbs_string_constant
                                   | dbs_sql_variable_reference
                                   | dbs_parameter
                                  )
            )
            (SET MESSAGE_TEXT EQUALCHAR)? dbs_diagnostic_string_expression;


/*TRANSFER OWNERSHIP */
dbs_transfer: TRANSFER OWNERSHIP OF (DATABASE dbs_database_name | INDEX dbs_index_name | STOGROUP dbs_stogroup_name |
                TABLE dbs_table_name | TABLESPACE dbs_database_name? dbs_table_space_name | VIEW dbs_view_name) TO (ROLE dbs_role_name |
                USER dbs_authorization_name | SESSION_USER) REVOKE PRIVILEGES;

/*TRUNCATE */
dbs_truncate: TRUNCATE TABLE? dbs_table_name ((DROP | REUSE) STORAGE)? ((IGNORE | RESTRICT WHEN) DELETE TRIGGERS)? IMMEDIATE?;

/*UPDATE */
dbs_update: UPDATE dbs_alias_name (dbs_update_searched | dbs_update_positioned);
dbs_update_searched: dbs_update_period? dbs_correlation_name? dbs_update_include? SET dbs_update_assignment (dbs_comma_separator
                    dbs_update_assignment)* (WHERE dbs_search_condition)? (WITH (RR|RS|CS) | SKIPCHAR LOCKED DATA)* (QUERYNO INTEGERLITERAL)?;
dbs_update_period: FOR PORTION OF BUSINESS_TIME (FROM dbs_expressions TO dbs_expressions | BETWEEN dbs_expressions AND dbs_expressions);
dbs_update_include: INCLUDE LPARENCHAR dbs_column_name dbs_data_type_2 (dbs_comma_separator
                    dbs_column_name dbs_data_type_2)* RPARENCHAR;
dbs_update_assignment: (dbs_column_name EQUALCHAR (dbs_expressions | DEFAULT | NULL) | LPARENCHAR dbs_column_name
                    (dbs_comma_separator dbs_column_name)* RPARENCHAR EQUALCHAR LPARENCHAR (dbs_fullselect | dbs_select_unpack_function_invocation |
                    (dbs_expressions | DEFAULT | NULL) (dbs_comma_separator (dbs_expressions | DEFAULT | NULL))*) RPARENCHAR);
dbs_update_positioned: dbs_correlation_name? SET dbs_update_assignment (dbs_comma_separator dbs_update_assignment)* WHERE CURRENT OF
                    dbs_cursor_name (FOR ROW (dbs_host_variable | dbs_integer_constant) OF ROWSET)?;

/*VALUES (both) */
dbs_values: VALUES (dbs_values_null | dbs_values_into);
dbs_values_null: (dbs_expression | LPARENCHAR dbs_expression (dbs_comma_separator dbs_expression)* RPARENCHAR);
dbs_values_into: (dbs_expression | NULL | LPARENCHAR (dbs_expression | NULL) (dbs_comma_separator (dbs_expression | NULL))* RPARENCHAR) INTO
                (dbs_sql_variable_reference (dbs_comma_separator dbs_sql_variable_reference)* | dbs_array_variable);

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
common_built_in_type2:  common_bit_integer | (VARCHAR | (CHARACTER | CHAR) VARYING) LPARENCHAR INTEGERLITERAL  RPARENCHAR (CCSID oneof_encoding)? common_bit_fordata?;
common_built_in_type_core3: common_built_in_type_core | common_bit_date_time |  ROWID | XML (LPARENCHAR xml_type_modifier RPARENCHAR)?;
common_built_in_type4: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat |
                       common_bit_char2 | common_bit_graphic2 | common_bit_binary_core  | common_bit_date_time);

common_bit_integer: INTEGER | INT;
common_bit_int: (SMALLINT | INT | INTEGER | BIGINT);
common_bit_decimal_opt: (DECIMAL | DEC | NUMERIC);
common_bit_decimal: common_bit_decimal_opt  (LPARENCHAR (INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL)? | NUMERICLITERAL) RPARENCHAR)?;
common_bit_float: (FLOAT (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | REAL | DOUBLE PRECISION?);
common_bit_decfloat: DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)?;
common_bit_char: (CHARACTER | CHAR) (VARYING common_bit_varandchar | LARGE OBJECT common_bit_clobandobj | LPARENCHAR INTEGERLITERAL RPARENCHAR common_bit_charopts);
common_bit_char2: ((CHARACTER | CHAR) (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | (VARCHAR | (CHARACTER | CHAR) VARYING) (LPARENCHAR INTEGERLITERAL RPARENCHAR)) (common_bit_fordata | CCSID dbs_integer1208)?;
common_bit_fordata: (FOR (SBCS | MIXED | BIT) DATA);
common_bit_charopts: (CCSID oneof_encoding)? common_bit_fordata?;
common_bit_varchar: VARCHAR common_bit_varandchar;
common_bit_varandchar: LPARENCHAR INTEGERLITERAL RPARENCHAR common_bit_charopts;
common_bit_clob: CLOB common_bit_clobandobj;
common_bit_clobandobj: (LPARENCHAR (T=dbs_sql_identifier {validateTokenWithRegex($T.text, "\\d+[MmGgKk]", "db2SqlParser.pieceSize");})? RPARENCHAR)?
                        (CCSID oneof_encoding)? (FOR (SBCS | MIXED ) DATA)?;
common_bit_graphic_core: GRAPHIC (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | VARGRAPHIC LPARENCHAR INTEGERLITERAL RPARENCHAR;
common_bit_graphic: (common_bit_graphic_core | DBCLOB (LPARENCHAR kmg_blob_parameter RPARENCHAR)?) (CCSID oneof_encoding)?;
common_bit_graphic2: common_bit_graphic_core CCSID dbs_integer1200;
common_bit_binary_core: BINARY (LPARENCHAR INTEGERLITERAL RPARENCHAR)? | (BINARY VARYING | VARBINARY) LPARENCHAR INTEGERLITERAL RPARENCHAR;
common_bit_binary: (common_bit_binary_core | (BINARY LARGE OBJECT | BLOB) (LPARENCHAR dbs_pieceSize? RPARENCHAR)?);
common_bit_timestamp: TIMESTAMP (LPARENCHAR INTEGERLITERAL RPARENCHAR)? (without_or_with TIME ZONE)?;
common_bit_date_time: (DATE |  TIME | common_bit_timestamp);

/*built in type with no LOBs used in DELETE, INSERT, MERGE, UPDATE */
common_short_built_in_type: (common_bit_int | common_bit_decimal | common_bit_float | common_bit_decfloat | common_short_bit_char |
                            common_short_bit_varchar | common_short_bit_graphic | common_short_bit_binary | DATE | TIME | common_bit_timestamp );
common_short_bit_char: (CHARACTER | CHAR) (VARYING common_short_bit_varchara | LPARENCHAR INTEGERLITERAL RPARENCHAR) (FOR BIT DATA)?;
common_short_bit_varchar: VARCHAR common_short_bit_varchara;
common_short_bit_varchara: LPARENCHAR INTEGERLITERAL RPARENCHAR (FOR BIT DATA)?;
common_short_bit_graphic: (GRAPHIC | VARGRAPHIC) (LPARENCHAR INTEGERLITERAL RPARENCHAR)?;
common_short_bit_binary: (BINARY VARYING? | VARBINARY) (LPARENCHAR INTEGERLITERAL RPARENCHAR)?;

sql_data_type: SQL (VARCHAR (LPARENCHAR INTEGERLITERAL RPARENCHAR) | DECFLOAT (LPARENCHAR dbs_decfloat_integer RPARENCHAR)? | DATE | TIMESTAMP (LPARENCHAR dbs_integer12 RPARENCHAR)? );

dbs_option_list_ext: (option_specific| option_parameter | EXTERNAL option_name? | FENCED | dbs_options_list_ext_common_in_create_alter)+;
dbs_options_list_ext_common_in_create_alter: option_language | parameter_style dbs_function_parameter_style | option_deterministic | option_returned_null | option_called |
                     option_sqldata3 | option_action | option_package_path | option_scratch| option_final_call| option_allow_parallel| option_dbinfo | option_collid |  option_wlm_env | option_asutime |
                     option_stay_resident | option_program_type | option_security | option_after | option_run | option_registers | option_dispatch | option_secured | CARDINALITY INTEGERLITERAL;

dbs_option_list_proc_ext: (option_specific | option_parameter| FENCED | dbs_option_list_proc_ext_altr_create)+;

dbs_option_list_proc_ext_altr_create: option_dynamic | EXTERNAL option_name | option_language | option_parameter_style | option_deterministic | option_package_path
                        | option_sql | option_dbinfo | option_collid | option_wlm_env | option_asutime | option_stay_resident | option_program_type
                        | option_security | option_run | option_commit | option_registers | option_called | option_after | option_debug_mode;

dbs_option_list_ext_table: (option_specific | option_parameter | EXTERNAL option_name | option_language | parameter_style SQL | option_deterministic| FENCED| (option_returned_null | option_called)|
                           option_sqldata| option_action | option_package_path| option_scratch | option_final_call | DISALLOW PARALLEL | option_dbinfo| option_cardinality| option_collid|
                           option_wlm_env_short | option_asutime | option_stay_resident |  option_program_type | option_security| option_run | option_registers | option_dispatch | option_after | option_secured)+;

dbs_option_list_inl_def:  (option_specific | option_parameter | option_deterministic| option_action| option_sqldata_common| option_dispatch| option_called| option_secured | LANGUAGE SQL)*;
option_action: NO?  EXTERNAL ACTION;
option_after: (STOP AFTER (SYSTEM DEFAULT FAILURES | INTEGERLITERAL FAILURES) | CONTINUE AFTER FAILURE);
option_allow_parallel: (ALLOW | DISALLOW) PARALLEL;
option_asutime: ASUTIME (NO LIMIT | LIMIT INTEGERLITERAL);
option_called: CALLED ON NULL INPUT;
option_cardinality: CARDINALITY INTEGERLITERAL;
option_collid: (NO COLLID | COLLID dbs_collection_id);
option_commit: COMMIT ON RETURN  no_or_yes;
option_dbinfo: NO? DBINFO;
option_debug_mode: (DISALLOW | ALLOW | DISABLE) DEBUG MODE;
option_decimal: DECIMAL LPARENCHAR dbs_decimal_15_31 (dbs_comma_separator dbs_char_s)? RPARENCHAR;
option_degree: DEGREE  (T=INTEGERLITERAL  {validateLevel($T.text);} | ANY);
option_deterministic: NOT? DETERMINISTIC;
option_dispatch: STATIC DISPATCH;
option_dynamic: DYNAMIC RESULT SETS INTEGERLITERAL;
option_final_call: NO? FINAL CALL;
option_language: LANGUAGE oneof_lang;
option_name: NAME ( dbs_string_constant | dbs_sql_identifier);
option_package_path: (NO PACKAGE PATH | PACKAGE PATH dbs_package_path);
option_parameter: PARAMETER (CCSID oneof_encoding | VARCHAR (NULTERM | STRUCTURE))*;
option_parameter_style: parameter_style ( dbs_function_parameter_style | GENERAL | GENERAL WITH NULLS);
option_program_type: program_type (SUB | MAIN);
option_registers: (INHERIT | DEFAULT ) SPECIAL REGISTERS;
option_returned_null: RETURNS NULL ON NULL INPUT;
option_run: RUN OPTIONS dbs_string_constant;
option_scratch: (NO SCRATCHPAD | SCRATCHPAD INTEGERLITERAL?);
option_security: SECURITY (DB2 | USER | DEFINER);
option_secured: NOT? SECURED;
option_specific: SPECIFIC dbs_specific_name;
option_sqldata_common: (READS SQL DATA | CONTAINS SQL);
option_sqldata: (option_sqldata_common | NO SQL);
option_sqldata2: (MODIFIES SQL DATA | option_sqldata_common);
option_sqldata3: (option_sqldata2 | NO (SQL | EXTERNAL ACTION));
option_sql: (MODIFIES SQL DATA | READS SQL DATA | CONTAINS SQL | NO SQL);
option_stay_resident: STAY RESIDENT no_or_yes;
option_timezone: without_or_with TIME ZONE;
option_wlm_env: wlm_env (dbs_sql_identifier | LPARENCHAR dbs_sql_identifier dbs_comma_separator ASTERISKCHAR RPARENCHAR);
option_wlm_env_short: wlm_env (dbs_sql_identifier | LPARENCHAR dbs_sql_identifier RPARENCHAR);
no_or_yes: (NO | YES);
oneof_encoding: (ASCII | EBCDIC | UNICODE);
parameter_style: PARAMETER STYLE;
program_type: PROGRAM TYPE;
wlm_env: WLM ENVIRONMENT;
without_or_with: (WITHOUT | WITH);
yes_or_no: (YES | NO);

dbs_select_into_suffix: INTO (target_variable_names_loop | dbs_array_variable) dbs_from_clause dbs_where_clause? dbs_groupby_clause? dbs_having_clause?
                                        dbs_orderby_clause? (dbs_offset_fetch_clause | dbs_select_statement_isolation_clause | dbs_select_statement_skip_locked_data | dbs_select_statement_queryno_clause)*;
common_table_expression_loop: dbs_select_statement_common_table_expression (dbs_comma_separator dbs_select_statement_common_table_expression)*;
target_variable_names_loop: dbs_sql_variable_reference (dbs_comma_separator dbs_sql_variable_reference)*;
dbs_select_statement_common_table_expression: dbs_sql_identifier (LPARENCHAR dbs_sql_identifier (dbs_comma_separator dbs_sql_identifier)* RPARENCHAR)? AS dbs_fullselect;
dbs_select_statement_isolation_clause: WITH (RR dbs_select_statement_isolation_clause_lock_clause | RS dbs_select_statement_isolation_clause_lock_clause | CS | UR );
dbs_select_statement_isolation_clause_lock_clause: USE AND KEEP (EXCLUSIVE | UPDATE | SHARE) LOCKS;
dbs_select_statement_queryno_clause: QUERYNO INTEGERLITERAL;
dbs_select_statement_skip_locked_data: SKIPCHAR LOCKED DATA;
/// END SQL PROCEDURE STATEMENT ///


///////////////// DBS EXPRESSION STARTS/////////////
dbs_expression: (dbs_function_invocation | dbs_constant| dbs_column_name | dbs_host_variable | LPARENCHAR dbs_expressions RPARENCHAR) dbs_time_unit?
 | dbs_special_register
 | dbs_scalar_fullselect
 | dbs_case_expression
 | dbs_cast_specification
 | dbs_XMLQUERY_func
 | dbs_array_element_specification
 | dbs_array_constructor
 | dbs_OLAP_specification
 | dbs_row_change_expression
 | dbs_sequence_reference
 | (PLUSCHAR | MINUSCHAR) dbs_expression
 | dbs_expression ( AT LOCAL | AT TIME ZONE dbs_expression);

dbs_expression_operator: (CONCAT | PIPECHAR | PIPECHAR2 | SLASHCHAR | ASTERISKCHAR | PLUSCHAR | MINUSCHAR);

dbs_expressions: dbs_expression (dbs_expression_operator dbs_expression)* (AS common_built_in_type_core)?;

//https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_predicatesoverview.html
dbs_predicate_condition: (EQUALCHAR | LESSTHANCHAR | MORETHANCHAR | MORETHANOREQUAL | LESSTHANOREQUAL | NOTEQUALCHAR | NOTLESSTHANCHAR | NOTMORETHANCHAR );
dbs_quantified_predicate: dbs_expression dbs_predicate_condition (SOME|ANY|ALL)  LPARENCHAR dbs_select RPARENCHAR;
dbs_array_exists_predicate: ARRAY_EXISTS LPARENCHAR dbs_sql_identifier dbs_comma_separator INTEGERLITERAL RPARENCHAR;
dbs_basic_and_distinct_predicate: dbs_expressions (dbs_predicate_condition | IS NOT? DISTINCT FROM) dbs_expressions;
dbs_exist_predicate: EXISTS LPARENCHAR dbs_select RPARENCHAR;
dbs_in_predicate: dbs_expressions NOT? IN LPARENCHAR (dbs_fullselect | dbs_expressions (dbs_comma_separator dbs_expressions)*) RPARENCHAR;
dbs_between_predicate: dbs_expressions NOT? BETWEEN dbs_expressions AND dbs_expressions;
dbs_like_predicate: dbs_expressions NOT? LIKE dbs_expressions (ESCAPE dbs_expressions)?;
dbs_null_predicate: dbs_expression IS NOT? NULL;
dbs_predicate: dbs_basic_and_distinct_predicate
                | dbs_quantified_predicate //
                | dbs_array_exists_predicate
                | dbs_between_predicate // (
                | dbs_exist_predicate
                | dbs_in_predicate // (
                | dbs_like_predicate
                | dbs_null_predicate ;
dbs_searched_when_clause : (WHEN ((LPARENCHAR dbs_predicate RPARENCHAR) | dbs_predicate) THEN (dbs_result_expression1 | NULL))+;

dbs_function_invocation : dbs_function_name LPARENCHAR (ALL | DISTINCT)? (TABLE dbs_transition_table_name |
(dbs_expressions | DATELITERAL | ASTERISKCHAR) (dbs_comma_separator (dbs_expressions | DATELITERAL | ASTERISKCHAR) | NUMERICLITERAL)*)? RPARENCHAR;
dbs_cast_specification: (CAST | XMLCAST) LPARENCHAR (dbs_expression | NULL | dbs_parameter_marker) AS dbs_comment_parameter_type RPARENCHAR;
dbs_time_unit: (YEAR | YEARS | MONTH | MONTHS | DAY | DAYS | HOUR | HOURS | MINUTE | MINUTES | SECOND | SECONDS | MICROSECOND | MICROSECONDS );

dbs_array_element_specification: dbs_array_variable;
dbs_XMLQUERY_func: XMLQUERY LPARENCHAR  dbs_xquery_expression_constant (PASSING (BY REF)? dbs_row_xquery_argument  (dbs_comma_separator dbs_row_xquery_argument)*)? (RETURNING SEQUENCE (BY REF)?)? (EMPTY ON EMPTY)? RPARENCHAR;
dbs_xquery_expression_constant: (dbs_expression|COLONCHAR|LSQUAREBRACKET|RSQUAREBRACKET|LPARENCHAR|RPARENCHAR|SLASHCHAR|EQUALCHAR|DOLLARCHAR)+; //TODO: https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/xml/src/tpc/db2z_xpxqprologexpression.html
dbs_array_constructor: ARRAY LSQUAREBRACKET (QUESTIONMARK | dbs_fullselect | (dbs_array_element_specification | NULL)
(dbs_comma_separator (dbs_array_element_specification | NULL))*) RSQUAREBRACKET;

dbs_lag_lead_expression: LPARENCHAR dbs_expression (dbs_comma_separator INTEGERLITERAL (dbs_comma_separator INTEGERLITERAL (dbs_comma_separator SINGLEQUOTE RESPECT NULLS SINGLEQUOTE |
 dbs_comma_separator SINGLEQUOTE IGNORE NULLS SINGLEQUOTE)?)?)? RPARENCHAR;
dbs_lag_function: LAG dbs_lag_lead_expression;

dbs_lead_function: LEAD dbs_lag_lead_expression;

dbs_partitioning_expression: dbs_expression;
dbs_window_partition_clause: PARTITION BY dbs_partitioning_expression (dbs_comma_separator dbs_partitioning_expression)*
;
dbs_sort_key_expression: dbs_column_name (dbs_expression_operator dbs_column_name)* | INTEGERLITERAL;
dbs_window_each_order_clause: dbs_sort_key_expression (ASC (NULLS LAST)? | ASC NULLS FIRST | DESC (NULLS FIRST)? | DESC NULLS LAST )?;

dbs_window_order_clause: ORDER BY dbs_window_each_order_clause (dbs_comma_separator dbs_window_each_order_clause)*;

dbs_ordered_OLAP_specification: (CUME_DIST LPARENCHAR RPARENCHAR| PERCENT_RANK LPARENCHAR RPARENCHAR | RANK LPARENCHAR RPARENCHAR|
DENSE_RANK LPARENCHAR RPARENCHAR | NTILE LPARENCHAR INTEGERLITERAL RPARENCHAR | dbs_lag_function | dbs_lead_function)
OVER LPARENCHAR dbs_window_partition_clause? dbs_window_order_clause RPARENCHAR;

dbs_numbering_specification: ROW_NUMBER LPARENCHAR RPARENCHAR OVER LPARENCHAR dbs_window_partition_clause? dbs_window_order_clause? RPARENCHAR;
dbs_OLAP_specification: dbs_ordered_OLAP_specification |
 dbs_numbering_specification ;

dbs_table_designator: dbs_constant+; // TODO check me
dbs_row_change_expression: ROW CHANGE (TIMESTAMP | TOKEN) FOR dbs_table_designator;
dbs_sequence_reference: (NEXT| PREVIOUS) VALUE FOR dbs_sequence_name;
/////////////////DBS EXPRESSION ENDS///////////////////

/////// Variables /////////////
db2sql_db_privileges: DBADM | DBCTRL | DBMAINT | CREATETAB | CREATETS | DISPLAYDB | DROP | IMAGCOPY | LOAD | RECOVERDB | REORG | REPAIR | STARTDB | STATS | STOPDB;
db2sql_system_privileges: ACCESSCTRL | ARCHIVE | BINDADD | BINDAGENT | BSDS | CREATEALIAS | CREATEDBA | CREATEDBC | CREATESG | CREATETMTAB | CREATE_SECURE_OBJECT |
                         DATAACCESS | DBADM ((WITH | WITHOUT) ACCESSCTRL )? ((WITH | WITHOUT) DATAACCESS)? | DEBUGSESSION | DISPLAY | EXPLAIN | MONITOR1 | MONITOR2 | RECOVER | SQLADM | STOPALL | STOSPACE | SYSADM | SYSCTRL | SYSOPR | TRACE;

db2sql_table_view_privileges: ALTER | DELETE | INDEX | INSERT | REFERENCES | SELECT | TRIGGER | UPDATE;

dbs_inbuild_functions : ASCII  | AVG | BLOB | BIGINT | BINARY | CARDINALITY | CHAR | CHARACTER_LENGTH | CAST
                        | CHAR_LENGTH | CLOB | COALESCE | CONCAT | CONTAINS | CORR | CORRELATION | COUNT | COUNT_BIG
                        | COVARIANCE | CUME_DIST | DATE | DAY | DAYOFMONTH | DAYOFWEEK | DAYOFYEAR | DAYS | DBCLOB
                        | DECIMAL | DEC | DECFLOAT | DOUBLE | EXIT | EXTRACT | FLOAT | GRAPHIC | GROUP | GROUPING
                        | HASH | HEX | HOUR | INSERT | INTEGER | INT | LEFT | LENGTH | LOWER | MAX | MICROSECOND
                        | MIN | MINUTE | MONTH | PERCENT_RANK | POSITION | RANDOM | REAL | REPEAT | REPLACE | RIGHT
                        | ROWID | SECOND | SMALLINT | SPACE | STDDEV | SUBSTR | SUBSTRING | SUM | TIME | TIMESTAMP
                        | ROW_NUMBER | TRANSLATE | TRIM | TRUNCATE | UNICODE | UNPACK | UPPER | VALUE | VARBINARY
                        | VARCHAR | VARGRAPHIC | VARIANCE | XMLNAMESPACES | XMLTABLE | YEAR;

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
SESSION_USER );

dbs_applcompat_value: FUNCTION_LEVEL_10 | FUNCTION_LEVEL_11 | FUNCTION_LEVEL_12;
dbs_array_variable: dbs_sql_identifier LSQUAREBRACKET (dbs_expressions) RSQUAREBRACKET;
dbs_attr_host_variable: dbs_host_identifier | NUMERICLITERAL ; // VARCHAR(128)
dbs_bp_name: T=dbs_sql_identifier {validateLength($T.text, "Buffer pool name", 8);};
dbs_case_expression : CASE (dbs_searched_when_clause | dbs_simple_when_clause) (ELSE dbs_result_expression1)? END ;
dbs_cast_function_name: dbs_sql_identifier;
dbs_catalog_name: T=dbs_sql_identifier {validateLength($T.text, "Catalog name", 8);};
dbs_clone_table_name: T=dbs_sql_identifier {validateLength($T.text, "Clone table name", 128);};
dbs_collection_name: T=dbs_sql_identifier {validateLength($T.text, "Collection name", 128);}; // SQLIDENTIFIER are case sensitive. allows only uppercase or quoted string as per doc.
dbs_special_name: ABSOLUTE | ACCELERATION | ACCELERATOR | ACCESS | ACCESSCTRL | ACCTNG | ACTION | ACTIVATE | ACTIVE
                | ADD | ADDRESS | AFTER | AGE | ALGORITHM | ALIAS | ALL | ALLOCATE | ALLOW | ALTER | ALTERIN | ALWAYS
                | AND | ANY | APPEND | APPLCOMPAT | APPLICATION | APPLNAME | ARCHIVE | ARRAY | ARRAY_EXISTS | AS | ASC
                | ASENSITIVE | ASSOCIATE | ASUTIME | AT | ATOMIC | ATTRIBUTES | AUDIT | AUTHENTICATION | AUTHID
                | AUTONOMOUS | AUX | AUXILIARY | BASED | BEFORE | BEGIN | BETWEEN | BIND | BINDADD | BINDAGENT | BIT
                | BOTH | BSDS | BUFFERPOOL | BUFFERPOOLS | BUSINESS_TIME | BY | CACHE | CALL | CALLED | CALLER
                | CAPTURE | CASCADE | CASCADED | CASE | CATALOG_NAME | CCSID | CHANGE | CHANGED | CHANGES | CHARACTER
                | CHECK | CLAUSE | CLIENT | CLIENT_ACCTNG | CLIENT_APPLNAME | CLIENT_CORR_TOKEN | CLIENT_USERID
                | CLIENT_WRKSTNNAME | CLONE | CLOSE | CLUSTER | COLLECTION | COLLID | COLUMN | COLUMNS | COMMENT
                | COMMIT | COMMITTED | COMPATIBILITY | COMPRESS | CONCENTRATE | CONCURRENT | CONDITION
                | CONDITION_NUMBER | CONNECT | CONNECTION | CONSTRAINT | CONTEXT | CONTINUE | CONTROL
                | COPY | CREATE | CREATE_SECURE_OBJECT | CREATEALIAS | CREATEDBA | CREATEDBC | CREATEIN | CREATESG
                | CREATETAB | CREATETMTAB | CREATETS | CROSS | CS | CUBE | CURRENT | CURRENT_DATE | CURRENT_LC_CTYPE
                | CURRENT_PATH | CURRENT_SCHEMA | CURRENT_SERVER | CURRENT_TIME | CURRENT_TIMESTAMP | CURRENT_TIMEZONE
                | CURRENTLY | CURSOR | CURSOR_NAME | CURSORS | CYCLE | DATA | DATAACCESS | DATABASE | DATACLAS | DB2
                | DB2_AUTHENTICATION_TYPE | DB2_AUTHORIZATION_ID | DB2_CONNECTION_STATE | DB2_CONNECTION_STATUS
                | DB2_ENCRYPTION_TYPE | DB2_ERROR_CODE1 | DB2_ERROR_CODE2 | DB2_ERROR_CODE3 | DB2_ERROR_CODE4
                | DB2_GET_DIAGNOSTICS_DIAGNOSTICS | DB2_INTERNAL_ERROR_POINTER | DB2_LAST_ROW | DB2_LINE_NUMBER
                | DB2_MESSAGE_ID | DB2_MODULE_DETECTING_ERROR | DB2_NUMBER_PARAMETER_MARKERS | DB2_NUMBER_RESULT_SETS
                | DB2_NUMBER_ROWS | DB2_ORDINAL_TOKEN1 | DB2_ORDINAL_TOKEN2 | DB2_ORDINAL_TOKEN3 | DB2_ORDINAL_TOKEN4
                | DB2_PRODUCT_ID | DB2_REASON_CODE | DB2_RETURN_STATUS | DB2_RETURNED_SQLCODE | DB2_ROW_NUMBER
                | DB2_SERVER_CLASS_NAME | DB2_SQL_ATTR_CURSOR_HOLD | DB2_SQL_ATTR_CURSOR_ROWSET
                | DB2_SQL_ATTR_CURSOR_SCROLLABLE | DB2_SQL_ATTR_CURSOR_SENSITIVITY | DB2_SQL_ATTR_CURSOR_TYPE
                | DB2_SQL_NESTING_LEVEL | DB2_SQLERRD1 | DB2_SQLERRD2 | DB2_SQLERRD3 | DB2_SQLERRD4 | DB2_SQLERRD5
                | DB2_SQLERRD6 | DB2_SQLERRD_SET | DB2_TOKEN_COUNT | DB2SQL | DBADM | DBCTRL | DBINFO | DBMAINT
                | DEACTIVATE | DEALLOCATE | DEBUG | DEBUGSESSION | DEC_ROUND_CEILING | DEC_ROUND_DOWN | DEC_ROUND_FLOOR
                | DEC_ROUND_HALF_DOWN | DEC_ROUND_HALF_EVEN | DEC_ROUND_HALF_UP | DEC_ROUND_UP | DECLARE | DEFAULT
                | DEFAULTS | DEFER | DEFERRED | DEFINE | DEFINEBIND | DEFINER | DEFINERUN | DEGREE | DELETE
                | DENSE_RANK | DEPENDENT | DESC | DESCRIBE | DESCRIPTOR | DETERMINISTIC | DIAGNOSTICS | DISABLE
                | DISALLOW | DISPATCH | DISPLAY | DISPLAYDB | DISTINCT | DROP | DROPIN | DSSIZE
                | DYNAMIC | DYNAMICRULES | EACH | EBCDIC | EDITPROC | ELEMENT | ELIGIBLE | ELSE | EMPTY
                | ENABLE | ENCODING | ENCRYPTION | END | ENDING | ENFORCED | ENVIRONMENT | ERASE | ESCAPE | EUR
                | EVERY | EXCHANGE | EXCLUDE | EXCLUDING | EXCLUSIVE | EXECUTE | EXISTS | EXPLAIN | EXTERNAL
                | EXTRA | FAILBACK | FAILURE | FAILURES | FENCED | FETCH | FIELDPROC | FINAL | FIRST
                | FIXEDLENGTH | FOR | FOREIGN | FORMAT | FOUND | FREE | FREEPAGE | FULL | FUNCTION | FUNCTION_LEVEL_10
                | FUNCTION_LEVEL_11 | FUNCTION_LEVEL_12 | GBPCACHE | GENERAL | GENERATE | GENERATED | GENERIC | GET
                | GET_ACCEL_ARCHIVE | GLOBAL | GO | GOTO | GRANT | HAVING | HIDDENCHAR | HIGH | HINT
                | HISTORY | HOLD | HOURS | HUFFMAN | ID | IDENTITY | IGNORE | IMAGCOPY | IMMEDIATE | IMPLICITLY | IN
                | INCLUDE | INCLUDING | INCLUSIVE | INCREMENT | INDEX | INDEXBP | INDICATOR | INNER | INHERIT | INITIALLY
                | INLINE | INOUT | INPUT | INSENSITIVE | INSTEAD | INVALID | INVOKEBIND | INVOKERUN | IS
                | ISO | ISOLATION | JAR | JIS | JOBNAME | KEEP | KEY | KEYS | LABEL | LABELS | LAG
                | LANGUAGE | LARGE | LAST | LC_CTYPE | LEAD | LEVEL | LEFT | LIKE | LIMIT | LITERALS
                | LOAD | LOB | LOCAL | LOCALE | LOCATION | LOCATOR | LOCATORS | LOCK | LOCKED | LOCKMAX | LOCKS
                | LOCKSIZE | LOGGED | LOW | MAIN | MAINTAINED | MASK | MATCHED | MATERIALIZED | MAXPARTITIONS
                | MAXROWS | MAXVALUE | MEMBER | MERGE | MESSAGE_TEXT | MGMTCLAS | MICROSECONDS | MINUTES | MINVALUE
                | MIXED | MODE | MODIFIERS | MODIFIES | MONITOR1 | MONITOR2 | MONTHS | MORECHAR | MOVE | MULTIPLIER
                | NAME | NAMES | NAMESPACE | NATIONAL | NCNAME | NEW | NEW_TABLE | NEXT | NO | NODEFER | NONE | NOT
                | NTILE | NULL | NULLS | NULTERM | NUMBER | NUMERIC | NUMPARTS | OBID | OBJECT | OF | OFF
                | OFFSET | OLD | OLD_TABLE | ON | ONCE | ONLY | OPEN | OPERATION | OPTHINT | OPTIMIZATION | OPTIMIZE
                | OPTION | OPTIONAL | OPTIONS | OR | ORDER | ORDINALITY | ORGANIZE | ORIGINAL | OUT | OUTCOME | OUTER
                | OUTPUT | OVER | OVERLAPS | OVERRIDING | OWNER | OWNERSHIP | PACKADM | PACKAGE | PACKAGE_NAME
                | PACKAGE_SCHEMA | PACKAGE_VERSION | PACKAGESET | PADDED | PAGE | PAGENUM | PARALLEL | PARAMETER
                | PART | PARTITION | PARTITIONED | PARTITIONING | PASSING | PASSWORD | PATH | PCTFREE | PENDING | PERIOD
                | PERMISSION | PIECESIZE | PLAN | PORTION | POSITIONING | PRECISION | PREPARE | PRESERVE
                | PREVIOUS | PRIMARY | PRIOR | PRIQTY | PRIVILEGES | PROCEDURE | PROFILE | PROGRAM | PUBLIC | QUALIFIER
                | QUERY | QUERYNO | QUOTED_NONE | RANGE | RANK | READ | READS | RECOVER
                | RECOVERDB | REF | REFERENCES | REFERENCING | REFRESH | REGENERATE | REGISTERS | RELATIVE | RELEASE
                | REMOVE | RENAME | REOPT | REORG | REPAIR | REQUIRED | RESET | RESIDENT | RESOLUTION
                | RESPECT | RESTART | RESTRICT | RIGHT | RESULT | RETAIN | RETURN | RETURNED_SQLSTATE
                | RETURNING | RETURNS | REUSE | REVOKE | ROLE | ROLLBACK | ROLLUP | ROTATE | ROUND_CEILING
                | ROUND_DOWN | ROUND_FLOOR | ROUND_HALF_DOWN | ROUND_HALF_EVEN | ROUND_HALF_UP | ROUND_UP | ROUNDING
                | ROUTINE | ROW | ROW_COUNT | ROWS | ROWSET | RR | RS | RULES | RUN | SAVEPOINT | SBCS | SCHEMA
                | SCHEME | SCRATCHPAD | SCROLL | SECONDS | SECQTY | SECTION | SECURED | SECURITY | SEGSIZE | SELECT
                | SELECTIVITY | SENSITIVE | SEQUENCE | SERVAUTH | SERVER | SERVER_NAME | SESSION | SESSION_USER | SET
                | SETS | SHARE | SIGNAL | SIZE | SKIPCHAR | SOME | SOURCE | SPECIAL | SPECIFIC | SQLADM | SQLCA
                | SQL | SQLDA | SQLERROR | SQLEXCEPTION | SQLID | SQLSTATE
                | SQLWARNING | STABILIZED | STACKED | START | STARTDB | STARTING | STATEMENT | STATEMENTS | STATIC
                | STATS | STAY | STMTCACHE | STMTID | STMTTOKEN | STOGROUP | STOP | STOPALL | STOPDB | STORAGE
                | STORCLAS | STORES | STOSPACE | STRUCTURE | STYLE | SUB | SYNONYM | SYSADM | SYSCTRL | SYSDEFLT
                | SYSIBM | SYSOPR | SYSTEM | SYSTEM_TIME | TABLE | TABLESPACE | TEMPORAL | TEMPORARY | THEN | TIMEZONE
                | TO | TOKEN | TRACE | TRACKMOD | TRANSACTION | TRANSFER | TRIGGER | TRIGGERS | TRUSTED
                | TYPE | TYPES | UNIQUE | UNNEST | UPDATE | UPON | UR | URL | USA | USAGE
                | USE | USER | USERID | USING | VALIDATE | VALIDPROC | VALUES | VARIABLE | VARYING | VCAT | VERSION
                | VERSIONING | VERSIONS | VIEW | VOLATILE | VOLUMES | WAIT | WAITFORDATA | WHENEVER | WITH
                | WITHOUT | WLM | WORK | WORKFILE | WRAPPED | WRITE | WRKSTNNAME | XML | XMLCAST | XMLPATTERN | XMLQUERY
                | XMLSCHEMA | YEARS | YES | ZONE;
dbs_copy_id: CURRENT | PREVIOUS | ORIGINAL;
dbs_diagnostic_string_expression: dbs_expressions;
dbs_distinct_type: db2sql_data_types+;
// Note: The DPSEGSZ subsystem parameter is not directly specified in a CREATE TABLESPACE statement.
// ref: https://www.ibm.com/docs/en/db2-for-zos/12?topic=2-default-partition-segsize-field-dpsegsz-subsystem-parameter
dbs_encryption_value: QUOTED_NONE | LOW | HIGH;
dbs_explainable_sql_statement: ( dbs_allocate | dbs_alter | dbs_associate | dbs_fetch | dbs_insert | dbs_label | dbs_lock | dbs_merge | dbs_open |
 dbs_prepare | dbs_refresh | dbs_release | dbs_rename | dbs_select | dbs_truncate | dbs_select | dbs_set | dbs_delete | dbs_drop); // RE-CHECK
dbs_function_name: (dbs_sql_identifier DOT_FS)? dbs_sql_identifier; //must not be any of the  system-reserved keywords
//dbs_imptkmod_param: YES | NO;
dbs_include_data_type: dbs_alter_procedure_bit_int | dbs_alter_procedure_bit_decimal | dbs_alter_procedure_bit_float | dbs_alter_procedure_bit_decfloat | dbs_alter_procedure_bit_char | dbs_alter_procedure_bit_graphic | dbs_alter_procedure_bit_varchar | DATE | TIME | dbs_alter_procedure_bit_timestamp;
dbs_jobname_value: dbs_string_constant;
dbs_create_algorithm_level: INTEGERLITERAL {validateTokenWithRegex($INTEGERLITERAL.text, "^0*[0-2]$", "level 0, 1 and 2 are only allowed");};
dbs_non_deterministic_expression: DATA CHANGE OPERATION | dbs_special_register | dbs_session_variable;
dbs_session_variable : SYSIBM DOT_FS PACKAGE_NAME | SYSIBM DOT_FS PACKAGE_SCHEMA | SYSIBM DOT_FS PACKAGE_VERSION;
dbs_obfuscated_statement_text: dbs_constant+ ;
dbs_package_path: dbs_string_constant;
dbs_pageset_pagenum_param: ABSOLUTE | dbs_pagenum_char_a_r | RELATIVE;
dbs_parameter_marker: ( QUESTIONMARK | COLONCHAR dbs_host_variable);
dbs_parameter_name: T=dbs_sql_identifier {validateLength($T.text, "Parameter name", 128);};
dbs_permission_name: dbs_sql_identifier;
dbs_plan_name: T=dbs_sql_identifier {validateLength($T.text, "Plan name", 8);} ;
dbs_program_name: T=dbs_sql_identifier {validateLength($T.text, "Program name", 8);};
dbs_registered_xml_schema_name: dbs_sql_identifier;
dbs_result_expression1: dbs_expressions;
dbs_role_name: T=dbs_sql_identifier+ {validateLength($T.text, "Role name", 128);};
dbs_routine_version_id: T=dbs_sql_identifier {validateLength($T.text, "Routine version dbs_sql_identifier in UTF-8", 122);};
dbs_scalar_fullselect : LPARENCHAR dbs_fullselect RPARENCHAR;
dbs_schema_location: dbs_host_identifier;
dbs_schema_name: T=dbs_sql_identifier {validateLength($T.text, "Schema name", 128);};
dbs_search_condition
    : dbs_boolean_term (OR dbs_boolean_term)*
    ;
dbs_boolean_term
    : dbs_boolean_factor (AND dbs_boolean_factor)*
    ;
dbs_boolean_factor
    : (NOT)? dbs_boolean_primary
    ;
dbs_boolean_primary
    : dbs_predicate (SELECTIVITY dbs_integer_constant)?
    | LPARENCHAR dbs_search_condition RPARENCHAR
    ;
dbs_seclabel_name: T=dbs_sql_identifier {validateLength($T.text, "Security label", 8);};
dbs_simple_when_clause: (dbs_expressions) (WHEN dbs_expressions THEN (dbs_result_expression1 | NULL))+;
dbs_smallint: dbs_integer_constant;//MINUSCHAR? SINGLEDIGITLITERAL SINGLEDIGITLITERAL?;// java ref - -1 to 99
dbs_specific_name: dbs_object_name;
dbs_stogroup_name: T=dbs_sql_identifier {validateLength($T.text, "Storage group name", 128);};
dbs_string_expression: (DOUBLEQUOTE | SINGLEQUOTE) (dbs_allocate | dbs_alter | dbs_associate | dbs_comment | dbs_commit | dbs_create | dbs_declare_global |
  dbs_delete | dbs_drop | dbs_explain | dbs_free | dbs_grant |dbs_hold |dbs_insert | dbs_label | dbs_lock | dbs_merge | dbs_refresh | dbs_release|
  dbs_rename | dbs_revoke | dbs_rollback | dbs_savepoint | dbs_set | dbs_signal |dbs_truncate | dbs_update) (DOUBLEQUOTE | SINGLEQUOTE); // ref- https://www.ibm.com/support/knowledgecenter/SSEPEK_12.0.0/sqlref/src/tpc/db2z_sql_executeimmediate.html
dbs_synonym: T=dbs_sql_identifier {validateLength($T.text, "Synonym name", 128);};
dbs_table_reference: dbs_joined_table;

dbs_joined_table : dbs_join
            | dbs_braced_join
            ;

// Ref: A : A C | B
// Can be represented as
//      A: B A'
//      A': C A' | <null>;
// dbs_normal_join: dbs_table_reference dbs_join_type? JOIN dbs_table_reference ON dbs_join_condition;
//dbs_normal_join: dbs_table_reference_non_join dbs_normal_join_prime;
dbs_join: dbs_table_reference_non_join dbs_join_prime;
dbs_join_prime: dbs_join_alpha dbs_join_prime | empty_rule;
dbs_join_alpha: (INNER | (LEFT | RIGHT | FULL) OUTER? | CROSS) JOIN dbs_table_reference (ON dbs_join_condition)?;
dbs_braced_join: LPARENCHAR dbs_joined_table RPARENCHAR;
empty_rule:/* epsilon */;

dbs_table_reference_non_join : dbs_single_table_ref | dbs_nested_table_expression | dbs_data_change_table_ref | dbs_table_function_ref |
 dbs_table_locator_ref | dbs_xmltable_expression | dbs_collection_derived_table;
dbs_single_table_ref : dbs_table_name dbs_period_specification* dbs_correlation_clause?;
dbs_period_specification : FOR (SYSTEM_TIME | BUSINESS_TIME) (AS OF dbs_expressions | FROM dbs_expressions TO dbs_expressions  | BETWEEN dbs_expressions AND dbs_expressions);
dbs_correlation_clause : AS? dbs_correlation_name (LPARENCHAR dbs_column_name (dbs_comma_separator dbs_column_name)* RPARENCHAR)?;
dbs_nested_table_expression : TABLE? LPARENCHAR dbs_fullselect RPARENCHAR dbs_correlation_clause?;
dbs_data_change_table_ref : (FINAL TABLE LPARENCHAR dbs_insert RPARENCHAR | (FINAL | OLD) TABLE LPARENCHAR dbs_update RPARENCHAR |
 OLD TABLE LPARENCHAR dbs_delete RPARENCHAR | FINAL TABLE LPARENCHAR dbs_merge RPARENCHAR) dbs_correlation_clause?;
dbs_table_function_ref : TABLE LPARENCHAR  dbs_function_name LPARENCHAR ((dbs_expression | TABLE dbs_transition_table_name) (dbs_comma_separator (dbs_expression |
                        TABLE dbs_transition_table_name))*)* RPARENCHAR dbs_table_udf_cardinality_clause? RPARENCHAR (dbs_correlation_clause | dbs_type_correlation_clause)?;
dbs_table_udf_cardinality_clause : CARDINALITY dbs_integer_constant | CARDINALITY MULTIPLIER INTEGERLITERAL;
dbs_type_correlation_clause : AS? dbs_correlation_name LPARENCHAR (dbs_column_name dbs_data_type_2 (dbs_comma_separator dbs_column_name dbs_data_type_2)*) RPARENCHAR;
dbs_table_locator_ref : TABLE LPARENCHAR dbs_host_variable LIKE dbs_table_name RPARENCHAR dbs_correlation_name?;
dbs_xmltable_expression : dbs_xmltable_function dbs_correlation_clause?;
dbs_xmltable_function : XMLTABLE LPARENCHAR (dbs_xml_namespace_declaration dbs_comma_separator)? dbs_row_query_expression_constant (PASSING (BY REF)?
                        dbs_row_xquery_argument (dbs_comma_separator dbs_row_xquery_argument)*)? (COLUMNS (dbs_xml_table_regular_column_defn |
                        dbs_xml_table_ordinality_column_defn) (dbs_comma_separator (dbs_xml_table_regular_column_defn | dbs_xml_table_ordinality_column_defn))* RPARENCHAR)?;
dbs_xml_namespace_args : dbs_string_constant AS dbs_string_constant | DEFAULT  dbs_string_constant | NO DEFAULT;
dbs_xquery_variable_expression : dbs_expression;
dbs_xml_namespace_declaration : XMLNAMESPACES LPARENCHAR  dbs_xml_namespace_args (dbs_comma_separator dbs_xml_namespace_args)* RPARENCHAR;
dbs_row_query_expression_constant: dbs_string_constant; //  must not contain an empty string or a string of all blanks.
dbs_column_xquery_expression_constant: dbs_string_constant; // must not be an empty string or a string of all blanks
dbs_row_xquery_argument : dbs_xquery_context_item_expression | dbs_xquery_variable_expression AS (dbs_string_constant | dbs_sql_identifier) (BY REF)?;
dbs_xml_table_regular_column_defn : dbs_column_name dbs_data_type_2 (column_def_clause | PATH dbs_column_xquery_expression_constant)?;
dbs_xml_table_ordinality_column_defn: dbs_column_name FOR ORDINALITY;
dbs_collection_derived_table :  UNNEST LPARENCHAR (dbs_ordinary_array_expression (dbs_comma_separator dbs_ordinary_array_expression)* | dbs_assosiative_array_expression) RPARENCHAR (WITH ORDINALITY)? dbs_correlation_clause?;
dbs_ordinary_array_expression : dbs_sql_identifier;
dbs_assosiative_array_expression : dbs_string_constant;
dbs_join_condition: dbs_inner_left_outer_join | dbs_full_join_expression;
dbs_inner_left_outer_join : dbs_search_condition;
dbs_full_join_expression : (dbs_column_name | dbs_cast_specification) | COALESCE LPARENCHAR (dbs_column_name | dbs_cast_specification) (dbs_comma_separator dbs_column_name | dbs_comma_separator dbs_cast_specification)+ RPARENCHAR;
dbs_table_space_name: T=dbs_sql_identifier {validateDbNames($T.text);};
dbs_transition_table_name: dbs_sql_identifier;
dbs_trigger_version_id: dbs_sql_identifier;
dbs_triggered_sql_statement : dbs_call | dbs_delete | dbs_select_statement_common_table_expression | dbs_fullselect | dbs_insert | dbs_merge | dbs_refresh |
                               dbs_set | dbs_signal | dbs_truncate | dbs_update | dbs_values_statement;
dbs_values_statement : VALUES  (LPARENCHAR dbs_expression (dbs_comma_separator dbs_expression)* RPARENCHAR | dbs_expression) ;
dbs_triggered_sql_statement_basic: dbs_triggered_sql_statement;
dbs_version_id: dbs_host_variable | dbs_sql_identifier | dbs_string_constant;
dbs_view_name: dbs_host_variable | dbs_alias_name;
dbs_comma_separator: (COMMASEPARATORDB2 | COMMACHAR);
dbs_semicolon_end: SEMICOLON_FS | SEMICOLONSEPARATORSQL;

////////  BUILDING BLOCKS   ///
///////  Ref: https://www.ibm.com/docs/en/db2-for-zos/12?topic=elements-naming-conventions ////
dbs_integer_constant: INTEGERLITERAL | NUMERICLITERAL; //range 1 - 32767
dbs_sql_identifier: dbs_generic_identifier_without_inbuild_function_names | dbs_inbuild_functions | CHAR_STRING_LITERAL_SINGLE_QUOTE;
dbs_generic_identifier_without_inbuild_function_names : IDENTIFIER | JOIN | UNION| EXCEPT | INTERSECT | dbs_special_name ;
dbs_constant : (dbs_string_constant | dbs_integer_constant);
dbs_generic_name: dbs_host_variable | dbs_string_constant | dbs_sql_identifier; //TODO : check this
dbs_string_constant: CHAR_STRING_LITERAL_DOUBLE_QUOTE | HEXSTRING | BXSTRING | GRAPHIC_CONSTANT | DATELITERAL;
dbs_accelerator_name: dbs_sql_identifier; // TODO {1-8 chars}
dbs_alias_name
    : dbs_sql_identifier (DOT_FS dbs_sql_identifier (DOT_FS dbs_sql_identifier)?)?
    ;
dbs_array_type_name: dbs_sql_identifier (DOT_FS dbs_sql_identifier)?;
dbs_authorization_name: dbs_sql_identifier;
dbs_authorization_id: dbs_string_constant;
dbs_aux_table_name: dbs_alias_name; //TODO {validateLength($T.text, "Auxiliary table name", 128);};
dbs_table_name: dbs_alias_name;
dbs_collection_id: dbs_sql_identifier;
dbs_column_name_without_alias: dbs_sql_identifier;
dbs_column_name: dbs_column_name_without_alias (DOT_FS dbs_sql_identifier (DOT_FS dbs_sql_identifier (DOT_FS dbs_sql_identifier)?)?)? ; //TODO {validateLength($T.text, "Column name", 30);};
dbs_constraint_name: dbs_sql_identifier; //todo {validateLength($T.text, "Constraint name", 128);};
dbs_context_name: dbs_sql_identifier; //TODO {validateLength($T.text, "Profile name", 127);};
dbs_correlation_name: IDENTIFIER | dbs_special_name | dbs_inbuild_functions | UNION| EXCEPT | INTERSECT; //todo {validateLength($T.text, "Correlation name", 128);};
dbs_cursor_name: dbs_sql_identifier;
dbs_host_identifier: COLONCHAR dbs_sql_identifier (DOT_FS dbs_sql_identifier)?; //todo: {validateLength($T.text, "Cursor name", 128);};
dbs_database_name: dbs_sql_identifier; //TODO check identifier must start with a letter and must not include special characters
dbs_host_variable:  dbs_host_identifier (INDICATOR?  dbs_host_identifier)?;
dbs_host_label: COLONCHAR? dbs_sql_identifier;
dbs_descriptor_name: dbs_host_variable;// dbs_descriptor_name: COLONCHAR? (SQLD | SQLDABC | SQLN | SQLVAR | SQLDA | IDENTIFIER);
dbs_distinct_type_name: dbs_generic_identifier_without_inbuild_function_names | CHAR_STRING_LITERAL_SINGLE_QUOTE;
dbs_external_program_name:  dbs_procedure_name;
dbs_procedure_name: dbs_alias_name | dbs_host_identifier; // {validateLength($T.text, "Procedure name", 128);};
dbs_profile_name: dbs_sql_identifier;
db2_function_name: dbs_sql_identifier (DOT_FS dbs_sql_identifier)?;
dbs_global_variable:  dbs_sql_identifier (DOT_FS dbs_sql_identifier)?;
dbs_index_name: dbs_sql_identifier (DOT_FS dbs_sql_identifier)?
		      | dbs_authorization_id  DOT_FS dbs_sql_identifier; // {validateLength($T.text, "Index name", 128);};
dbs_location_name: dbs_sql_identifier; // TODO: A location name is 1 to 16 bytes, does not include alphabetic extenders (national characters), lowercase letters, or Katakana characters.
dbs_mask_name:  dbs_sql_identifier (DOT_FS dbs_sql_identifier)?;
dbs_parameter: dbs_expression | TABLE dbs_sql_identifier | NULL;
dbs_package_name:  (dbs_sql_identifier DOT_FS)? dbs_sql_identifier;
dbs_sequence_name : dbs_sql_identifier (DOT_FS dbs_sql_identifier)?; //  {validateLength($T.text, "Sequence name", 128);};
dbs_trigger_name :  dbs_sql_identifier (DOT_FS dbs_sql_identifier)?; // {validateLength($T.text, "Trigger name", 128);};
dbs_version_name: CHAR_STRING_LITERAL_DOUBLE_QUOTE | dbs_host_variable | ;//empty alternative;
dbs_object_name: dbs_sql_identifier (DOT_FS dbs_sql_identifier)?;
dbs_sql_variable_reference: dbs_host_variable | dbs_object_name;
dbs_statement_name: dbs_sql_identifier;
dbs_xquery_context_item_expression: dbs_generic_name;

/////  validation rules /////
dbs_integer5: INTEGERLITERAL;
dbs_integer12: INTEGERLITERAL;
dbs_integer1200: INTEGERLITERAL;
dbs_integer1208: INTEGERLITERAL;
dbs_decfloat_integer: INTEGERLITERAL ;
dbs_decimal_15_31: INTEGERLITERAL;
dbs_pagenum_char_a_r: dbs_sql_identifier;
dbs_char_s: dbs_sql_identifier;
dbs_function_language: dbs_sql_identifier ;
dbs_function_parameter_style: dbs_sql_identifier;
oneof_lang: dbs_sql_identifier;
dbs_k_m_g_identifier: dbs_sql_identifier;
dbs_pieceSize : dbs_sql_identifier;
kmg_blob_parameter: INTEGERLITERAL dbs_k_m_g_identifier? | dbs_sql_identifier;
dbs_dsize_parameter: INTEGERLITERAL dbs_sql_identifier | dbs_sql_identifier;
dbs_maxPartition: INTEGERLITERAL;
dbs_minus_one: MINUSCHAR INTEGERLITERAL;
/////
