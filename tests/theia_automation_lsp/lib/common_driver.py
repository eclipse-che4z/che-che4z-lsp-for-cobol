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
from selenium.common.exceptions import StaleElementReferenceException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait

from inc.exceptions.general_exception import GeneralException
from inc.helpers import highlight
from inc.decorators.wait_till_exist import WaitTillExist


class CommonDriver(object):

    def __init__(self, driver=None):
        self._driver = driver

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

        element = parent.find_element(*locator)
        highlight(element)
        return element

    def find_them(self, locator, parent=None, show=True):
        if parent is None:
            parent = self._driver

        elements = parent.find_elements(*locator)
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

    @keyword("Wait for ${DEFAULT_TIMEOUT} until ${condition}")
    def wait_browser(self, timeout, condition):
        WebDriverWait(self._driver, timeout).until(condition)
