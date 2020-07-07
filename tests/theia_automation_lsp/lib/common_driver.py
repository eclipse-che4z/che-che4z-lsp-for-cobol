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

import re
from robot.api.deco import keyword
from selenium.common.exceptions import StaleElementReferenceException, NoSuchElementException, WebDriverException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from inc.exceptions.element_not_found_exception import ElementNotFoundException
from inc.exceptions.general_exception import GeneralException
from inc.helpers import highlight
from inc.decorators.wait_till_exist import WaitTillExist
from inc.theia import constants
from inc.theia import che_constants
from inc.theia.ui import UI


class CommonDriver(object):

    def __init__(self, driver=None):
        self._driver = driver
        self._ide_iframe = None
        self.run_on_che = False
        # self._ide_iframe = self.find_it(UI.get_ide_iframe_locator())

    def get_me(self):
        return self

    def get_driver(self):
        return self._driver

    def exit(self):
        self._driver.close()

    def quit(self):
        self._driver.quit()

    def get_title(self):
        return self._driver.title

    def find_it(self, locator, parent=None):
        if parent is None:
            parent = self._driver

        try:
            element = parent.find_element(*locator)
            highlight(element)

        except NoSuchElementException:
            raise ElementNotFoundException(self.get_driver(), call_from=self.find_it.__name__)

        except Exception:
            raise

        return element

    def find_them(self, locator, parent=None, show=True):
        if parent is None:
            parent = self._driver

        try:
            elements = parent.find_elements(*locator)

        except NoSuchElementException:
            raise ElementNotFoundException(self.get_driver(), call_from=self.find_them.__name__)

        if show:
            for element in elements:
                try:
                    highlight(element)

                except StaleElementReferenceException:
                    pass

                except Exception:
                    raise GeneralException(self.get_driver(), call_from=self.find_them.__name__)

        return elements

    @staticmethod
    def get_parent_node(element):
        print("Getting parent for {0}".format(element))
        parent = element.find_element(By.XPATH, "./..")
        return parent

    @staticmethod
    def get_element_height(element):
        return element.value_of_css_property("height")

    @staticmethod
    def get_element_top(element):
        return element.value_of_css_property("top")

    @staticmethod
    def get_element_padding_left(element):
        return element.value_of_css_property("padding-left")

    @staticmethod
    def click_it(element, effect_time=None, color=None, border=None):
        highlight(element, effect_time, color, border)
        element.click()

    @staticmethod
    def right_click_it(element, effect_time=None, color=None, border=None):
        highlight(element, effect_time, color, border)

        driver = element.parent
        actions = ActionChains(driver)
        actions.move_to_element(element)
        actions.context_click(element)
        actions.perform()

    @staticmethod
    def is_element_expanded(element):
        return constants.THEIA_ELEMENT_COLLAPSED not in element.get_attribute(constants.TYPE_CLASS)

    def expand_tree(self, parent):
        arrow_element = self.find_it(UI.get_theia_expand_arrow_locator(), parent=parent)
        if self.is_element_expanded(arrow_element):
            return

        self.click_me(arrow_element)

    @WaitTillExist()
    def click_me(self, element, element_human_name=None, effect_time=None, color=None, border=None):
        show_element = element
        if element_human_name is not None:
            show_element = element_human_name

        if element is None:
            raise GeneralException(
                self.get_driver(),
                call_from=self.click_me.__name__,
                msg="Element '{0}' couldn't be found".format(show_element)
            )

        print("Click on '{0}'".format(show_element))
        self.click_it(element, effect_time=effect_time, color=color, border=border)
        print("Ok, {0} clicked!".format(show_element))

    @WaitTillExist()
    def right_click_me(self, element, element_human_name=None, effect_time=None, color=None, border=None):
        show_element = element
        if element_human_name is not None:
            show_element = element_human_name

        if element is None:
            raise GeneralException(
                self.get_driver(),
                call_from=self.right_click_me.__name__,
                msg="Element '{0}' couldn't be found".format(show_element)
            )

        print("Right click on '{0}'".format(show_element))
        self.right_click_it(element, effect_time=effect_time, color=color, border=border)
        print("Ok, {0} clicked!".format(show_element))

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def wait_for_login_form_if_any(self):
        title = self.get_title()

        if title in ["", None]:
            raise WebDriverException

        if re.search(constants.THEIA.upper(), title.upper()):
            self.run_on_che = False
            return False

        elif title.upper() in [che_constants.CHE_LOADING_TITLE.upper(), che_constants.CHE_LOGIN_TITLE.upper()]:
            locator = UI.get_che_login_form_locator()
            condition = expected_conditions.presence_of_element_located(locator)
            WebDriverWait(self.get_driver(), constants.DEFAULT_TIMEOUT).until(condition)

            form = self.find_it(locator)
            highlight(form, effect_time=1)
            self.run_on_che = True
            return True

        else:
            raise GeneralException("Unexpected page title: '{0}'".format(title))

    def get_che_form_username(self):
        che_login_form = self.find_it(UI.get_che_login_form_locator())
        highlight(che_login_form, effect_time=1)
        username = self.find_it(UI.get_username_locator(), parent=che_login_form)
        highlight(username, effect_time=1)
        return username

    def get_che_form_password(self):
        che_login_form = self.find_it(UI.get_che_login_form_locator())
        highlight(che_login_form, effect_time=1)
        password = self.find_it(UI.get_password_locator(), parent=che_login_form)
        highlight(password, effect_time=1)
        return password

    def che_submit_credentials_form(self):
        che_login_form = self.find_it(UI.get_che_login_form_locator())
        highlight(che_login_form, effect_time=1)
        submit = self.find_it(UI.get_che_submit_form_locator(), parent=che_login_form)
        self.click_me(submit, element_human_name="Submit")

    @keyword("Wait For Workspace Is Running")
    def wait_ws_running(self):
        self._driver.switch_to.default_content()
        locator = UI.get_ide_iframe_locator()
        condition = expected_conditions.presence_of_element_located(locator)
        WebDriverWait(self.get_driver(), constants.DEFAULT_LONG_TIMEOUT).until(condition)
        # WebDriverWait(self.get_driver(), constants.DEFAULT_HUGE_TIMEOUT).until(condition)
        ide = self.find_it(locator)
        highlight(ide)
        self.switch_to_theia_frame()

    def wait_for_login_page(self):
        title = self.get_title()
        if title == che_constants.CHE_LOGIN_TITLE:
            return True

        if title == che_constants.CHE_LOADING_TITLE:
            pass

    @keyword("Wait for ${DEFAULT_TIMEOUT} until ${condition}")
    def wait_browser(self, timeout, condition):
        WebDriverWait(self._driver, timeout).until(condition)

    def switch_to_theia_frame(self):
        self._driver.switch_to.default_content()
        if self.run_on_che:
            self._ide_iframe = self.find_it(UI.get_ide_iframe_locator())
            self._driver.switch_to.frame(self._ide_iframe)

    def send_key_sequence(self, key_list):
        actions = ActionChains(self.get_driver())
        for key in key_list:
            actions.send_keys(key)

        actions.perform()

    def execute_key_sequence(self, keys_sequence):
        actions = ActionChains(self.get_driver())

        for key_pair in keys_sequence:
            action = key_pair["action"]
            value = key_pair["value"]

            if action == "send_keys":
                actions.send_keys(value)

            elif action == "key_down":
                actions.key_down(value)

            elif action == "key_up":
                actions.key_up(value)

            else:
                raise Exception("Action '{0}' not yet supported". format(action))

        actions.perform()
