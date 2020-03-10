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

import time
import urllib.parse
import os
import base64
from copy import deepcopy
from selenium.common.exceptions import WebDriverException, NoSuchElementException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from inc.exceptions.assert_exception import AssertException
from inc.exceptions.custom_timeout_exception import CustomTimeoutException
from inc.exceptions.element_not_found_exception import ElementNotFoundException
from inc.exceptions.general_exception import GeneralException
from inc.exceptions.no_line_number_exception import NoLineNumberOnScreenException
from inc.helpers import highlight, dump, bool2str
from inc.theia import constants, lsp_constants
from inc.theia.main_menu import MainMenu
from inc.theia.ui import UI
from lib.common_driver import CommonDriver
from inc.decorators.wait_till_exist import WaitTillExist


class MonakoEditor(CommonDriver):

    def __init__(self, driver=None):
        super(MonakoEditor, self).__init__(driver)

    @staticmethod
    def unquote_http_value(value):
        return urllib.parse.unquote(value)

    @staticmethod
    def extract_file_path_from_id_value(id_value):
        return ":".join(id_value.split(":")[1:])

    def get_dataset_member_from_id_value(self, id_value):
        unquoted_id_value = self.unquote_http_value(id_value)
        file_path = self.extract_file_path_from_id_value(unquoted_id_value)
        mf_element = file_path.split("/")[-1]
        dataset, member = mf_element.split("_")[0], os.path.splitext(mf_element.split("_")[1])[0]

        return dataset, member

    def get_hostname_from_id_value(self, id_value):
        unquoted_id_value = self.unquote_http_value(id_value)
        file_path = self.extract_file_path_from_id_value(unquoted_id_value)
        hostname_encoded = file_path.split("/")[-2]
        hostname = base64.standard_b64decode(hostname_encoded).decode('UTF-8')

        return hostname

    def get_active_tab_element(self):
        # <li> id like "^shell-tab-code-editor-opener:.*$"
        main_content = self.find_it(UI.get_theia_main_content_panel_locator())
        tab_container = self.find_it(UI.get_tab_content_locator(), parent=main_content)
        tabs = self.find_them(UI.get_tabs_locator(), parent=tab_container)

        for tab in tabs:
            if constants.THEIA_CURRENT_TAB in tab.get_attribute(constants.TYPE_CLASS):
                return tab

        return None

    def close_tab_element(self, tab_element, save=False):
        modified = constants.THEIA_UNSAVED_FILE in tab_element.get_attribute(constants.TYPE_CLASS)
        close_button = self.find_it(UI.get_tab_close_button_locator(), parent=tab_element)
        self.click_me(close_button, element_human_name=constants.Close, effect_time=1)

        if modified:
            print("File was modified")
            tab_title = self.find_it(UI.get_tab_label_locator(), parent=tab_element)
            msg = lsp_constants.SAVE_DIALOG_TEMPLATE.format(tab_title.text)

            dialog_shell = self.find_it(UI.get_theia_dialog_shell_locator())
            dialog_title = self.find_it(UI.get_theia_dialog_title_locator(), parent=dialog_shell)

            control_button = None

            if dialog_title.text.upper() == msg.upper():
                dialog_control = self.find_it(UI.get_theia_dialog_control_locator(), parent=dialog_shell)
                control_buttons = self.find_them(UI.get_buttons_locator(), parent=dialog_control)
                for control_button in control_buttons:
                    button_text = control_button.text
                    if not save and button_text == constants.THEIA_DIALOG_DONT_SAVE_BUTTON:
                        break

                    if save and button_text == constants.THEIA_DIALOG_SAVE_BUTTON:
                        break

            if control_button is not None:
                self.click_me(control_button, effect_time=1)

        else:
            print("File was NOT modified")

    def close_tab_with_dataset_member(self, dataset, member):
        tab = self.wait_for_tab_with_dataset_member(dataset, member)
        self.close_tab_element(tab)

    @staticmethod
    def get_tab_element_title(tab):
        return tab.text

    def wait_for_tab_with_dataset_member(self, dataset, member):
        tab_text = lsp_constants.TAB_TITLE_TEMPLATE.format(dataset.upper(), member.upper())
        return self.wait_for_tab_exist(tab_text)

    @WaitTillExist()
    def wait_for_tab_exist(self, tab_text):

        main_content = self.find_it(UI.get_theia_main_content_panel_locator())
        tab_container = self.find_it(UI.get_tab_content_locator(), parent=main_content)
        tabs = self.find_them(UI.get_tabs_locator(), parent=tab_container)

        for tab in tabs:
            if tab.text == tab_text:
                return tab

        raise WebDriverException

    @WaitTillExist()
    def wait_for_sub_tab_exist(self, tab_text):
        main_content = self.find_it(UI.get_theia_main_content_panel_locator())
        dock_panel = self.find_it(UI.get_theia_dock_panel_locator(), parent=main_content)

        highlight(dock_panel, effect_time=1)

        tabs = self.find_them(UI.get_tabs_locator(), parent=dock_panel)

        for tab in tabs:
            if tab.text == tab_text:
                highlight(tab, effect_time=1)

                if constants.THEIA_CURRENT_TAB not in tab.get_attribute(constants.TYPE_CLASS):
                    self.click_me(tab)

                return tab

        raise WebDriverException

    @staticmethod
    def get_element_id(element):
        return element.get_attribute(constants.TYPE_ID)

    def get_editor_element(self):
        # <div> id like "^code-editor-opener:.*$"
        main_content = self.find_it(UI.get_theia_main_content_panel_locator())

        eds = self.find_them(UI.get_theia_dock_panel_widgets_locator(), parent=main_content)

        for ed in eds:
            classes = ed.get_attribute(constants.TYPE_CLASS)
            if constants.THEIA_HIDDEN not in classes:
                highlight(ed, effect_time=1)
                return ed

    def set_focus(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        self.click_me(editor)

    def set_focus_in_user_preferences(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        user_preferences = self.find_it(UI.get_theia_user_preferences_locator(), parent=editor)
        self.click_me(user_preferences)
        return user_preferences

    def get_line_numbers_elements(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        line_numbers = self.find_them(UI.get_monako_line_numbers_content_locator(), parent=editor)
        return line_numbers

    def get_line_number_element(self, number, line_numbers_elements=None, editor=None):
        print("Find line element with number: '{0}'".format(number))
        if line_numbers_elements is None:
            line_numbers_elements = self.get_line_numbers_elements(editor)

        for line_numbers_element in line_numbers_elements:
            print("Checking line. It's number: '{0}'".format(line_numbers_element.text))
            if str(line_numbers_element.text) == str(number):
                highlight(line_numbers_element)
                parent_element = self.get_parent_node(line_numbers_element)
                return parent_element

        raise NoLineNumberOnScreenException(
            self.get_driver(),
            call_from=self.get_line_number_element.__name__,
            msg="No line with number '{0}' found".format(number)
        )

    def get_current_line_num(self, content=None, parent=None):
        if parent is None:
            parent = self.get_editor_element()

        overlays = self.find_it(UI.get_monako_overlays_locator(), parent=parent)

        highlight(overlays, effect_time=1)

        current = self.find_it(UI.get_current_line_locator(), parent=overlays)
        print("Found current Line")
        highlight(current, effect_time=1)

        top_current = self.get_parent_node(current)
        top = self.get_element_top(top_current)
        line_number = self.get_line_number_from_top(top, editor=parent)
        print("The number of the current line: '{0}'".format(line_number))

        if content is not None:
            print("Check if line contains '{0}'...".format(content))

            line_content = self.get_line_content_with_number(line_number, editor=parent)

            if line_content.find(content) == -1:
                raise AssertException(
                    self.get_driver(),
                    content,
                    line_content,
                    call_from=self.get_current_line_num.__name__
                )

            print("...Ok")

        line_number_element = self.get_line_number_element(line_number, editor=parent)
        highlight(line_number_element, effect_time=1)

        return line_number

    def get_lines_elements(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        lines = self.find_it(UI.get_monako_lines_content_locator(), parent=editor)
        lines_list = self.find_them(UI.get_monako_editor_lines_locator(), parent=lines)

        return lines_list

    def get_line_element_with_number(self, number, editor=None, line_elements=None, line_numbers_elements=None):
        if editor is None:
            editor = self.get_editor_element()

        if line_elements is None:
            line_elements = self.get_lines_elements(editor)

        print("line_elements", line_elements, len(line_elements))

        if line_numbers_elements is None:
            line_numbers_elements = self.get_line_numbers_elements(editor)

        print("line_numbers_elements", line_numbers_elements, len(line_numbers_elements))

        line_number_element = self.get_line_number_element(number, line_numbers_elements)

        top = self.get_element_top(line_number_element)
        print("top", top)

        for line_element in line_elements:
            line_top = self.get_element_top(line_element)
            print("compare if: '{0}' == '{1}'".format(line_top, top))
            if line_top == top:
                print("Line: {0}: Text: {1}".format(number, line_element.text))
                return line_element

        raise NoLineNumberOnScreenException(
            self.get_driver(),
            call_from=self.get_line_element_with_number.__name__,
            msg="Couldn't find line with top '{0}' style attribute".format(top)
        )

    def get_line_content_with_number(self, number, trim=False, editor=None):
        line_element = self.get_line_element_with_number(number, editor)
        content = line_element.text
        if trim:
            content = content.strip()

        return content

    def get_text_element_in_line(self, line_element, text):
        text_elements = self.find_them(UI.get_spans_locator(), parent=line_element)
        for text_element in text_elements:
            highlight(text_element)
            if text_element.text.strip() == text:
                return text_element

    def get_line_number_from_top(self, top, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        line_numbers_elements = self.get_line_numbers_elements(editor)
        for line_numbers_element in line_numbers_elements:
            parent = self.get_parent_node(line_numbers_element)
            parent_top = self.get_element_top(parent)
            if parent_top == top:
                return line_numbers_element.text

    def scroll_editor_till_line_number(self, number, direction, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        start_time = round(time.time())
        while True:
            self.set_focus(editor)
            line_numbers_elements = self.get_line_numbers_elements()

            elapsed_time = round(time.time())
            if elapsed_time - start_time > constants.DEFAULT_HUGE_TIMEOUT:
                raise CustomTimeoutException(self.get_driver(), call_from=self.scroll_editor_till_line_number.__name__)

            try:
                line_number_element = self.get_line_number_element(number, line_numbers_elements)
                if line_number_element is not None:
                    highlight(line_number_element, effect_time=1)
                    return line_number_element

            except NoLineNumberOnScreenException:
                if direction == "Down":
                    self.page_down(editor)

                elif direction == "Up":
                    self.page_up(editor)

            except Exception:
                raise GeneralException(self.get_driver(), call_from=self.scroll_editor_till_line_number.__name__)

    def page_down(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        self.set_focus(editor)
        self.send_key_sequence([Keys.PAGE_DOWN])

    def page_up(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        self.set_focus(editor)
        self.send_key_sequence([Keys.PAGE_UP])

    @WaitTillExist(timeout=constants.DEFAULT_TIMEOUT)
    def error_should_present(self, editor=None, error_type=None, error_should_exist=True):
        if editor is None:
            editor = self.get_editor_element()

        if error_type is None:
            error_type = "error"

        overlays = self.find_it(UI.get_monako_overlays_locator(), parent=editor)

        if error_type == "error":
            error_divs = self.find_them(UI.get_editor_errors_locator(), parent=overlays)

        elif error_type == "info":
            error_divs = self.find_them(UI.get_editor_infos_locator(), parent=overlays)

        else:
            raise Exception("Unsupported error_type: '{0}'".format(error_type))

        if not len(error_divs) and error_should_exist:
            raise WebDriverException

        if len(error_divs) and not error_should_exist:
            raise WebDriverException

        return error_divs

    def find_errors_on_screen(self, editor=None, error_type="error", error_should_exist=True):
        if editor is None:
            editor = self.get_editor_element()

        error_lines = list()

        error_divs = self.error_should_present(
            editor=editor,
            error_type=error_type,
            error_should_exist=error_should_exist
        )
        print("error_divs: '{0}'".format(error_divs))
        # debug!
        if not len(error_divs) and error_should_exist:
            dump(self.get_driver(), reason=self.find_errors_on_screen.__name__)

        for error_div in error_divs:
            parent = self.get_parent_node(error_div)
            top = self.get_element_top(parent)
            line_num = self.get_line_number_from_top(top, editor)
            error_lines.append(line_num)

        return error_lines

    def mark_lines_with_numbers(self, line_numbers, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        lines_to_mark = list()

        line_elements = self.get_lines_elements(editor)
        line_numbers_elements = self.get_line_numbers_elements()

        for line_number in line_numbers:
            line = self.get_line_element_with_number(
                line_number,
                editor=editor,
                line_elements=line_elements,
                line_numbers_elements=line_numbers_elements
            )
            lines_to_mark.append(line)

        highlight(lines_to_mark, effect_time=1)

    def show_error_tooltip(self, line_number, editor=None):
        return self.show_tooltip("error", line_number, editor)

    def show_info_tooltip(self, line_number, editor=None):
        return self.show_tooltip("info", line_number, editor)

    @WaitTillExist()
    def find_active_hover_element(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        hovers = self.find_them(UI.get_monako_hover_locator(), parent=editor)
        print("hovers", hovers, len(hovers))

        for hover in hovers:
            print("hover class", hover.get_attribute(constants.TYPE_CLASS))
            if constants.STATE_HIDDEN not in hover.get_attribute(constants.TYPE_CLASS):
                return hover

        dump(self.get_driver(), reason=self.find_active_hover_element.__name__)
        raise WebDriverException

    @WaitTillExist()
    def get_error_divs(self, divs_locator, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        highlight(editor, effect_time=1)

        overlays = self.find_it(UI.get_monako_overlays_locator(), parent=editor)
        error_divs = self.find_them(divs_locator, parent=overlays)

        print("error_divs", error_divs)

        if not len(error_divs):
            raise WebDriverException

        return error_divs

    def show_tooltip(self, tooltip_type, line_number, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        highlight(editor, effect_time=1)

        if tooltip_type == "error":
            divs_locator = UI.get_editor_errors_locator()

        elif tooltip_type == "info":
            divs_locator = UI.get_editor_infos_locator()

        else:
            raise Exception("Unsupported tooltip type")

        error_divs = self.get_error_divs(divs_locator, editor)
        error_div = None
        for error_div in error_divs:
            parent = self.get_parent_node(error_div)
            top = self.get_element_top(parent)
            line_num = self.get_line_number_from_top(top, editor)
            if line_num == line_number:
                break

        if error_div is None:
            raise ElementNotFoundException(self.get_driver())

        highlight(error_div, effect_time=1)
        actions = ActionChains(self.get_driver())
        actions.move_to_element(error_div).perform()
        time.sleep(1)
        hover = self.find_active_hover_element(editor=editor)
        hover_row = self.find_it(UI.get_hover_row_locator(), parent=hover)
        highlight(hover_row, effect_time=1)
        content = self.find_it(UI.get_hover_content_locator(), parent=hover_row)
        return content.text

    def select_line_element(self, number, editor=None):
        line_element = self.get_line_element_with_number(number, editor)
        highlight(line_element, effect_time=1)
        self.click_me(line_element)
        return line_element

    def append_ending_spaces_to_line(self, line_element):
        line_content = line_element.text
        spaces_num = 80 - len(line_content) + 1
        self.send_key_sequence([Keys.END, spaces_num * Keys.SPACE])

    def press_enter_here(self):
        self.send_key_sequence([Keys.END, Keys.ENTER])

    def call_auto_complete_here(self):
        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.CONTROL)
        actions.send_keys(Keys.SPACE)
        actions.key_up(Keys.CONTROL)
        actions.perform()

    def control_left_click(self, element):
        actions = ActionChains(self.get_driver())
        actions.move_to_element(element)
        actions.key_down(Keys.CONTROL)
        actions.click()
        actions.key_up(Keys.CONTROL)
        actions.perform()

    def call_find_all_references_here(self):
        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.SHIFT)
        actions.send_keys(Keys.F12)
        actions.key_up(Keys.SHIFT)
        actions.perform()

    @WaitTillExist()
    def wait_for_suggest_widget_is_visible(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        suggest_widget = self.find_it(UI.get_monako_suggest_widget_locator(), parent=editor)

        if constants.STATE_VISIBLE not in suggest_widget.get_attribute(constants.TYPE_CLASS):
            raise WebDriverException

        return suggest_widget

    @WaitTillExist()
    def wait_for_suggestion_rows_is_loaded(self, parent):
        rows = self.find_them(UI.get_monako_list_row_locator(), parent=parent)
        if not len(rows):
            raise WebDriverException

    def choose_item_from_suggestion(self, suggest_widget, element):
        rows_element = self.find_it(UI.get_monako_list_rows_locator(), parent=suggest_widget)
        self.wait_for_suggestion_rows_is_loaded(parent=rows_element)

        old_names = list()
        old_focused = None

        no_change_num = 0

        while True:
            rows = self.find_them(UI.get_monako_list_row_locator(), parent=rows_element)

            current_names = list()
            current_focused = None
            for row in rows:
                current_name = row.text
                if current_name == element:
                    self.click_me(row, effect_time=1)
                    return

                current_names.append(current_name)
                if constants.THEIA_FOCUSED in row.get_attribute(constants.TYPE_CLASS):
                    current_focused = row

            if old_names == current_names and old_focused == current_focused:
                no_change_num += 1

            if no_change_num > 1:
                # rows didn't change - no more to page down
                raise ElementNotFoundException(self.get_driver())

            old_names = deepcopy(current_names)
            old_focused = current_focused
            self.send_key_sequence([Keys.PAGE_DOWN])

    def fill_snippets_with_values(self, values):
        i = 0
        for value in values:
            self.send_key_sequence(value)
            i = i + 1
            if i != len(values):
                self.send_key_sequence(Keys.TAB)

    def click_on_text(self, line_number, text, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        line_element = self.get_line_element_with_number(line_number, editor=editor)
        element = self.get_text_element_in_line(line_element, text)
        highlight(element)

        return element

    @WaitTillExist()
    def wait_for_widget_zone_disappear(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        try:
            widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
            raise WebDriverException

        finally:
            return

    def close_zone_widget_if_exists(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        try:
            widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
            highlight(widget_zone)
            actions = self.find_them(UI.get_action_items_locator(), parent=widget_zone)

            for action in actions:
                highlight(action)
                action_label = self.find_it(UI.get_action_label_locator())
                if action_label.get_attribute(constants.ELEMENT_TITLE) == constants.Close:
                    self.click_me(action, element_human_name=constants.Close)
                    self.wait_for_widget_zone_disappear(editor)
                    break

        except WebDriverException:
            print("No widget zone. That's fine here.")

        except Exception:
            raise GeneralException(self.get_driver(), call_from=self.close_zone_widget_if_exists.__name__)

    def get_zone_widget_rows(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        WebDriverWait(
            self.get_driver(),
            constants.DEFAULT_TIMEOUT
        ).until(
            expected_conditions.presence_of_element_located(UI.get_monako_zone_widget_locator())
        )

        widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
        highlight(widget_zone)
        list_rows = self.find_them(UI.get_monako_list_row_locator(), parent=widget_zone)

        return list_rows

    def expand_widget_row_if_needed(self, list_row):
        expanded = list_row.get_attribute(constants.ARIA_EXPANDED)
        if expanded in [None, bool2str(True)]:
            return

        self.click_me(list_row)

    def remove_tree_branches(self, list_lows):
        rows = []
        for list_row in list_lows:
            expanded = list_row.get_attribute(constants.ARIA_EXPANDED)
            if expanded is None:
                rows.append(list_row)

        return rows

    def get_references_num(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        list_rows = self.get_references_in_widget_zone(editor)
        return len(list_rows)

    def get_references_in_widget_zone(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        list_rows = self.get_zone_widget_rows(editor)

        for list_row in list_rows:
            self.expand_widget_row_if_needed(list_row)

        list_rows = self.get_zone_widget_rows(editor)
        list_rows = self.remove_tree_branches(list_rows)

        return list_rows

    def get_line_num_for_reference(self, ref_num, list_rows=None, content=None, editor=None):
        if list_rows is None:
            list_rows = self.get_zone_widget_rows(editor)

        ref_num = int(ref_num)
        self.click_me(list_rows[ref_num])

        widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
        current_line_num = self.get_current_line_num(content=content, parent=widget_zone)
        return current_line_num

    def expand_tree_of_references(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        WebDriverWait(
            self.get_driver(),
            constants.DEFAULT_TIMEOUT
        ).until(
            expected_conditions.presence_of_element_located(UI.get_monako_zone_widget_locator())
        )

        widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
        highlight(widget_zone)

        tree_rows = self.find_them(UI.get_monako_tree_row_locator(), parent=widget_zone)
        for row in tree_rows:
            highlight(row, effect_time=1)
            self.click_me(row)
            # current_line_num = self.get_current_line_num(parent=widget_zone)

    def get_current_line_num_inside_widget_zone(self, content, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        WebDriverWait(
            self.get_driver(),
            constants.DEFAULT_TIMEOUT
        ).until(
            expected_conditions.presence_of_element_located(UI.get_monako_zone_widget_locator())
        )

        widget_zone = self.find_it(UI.get_monako_zone_widget_locator(), parent=editor)
        highlight(widget_zone)

        current_line_num = self.get_current_line_num(content=content, parent=widget_zone)

        return current_line_num

    def find_lines_with_breakpoints(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        lines = list()
        break_points = self.find_them(UI.get_debug_breakpoint_locator(), parent=editor)

        for break_point in break_points:
            line_number_element = self.get_parent_node(break_point)
            line_number = self.find_it(UI.get_monako_line_numbers_content_locator(), parent=line_number_element)
            lines.append(line_number.text)

        print("lines with breakpoints: {0}".format(sorted(lines)))

        return sorted(lines)

    def find_line_with_breakpoint_hint(self, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        try:
            break_point_hint = self.find_it(UI.get_debug_breakpoint_hint_locator(), parent=editor)
            line_number_element = self.get_parent_node(break_point_hint)
            line_number = self.find_it(UI.get_monako_line_numbers_content_locator(), parent=line_number_element)
            return line_number.text

        except (NoSuchElementException, ElementNotFoundException):
            return None

        except Exception:
            raise

    def find_variables_header(self, parent=None):
        headers = self.find_them(UI.get_theia_header_locator(), parent=parent)
        for header in headers:
            if header.text.upper() == constants.Variables.upper():
                return header

        raise ElementNotFoundException("Variables header not found")

    def find_breakpoints_header(self, parent=None):
        headers = self.find_them(UI.get_theia_header_locator(), parent=parent)
        for header in headers:
            if header.text.upper() == constants.Breakpoints.upper():
                highlight(header)
                return header

        raise ElementNotFoundException("Breakpoints header not found")

    def clear_breakpoints(self):
        debug_container = self.find_it(UI.get_debug_locator())
        header = self.find_breakpoints_header(parent=debug_container)

        breakpoint_container = self.get_parent_node(header)
        highlight(breakpoint_container)

        trees = self.find_them(UI.get_tree_container_locator(), parent=breakpoint_container)
        for tree in trees:
            highlight(tree)
            if tree.text.upper() == constants.NoBreakpoints.upper():
                print("There are no breakpoints. Nothing to clear.")
                return

        menu = MainMenu(self.get_driver())
        menu.invoke_menu_path(constants.DebugRemoveAllBreakpoints)

    @WaitTillExist()
    def move_to_line_number_element(self, line_number, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        line_number_element = self.get_line_number_element(line_number, editor=editor)
        highlight(line_number_element)

        try:
            actions = ActionChains(self.get_driver())
            actions.move_to_element(line_number_element)
            actions.perform()

        except Exception:
            raise WebDriverException

        return line_number_element

    def move_mouse_until_hint_is_shown(self, line_number, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        self.move_to_line_number_element(line_number, editor=editor)

        offset = 10
        max_offset = 50
        current_offset = 0

        actions = ActionChains(self.get_driver())

        while True:
            if current_offset >= max_offset:
                raise Exception("Max offset achieved, no breakpoint hint detected")

            current_offset = current_offset + offset
            actions.move_by_offset(-offset, 0)
            actions.perform()
            number = self.find_line_with_breakpoint_hint()
            print("Line number with hint: '{0}'".format(number))
            if number is None:
                continue

            if number != line_number:
                raise Exception(
                    "Breakpoint hint line number doesn't correspond to search one: {0}<->{1}".format(
                        number, line_number
                    )
                )

            break

    @WaitTillExist()
    def breakpoints_num_increased(self, current_num):
        debug_container = self.find_it(UI.get_debug_locator())
        header = self.find_breakpoints_header(parent=debug_container)
        breakpoint_container = self.get_parent_node(header)
        breakpoint_elements = self.find_them(UI.get_debug_source_breakpoint_locator(), parent=breakpoint_container)

        breakpoints_num = len(breakpoint_elements)
        if breakpoints_num > current_num:
            return

        raise WebDriverException

    def set_breakpoint_at_line(self, line_number, editor=None):
        if editor is None:
            editor = self.get_editor_element()

        debug_container = self.find_it(UI.get_debug_locator())
        header = self.find_breakpoints_header(parent=debug_container)
        breakpoint_container = self.get_parent_node(header)

        breakpoints_num = None

        trees = self.find_them(UI.get_tree_container_locator(), parent=breakpoint_container)
        for tree in trees:
            highlight(tree, effect_time=1)
            if tree.text.upper() == constants.NoBreakpoints.upper():
                breakpoints_num = 0
                break

        if breakpoints_num is None:
            breakpoint_elements = self.find_them(UI.get_debug_source_breakpoint_locator(), parent=breakpoint_container)
            breakpoints_num = len(breakpoint_elements)

        breakpoint_lines = self.find_lines_with_breakpoints(editor)
        if line_number not in breakpoint_lines:
            self.move_mouse_until_hint_is_shown(line_number, editor)
            actions = ActionChains(self.get_driver())
            actions.click()
            actions.perform()
            self.breakpoints_num_increased(breakpoints_num)
