*** Settings ***
Resource        ${EXECDIR}${/}tests/web/common.robot
Library         ${EXECDIR}${/}resources/web/MasterDataMgmt/ProductSector/ProductSectorAddPage.py
Library         ${EXECDIR}${/}resources/web/MasterDataMgmt/ProductSector/ProductSectorListPage.py


*** Test Cases ***
1 - Able to create product sector
    [Documentation]  To validate user able to create product sector
    [Tags]    hqadm
    Given user navigates to menu Master Data Management | Product Sector
    When user creates product sector using random data
    Then product sector created successfully with message 'New Product Sector Entry Added successfully'
    When user selects product sector to edit
    And user updates product sector using random data
    Then product sector updated successfully with message 'Product Sector Updated successfully'
    When user selects product sector to delete