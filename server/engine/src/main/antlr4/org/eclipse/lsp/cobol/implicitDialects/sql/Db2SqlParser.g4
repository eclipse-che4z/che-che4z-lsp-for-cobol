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

dbs_special_name: AND | AS | BINARY | BLOB | BLOB_FILE | BLOB_LOCATOR | CHAR | CHARACTER | CLIENT
                  | CLOB | CLOB_FILE | CLOB_LOCATOR | CURRENT | DBCLOB | DBCLOB_FILE | DBCLOB_LOCATOR
                  | G_CHAR | IS | K_CHAR | LARGE | LIKE | LOCATOR | M_CHAR | NOT | OBJECT | OCCURS|  OR
                  | RESULT_SET_LOCATOR | ROWID | SELECTIVITY | SERVER | SQL | TABLE | TIMES | TYPE | USAGE
                  | VARBINARY | VARYING | XML;

dbs_integer: INTEGERLITERAL | SINGLEDIGIT_1 | DOUBLEDIGIT_1 | SINGLEDIGITLITERAL;
dbs_integer_constant: dbs_integer | NUMERICLITERAL; //range 1 - 32767
dbs_search_condition: (NOT? (SELECTIVITY dbs_integer_constant)? | LPARENCHAR dbs_search_condition RPARENCHAR) ((AND|OR) NOT?
                      ( dbs_search_condition))* ;
dbs_integerliteral_expanded: MINUSCHAR? (INTEGERLITERAL|SINGLEDIGITLITERAL|SINGLEDIGIT_1);
dbs_level_01: SINGLEDIGIT_1 | DOUBLEDIGIT_1;
