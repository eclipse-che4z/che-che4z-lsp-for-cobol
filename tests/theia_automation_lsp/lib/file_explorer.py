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

import json
import os
import pyperclip
from robot.api.deco import keyword
from selenium.common.exceptions import NoSuchElementException, WebDriverException, TimeoutException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from inc.cfg.env_constants import TEST_FILES_DIR
from inc.exceptions.custom_timeout_exception import CustomTimeoutException
from inc.exceptions.element_not_found_exception import ElementNotFoundException
from inc.exceptions.general_exception import GeneralException
from inc.helpers import highlight
from inc.theia.main_menu import MainMenu
from inc.theia.ui import UI
from lib.common_engine import CommonEngine
from inc.decorators.wait_till_exist import WaitTillExist
from inc.theia import constants, lsp_constants
from lib.monako_editor import MonakoEditor


class FileExplorer(CommonEngine):

    def __init__(self, url=None):
        super(FileExplorer, self).__init__(url)

    def is_file_explorer_visible(self):
        panel_state = explorer_state = constants.STATE_HIDDEN
        theia_left_panel = self.find_it(UI.get_theia_left_panel_locator())
        if constants.THEIA_ELEMENT_COLLAPSED not in theia_left_panel.get_attribute(constants.TYPE_CLASS):
            panel_state = constants.STATE_VISIBLE

        try:
            file_explorer_id_element = self.find_it(UI.get_files_explorer_locator())
            explorer_classes = file_explorer_id_element.get_attribute(constants.TYPE_CLASS)
            if constants.THEIA_ELEMENT_COLLAPSED not in explorer_classes and \
                    constants.THEIA_HIDDEN not in explorer_classes:
                explorer_state = constants.STATE_VISIBLE

        except (NoSuchElementException, ElementNotFoundException):
            pass

        except Exception:
            raise GeneralException(self.get_driver(), call_from=self.is_file_explorer_visible.__name__)

        return constants.STATE_HIDDEN not in [panel_state, explorer_state]

    def make_sure_debug_button_is_here(self):
        theia_locator = UI.get_theia_left_panel_locator()
        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(theia_locator)
        )
        theia_left_panel = self.find_it(theia_locator)
        highlight(theia_left_panel)

        try:
            return self.find_it(UI.get_debug_tab_locator())

        except (NoSuchElementException, ElementNotFoundException):
            menu = MainMenu(self.get_driver())
            menu.invoke_menu_path(constants.Debug)
            return self.find_it(UI.get_debug_tab_locator())

    @WaitTillExist()
    def show_file_explorer(self):
        if not self.is_file_explorer_visible():
            file_explorer_id_element = self.find_it(UI.get_files_explorer_tab_locator())
            self.click_me(file_explorer_id_element)

        else:
            print("visible?")

    @WaitTillExist(timeout=constants.DEFAULT_HUGE_TIMEOUT, interval=10)
    def wait_for_theia_loaded(self):
        # self.switch_to_theia_frame()
        theia_panel_locator = UI.get_theia_left_right_panel_locator()
        try:
            theia_panel = self.find_it(theia_panel_locator)
            highlight(theia_panel)

        except ElementNotFoundException:
            raise WebDriverException

        except Exception:
            raise

    def show_debug_tab(self):
        debug_id_element = self.make_sure_debug_button_is_here()
        highlight(debug_id_element)
        if not self.current_left_tab(debug_id_element):
            self.click_me(debug_id_element)

    def start_debug(self):
        debug_start_locator = UI.get_debug_start_locator()
        WebDriverWait(self._driver, constants.DEFAULT_LONG_TIMEOUT).until(
            expected_conditions.presence_of_element_located(debug_start_locator)
        )

        theia_locator = UI.get_theia_left_panel_locator()
        theia_panel = self.find_it(theia_locator)
        debug_start_button = self.find_it(debug_start_locator, parent=theia_panel)
        highlight(debug_start_button, effect_time=1)
        self.click_me(debug_start_button, element_human_name="Start Debug")

        debug_thread_locator = UI.get_debug_thread_locator()
        WebDriverWait(self._driver, constants.DEFAULT_LONG_TIMEOUT).until(
            expected_conditions.presence_of_element_located(debug_thread_locator)
        )

        editor_obj = self.get_editor_obj()
        line_num = editor_obj.get_current_line_num()
        return line_num

    def debug_step_over(self):
        debug_step_over_locator = UI.get_debug_step_over_locator()
        WebDriverWait(self._driver, constants.DEFAULT_LONG_TIMEOUT).until(
            expected_conditions.presence_of_element_located(debug_step_over_locator)
        )

        editor_obj = self.get_editor_obj()
        editor = editor_obj.get_editor_element()

        step_locator = UI.get_debug_top_stack_frame_locator()
        step_element = self.find_it(step_locator, parent=editor)
        highlight(step_element, effect_time=1)

        theia_locator = UI.get_theia_left_panel_locator()
        theia_panel = self.find_it(theia_locator)
        debug_step_over_button = self.find_it(debug_step_over_locator, parent=theia_panel)
        highlight(debug_step_over_button, effect_time=1)
        self.click_me(debug_step_over_button, element_human_name="Step Over")

        # possible variants after step: determine what to wait here for
        # theia-debug-top-stack-frame - exists, theia-debug-top-stack-frame-line - exists and line num increased
        # or
        # theia-debug-top-stack-frame - exists, theia-debug-top-stack-frame-line - doesn't exist and line num unchanged

        try:
            WebDriverWait(self._driver, constants.DEFAULT_SHORT_TIMEOUT).until(
                expected_conditions.invisibility_of_element_located(step_locator)
            )
        except TimeoutException:
            pass

        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(step_locator)
        )

        line_after_step = editor_obj.get_current_line_num()
        print("line after debug step", line_after_step)

        step_element = self.find_it(step_locator, parent=editor)
        highlight(step_element, effect_time=1)

        return line_after_step

    def debug_continue(self, file_is_opened=True):
        debug_continue_locator = UI.get_debug_continue_locator()
        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(debug_continue_locator)
        )

        editor_obj = self.get_editor_obj()
        editor = editor_obj.get_editor_element()

        step_locator = UI.get_debug_top_stack_frame_locator()

        if file_is_opened:
            step_element = self.find_it(step_locator, parent=editor)
            highlight(step_element, effect_time=1)

        theia_locator = UI.get_theia_left_panel_locator()
        theia_panel = self.find_it(theia_locator)
        debug_continue_button = self.find_it(debug_continue_locator, parent=theia_panel)
        highlight(debug_continue_button, effect_time=1)
        self.click_me(debug_continue_button, element_human_name="Continue")

        if not file_is_opened:
            return None

        try:
            WebDriverWait(self._driver, constants.DEFAULT_SHORT_TIMEOUT).until(
                expected_conditions.invisibility_of_element_located(step_locator)
            )
        except TimeoutException:
            pass

        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(step_locator)
        )

        line_after_continue = editor_obj.get_current_line_num()
        print("line after debug continue", line_after_continue)

        step_element = self.find_it(step_locator, parent=editor)
        highlight(step_element, effect_time=1)

        return line_after_continue

    @WaitTillExist(timeout=constants.DEFAULT_LONG_TIMEOUT)
    def wait_for_debug_to_stop(self):
        theia_locator = UI.get_theia_left_panel_locator()
        theia_panel = self.find_it(theia_locator)
        debug_thread_locator = UI.get_debug_thread_locator()
        try:
            thread_element = self.find_it(debug_thread_locator, parent=theia_panel)
            highlight(thread_element)
            raise WebDriverException

        except (NoSuchElementException, ElementNotFoundException):
            return

        except Exception:
            raise

    def open_preferences(self):
        menu = MainMenu(self.get_driver())
        menu.invoke_menu_path(constants.Preferences)

    @WaitTillExist()
    def get_variables_elements(self, parent=None):
        variables_elements = self.find_them(UI.get_debug_console_variable_locator(), parent=parent)
        if not len(variables_elements):
            raise WebDriverException

        return variables_elements

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def check_variable_is_updated(self, text, value):
        variable_value = text.split(":")[1].strip()
        if str(variable_value) != str(value):
            raise WebDriverException

    def get_variable_element(self, var_name, var_value=None):
        editor_obj = self.get_editor_obj()

        variables_header = editor_obj.find_variables_header()
        highlight(variables_header, effect_time=1)

        self.expand_tree(variables_header)

        variables_container = self.get_parent_node(variables_header)
        highlight(variables_container, effect_time=1)

        locals_trees = self.find_them(UI.get_tree_node_content_locator(), parent=variables_container)
        locals_found = False
        locals_tree = None
        for locals_tree in locals_trees:
            if locals_tree.text.upper() == constants.THEIA_LOCALS.upper():
                locals_found = True
                break

        if not locals_found:
            raise ElementNotFoundException(self.get_driver(), call_from=self.get_variable_element.__name__)

        self.expand_tree(locals_tree)

        variable_elements = self.get_variables_elements(parent=variables_container)
        for variable_element in variable_elements:
            highlight(variable_element, effect_time=1)

            full_var_text = variable_element.text
            variable_name = full_var_text.split(":")[0]

            if var_value is not None:
                self.check_variable_is_updated(full_var_text, var_value)
                print("Current variable '{0}' value: '{1}'".format(var_name, var_value))

            print("variable_name", variable_name)
            if variable_name.upper() == var_name.upper():
                return variable_element

        raise NoSuchElementException

    def expand_directory_node(self, dir_node, empty_node=False, timeout=None):
        content = self.find_file_explorer_content()
        self.expand_tree_node(dir_node, content, empty_node=empty_node, timeout=timeout)

    @staticmethod
    def is_directory(dir_node):
        return constants.THEIA_DIR_NODE in dir_node.get_attribute(constants.TYPE_CLASS)

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def enter_in_dialog(self, input_msg, dlg_title=None):
        dialog_shell = self.find_it(UI.get_theia_dialog_shell_locator())
        dialog_title = self.find_it(UI.get_theia_dialog_title_locator(), parent=dialog_shell)
        if dialog_title.text.upper() != dlg_title.upper():
            raise ElementNotFoundException

        dialog_content = self.find_it(UI.get_theia_dialog_content_locator(), parent=dialog_shell)
        input_element = dialog_content.find_element(By.XPATH, "./input")
        self.input_value(input_msg, input_element=input_element)

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def answer_ok_to_dialog(self, dlg_title):
        dialog_shell = self.find_it(UI.get_theia_dialog_shell_locator())
        dialog_title = self.find_it(UI.get_theia_dialog_title_locator(), parent=dialog_shell)
        if dialog_title.text.upper() != dlg_title.upper():
            raise ElementNotFoundException

        dialog_control = self.find_it(UI.get_theia_dialog_control_locator(), parent=dialog_shell)
        control_buttons = self.find_them(UI.get_buttons_locator(), parent=dialog_control)
        for control_button in control_buttons:
            button_text = control_button.text
            if button_text.upper() == constants.OK.upper():
                self.click_me(control_button, element_human_name=constants.OK, effect_time=1)

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT, should_exist=False, do_dump=False)
    def close_dialog(self):
        try:
            self.switch_to_theia_frame()
            dialog_shell = self.find_it(UI.get_theia_dialog_shell_locator())
            dialog_title = self.find_it(UI.get_theia_dialog_title_locator(), parent=dialog_shell)
            highlight(dialog_title)

            if dialog_title.text.upper() == che_constants.CHE_BUG_TITLE.upper():
                self.send_key_sequence([Keys.ESCAPE, Keys.ESCAPE, Keys.ESCAPE])

        except Exception as e:
            raise WebDriverException(msg=e.args)

    def get_stop_debug_button(self):
        debug_stop_locator = UI.get_debug_stop_locator()
        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(debug_stop_locator)
        )

        theia_locator = UI.get_theia_left_panel_locator()
        theia_panel = self.find_it(theia_locator)
        debug_stop_button = self.find_it(debug_stop_locator, parent=theia_panel)

        if constants.THEIA_MOD_DISABLED in debug_stop_button.get_attribute(constants.TYPE_CLASS):
            debug_stop_button = None

        return debug_stop_button

    def stop_debug(self, retry=False):
        debug_stop_button = self.get_stop_debug_button()

        if debug_stop_button is None:
            return

        highlight(debug_stop_button, effect_time=1)
        self.click_me(debug_stop_button, element_human_name="Stop Debug")
        try:
            self.wait_for_debug_to_stop()

        except (TimeoutException, CustomTimeoutException):
            if retry:
                print("Retry to stop debug")
                debug_stop_button = self.get_stop_debug_button()
                if debug_stop_button is None:
                    return

                highlight(debug_stop_button, effect_time=1)
                self.click_me(debug_stop_button, element_human_name="Stop Debug")
                self.wait_for_debug_to_stop()

            else:
                raise

        except Exception:
            raise

    @staticmethod
    def current_left_tab(left_tab_element):
        left_tab_element_classes = left_tab_element.get_attribute(constants.TYPE_CLASS)
        return constants.THEIA_CURRENT_TAB in left_tab_element_classes

    @keyword("Get Syntax Ok Message For ${member}")
    def get_for_member_syntax_ok_message(self, member):
        full_message = lsp_constants.LSP_COBOL_MEMBER_SYNTAX_OK_TEMPLATE.format(member)
        return full_message

    @keyword("Get Editor")
    def get_editor_obj(self):
        editor = MonakoEditor(self.get_driver())
        return editor

    @keyword("See ${text} In Statusbar")
    def status_bar_should_have_text(self, text):
        theia_status_bar = self.find_it(UI.get_theia_statusbar_locator())
        elements_with_commands = self.find_them(UI.get_status_elements(), parent=theia_status_bar)
        for elements_with_command in elements_with_commands:
            if elements_with_command.text == text:
                highlight(elements_with_command, effect_time=1)
                return

        raise NoSuchElementException

    def select_all(self):
        # actions = [
        #     {
        #         "action": "key_down",
        #         "value": Keys.CONTROL
        #     },
        #     {
        #         "actions": "send_keys",
        #         "value": "a"
        #     },
        #     {
        #         "action": "key_up",
        #         "value": Keys.CONTROL
        #     }
        # ]
        # self.execute_key_sequence(actions)
        #
        # return

        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.CONTROL)
        actions.send_keys("a")
        actions.key_up(Keys.CONTROL)
        actions.perform()

    def copy_to_clipboard(self):
        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.CONTROL)
        actions.send_keys("c")
        actions.key_up(Keys.CONTROL)
        actions.perform()

    def paste_from_clipboard(self):
        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.CONTROL)
        actions.send_keys("v")
        actions.key_up(Keys.CONTROL)
        actions.perform()

    def save_file(self):
        actions = ActionChains(self.get_driver())
        actions.key_down(Keys.CONTROL)
        actions.send_keys("s")
        actions.key_up(Keys.CONTROL)
        actions.perform()

    @staticmethod
    def clear_clipboard():
        clb_type = pyperclip.determine_clipboard()
        print("clipboard", clb_type)
        pyperclip.copy("")

    @staticmethod
    def get_from_clipboard(json_format=True):
        res = pyperclip.paste()

        print("clipboard res: '{0}' - '{1}'".format(res, type(res)))

        if json_format:
            res = json.loads(res)
            print("json res: '{0}' - '{1}'".format(res, type(res)))

        return json.dumps(res, indent=3)

    @staticmethod
    def get_to_clipboard(value):
        pyperclip.copy(value)

    @staticmethod
    @keyword("Modify User Preferences")
    def append_dict(pref_dict, merge_dict):
        if isinstance(pref_dict, str):
            pref_dict = json.loads(pref_dict)

        for key in merge_dict:
            pref_dict[key] = merge_dict[key]

        return json.dumps(pref_dict, indent=3)
