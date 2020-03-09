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

from robot.api.deco import keyword
from selenium.common.exceptions import NoSuchElementException
from inc.exceptions.general_exception import GeneralException
from inc.helpers import highlight
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

        except NoSuchElementException:
            pass

        except Exception:
            raise GeneralException(self.get_driver(), call_from=self.is_file_explorer_visible.__name__)

        return constants.STATE_HIDDEN not in [panel_state, explorer_state]

    @WaitTillExist()
    def show_file_explorer(self):
        if not self.is_file_explorer_visible():
            file_explorer_id_element = self.find_it(UI.get_files_explorer_tab_locator())
            self.click_me(file_explorer_id_element)

        else:
            print("visible?")

    @keyword("Expect Syntax Ok Message For ${member}")
    def expect_for_member_syntax_ok_message(self, member):
        full_message = lsp_constants.LSP_COBOL_MEMBER_SYNTAX_OK_TEMPLATE.format(member)
        # self.expect_notification_message(full_message)
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
