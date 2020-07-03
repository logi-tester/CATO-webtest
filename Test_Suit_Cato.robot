*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://webdev.xerago.com/cvm
${BROWSER}        chrome
${control_val}    15
${Program_title}    Program for Cross-sell Savings Accounts Volatile account balances
${Creator_status_rej}    Rejected
${Creator_status_apprv}    Approved
${Creator_status_abrt}    Aborted
${alert_txt}      Program already exists for the given period

*** Test Cases ***

Valid Credentials Test
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox

    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go to    ${LOGIN URL}
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
    Go to    ${LOGIN URL}   
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
    
Create successful campaign 
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go to    ${LOGIN URL} 
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    40s
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']    60s
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram()']
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@id='productName'][contains(.,'Savings Accounts')]    40s
    SeleniumLibrary.Click Element    xpath=.//div[@id='productName'][contains(.,'Savings Accounts')]
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Cross-sell')]
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@class='approach-head']/div[contains(.,'Volatile account balances')]    40s
    SeleniumLibrary.Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Volatile account balances')]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    SeleniumLibrary.Click Element    xpath=.//input[@name='saveChanges']
    Sleep    15s
    SeleniumLibrary.Click Element    xpath=.//a[@title='Check Count']
    Sleep    10s
    SeleniumLibrary.Wait Until Page Contains Element    xpath=.//div[@ng-show='showRecordCount']    15s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Wait Until Page Contains Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]    30s
    SeleniumLibrary.Click Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]
    Sleep    15s
    SeleniumLibrary.Click Element    xpath=.//a[@title='Save and Proceed']
    Sleep    15s
    SeleniumLibrary.Click Element    xpath=(.//div[@class='btn-group fg col-sm-8']/label)[1]
    Sleep    15s
    SeleniumLibrary.Click Element    xpath=.//table[@class='ds-table']/tbody/tr/td[15]/div
    Sleep    15s
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ds-table']/tbody/tr/td[15]/div/following-sibling::ul/li/label)[1]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ds-table']/tbody/tr/td[15]/div/following-sibling::ul/li/label)[3]
    Sleep    15s
    SeleniumLibrary.Click Button    xpath=.//button[@title='Next']
    Sleep    15s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//input[@title='Save & Proceed']
    Sleep    25s
    SeleniumLibrary.Click Element    xpath=.//p[@class='sdnptop pfontsize ng-binding']
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//div[@class='col-sm-12 sdnmaincontainerforsavedtemplate']/div/div[@class='col-sm-4 ng-scope'][1]
    Sleep    20s
    SeleniumLibrary.Mouse Over    xpath=.//div[@class='templatepopcombo']/div[@class='Emailer']
    Sleep    10s
    SeleniumLibrary.Click Element    xpath=.//div[@class='templatepopcombo']/div[@class='Emailer']
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//button[@ng-click='channelselectfornext()']    50s
    Sleep    10s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    Sleep    15s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//button[@title='Save and Continue']    30s
    SeleniumLibrary.Click Element    xpath=.//button[@title='Save and Continue']
    Sleep    15s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//p[@class='paddingSummary updatedsummary']    40s
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approval()']
    SeleniumLibrary.Close Browser
	
Approve the program in reviewer dashboard
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}    
    Set Window Size    1920    1080
    Go to    ${LOGIN URL} 
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    Sleep    30s
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Savings Accounts Volatile account balances')]/parent::*/parent::*/parent::*//*[@ng-click='conApproveCamp(x)'])[1]
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approveProgram(0)']
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[2]
    Sleep    20s
    SeleniumLibrary.Close Browser

Ensure approved program display in creator dashboard
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go to    ${LOGIN URL} 
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//a[@ng-click='goCampaign()']    60s
    SeleniumLibrary.Click Element    xpath=.//a[@ng-click='goCampaign()']
    SeleniumLibrary.Input Text    id=search    ${Program_title}
    Sleep    5s
    ${status_str}    SeleniumLibrary.Get Text    xpath=.//*[@id='main_container']/div[6]/div[3]/div[1]//table/tbody/tr[1]/td/table/tbody/tr[1]/td[1]/span[1]
    Run Keyword If    '${status_str}'=='${Creator_status_apprv}'    Log To Console    Approve Status are display correctly
    SeleniumLibrary.Close Browser
	
Abort program in reviewer dashboard
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go to    ${LOGIN URL}
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    Sleep    30s
    SeleniumLibrary.Close Browser
	
Ensure abort program display in creator dashboard
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}   
    Set Window Size    1920    1080
    Go to    ${LOGIN URL}
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//a[@ng-click='goCampaign()']    60s
    SeleniumLibrary.Click Element    xpath=.//a[@ng-click='goCampaign()']
    Sleep    5s
    SeleniumLibrary.Input Text    id=search    ${Program_title}
    Sleep    5s
    ${status_str}    SeleniumLibrary.Get Text    xpath=.//*[@id='main_container']/div[6]/div[3]/div[1]//table/tbody/tr[1]/td/table/tbody/tr[1]/td[1]/span[1]
    Run Keyword If    '${status_str}'=='${Creator_status_abrt}'    Log To Console    Aborted Status are display correctly
    SeleniumLibrary.Close Browser

Search and delete program in creator dashboard
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox


    Create WebDriver  Chrome  chrome_options=${chrome_options}    
    Set Window Size    1920    1080
    Go to    ${LOGIN URL} 
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    40s
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//a[@ng-click='goCampaign()']
    Sleep    5s
    SeleniumLibrary.Input Text    id=search    ${Program_title}
    Sleep    5s
    SeleniumLibrary.Click Element    xpath=.//span[@class='sprite-globe icondel']
    Sleep    5s
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='deleteConversation()']
    Sleep    5s
    SeleniumLibrary.Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button
    SeleniumLibrary.Close Browser
   
Create campaign after 30 days

    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    
    Create WebDriver  Chrome  chrome_options=${chrome_options}    
    Set Window Size    1920    1080
    Go to    ${LOGIN URL} 
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    40s
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']    60s
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram()']
    Sleep    20s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@id='productName'][contains(.,'Savings Account')]    40s
    SeleniumLibrary.Click Element    xpath=.//div[@id='productName'][contains(.,'Savings Account')]
    Sleep    20s
    SeleniumLibrary.Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Cross-sell')]
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@class='approach-head']/div[contains(.,'Volatile account balances')]    40s
    SeleniumLibrary.Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Volatile account balances')]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    SeleniumLibrary.Click Element    xpath=.//input[@name='saveChanges']
    Sleep    15s
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//a[@title='Check Count']
    SeleniumLibrary.Close Browser

*** Keywords ***
