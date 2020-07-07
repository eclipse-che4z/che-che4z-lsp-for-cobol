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

import os
import sys
from robot.api.deco import keyword
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
from inc.conditions.element_with_locator_nomore_exist import ElementLocatorNoMoreExist


def get_login_name(upper=True):
    platform = sys.platform
    if platform == "win32":
        key = "USERNAME"
    elif platform == "linux":
        key = "LOGNAME"
    else:
        raise Exception("Unsupported platform {0}".format(platform))

    login = os.environ[key]
    if upper:
        login = login.upper()

    return login


def create_condition_where_title_contains(title_msg):
    return expected_conditions.title_contains(title_msg)


def create_condition_when_element_shoud_be_clickable(element_locator):
    return expected_conditions.element_to_be_clickable(element_locator)


def create_condition_when_element_with_locator_nomore_exist(element_locator):
    return ElementLocatorNoMoreExist(element_locator)


@keyword("Wait ${browser} for ${DEFAULT_TIMEOUT} until ${condition}")
def wait_browser(browser, timeout, condition):
    WebDriverWait(browser, timeout).until(condition)


def enter_value_in_element(cls, value, element, overwrite=True):
    cls.input_value(value, element, overwrite)
    # cls.input_value_with_copy_paste(value, element)


def enter_credentials(view, username, password):
    view.enter_mf_credentials(username, password)