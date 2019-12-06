# Copyright (c) 2019 Broadcom.
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

from selenium.common.exceptions import StaleElementReferenceException
from selenium.webdriver.support import expected_conditions


class AttributeHasValue(object):
    def __init__(self, locator, attribute_name, attribute_value):
        self.locator = locator
        self.attribute_name = attribute_name
        self.attribute_value = attribute_value

    def __repr__(self):
        msg = "Class: '{0}'" \
              "\nLocator: '{1}'" \
              "\nAttribute: '{2}'" \
              "\nValue: '{3}'"\
            .format(
                self.__class__,
                self.locator,
                self.attribute_name,
                self.attribute_value
            )

        return msg

    def get_attribute_value(self, driver):
        return expected_conditions.presence_of_element_located(self.locator).__call__(driver)\
            .get_attribute(self.attribute_name)

    def __call__(self, driver):
        try:
            return self.get_attribute_value(driver) == self.attribute_value

        except StaleElementReferenceException:
            return False
