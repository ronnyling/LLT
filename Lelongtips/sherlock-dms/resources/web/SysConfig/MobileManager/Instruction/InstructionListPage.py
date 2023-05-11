""" Python file related to instruction UI """
from PageObjectLibrary import PageObject
from robot.libraries.BuiltIn import BuiltIn


class InstructionListPage(PageObject):
    """ Functions related to instruction list page """
    PAGE_TITLE = "System Configuration / Mobile Manager / Instruction"
    PAGE_URL = "/mobile-manager/instruction?template=p"

    _locators = {
        "first_row_column": "//tr[1]//td[2]//core-cell-render//div//div"
    }

    def user_retrieved_all_instruction(self):
        """ Functions to ensure there is at least one record shown in listing page """
        self.user_verify_record_shown()
        is_record_shown = BuiltIn().get_variable_value("${is_record_shown}")
        assert is_record_shown is True, "No record shown in listing page"

    def user_verify_record_shown(self):
        """ Functions to verify if record shown in the listing page """
        try:
            self.selib.wait_until_element_is_enabled(self.locator.first_row_column)
            is_record_shown = True
        except Exception as e:
            print(e.__class__, "occured")
            is_record_shown = False

        BuiltIn().set_test_variable("${is_record_shown}", is_record_shown)
