*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}=    https://petstore.octoperf.com/actions/Catalog.action
${BROWSER}=    chrome
${CHROME_OPTIONS}=    add_argument("--disable-search-engine-choice-screen");
...    add_argument("--ignore-certificate-errors")
${SIGN_IN_BUTTON}=    xpath://a[text()="Sign In"]
${USERNAME_FIELD}=    xpath://input[@name="username"]
${PASSWORD_FIELD}=    xpath://input[@name="password"]

*** Test Cases ***
User can login with valid credentials
    Begin Web Test
    Navigate To MainPage
    Click Sign In
    Fill Username    TestUser
    Sleep    10s

*** Keywords ***
Begin Web Test
    SeleniumLibrary.Open Browser    url=about:blank    browser=${BROWSER}    options=${CHROME_OPTIONS}
    SeleniumLibrary.Maximize Browser Window
    Maximize Browser Window

Navigate To MainPage
    SeleniumLibrary.Go To    url=${URL}

Click Sign In
    SeleniumLibrary.Wait Until Page Contains Element    ${SIGN_IN_BUTTON}
    SeleniumLibrary.Click Element    ${SIGN_IN_BUTTON}

Fill Username
    [Arguments]    ${username}
    SeleniumLibrary.Wait Until Page Contains Element    ${USERNAME_FIELD}
    SeleniumLibrary.Input Text    ${USERNAME_FIELD}    ${username}
