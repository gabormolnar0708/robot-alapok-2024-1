*** Settings ***
Resource    Resources/Common/CommonWeb.resource
Resource    Resources/PO/MainPage.resource
Resource    Resources/PO/LoginPage.resource

Test Setup    CommonWeb.Begin Web Test
Test Teardown    CommonWeb.End Web Test

*** Variables ***


*** Test Cases ***
User can not login with invalid credentials
    MainPage.Navigate To
    MainPage.Click Sign In
    LoginPage.Fill Username    TestUser
    LoginPage.Fill Password    asdf1234
    LoginPage.Submit Credentials
    LoginPage.Verify Invalid Login Message
    

User can login with valid credentials
    MainPage.Navigate To
    MainPage.Click Sign In
    LoginPage.Fill Username    robot-base241111
    LoginPage.Fill Password    robot-base241111   
    LoginPage.Submit Credentials
    #Verify Success Login
