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
import time
from time import sleep
from robot.api.deco import keyword
from selenium.common.exceptions import WebDriverException, NoSuchElementException, StaleElementReferenceException
from selenium.webdriver import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions
from selenium.webdriver.support.wait import WebDriverWait
import inc.theia.constants as constants
from inc.exceptions.custom_timeout_exception import CustomTimeoutException
from inc.exceptions.element_not_found_exception import ElementNotFoundException
from inc.exceptions.general_exception import GeneralException
from inc.exceptions.unexpected_notification_message_exception import UnexpectedNotificationMessage
from inc.theia import zos_constants
from inc.theia.ui import UI
from inc.helpers import highlight, lt_pixels, get_mod_key, str2bool, dump, string_is_regexp, sum_pixels
from lib.common_driver import CommonDriver
from inc.decorators.wait_till_exist import WaitTillExist
import pyperclip


class CommonEngine(CommonDriver):

    def __init__(self, url=None, headless=None):
        super(CommonEngine, self).__init__()
        self.url = url
        self.headless = headless

    def set_url(self, url):
        self.url = url

    def get_url(self):
        return self.url

    def set_mode(self, headless_mode=None):
        if headless_mode is not None:
            self.headless = headless_mode

    def get_mode(self):
        return self.headless

    def get_content(self):
        self._driver.get(self.url)

    @WaitTillExist()
    def invoke_left_bar_item(self, item):
        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(UI.get_left_menu_bar_locator())
        )

        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_all_elements_located(UI.get_tabs_locator())
        )

        theia_left_panel = self.find_it(UI.get_theia_left_panel_locator())
        menu_content = self.find_it(UI.get_left_menu_bar_locator(), theia_left_panel)
        menu_elements = self.find_them(UI.get_tabs_locator(), menu_content)

        menu_item = None
        for menu_element in menu_elements:
            title = menu_element.get_attribute(constants.ELEMENT_TITLE)
            if title == item:
                menu_item = menu_element
                break

        if menu_item is None:
            raise WebDriverException

        self.click_me(menu_item, item)

    @WaitTillExist()
    def node_should_exist(self, node):
        highlight(node)

    @WaitTillExist()
    def click_node_to_expand(self, node):
        parent_node = self.get_parent_node(node)
        child_node_content = self.find_it(UI.get_tree_node_segment_grow_locator(), parent=node)
        node_id = child_node_content.get_attribute(constants.TYPE_ID)

        if constants.THEIA_TREE_EXPANDABLE_NODES in node.get_attribute(constants.TYPE_CLASS):
            arrow = self.find_it(UI.get_theia_expand_arrow_locator(), parent=parent_node)
            is_expanded = self.is_element_expanded(arrow)
            if not is_expanded:
                highlight(node)
                self.click_me(node)

        return node_id

    @WaitTillExist()
    def find_node_by_id(self, node_id):
        return self.get_parent_node(self.get_parent_node(self.find_it((By.ID, node_id))))

    def expand_tree_node(self, node, content, empty_node=False, timeout=None):
        node_id = self.click_node_to_expand(node)

        if not empty_node:
            self.wait_for_expanded(node_id, content, timeout)

        return self.find_node_by_id(node_id)

    def collapse_tree_node(self, node):
        try:
            parent_node = self.get_parent_node(node)
            arrow = self.find_it(UI.get_theia_expand_arrow_locator(), parent=parent_node)
            is_expanded = self.is_element_expanded(arrow)
            if is_expanded:
                self.click_me(node)

        except Exception:
            dump(self.get_driver(), reason=self.collapse_tree_node.__name__)

    @WaitTillExist()
    def get_input_element(self):
        input_frame = self.find_it(UI.get_monako_quick_input_locator())
        input_element = self.find_it(UI.get_monako_input_locator(), parent=input_frame)
        visible = str2bool(input_element.get_attribute(constants.ARIA_HAS_POPUP))

        if not visible:
            raise WebDriverException

        highlight(input_element)
        self.click_me(input_element)
        return input_element

    @WaitTillExist()
    def get_input_element_with_title(self, title):
        input_frame = self.find_it(UI.get_monako_quick_input_locator())
        input_element = self.find_it(UI.get_monako_input_locator(), parent=input_frame)
        visible = str2bool(input_element.get_attribute(constants.ARIA_HAS_POPUP))

        if not visible:
            raise WebDriverException

        if input_element.get_attribute(constants.ELEMENT_TITLE) != title:
            raise WebDriverException

        highlight(input_element)
        self.click_me(input_element)
        return input_element

    def confirm_input(self, input_element):
        print("Press Enter on element")
        highlight(input_element)
        self.click_me(input_element)
        actions = ActionChains(self.get_driver())
        actions.send_keys(Keys.ENTER)
        actions.perform()
        sleep(2)

    def input_value(self, value, input_element=None, overwrite=True):
        print("Input value")

        mod_key = get_mod_key()

        actions = ActionChains(self.get_driver())
        if overwrite:
            actions.key_down(mod_key)
            actions.send_keys('a')
            actions.key_up(mod_key)

        actions.send_keys(Keys.DELETE)
        actions.send_keys(value)
        actions.perform()

        if input_element is not None:
            self.confirm_input(input_element)

    def form_input(self, element, value):
        print("Input value in form")
        self.click_me(element)
        mod_key = get_mod_key()

        actions = ActionChains(self.get_driver())
        actions.key_down(mod_key)
        actions.send_keys('a')
        actions.key_up(mod_key)

        actions.send_keys(Keys.DELETE)
        actions.send_keys(value)
        actions.perform()

    def input_value_with_copy_paste(self, value, input_element=None):
        print("Input value with copy/paste")

        mod_key = get_mod_key()

        actions = ActionChains(self.get_driver())
        actions.key_down(mod_key)
        actions.send_keys('a')
        actions.send_keys('v')
        actions.key_up(mod_key)

        current_value = pyperclip.paste()
        pyperclip.copy(value)
        actions.perform()
        pyperclip.copy(current_value)

        if input_element is not None:
            self.confirm_input(input_element)

    def page_down_tree(self, content):
        actions = ActionChains(self.get_driver())
        actions.move_to_element(content)
        actions.send_keys(Keys.PAGE_DOWN)
        actions.perform()

    def page_up_tree(self, content):
        actions = ActionChains(self.get_driver())
        actions.move_to_element(content)
        actions.send_keys(Keys.PAGE_UP)
        actions.perform()

    def scroll_up(self, content, offset=-50):
        y_thumb_scroll = self.find_it(UI.get_y_thumb_scroll_locator(), parent=content)
        highlight(y_thumb_scroll)

        actions = ActionChains(self.get_driver())
        actions.move_to_element(y_thumb_scroll)
        actions.click_and_hold(y_thumb_scroll)
        actions.move_by_offset(0, offset)
        actions.release()
        actions.perform()

    def scroll_down(self, content, offset=50):
        y_thumb_scroll = self.find_it(UI.get_y_thumb_scroll_locator(), parent=content)
        highlight(y_thumb_scroll)

        actions = ActionChains(self.get_driver())
        actions.move_to_element(y_thumb_scroll)
        actions.click_and_hold(y_thumb_scroll)
        actions.move_by_offset(0, offset)
        actions.release()
        actions.perform()

    def get_tree_element_top_by_id(self, node_id):
        node = self.find_it((By.ID, node_id))
        p_node = self.get_parent_node(node)
        pp_node = self.get_parent_node(p_node)
        ppp_node = self.get_parent_node(pp_node)
        node_top = self.get_element_top(ppp_node)
        return node_top

    def get_tree_element_padding_by_id(self, node_id):
        node = self.find_it((By.ID, node_id))
        p_node = self.get_parent_node(node)
        pp_node = self.get_parent_node(p_node)
        node_padding = self.get_element_padding_left(pp_node)
        return node_padding

    def wait_for_expanded(self, node_id, content, timeout=None):
        if timeout is None:
            timeout = constants.DEFAULT_TIMEOUT

        if timeout == constants.DEFAULT_TIMEOUT:
            return self.wait_for_data_sets_expanded(node_id, content)

        if timeout == constants.DEFAULT_SHORT_TIMEOUT:
            return self.wait_for_data_sets_expanded_short(node_id, content)

        if timeout == constants.DEFAULT_LONG_TIMEOUT:
            return self.wait_for_data_sets_expanded_long(node_id, content)

        if timeout == constants.DEFAULT_HUGE_TIMEOUT:
            return self.wait_for_data_sets_expanded_huge(node_id, content)

    @WaitTillExist()
    def wait_for_data_sets_expanded(self, node_id, content):
        return self.wait_for_data_sets_is_expanded(node_id, content)

    @WaitTillExist(constants.DEFAULT_SHORT_TIMEOUT)
    def wait_for_data_sets_expanded_short(self, node_id, content):
        return self.wait_for_data_sets_is_expanded(node_id, content)

    @WaitTillExist(timeout=constants.DEFAULT_LONG_TIMEOUT)
    def wait_for_data_sets_expanded_long(self, node_id, content):
        return self.wait_for_data_sets_is_expanded(node_id, content)

    @WaitTillExist(timeout=constants.DEFAULT_HUGE_TIMEOUT, interval=10)
    def wait_for_data_sets_expanded_huge(self, node_id, content):
        return self.wait_for_data_sets_is_expanded(node_id, content)

    def wait_for_data_sets_is_expanded(self, node_id, content):
        print("Wait for node is expanded...")
        node_top = self.get_tree_element_top_by_id(node_id)
        node_padding = self.get_tree_element_padding_by_id(node_id)

        try:
            child_nodes = self.find_them(UI.get_tree_nodes_locator(), parent=content)

        except (NoSuchElementException, ElementNotFoundException):
            raise WebDriverException

        for child_node in child_nodes:
            highlight(child_node)
            child_parent = self.get_parent_node(child_node)
            child_top = self.get_element_top(child_parent)

            if lt_pixels(child_top, node_top):
                continue

            child_padding = self.get_element_padding_left(child_node)
            if lt_pixels(node_padding, child_padding):
                print("Wait for node is expanded...Ok", node_padding, child_padding)
                return

        print("Wait for node is expanded...Waiting")

        node = self.find_it((By.ID, node_id))
        highlight(node)
        arrow = self.find_it(UI.get_theia_expand_arrow_locator(), parent=node)
        highlight(arrow)
        is_expanded = self.is_element_expanded(arrow)
        if is_expanded:
            self.page_down_tree(content)

        raise WebDriverException

    @WaitTillExist()
    def get_context_menu(self):
        return self.find_it(UI.get_theia_submenu_content_locator())

    def invoke_context_menu_item(self, item):
        menu = self.get_context_menu()
        menu_item = None
        menu_elements = self.find_them(UI.get_theia_submenu_items_locator(), parent=menu)
        for menu_element in menu_elements:
            highlight(menu_element)
            label = self.find_it(UI.get_theia_submenu_item_label_locator(), parent=menu_element)
            if label.text == item:
                menu_item = menu_element
                break

        if menu_item is None:
            raise ElementNotFoundException(self.get_driver())

        actions = ActionChains(self._driver)
        actions.move_to_element(menu_item)
        actions.click(menu_item)
        actions.perform()

    def right_click(self, element, element_name=None, left_click_first=True):
        if left_click_first:
            self.click_me(element, element_human_name=element_name)

        self.right_click_me(element, element_human_name=element_name)

    @staticmethod
    def create_delete_host_expected_text(name):
        return zos_constants.ZOS_DELETE_HOST_CONFIRM_TEMPLATE.format(name)

    @staticmethod
    def create_delete_member_expected_text(dataset, member):
        return zos_constants.ZOS_DELETE_MEMBER_QUESTION_TEMPLATE.format(member.upper(), dataset.upper())

    @staticmethod
    def create_copy_member_message(dataset, member):
        return zos_constants.ZOS_COPY_MEMBER_MESSAGE_TEMPLATE.format(dataset.upper(), member.upper())

    def get_notifications_from_control_center(self):
        status_bar = self.find_it(UI.get_theia_statusbar_locator())
        highlight(status_bar)

        area_right = self.find_it(UI.get_right_status_bar_area(), parent=status_bar)

        highlight(area_right)

        status_elements = self.find_them(UI.get_status_elements(), parent=area_right)

        show_button = None
        for status_element in status_elements:
            highlight(status_element)
            try:
                int_text = int(status_element.text)
                show_button = status_element
                break

            except ValueError:
                continue

            except Exception:
                raise GeneralException(self.get_driver(), call_from=self.get_notifications_from_control_center.__name__)

        notifications = list()

        if show_button is not None:
            highlight(show_button)

            notification_center = self.find_it(UI.get_theia_notification_center_locator())
            highlight(notification_center)
            if constants.THEIA_CLOSED in notification_center.get_attribute(constants.TYPE_CLASS):
                self.click_me(show_button)
                sleep(1)

            while True:
                if constants.THEIA_CLOSED in notification_center.get_attribute(constants.TYPE_CLASS):
                    sleep(1)
                    continue

                break

            highlight(notification_center)
            notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_center)

        return notifications

    @WaitTillExist()
    def confirm_delete(self, host_name):
        notification_container = self.find_it(UI.get_theia_notification_container_locator())
        highlight(notification_container)

        notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_container)

        if len(notifications) == 0:
            notifications = self.get_notifications_from_control_center()

        for notification in notifications:
            highlight(notification)
            text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)
            if text_el.text == self.create_delete_host_expected_text(host_name):
                buttons = self.find_them(UI.get_buttons_locator(), parent=notification)
                for button in buttons:
                    if button.text == constants.OK:
                        self.click_me(button, element_human_name=constants.OK)
                        return

        raise WebDriverException

    @WaitTillExist()
    def confirm_delete_member(self, dataset, member):
        notification_container = self.find_it(UI.get_theia_notification_container_locator())
        highlight(notification_container)

        notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_container)
        for notification in notifications:
            text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)
            if text_el.text == self.create_delete_member_expected_text(dataset, member):
                buttons = self.find_them(UI.get_buttons_locator(), parent=notification)
                for button in buttons:
                    if button.text == constants.OK:
                        self.click_me(button, element_human_name=constants.OK)
                        return

        raise WebDriverException

    def notification_message_not_expected(self, msg_text):
        try:
            self.wait_for_timeout_waiting_notification(msg_text)

        except CustomTimeoutException:
            return

        except Exception:
            raise GeneralException(self.get_driver(), call_from=self.notification_message_not_expected.__name__)

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def wait_for_timeout_waiting_notification(self, msg_text):
        print("Notification message '{0}' should not appear...".format(msg_text))
        notification_container = self.find_it(UI.get_theia_notification_container_locator())
        highlight(notification_container)

        notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_container)
        if len(notifications) == 0:
            notifications = self.get_notifications_from_control_center()

        if len(notifications) == 0:
            raise WebDriverException

        for notification in notifications:
            highlight(notification)
            text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)
            if text_el.text == msg_text:
                print("Expecting notification message '{0}' ... Ok".format(msg_text))
                raise UnexpectedNotificationMessage(
                    self.get_driver(),
                    call_from=self.wait_for_timeout_waiting_notification.__name__
                )

    def expect_notification_message(self, msg_text, like=False, timeout=None):
        if timeout is None:
            timeout = constants.DEFAULT_TIMEOUT

        if timeout == constants.DEFAULT_TIMEOUT:
            return self.expect_notification_message_default(msg_text, like)

        if timeout == constants.DEFAULT_SHORT_TIMEOUT:
            return self.expect_notification_message_short(msg_text, like)

        if timeout == constants.DEFAULT_LONG_TIMEOUT:
            return self.expect_notification_message_long(msg_text, like)

        if timeout == constants.DEFAULT_HUGE_TIMEOUT:
            return self.expect_notification_message_huge(msg_text, like)

    @WaitTillExist()
    def expect_notification_message_default(self, msg_text, like=False):
        return self.expect_notification(msg_text, like)

    @WaitTillExist(timeout=constants.DEFAULT_SHORT_TIMEOUT)
    def expect_notification_message_short(self, msg_text, like=False):
        return self.expect_notification(msg_text, like)

    @WaitTillExist(timeout=constants.DEFAULT_LONG_TIMEOUT)
    def expect_notification_message_long(self, msg_text, like=False):
        return self.expect_notification(msg_text, like)

    @WaitTillExist(timeout=constants.DEFAULT_HUGE_TIMEOUT, interval=10)
    def expect_notification_message_huge(self, msg_text, like=False):
        return self.expect_notification(msg_text, like)

    def expect_notification(self, msg_text, like=False):
        print("Expecting notification message '{0}' ...".format(msg_text))
        notification_container = self.find_it(UI.get_theia_notification_container_locator())
        highlight(notification_container)

        notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_container)
        if len(notifications) == 0:
            notifications = self.get_notifications_from_control_center()

        for notification in notifications:
            highlight(notification)
            text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)

            if like:
                if msg_text in text_el.text:
                    print("Expecting notification message '{0}' ... Ok".format(msg_text))
                    return notification
            else:
                if text_el.text == msg_text:
                    print("Expecting notification message '{0}' ... Ok".format(msg_text))
                    return notification

        raise WebDriverException

    def close_notification_with_message_and_wait_it_is_closed(self, notification, msg_text):
        clear_button = self.find_it(UI.get_theia_notification_close_button_locator(), parent=notification)
        self.click_me(clear_button, element_human_name=constants.Close)
        self.expect_notification_message_gone(msg_text)

    def close_notification_message(self, msg_text):
        notification = self.expect_notification_message(msg_text)
        highlight(notification)
        self.close_notification_with_message_and_wait_it_is_closed(notification, msg_text)

    def close_notification(self, notification):
        text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)
        msg_text = text_el.text
        self.close_notification_with_message_and_wait_it_is_closed(notification, msg_text)

    @WaitTillExist()
    def expect_notification_message_gone(self, msg_text):
        print("Expecting notification message '{0}' to disappear ...".format(msg_text))
        notification_container = self.find_it(UI.get_theia_notification_container_locator())
        highlight(notification_container)

        notifications = self.find_them(UI.get_theia_notifications_locator(), parent=notification_container)
        for notification in notifications:
            text_el = self.find_it(UI.get_theia_notification_message_locator(), parent=notification)
            if text_el.text == msg_text:
                raise WebDriverException

        print("Expecting notification message '{0}' to disappear ... Ok".format(msg_text))
        return

    def find_child_node(self, content, child_name, top, padding, node_prev_padding):
        child_nodes = self.find_them(UI.get_tree_nodes_locator(), parent=content)

        previous_child_padding_left = "0px"

        for child_node in child_nodes:
            child_parent = self.get_parent_node(child_node)
            child_parent_top = self.get_element_top(child_parent)

            child_node_padding_left = self.get_element_padding_left(child_node)
            if lt_pixels(child_node_padding_left, previous_child_padding_left) and lt_pixels("0px", node_prev_padding):
                print("Another subdir")
                break

            previous_child_padding_left = child_node_padding_left

            if lt_pixels(child_parent_top, top):
                continue

            child_padding = self.get_element_padding_left(child_node)
            if lt_pixels(child_padding, padding):
                continue

            child_node_content = self.find_it(UI.get_tree_node_segment_grow_locator(), parent=child_node)
            if child_node_content.text != child_name:
                continue

            # we reached another Connection name, but looking not for a connection
            if child_node_padding_left == "0px" and padding != "0px":
                print("Next connection reached!")
                print("child_node_padding_left: '{0}'".format(child_node_padding_left))
                print("padding: '{0}'".format(padding))
                break

            if child_node_content.text == child_name:
                return child_node

        return None

    def find_file_explorer_panel(self):
        return self.find_panel_with_title(constants.FILES_PANEL_TITLE)

    def find_panel_with_title(self, title):
        title = title.upper()
        panels = self.find_them(UI.get_theia_side_panel_title_locator())
        for panel in panels:
            highlight(panel)
            panel_title = panel.text.upper()

            if string_is_regexp(title):
                if re.search(title, panel_title):
                    highlight(panel)
                    return panel
            else:
                if panel_title == title:
                    highlight(panel)
                    return panel

        raise ElementNotFoundException(self.get_driver())

    def find_file_explorer_content(self):
        locator = UI.get_files_explorer_content_locator()
        WebDriverWait(self._driver, constants.DEFAULT_TIMEOUT).until(
            expected_conditions.presence_of_element_located(locator)
        )
        file_explorer = self.find_it(locator)
        return file_explorer

    def find_first_element_in_files_explorer(self):
        content = self.find_file_explorer_content()
        highlight(content)

    @keyword("Navigate All the Way ${direction}")
    def scroll_all_up(self, direction):
        content = self.find_file_explorer_content()
        highlight(content)
        return self.scroll_explorer(direction, content)

    def scroll_explorer(self, direction, content):
        start_time = round(time.time())

        while True:
            elapsed_time = round(time.time())
            if elapsed_time - start_time > constants.DEFAULT_HUGE_TIMEOUT:
                raise CustomTimeoutException(
                    self.get_driver(),
                    call_from=self.scroll_explorer.__name__
                )

            if direction == "Up":
                while not self.is_files_content_scrolled_up():
                    self.scroll_up(content)

                break

            elif direction == "Down":
                while not self.is_files_content_scrolled_down():
                    self.scroll_down(content)

                break

            else:
                raise Exception("Unsupported direction: '{0}'".format(direction))

    @keyword("Scroll ${direction} File Explorer From ${upper_node} And Find ${element_name} Which Is ${present}")
    def scroll_file_explorer_element_can_be_missing(self, direction, upper_node, element_name, present):
        content = self.find_file_explorer_content()
        highlight(content)
        return self.scroll_till_element_is_found(direction, content, element_name, upper_node, should_present=present)

    @keyword("Inside File Explorer Navigate ${direction} to ${element_name} from ${upper_node}")
    def scroll_file_explorer_till_element_is_found(self, direction, element_name, upper_node):
        content = self.find_file_explorer_content()
        highlight(content)
        return self.scroll_till_element_is_found(direction, content, element_name, upper_node)

    def is_files_content_scrolled_up(self):
        content = self.find_file_explorer_content()
        highlight(content)

        y_scroll = self.find_it(UI.get_y_scroll_locator(), parent=content)
        highlight(y_scroll)

        y_scroll_top = y_scroll.value_of_css_property("top")

        return y_scroll_top == "0px"

    def is_files_content_scrolled_down(self):
        content = self.find_file_explorer_content()
        highlight(content)

        y_scroll = self.find_it(UI.get_y_scroll_locator(), parent=content)
        highlight(y_scroll)

        y_thumb_scroll = self.find_it(UI.get_y_thumb_scroll_locator(), parent=content)
        highlight(y_thumb_scroll)

        y_scroll_height = y_scroll.value_of_css_property("height")

        y_thumb_scroll_height = y_thumb_scroll.value_of_css_property("height")
        y_thumb_scroll_top = y_thumb_scroll.value_of_css_property("top")

        full_height = sum_pixels(y_thumb_scroll_height, y_thumb_scroll_top)

        return full_height in ["0px", y_scroll_height]

    def scroll_till_element_is_found(self, direction, content, element_name, upper_node, should_present=True):
        self.node_should_exist(upper_node)

        if constants.THEIA_VIEW_CONTAINER_TITLE_NODE in upper_node.get_attribute(constants.TYPE_CLASS) \
                or constants.THEIA_SIDE_PANEL_TOOLBAR in upper_node.get_attribute(constants.TYPE_CLASS):
            node_top = "0px"
            node_padding = "0px"
            node_prev_padding = "-1px"

        else:
            parent_upper_node = self.get_parent_node(upper_node)
            node_top = self.get_element_top(parent_upper_node)
            node_padding = self.get_element_padding_left(upper_node)
            node_prev_padding = node_padding

        found_node = None

        start_time = round(time.time())

        while True:
            elapsed_time = round(time.time())
            if elapsed_time - start_time > constants.DEFAULT_HUGE_TIMEOUT:
                raise CustomTimeoutException(
                    self.get_driver(),
                    call_from=self.scroll_file_explorer_till_element_is_found.__name__
                )

            try:
                found_node = self.find_child_node(content, element_name, node_top, node_padding, node_prev_padding)

            except StaleElementReferenceException:
                print("Got StaleElementReferenceException exception, wait 1 sec")
                time.sleep(1)
                continue

            except Exception:
                raise GeneralException(self.get_driver(), call_from=self.scroll_till_element_is_found.__name__)

            if found_node is not None:
                highlight(found_node)
                break

            if direction == "Down":
                if self.is_files_content_scrolled_down():
                    print("Scrolled fully down")
                    break

                self.page_down_tree(content)

            elif direction == "Up":
                self.page_up_tree(content)

            else:
                raise Exception("Unsupported scroll direction: '{0}'".format(direction))

        if found_node is None and should_present:
            raise ElementNotFoundException(self.get_driver())

        return found_node

    def wait_for_nodes(self, content, expandable=True):
        interval = 1
        elapsed = 0
        timeout = 3

        tree_nodes = None

        while True:
            if elapsed > timeout:
                break

            if expandable:
                tree_nodes = self.find_them(UI.get_tree_expandable_nodes_locator(), parent=content)
            else:
                tree_nodes = self.find_them(UI.get_tree_nodes_locator(), parent=content)

            if len(tree_nodes):
                break

            time.sleep(interval)
            elapsed += interval

        return tree_nodes

    def find_host(self, content, connection_name, expandable=True, padding_left="0px"):
        tree_nodes = self.wait_for_nodes(content, expandable)
        for tree_node in tree_nodes:
            highlight(tree_node)
            node_padding_left = self.get_element_padding_left(tree_node)
            if node_padding_left != padding_left:
                continue

            node_content = self.find_it(UI.get_tree_node_segment_grow_locator(), parent=tree_node)
            if node_content.text == connection_name:
                return tree_node

        return None

    @WaitTillExist()
    def find_tree_node(self, content, node_name, expandable=True, padding_left="0px", should_exist=True):
        tree_node = self.find_host(content, node_name, expandable, padding_left)

        if (tree_node is None and should_exist) or \
                (tree_node is not None and not should_exist):
            raise WebDriverException

        return tree_node

    @WaitTillExist()
    def wait_for_input_disappear(self):
        input_widget = self.find_it(UI.get_monako_input_widget_locator())
        hidden = str2bool(input_widget.get_attribute(constants.ARIA_HIDDEN))
        if not hidden:
            print("Press Enter again")
            self.confirm_input(input_widget)
            raise WebDriverException

    def cancel_input_if_exist(self):
        try:
            input_widget = self.find_it(UI.get_monako_input_widget_locator())

        except (NoSuchElementException, ElementNotFoundException):
            return

        hidden = str2bool(input_widget.get_attribute(constants.ARIA_HIDDEN))
        if not hidden:
            self.click_me(input_widget)
            actions = ActionChains(self.get_driver())
            actions.send_keys(Keys.ESCAPE)
            actions.perform()
            self.wait_for_input_disappear()

    @keyword("Click On ${node}")
    def click_on_node(self, node):
        try:
            highlight(node)
            self.click_me(node)

        except Exception:
            dump(self.get_driver(), reason=self.click_on_node.__name__)

    def execute_f1_command(self):
        actions = ActionChains(self.get_driver())
        actions.send_keys(Keys.F1)
        actions.perform()

    @WaitTillExist()
    def wait_for_input_with_title_disappear(self, title):
        input_frame = self.find_it(UI.get_monako_quick_input_locator())
        input_element = self.find_it(UI.get_monako_input_locator(), parent=input_frame)

        visible = str2bool(input_element.get_attribute(constants.ARIA_HAS_POPUP))

        if visible and input_element.get_attribute(constants.ELEMENT_TITLE) == title:
            raise WebDriverException

    def send_ctrl_left(self):
        actions = [
            {
                "action": "key_down",
                "value": Keys.CONTROL
            },
            {
                "action": "send_keys",
                "value": Keys.LEFT
            },
            {
                "action": "key_up",
                "value": Keys.CONTROL
            }
        ]
        self.execute_key_sequence(actions)
