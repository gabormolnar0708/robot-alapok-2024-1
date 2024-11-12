*** Settings ***
Resource    ..${/}Common${/}CommonWeb.resource
Resource    ..${/}..${/}Data${/}Configuration.resource

*** Variables ***
${USERNAME_FIELD}=    xpath://input[@name="username"]
${PASSWORD_FIELD}=    xpath://input[@name="password"]
${LOGIN_BUTTON}=    xpath://input[@name="signon"]
${MESSAGE_CONTENT}=    xpath://div[@id="Content"]//ul[@class="messages"]/li


*** Keywords ***
Fill Username
    [Arguments]    ${username}
    SeleniumLibrary.Wait Until Page Contains Element    ${USERNAME_FIELD}
    SeleniumLibrary.Wait Until Element Is Enabled    ${USERNAME_FIELD}
    SeleniumLibrary.Input Text    ${USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]    ${password}
    SeleniumLibrary.Wait Until Page Contains Element    ${PASSWORD_FIELD}
    SeleniumLibrary.Wait Until Element Is Enabled    ${PASSWORD_FIELD}
    SeleniumLibrary.Input Text    ${PASSWORD_FIELD}    ${password}

Submit Credentials
    SeleniumLibrary.Wait Until Page Contains Element   ${LOGIN_BUTTON}
    SeleniumLibrary.Wait Until Element Is Enabled    ${LOGIN_BUTTON}
    SeleniumLibrary.Click Element    ${LOGIN_BUTTON}

Verify Invalid Login Message
    SeleniumLibrary.Wait Until Page Contains Element    ${MESSAGE_CONTENT}
    SeleniumLibrary.Wait Until Element Is Visible    ${MESSAGE_CONTENT}
    SeleniumLibrary.Wait Until Element Contains    ${MESSAGE_CONTENT}    Invalid username or password. Signon failed.