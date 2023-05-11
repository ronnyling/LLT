*** Settings ***
Resource          ${EXECDIR}${/}tests/restAPI/common.robot
Library           ${EXECDIR}${/}resources/restAPI/TradeAsset/AssetReference/PreventiveMaintenance/PreventiveMaintenancePost.py
Library           ${EXECDIR}${/}resources/restAPI/TradeAsset/AssetReference/PreventiveMaintenance/PreventiveMaintenanceDelete.py


*** Test Cases ***
1 - Able to posts to preventive maintenance
    [Documentation]    Able to posts to preventive maintenance
    [Tags]    sysimp
    [Teardown]  user deletes preventive maintenance
    Given user retrieves token access as sysimp
    When user posts to preventive maintenance
    Then expected return status code 201
