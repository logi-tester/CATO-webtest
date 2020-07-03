*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary

*** Variables ***
${url}            http://webtest.xerago.com/cvm
${browser}        chrome

*** Test Cases ***
Valid credential
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox

    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go to    ${url}
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    Sleep	20s
    SeleniumLibrary.Element Text Should Be    //label[@class='loginLabel']    Username
    SeleniumLibrary.Element Text Should Be    //label[@for='form_password']    Password
    SeleniumLibrary.Input Text    id=form_username    cvmcreator
    SeleniumLibrary.Input Text    id=form_password    cvmcreator@123
    SeleniumLibrary.Click Button    form_login
    SeleniumLibrary.Close Browser
	
Invalid Credentials Test
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080	
    Go to    ${url}   
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    Sleep	20s
    SeleniumLibrary.Element Text Should Be    //label[@class='loginLabel']    Username
    SeleniumLibrary.Element Text Should Be    //label[@for='form_password']    Password
    SeleniumLibrary.Input Text    id=form_username    cvmcreators
    SeleniumLibrary.Input Text    id=form_password    cvmcreator@12334
    SeleniumLibrary.Click Button    form_login
    Sleep    10s
    Element Should Be Visible    xpath=.//*[@id='msg']    Invalid credentials
    SeleniumLibrary.Close Browser
