*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Configuration.resource

*** Variables ***
${CHROME_OPTIONS}=    add_argument("--disable-search-engine-choice-screen");
...    add_argument("--ignore-certificate-errors")

*** Keywords ***
Begin Web Test
    SeleniumLibrary.Open Browser    url=about:blank    browser=${BROWSER}    options=${CHROME_OPTIONS}
    SeleniumLibrary.Maximize Browser Window
    Maximize Browser Window

End Web Test
    SeleniumLibrary.Close All Browsers