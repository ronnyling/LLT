*** Settings ***
Resource        ${EXECDIR}${/}tests/web/common.robot
Resource        ${EXECDIR}${/}tests/restAPI/common.robot
Library         ${EXECDIR}${/}resources/restAPI/CustTrx/SalesOrder/SalesOrderPost.py
Library         ${EXECDIR}${/}resources/restAPI/CustTrx/SalesOrder/SalesOrderProcess.py
Library         ${EXECDIR}${/}resources/web/CustTrx/SalesInvoice/SalesInvoiceListPage.py
Library         ${EXECDIR}${/}resources/restAPI/CustTrx/SalesInvoice/SalesInvoiceConfirm.py
Library         ${EXECDIR}${/}resources/restAPI/SysConfig/TenantMaintainance/FeatureSetup/FeatureSetupPut.py

Test Setup      run keywords
...    user open browser and logins using user role ${user_role}
...    User sets the feature setup for delivery app to off passing with 'DELIVERY_APP' value
Test Teardown   run keywords
...    User sets the feature setup for delivery app to on passing with 'DELIVERY_APP' value
...    user logouts and closes browser

*** Test Cases ***
1 - Validate Status updated to Invoiced after Confirm single Invoice
    [Documentation]    Able to confirm Invoice and status updated successfully
    [Tags]     distadm      9.2    NRSZUANQ-46134
    ${SODetailsPre}=    create dictionary
    ...    PRIME_FLAG=Prime
    ...    route=Rchoon
    ...    customer=CT0000001549
    ...    warehouse=CCCC
    ...    shipTo=CXTESTTAX
    ...    product=AdPrdTNet
    ...    distributor=DistEgg
    ...    status=P
    ...    selling=S
    Given user post random sales order as prerequisite
    When user process the sales order
    Then expected return status code 202
    Given user navigates to menu Customer Transaction | Sales Invoice
    When user selects invoice to check
    And user confirm selected invoice
    Then Invoice confirmed successfully with message 'request successfully processed'
    And user validates status updated to Invoiced

2 - Validate Status updated to Invoiced after Confirm multiple Invoice
    [Documentation]    Able to confirm multiple Invoice and status updated successfully
    [Tags]     distadm      9.2    NRSZUANQ-46134   BUG:NRSZUANQ-46894
    ${SODetailsPre}=    create dictionary
    ...    PRIME_FLAG=Prime
    ...    route=Rchoon
    ...    customer=CT0000001549
    ...    warehouse=CCCC
    ...    shipTo=CXTESTTAX
    ...    product=AdPrdTNet
    ...    distributor=DistEgg
    ...    status=P
    ...    selling=S
    Given user post random sales order as prerequisite
    When user process the sales order
    Then expected return status code 202
    And get invoice id using order number
    Given user post random sales order as prerequisite
    When user process the sales order
    Then expected return status code 202
    And get invoice id using order number
    Given user navigates to menu Customer Transaction | Sales Invoice
    When user selects invoice to check
    And user confirm selected invoice
    Then Invoice confirmed successfully with message 'request successfully processed'
