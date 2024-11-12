*** Settings ***
Resource    ..${/}Common${/}CommonWeb.resource
Resource    ..${/}..${/}Data${/}Configuration.resource

*** Variables ***
${SIGN_IN_BUTTON}=    xpath://a[text()="Sign In"]

*** Keywords ***
Navigate To
    SeleniumLibrary.Go To    url=${URL}

Click Sign In
    SeleniumLibrary.Wait Until Page Contains Element    ${SIGN_IN_BUTTON}
    SeleniumLibrary.Wait Until Element Is Enabled    ${SIGN_IN_BUTTON}
    SeleniumLibrary.Click Element    ${SIGN_IN_BUTTON}
