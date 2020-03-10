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

from inc.helpers import dump


class GeneralException(Exception):

    def __init__(self, driver=None, call_from=None, msg="", do_dump=True):
        self.driver = driver
        self.msg = msg
        super(GeneralException, self).__init__(msg)
        if msg != "":
            print(msg)

        self.do_dump = do_dump

        reason = self.__class__.__name__
        if call_from is not None:
            reason = "{0}: {1}".format(reason, call_from)

        try:
            if self.do_dump:
                dump(self.driver, reason=reason)

        finally:
            pass

    def __str__(self):
        return self.msg
