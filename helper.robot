*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Should Append To List
    [Arguments]    ${text}
    ${state}    Evaluate    "pxy" in "${text}" or "monitoring" in "${text}" or "proxy" in "${text}" or "sle15sp4_minion" in "${text}"
    ${should_append}    Set Variable    not ${state}
    [Return]    ${should_append}

Delete System
    Wait Until Element Is Visible    xpath: //i[@class="fa fa-trash-o"]
    Click Element    xpath: //i[@class="fa fa-trash-o"]
    Wait Until Element Is Visible    xpath: //div[@id='delete_system_button']/span/button
    Click Element    xpath: //div[@id='delete_system_button']/span/button
    Wait Until Page Contains    has been deleted.

Delete ActivationKey
    Wait Until Element Is Visible    xpath: //i[@class='fa fa-trash-o']
    Click Element    xpath: //i[@class='fa fa-trash-o']
    Wait Until Element Is Visible    xpath: //input[@class='btn btn-danger']
    Click Element    xpath: //input[@class='btn btn-danger']
    Wait Until Page Contains    has been deleted.

Delete Channels
    Wait Until Element Is Visible    xpath: //i[@class='fa fa-trash-o']
    Click Element    xpath: //i[@class='fa fa-trash-o']
    Wait Until Element Is Visible    xpath: //input[@class='btn btn-danger']
    Click Element    xpath: //input[@class='btn btn-danger']
    Comment    Wait Until Page Contains    has been deleted. or Unable to delete channel
    Comment    Wait Until Page Contains Element    xpath=//*[contains(text(),'Unable to delete channel') or contains(text(),'has been deleted')]


Delete ContentLifeCyclesProjects
    Wait Until Element Is Visible    xpath ://div[@class='pull-right btn-group']/button[@class='btn btn-danger']
    Click Element    xpath: //div[@class='pull-right btn-group']/button[@class='btn btn-danger']
    Wait Until Element Is Visible    xpath: //i[@class='fa fa-trash']
    Click Element    xpath: //i[@class='fa fa-trash']
    Wait Until Page Contains    deleted successfully

Delete Repositories
    Wait Until Element Is Visible    xpath: //i[@class='fa fa-trash-o']
    Click Element    xpath: //i[@class='fa fa-trash-o']
    Wait Until Element Is Visible    xpath: //input[@class='btn btn-danger']
    Click Element    xpath: //input[@class='btn btn-danger']
    Wait Until Page Contains    Repository deleted successfully

Login To Page
    [Arguments]    ${page}
    Set Selenium Timeout    60
    Open Browser    https://${server}    firefox    options=add_argument("--disable-popup-blocking"); add_argument("--ignore-certificate-errors")
    Wait Until Page Contains    Sign In
    Input Text    username-field    admin
    Input Password    password-field    admin
    Click Button    login-btn
    Wait Until Element Is Visible    xpath: //header//i[@class='fa fa-sign-out']
    Go to    https://${server}/rhn/${page}

Get Href List Of WebElements
    [Arguments]    ${webelement}
    @{elements}    Get WebElements    xpath: ${webelement}
    ${filtered_hrefs}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        ${should_append}    Should Append To List    ${text}
        ${element_href}    Get Element Attribute    ${element}    href
        Run Keyword if    ${should_append}    Append To List    ${filtered_hrefs}    ${element_href}
    END
    [Return]    ${filtered_hrefs}
