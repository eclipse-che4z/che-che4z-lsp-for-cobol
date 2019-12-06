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

from time import sleep
from selenium.common.exceptions import WebDriverException, NoSuchElementException, TimeoutException
from inc.exceptions.custom_timeout_exception import CustomTimeoutException
from inc.exceptions.general_exception import GeneralException
from inc.theia.constants import DEFAULT_TIMEOUT
from inspect import getmembers, ismethod


class WaitTillExist(object):

    def __init__(self, timeout=None):
        self.driver = None
        self.timeout = timeout
        if self.timeout is None:
            self.timeout = DEFAULT_TIMEOUT

    def __call__(self, target_func):
        def func_wrapper(*args, **kwargs):
            interval = 1
            elapsed = 0

            while True:
                if elapsed > self.timeout:

                    if args:
                        method = getmembers(args[0], ismethod)
                        if method:
                            class_obj = args[0]
                            self.driver = class_obj.get_driver()
                            raise CustomTimeoutException(self.driver, call_from=target_func.__name__)

                    raise TimeoutException

                try:
                    res = target_func(*args, **kwargs)
                    print("Ok, waited for {0} sec!".format(elapsed))
                    return res

                except (WebDriverException, NoSuchElementException):
                    print("Wait for '{0}' sec".format(interval))
                    sleep(interval)
                    elapsed += interval

                except Exception:
                    if args:
                        method = getmembers(args[0], ismethod)
                        if method:
                            class_obj = args[0]
                            self.driver = class_obj.get_driver()

                    raise GeneralException(self.driver, call_from=target_func.__name__)

        return func_wrapper
