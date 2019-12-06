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

import re
import shutil
from time import sleep
import sys
import os
from selenium.webdriver.common.keys import Keys
from inc.cfg.env_constants import ROBOT_OUTPUT_DIR, DUMP_DIR_NAME

DEFAULT_EFFECT_TIME = 0
DEFAULT_EFFECT_COLOR = "red"
DEFAULT_BORDER_WIDTH = 2


def apply_style(element, s):
    driver = element.parent
    driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, s)


def highlight(elements, effect_time=None, color=None, border=None, create_dump=False):
    """Highlights (blinks) a Selenium WebDriver element"""
    if effect_time is None:
        effect_time = DEFAULT_EFFECT_TIME

    if color is None:
        color = DEFAULT_EFFECT_COLOR

    if border is None:
        border = DEFAULT_BORDER_WIDTH

    original_styles = dict()

    elements_list = elements
    if not isinstance(elements_list, list):
        elements_list = list()
        elements_list.append(elements)

    for element in elements_list:
        original_styles[element] = element.get_attribute('style')
        new_style = original_styles[element] + "; border: {0}px solid {1};".format(border, color)
        apply_style(element, new_style)

    if create_dump:
        dump(elements_list[0].parent, reason=highlight.__name__)

    sleep(effect_time)

    for element in elements_list:
        apply_style(element, original_styles[element])


def str2bool(input_string):
    if not isinstance(input_string, str):
        raise Exception("Input must be string, not '{0}': '{1}'".format(input_string, type(input_string)))

    if input_string in ["true", "True", "t", "T"]:
        return True

    if input_string in ["false", "False", "f", "F"]:
        return False

    raise Exception("Unsupported input for converting to boolean: {0}".format(input_string))


def sum_pixels(a, b):
    suffix = "px"
    a = int(a.strip(suffix))
    b = int(b.strip(suffix))
    c = a + b
    c = str(c) + suffix
    return c


def lt_pixels(a, b):
    suffix = "px"
    a = int(a.strip(suffix))
    b = int(b.strip(suffix))
    return a < b


def get_mod_key():
    platform = sys.platform
    if platform == "win32":
        mod_key = Keys.CONTROL

    elif platform == "linux":
        mod_key = Keys.CONTROL

    elif platform == "darwin":
        mod_key = Keys.META

    else:
        raise Exception("Unsupported platform: '{0}'".format(platform))

    return mod_key


def get_next_filename_in_path(path, filename_template, size=100):
    size_str = str(size)
    for i in range(size):
        i_str = str(i)
        zero_nums = len(size_str) - len(i_str)

        file_number = zero_nums * "0" + i_str

        file_check = filename_template.format(file_number)
        file_check_path = os.path.join(path, file_check)
        if not os.path.exists(file_check_path):
            return file_check_path

    return None


def ensure_dir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)


def ignore_error(target_func):
    def func_wrapper(*args, **kwargs):
        try:
            res = target_func(*args, **kwargs)
            return res

        except Exception:
            pass

    return func_wrapper()


def prepare_dump_path():
    cur_dir = os.path.dirname(__file__)
    save_dir = os.path.abspath(os.path.join(cur_dir, "..", "..", ROBOT_OUTPUT_DIR, DUMP_DIR_NAME))

    try:
        if os.path.exists(save_dir):
            shutil.rmtree(save_dir)

    except PermissionError:
        try:
            for file in os.listdir(save_dir):
                os.remove(os.path.join(save_dir, file))

        finally:
            pass

    except Exception:
        raise

    ensure_dir(save_dir)


# @ignore_error
def dump(driver, reason=None):
    if driver is None:
        print("No driver defined. Cannot dump html.")
        return

    cur_dir = os.path.dirname(__file__)
    save_dir = os.path.abspath(os.path.join(cur_dir, "..", "..", ROBOT_OUTPUT_DIR, DUMP_DIR_NAME))

    html_file = dump_html(driver, save_dir)
    scr_file = dump_screenshot(driver, save_dir)

    update_map_file(save_dir, html_file, scr_file, reason)


def dump_html(driver, save_dir):
    if driver is None:
        print("No driver defined. Cannot dump html.")
        return

    html_template = "page_source{0}.html"
    html_file_path = get_next_filename_in_path(save_dir, html_template)

    html = driver.page_source

    if html_file_path is not None:
        with open(html_file_path, "w") as fd:
            fd.write(html)

    else:
        print("Too many page sources saved")

    return html_file_path


def dump_screenshot(driver, save_dir):
    if driver is None:
        print("No driver defined. Cannot make a screensoht.")
        return

    screenshot_template = "scr{0}.png"
    screenshot_file_path = get_next_filename_in_path(save_dir, screenshot_template)

    png = driver.get_screenshot_as_png()

    if screenshot_file_path is not None:
        with open(screenshot_file_path, "wb") as fd:
            fd.write(png)

    else:
        print("Too many screenshots saved")

    return screenshot_file_path


def string_is_regexp(check_string):
    if re.search("[*?^$]", check_string):
        return True

    return False


def update_map_file(save_dir, fname, scr_name, src):
    map_fname = "map.log"
    map_fpath = os.path.join(save_dir, map_fname)

    if not os.path.exists(map_fpath):
        with open(map_fpath, "w") as fd:
            fd.write("Dump Map\n")
            fd.write("HTML Dump\tScreenshot\tReason\n")

    with open(map_fpath, "a") as fd:
        fd.write(os.path.basename(fname) + "\t" + os.path.basename(scr_name) + "\t" + str(src) + "\n")
