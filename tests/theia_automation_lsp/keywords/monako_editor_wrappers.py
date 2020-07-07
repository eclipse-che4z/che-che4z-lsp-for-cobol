# Copyright (c) 2020 Broadcom.
# The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
#
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Broadcom, Inc. - initial API and implementation


def get_line_content(cls, line_number, trim=False, editor=None):
    return cls.get_line_content_with_number(line_number, trim=trim, editor=editor)


def get_active_editor(cls):
    return cls.get_editor_element()


def focus_in(cls, editor):
    return cls.set_focus(editor)


def get_editor_id(cls, editor):
    return cls.get_element_id(editor)


def get_hostname_from_id(cls, id):
    return cls.get_hostname_from_id_value(id)


def get_dataset_member_from_id(cls, id):
    return cls.get_dataset_member_from_id_value(id)


def get_active_editor_tab(cls):
    return cls.get_active_tab()


def get_active_tab(cls):
    return cls.get_active_tab_element()


def get_active_tab_id(cls, tab):
    return cls.get_element_id(tab)


def wait_for_tab(cls, dataset, member):
    return cls.wait_for_tab_with_dataset_member(dataset, member)


def wait_for_tab_with_title(cls, title):
    return cls.wait_for_tab_exist(title)


def find_lines_with_errors(cls, editor):
    return cls.find_errors_on_screen(editor)


def find_lines_with_warnings(cls, editor):
    return cls.find_errors_on_screen(editor, error_type="info")


def mark_lines(cls, line_numbers_list, editor=None):
    return cls.mark_lines_with_numbers(line_numbers_list, editor=editor)


def show_error_tooltip_for_line_number(cls, line_number, editor=None):
    return cls.show_error_tooltip(line_number, editor=editor)


def show_info_tooltip_for_line_number(cls, line_number, editor=None):
    return cls.show_info_tooltip(line_number, editor=editor)


def close_tab(cls, tab_element):
    return cls.close_tab_element(tab_element)


def close_tab_with_member(cls, dataset, member):
    return cls.close_tab_with_dataset_member(dataset, member)


def scroll_editor_for_line_number(cls, direction, line_number, active_editor):
    return cls.scroll_editor_till_line_number(line_number, direction, active_editor)


def select_line(cls, line_number):
    return cls.select_line_element(line_number)


def append_spaces_to_line(cls, line_element):
    return cls.append_ending_spaces_to_line(line_element)


def add_new_line(cls):
    return cls.press_enter_here()


def call_auto_complete(cls):
    return cls.call_auto_complete_here()


def call_find_all_references(cls):
    return cls.call_find_all_references_here()


def wait_for_autocomplete_suggest(cls):
    return cls.wait_for_suggest_widget_is_visible()


def choose_from_suggestion(cls, suggest_widget, element):
    return cls.choose_item_from_suggestion(suggest_widget, element)


def fill_snippets_with(cls, values):
    return cls.fill_snippets_with_values(values)


def click_inside_definition(cls, line_number, text, editor=None):
    return cls.click_on_text(line_number, text, editor=editor)


def get_current_line_number(cls, content=None, editor=None):
    return cls.get_current_line_num(content, editor)


def get_current_line_number_in_widget_zone(cls, content=None, editor=None):
    return cls.get_current_line_num_inside_widget_zone(content, editor)


def close_zone_if_exists(cls, editor=None):
    return cls.close_zone_widget_if_exists(editor)


def get_number_of_references(cls, editor=None):
    return cls.get_references_num(editor)


def navigate_to_reference(cls, reference_num, content=None, editor=None):
    return cls.get_line_num_for_reference(reference_num, content, editor)


def navigate_by_references(cls, editor=None):
    return cls.navigate_with_references(editor)
