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

from selenium.webdriver import ActionChains
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait

from inc.decorators.wait_till_exist import WaitTillExist
from inc.exceptions.element_not_found_exception import ElementNotFoundException
from inc.helpers import highlight
from inc.theia.constants import HelpAbout, TheiaDialog, Preferences, TheiaTab, DEFAULT_TIMEOUT, LeftTab, Debug, \
    SelectAll, Paste, DebugRemoveAllBreakpoints, Copy, Save
from inc.theia.ui import UI
from lib.common_driver import CommonDriver


class MainMenu(CommonDriver):

    MENUS = {
        HelpAbout: {
            "menuItem": "Help->About",
            "type": TheiaDialog,
            "title": HelpAbout
        },
        Preferences: {
            "menuItem": "File->Settings->Open Preferences",
            "type": TheiaTab,
            "title": "Preferences"
        },
        Debug: {
            "menuItem": "View->Debug",
            "type": LeftTab,
            "title": "Debug"
        },
        DebugRemoveAllBreakpoints: {
            "menuItem": "Debug->Remove All Breakpoints",
            "type": None,
            "title": None
        },
        SelectAll: {
            "menuItem": "Selection->Select All",
            "type": None,
            "title": None
        },
        Copy: {
            "menuItem": "Edit->Copy",
            "type": None,
            "title": None
        },
        Paste: {
            "menuItem": "Edit->Paste",
            "type": None,
            "title": None
        },
        Save: {
            "menuItem": "File->Save",
            "type": None,
            "title": None
        }
    }

    def __init__(self, driver=None):
        super(MainMenu, self).__init__(driver)

    @staticmethod
    def get_menu_item(element):
        return MainMenu.MENUS[element]["menuItem"]

    @staticmethod
    def get_menu_invoked_element_type(element):
        return MainMenu.MENUS[element]["type"]

    @staticmethod
    def get_menu_invoked_dlg_title(element):
        return MainMenu.MENUS[element]["title"]

    def invoke_menu_path(self, item):
        path = MainMenu.get_menu_item(item)

        part0, parts = path.split("->", 1)
        print(part0, parts)

        self._invoke_menubar_item(part0)

        for part in parts.split("->"):
            self._invoke_submenu_item(part)

        invoked_type = MainMenu.get_menu_invoked_element_type(item)

        if invoked_type is None:
            return None, None

        invoked_title = MainMenu.get_menu_invoked_dlg_title(item)
        print("A '{0}' with title '{1}' should be invoked".format(invoked_type, invoked_title))

        return invoked_type, invoked_title

    def _invoke_menubar_item(self, item):
        # self._driver.switch_to.default_content()

        WebDriverWait(self._driver, DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(UI.get_theia_top_panel_locator())
        )

        WebDriverWait(self._driver,DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_all_elements_located(UI.get_theia_menu_locator())
        )

        theia_top_panel = self.find_it(UI.get_theia_top_panel_locator())
        highlight(theia_top_panel)

        theia_menu = self.find_it(UI.get_theia_menu_locator(), theia_top_panel)
        highlight(theia_menu)

        menu_content = self.find_it(UI.get_theia_menu_content_locator(), theia_menu)
        highlight(menu_content)
        menu_elements = self.find_them(UI.get_theia_menu_items_locator(), menu_content)

        menu_item = None
        for menu_element in menu_elements:
            highlight(menu_element)
            label = self.find_it(UI.get_theia_menu_item_label_locator(), menu_element)
            if label.text == item:
                menu_item = menu_element
                break

        actions = ActionChains(self._driver)
        actions.move_to_element(menu_item)
        actions.click(menu_item)
        actions.perform()

    def _invoke_submenu_item(self, item):
        print("item to invoke", item)
        self._wait_for_needed_submenu_to_appear_and_invoke(item)

    @WaitTillExist()
    def _wait_for_needed_submenu_to_appear_and_invoke(self, item):
        print("Wait for submenu with element '{0}' to appear".format(item))

        submenu_contents = self.find_them(UI.get_theia_submenu_content_locator())
        submenu = None

        submenu_item = None
        for submenu in submenu_contents:
            highlight(submenu)
            if submenu_item is not None:
                break

            submenu_elements = self.find_them(UI.get_theia_submenu_items_locator(), submenu)

            for submenu_element in submenu_elements:
                # highlight(submenu_element)
                label = self.find_it(UI.get_theia_submenu_item_label_locator(), submenu_element)
                # highlight(label)
                if label.text == item:
                    submenu_item = label
                    print("Found", submenu_item)
                    break

        if submenu_item is None:
            raise ElementNotFoundException

        print("Got it. Clicking on '{0}'".format(item))
        highlight(submenu_item)

        actions = ActionChains(self._driver)

        if submenu is not None:
            actions.move_to_element(submenu)

        actions.move_to_element(submenu_item)
        actions.click(submenu_item)
        actions.perform()
