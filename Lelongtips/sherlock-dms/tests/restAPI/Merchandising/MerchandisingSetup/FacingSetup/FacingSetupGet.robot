*** Settings ***
Resource          ${EXECDIR}${/}tests/restAPI/common.robot
Library           ${EXECDIR}${/}resources/restAPI/Merchandising/MerchandisingSetup/FacingSetup/FacingSetupGet.py
Library           ${EXECDIR}${/}resources/restAPI/Merchandising/MerchandisingSetup/FacingSetup/FacingSetupPost.py
Library           ${EXECDIR}${/}resources/restAPI/Merchandising/MerchandisingSetup/FacingSetup/FacingSetupDelete.py

*** Test Cases ***
1-Able to retrieve all product group via API
    [Documentation]  This test is to retrieve all product group via API
    [Tags]    9.1     hqadm
    Given user retrieves token access as hqadm
    When user retrieves all product groups
    Then expected return status code 200

2-Able to retrieve product group by ID via API
    [Documentation]  This test is to retrieve product group by ID via API
    [Tags]    9.1     hqadm
    [Teardown]    run keywords
    ...    user deletes created product group
    ...    AND expected return status code 200
    Given user retrieves token access as hqadm
    When user creates product group with random data
    Then expected return status code 201
    When user retrieves product group by ID
    Then expected return status code 200





