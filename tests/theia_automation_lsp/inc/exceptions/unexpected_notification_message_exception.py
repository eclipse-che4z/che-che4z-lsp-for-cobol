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

from inc.exceptions.general_exception import GeneralException


class UnexpectedNotificationMessage(GeneralException):

    def __init__(self, driver, call_from=None, msg=""):
        super(UnexpectedNotificationMessage, self).__init__(driver, call_from=call_from, msg=msg)
