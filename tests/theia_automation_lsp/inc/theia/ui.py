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

from selenium.webdriver.common.by import By
import inc.theia.constants as constants
from inc.exceptions.unknown_locator_exception import UnknownLocatorException
from inc.theia import zos_constants


def _get_locator(locator_text):
    if locator_text == constants.TYPE_ID:
        return By.ID

    if locator_text == constants.TYPE_CLASS:
        return By.CLASS_NAME

    if locator_text == constants.TYPE_NAME:
        return By.NAME

    if locator_text == constants.TYPE_TAG:
        return By.TAG_NAME

    raise UnknownLocatorException()


class UI(object):

    @staticmethod
    def get_element_locator(item):
        if item not in constants.THEIA_UI:
            raise Exception("Item {0} does not exist in dictionary".format(item))

        return \
            _get_locator(constants.THEIA_UI[item][constants.ELEMENT_TYPE]), \
            constants.THEIA_UI[item][constants.ELEMENT_TEXT]

    @staticmethod
    def get_locator_by_id(id):
        return By.ID, id

    @staticmethod
    def get_files_explorer_locator():
        return UI.get_element_locator(constants.FILES_EXPLORER_ID)

    @staticmethod
    def get_files_explorer_tab_locator():
        return UI.get_element_locator(constants.FILES_EXPLORER_TAB_ID)

    @staticmethod
    def get_files_explorer_content_locator():
        return UI.get_element_locator(constants.FILES_EXPLORER_CONTENT)

    @staticmethod
    def get_theia_locator():
        return UI.get_element_locator(constants.THEIA)

    @staticmethod
    def get_left_menu_bar_locator():
        return UI.get_element_locator(constants.THEIA_TAB_CONTENT)

    @staticmethod
    def get_tabs_locator():
        return UI.get_element_locator(constants.THEIA_TABS)

    @staticmethod
    def get_theia_top_panel_locator():
        return UI.get_element_locator(constants.THEIA_TOP_PANEL)

    @staticmethod
    def get_theia_menu_locator():
        return UI.get_element_locator(constants.THEIA_MENU)

    @staticmethod
    def get_theia_menu_content_locator():
        return UI.get_element_locator(constants.THEIA_MENU_CONTENT)

    @staticmethod
    def get_theia_submenu_content_locator():
        return UI.get_element_locator(constants.THEIA_SUBMENU_CONTENT)

    @staticmethod
    def get_theia_menu_items_locator():
        return UI.get_element_locator(constants.THEIA_MENU_BAR_ITEMS)

    @staticmethod
    def get_theia_menu_item_label_locator():
        return UI.get_element_locator(constants.THEIA_MENU_BAR_ITEM_LABEL)

    @staticmethod
    def get_theia_main_content_panel_locator():
        return UI.get_element_locator(constants.THEIA_MAIN_CONTENT_PANEL)

    @staticmethod
    def get_theia_submenu_items_locator():
        return UI.get_element_locator(constants.THEIA_SUBMENU_ITEMS)

    @staticmethod
    def get_theia_submenu_item_label_locator():
        return UI.get_element_locator(constants.THEIA_SUBMENU_ITEM_LABEL)

    @staticmethod
    def get_tab_content_locator():
        return UI.get_element_locator(constants.THEIA_TAB_CONTENT)

    @staticmethod
    def get_tab_label_locator():
        return UI.get_element_locator(constants.THEIA_TAB_LABEL)

    @staticmethod
    def get_tab_close_button_locator():
        return UI.get_element_locator(constants.THEIA_TAB_CLOSE_BUTTON)

    @staticmethod
    def get_theia_left_panel_locator():
        return UI.get_element_locator(constants.THEIA_LEFT_CONTENT_PANEL)

    @staticmethod
    def get_theia_dock_panel_widgets_locator():
        return UI.get_element_locator(constants.THEIA_DOCK_PANEL_WIDGET)

    @staticmethod
    def get_tab_bar_locator():
        return UI.get_element_locator(constants.THEIA_TAB_BAR)

    @staticmethod
    def get_zos_explorer_container_locator():
        return UI.get_element_locator(zos_constants.ZOS_EXPLORER_CONTAINER)

    @staticmethod
    def get_theia_side_panel_title_locator():
        return UI.get_element_locator(constants.THEIA_SIDE_PANEL_TOOLBAR)

    @staticmethod
    def get_theia_expand_arrow_locator():
        return UI.get_element_locator(constants.THEIA_EXPAND_ARROW)

    @staticmethod
    def get_theia_statusbar_locator():
        return UI.get_element_locator(constants.THEIA_STATUS_BAR)

    @staticmethod
    def get_right_status_bar_area():
        return UI.get_element_locator(constants.THEIA_STATUS_BAR_RIGHT_AREA)

    @staticmethod
    def get_status_elements():
        return UI.get_element_locator(constants.THEIA_STATUS_ELEMENTS_WITH_COMMANDS)

    @staticmethod
    def get_theia_dialog_shell_locator():
        return UI.get_element_locator(constants.THEIA_DIALOG_SHELL)

    @staticmethod
    def get_theia_dialog_control_locator():
        return UI.get_element_locator(constants.THEIA_DIALOG_CONTROL)

    @staticmethod
    def get_theia_dialog_title_locator():
        return UI.get_element_locator(constants.THEIA_DIALOG_TITLE)

    @staticmethod
    def get_zos_explorer_locator():
        return UI.get_element_locator(zos_constants.ZOS_EXPLORER_LABEL)

    @staticmethod
    def get_zos_explorer_content_locator():
        return UI.get_element_locator(zos_constants.ZOS_EXPLORER_ID)

    @staticmethod
    def get_toolbars_locator():
        return UI.get_element_locator(constants.THEIA_SIDE_PANEL_TOOLBAR)

    @staticmethod
    def get_theia_container_title_node_locator():
        return UI.get_element_locator(constants.THEIA_VIEW_CONTAINER_TITLE_NODE)

    @staticmethod
    def get_panel_titles_locator():
        return UI.get_element_locator(constants.THEIA_SIDE_PANEL_TITLE)

    @staticmethod
    def get_section_labels_locator():
        return UI.get_element_locator(constants.THEIA_VIEWS_CONTAINER_SECTION_LABEL)

    @staticmethod
    def get_theia_iframe_locator():
        return UI.get_element_locator(constants.THEIA_IFRAME)

    @staticmethod
    def get_host_cfg_form():
        return UI.get_element_locator(constants.HOST_CFG_FORM)

    @staticmethod
    def get_host_name_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_NAME)

    @staticmethod
    def get_url_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_URL)

    @staticmethod
    def get_username_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_ZOS_USER)

    @staticmethod
    def get_password_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_PASSWORD)

    @staticmethod
    def get_next_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_NEXT)

    @staticmethod
    def get_submit_locator():
        return UI.get_element_locator(constants.HOST_CFG_FORM_SUBMIT)

    @staticmethod
    def get_tree_expandable_nodes_locator():
        return UI.get_element_locator(constants.THEIA_TREE_EXPANDABLE_NODES)

    @staticmethod
    def get_tree_nodes_locator():
        return UI.get_element_locator(constants.THEIA_TREE_NODES)

    @staticmethod
    def get_tree_node_content_locator():
        return UI.get_element_locator(constants.THEIA_TREE_NODE_CONTENT)

    @staticmethod
    def get_tree_node_actions_locator():
        return UI.get_element_locator(constants.THEIA_INLINE_ACTIONS)

    @staticmethod
    def get_theia_notification_container_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_CONTAINER)

    @staticmethod
    def get_theia_notification_center_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATIONS_CENTER)

    @staticmethod
    def get_theia_notifications_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION)

    @staticmethod
    def get_theia_notifications_show_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATIONS_SHOW)

    @staticmethod
    def get_theia_notification_message_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_MESSAGE)

    @staticmethod
    def get_theia_notification_actions_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_ACTIONS)

    @staticmethod
    def get_action_items_locator():
        return UI.get_element_locator(constants.THEIA_ACTION_ITEM)

    @staticmethod
    def get_action_label_locator():
        return UI.get_element_locator(constants.THEIA_ACTION_LABEL)

    @staticmethod
    def get_theia_notification_close_button_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_CLOSE_BUTTON)

    @staticmethod
    def get_text_locator():
        return UI.get_element_locator(constants.TEXT_CLASS)

    @staticmethod
    def get_buttons_container_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_BUTTONS)

    @staticmethod
    def get_buttons_locator():
        return UI.get_element_locator(constants.THEIA_NOTIFICATION_BUTTON)

    @staticmethod
    def get_monako_quick_overlay_locator():
        return UI.get_element_locator(constants.MONAKO_QUICK_OPEN_OVERLAY)

    @staticmethod
    def get_monako_quick_container_locator():
        return UI.get_element_locator(constants.MONAKO_QUICK_OPEN_CONTAINER)

    @staticmethod
    def get_monako_quick_input_locator():
        return UI.get_element_locator(constants.MONAKO_QUICK_OPEN_INPUT)

    @staticmethod
    def get_monako_open_tree_locator():
        return UI.get_element_locator(constants.MONAKO_OPEN_TREE)

    @staticmethod
    def get_monako_tree_rows_locator():
        return UI.get_element_locator(constants.MONAKO_TREE_ROWS)

    @staticmethod
    def get_monako_tree_row_locator():
        return UI.get_element_locator(constants.MONAKO_TREE_ROW)

    @staticmethod
    def get_monako_input_locator():
        return UI.get_element_locator(constants.MONAKO_INPUT_CLASS)

    @staticmethod
    def get_monako_input_widget_locator():
        return UI.get_element_locator(constants.MONAKO_INPUT_WIDGET)

    @staticmethod
    def get_monako_suggest_widget_locator():
        return UI.get_element_locator(constants.MONAKO_SUGGEST_WIDGET)

    @staticmethod
    def get_monako_list_rows_locator():
        return UI.get_element_locator(constants.MONAKO_LIST_ROWS)

    @staticmethod
    def get_monako_list_row_locator():
        return UI.get_element_locator(constants.MONAKO_LIST_ROW)

    @staticmethod
    def get_monako_zone_widget_locator():
        return UI.get_element_locator(constants.MONAKO_ZONE_WIDGET)

    @staticmethod
    def get_monako_hover_locator():
        return UI.get_element_locator(constants.MONAKO_EDITOR_HOVER)

    @staticmethod
    def get_hover_row_locator():
        return UI.get_element_locator(constants.MONAKO_EDITOR_HOVER_ROW)

    @staticmethod
    def get_hover_content_locator():
        return UI.get_element_locator(constants.MONAKO_HOVER_CONTENTS)

    @staticmethod
    def get_monako_lines_content_locator():
        return UI.get_element_locator(constants.MONAKO_LINES_CONTENT)

    @staticmethod
    def get_monako_editor_lines_locator():
        return UI.get_element_locator(constants.MONAKO_EDITOR_LINE)

    @staticmethod
    def get_monako_line_numbers_content_locator():
        return UI.get_element_locator(constants.MONAKO_LINE_NUMBERS)

    @staticmethod
    def get_monako_overlays_locator():
        return UI.get_element_locator(constants.MONAKO_OVERLAYS)

    @staticmethod
    def get_current_line_locator():
        return UI.get_element_locator(constants.MONAKO_CURRENT_LINE)

    @staticmethod
    def get_editor_errors_locator():
        return UI.get_element_locator(constants.MONAKO_EDITOR_ERROR)

    @staticmethod
    def get_editor_infos_locator():
        return UI.get_element_locator(constants.MONAKO_EDITOR_INFO)

    @staticmethod
    def get_spans_locator():
        return UI.get_element_locator(constants.SPAN)
