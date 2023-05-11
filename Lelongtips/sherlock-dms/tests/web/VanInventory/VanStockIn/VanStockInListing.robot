*** Settings ***
Resource        ${EXECDIR}${/}tests/web/common.robot
Resource        ${EXECDIR}${/}tests/restAPI/common.robot
Library         ${EXECDIR}${/}resources/web/VanInventory/VanReplenishment/VanReplenishmentAddPage.py
Library         ${EXECDIR}${/}resources/web/VanInventory/VanReplenishment/VanReplenishmentListPage.py
Library         ${EXECDIR}${/}resources/web/VanInventory/VanReplenishment/VanStockInListing.py
Library         ${EXECDIR}${/}resources/restAPI/Config/DistConfig/DistConfigPost.py
Library         ${EXECDIR}${/}resources/restAPI/MasterDataMgmt/Product/ProductGet.py
Library         ${EXECDIR}${/}resources/restAPI/MasterDataMgmt/Product/ProductPut.py
Library         ${EXECDIR}${/}resources/restAPI/MasterDataMgmt/Distributor/DistributorGet.py
Library         ${EXECDIR}${/}resources/restAPI/MasterDataMgmt/Distributor/DistributorProductSectorDelete.py

*** Test Cases ***

Web#1-To verify the fields on listing
    [Documentation]    To verify the fileds on listing pages
    [Tags]   Web     distadm     vanstockin    R1   FieldValidations      9.0
    Given user navigates menu to Van Inventory | Van Stock In
    When user is able to view the Van Stock In listing

WEB#2- Able to verify all the fields in Van replenishment listing page
    [Documentation]    To ensure the user is able to verify all the fields in Van replenishment
    [Tags]   WEB   distadm  VanStockIn    R1    verify     listing      9.0
    Given user navigates menu to Van Inventory | Van Stock In
    Then verifies all the fileds in listing page
