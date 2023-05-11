*** Settings ***
Resource        ${EXECDIR}${/}tests/web/common.robot
Library         ${EXECDIR}${/}resources/web/MasterDataMgmt/PriceGroup/PriceGroupAddPage.py
Library         ${EXECDIR}${/}resources/web/MasterDataMgmt/PriceGroup/PriceGroupListPage.py


*** Test Cases ***
1 - Able to delete price group
    [Documentation]  To validate user able to delete price group
    [Tags]    hqadm
    Given user navigates to menu Master Data Management | Price Group
    When user creates price group using random data
    Then price group created successfully with message 'Success: New Price Group inserted successfully'
    When user backs to price group listing page
    And user selects price group to delete
    Then price group created successfully with message 'Record deleted'
