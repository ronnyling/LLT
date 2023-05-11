from PageObjectLibrary import PageObject
from resources.web.VanInventory.VanStockIn import VanStockInListing
from resources.web import COMMON_KEY, BUTTON, TEXTFIELD, RADIOBTN, DRPSINGLE
from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword


class VanStockCountListing(PageObject):
    PAGE_TITLE = "Van Inventory / Van Stock In"
    PAGE_URL = "inventory/van-stock-in/NEW"
    REP_DETAILS = "${InDetails}"

    _locators = {
        "PrdRow": "//*[@class='cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing']/following::tr//td[2]",
        "product": "//input[@placeholder='Enter Code / Description']",
        "productList": "//input[@placeholder='Enter Code / Description']//following::tr[@role='row']",
        "LoadingImg": "//div[@class='loading-text']//img"
    }

    @keyword("user provides van replenishment header details")
    def user_provides_van_replenishment_header_details(self):
        BUTTON.validate_button_is_shown("Add")
        details = BuiltIn().get_variable_value(self.REP_DETAILS)
        VanStockInListing.VanStockInListing().click_add_van_stock_in_button()
        RADIOBTN.select_from_radio_button("Principal", details['principal'])
        DRPSINGLE.select_from_single_selection_dropdown("Source Warehouse", details['warehouse'])
        DRPSINGLE.select_from_single_selection_dropdown("Route", details['route'])