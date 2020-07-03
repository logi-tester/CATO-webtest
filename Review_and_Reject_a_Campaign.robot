*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://webtest.xerago.com/cvm
${browser}        chrome

*** Test Cases ***
Review and Reject a Campaign
	${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    SeleniumLibrary.Create WebDriver  Chrome  chrome_options=${chrome_options}
    SeleniumLibrary.Set Window Size    1920    1080	
    SeleniumLibrary.Go to    ${url}
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Savings Accounts Volatile account balances')]/parent::*/parent::*/parent::*//*[@ng-click='conOpenRejectModal(x)'])[1]
    Sleep    25s
    SeleniumLibrary.Input Text    xpath=.//*[@placeholder='Reason']    test reject
    Sleep    25s
    SeleniumLibrary.Click Element    xpath=.//*[@ng-click='rejectConversation()']
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button
    SeleniumLibrary.Close Browser
