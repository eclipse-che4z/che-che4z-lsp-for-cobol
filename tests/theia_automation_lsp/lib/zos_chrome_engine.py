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
import stat
import sys
from selenium import webdriver
import drivers.drv_config as drv
from inc.helpers import prepare_dump_path, str2bool
from lib.file_explorer import FileExplorer
from inc.theia.config import THEIA_URL, HEADLESS


class ZosChromeEngine(FileExplorer):

    ROBOT_LIBRARY_SCOPE = "TEST SUITE"

    def __init__(self, url=None, driver_path=None):

        print("ZosChromeEngine Init")

        super(ZosChromeEngine, self).__init__(url)

        self.platform = sys.platform
        self.engine = "chrome"

        if driver_path is None:
            cur_dir = os.path.dirname(__file__)
            driver_dir = os.path.abspath(os.path.join(cur_dir, "..", "drivers", self.platform))
            driver_path = os.path.abspath(os.path.join(driver_dir, drv.ENGINES_EXE[self.engine]))
            if self.platform in ["windows", "win32"]:
                driver_path = driver_path + ".exe"

        self.driver_path = driver_path

        self.make_sure_engine_is_ready()

    @staticmethod
    def prepare_dump_engine():
        prepare_dump_path()

    def make_sure_engine_is_ready(self):
        if not os.path.exists(self.driver_path):
            url = drv.DRIVERS[self.platform][self.engine]
            save_dir = os.path.dirname(self.driver_path)

            downloaded_driver = drv.download_file(url, save_dir)
            drv.extract_archive(downloaded_driver, save_dir=save_dir)
            os.remove(downloaded_driver)

        if self.platform not in ["windows", "win32"]:
            if not drv.is_file_executable(self.driver_path):
                st = os.stat(self.driver_path)
                os.chmod(self.driver_path, st.st_mode | stat.S_IEXEC)

    def start_engine(self, headless=None):
        print("driver", self.driver_path)
        chrome_options = webdriver.ChromeOptions()

        # chrome_options.add_argument("--disable-dev-shm-usage")

        if headless is None:
            headless = HEADLESS

        if isinstance(headless, str):
            headless = str2bool(headless)

        chrome_options.headless = headless
        print("Headless mode: '{0}'".format(headless), type(headless))

        self._driver = webdriver.Chrome(executable_path=self.driver_path, options=chrome_options)
        self._driver.set_window_size(1440, 900)

    def stop_engine(self):
        self._driver.quit()

    def final_clean(self):
        try:
            os.remove(self.driver_path)

        except Exception as e:
            print("Final clean exception: {0}".format(e.args))


if __name__ == "__main__":
    browser = ZosChromeEngine(THEIA_URL)
    browser.start_engine()
    browser.exit()
