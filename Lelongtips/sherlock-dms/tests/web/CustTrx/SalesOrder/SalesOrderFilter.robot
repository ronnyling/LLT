*** Settings ***
Resource        ${EXECDIR}${/}tests/web/common.robot
Library         ${EXECDIR}${/}resources/web/CustTrx/SalesOrder/SalesOrderListPage.py
Library         ${EXECDIR}${/}resources/restAPI/Config/DistConfig/DistConfigPost.py
Library         ${EXECDIR}${/}resources/restAPI/Config/AppSetup/AppSetupPut.py
Library         ${EXECDIR}${/}resources/restAPI/Config/AppSetup/AppSetupGet.py
Library         ${EXECDIR}${/}resources/restAPI/SysConfig/TenantMaintainance/FeatureSetup/FeatureSetupPut.py

*** Test Cases ***
1 - Able to filter Sales Order using principal field
    [Documentation]    Able to filter Sales Order with principal field when multi principal = On
    [Tags]     distadm  9.1    NRSZUANQ-30047
    ${FilterDetails}=    create dictionary
    ...    principal=Prime
    set test variable     &{FilterDetails}
    Given user switches On multi principal
    And user navigates to menu Customer Transaction | Sales Order
    When user filters sales order with given data
    And principal listed successfully with Prime data

2 - Able to filter Sales Order using type field
    [Documentation]    Able to filter sales order with type field when Sampling = On and Combine = No
    [Tags]     distadm    9.3
    ${AppSetupDetails}=    create dictionary
    ...    SAMPLING_COMBINE_IN_SELLING_TXN=${False}
    set test variable   &{AppSetupDetails}
    [Setup]      run keywords
    ...    user sets the feature setup for sampling to on passing with 'SAMPLING' value
    Given user retrieves details of application setup
    And user updates app setup details using fixed data
    And user open browser and logins using user role ${user_role}
    When user navigates to menu Customer Transaction | Sales Order
    And user filters sales order with Sampling data
    Then validate sampling order listed successfully
    When user filters sales order with Selling data
    Then validate sampling order listed successfully
