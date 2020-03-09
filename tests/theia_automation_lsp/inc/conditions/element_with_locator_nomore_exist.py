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

from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support import expected_conditions


class ElementLocatorNoMoreExist(object):
    def __init__(self, locator):
        self.locator = locator

    def __repr__(self):
        msg = "Class: '{0}'" \
              "\nLocator: '{1}'" \
            .format(
                self.__class__,
                self.locator
            )

        return msg

    def __call__(self, driver):
        try:
            if expected_conditions.presence_of_element_located(self.locator).__call__(driver):
                return False

        except NoSuchElementException:
            return True
