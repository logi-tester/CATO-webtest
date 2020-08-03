*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           DateTime

*** Variables ***
${url}            http://webtest.xerago.com/cvm
${browser}        chrome
${lead_time_days}    5
${below_lead_time}    4
${base_allocation}    4
${base_allocation_above_val}    55
${base_allocation_btw_val}    45
${variances_below_val}    1
${variances_above_val}    2
${choose_date}    16
${user_base_count}    10000
${program_title}    Program for Activation Money Market Accounts Inactive for 180 or more days

*** Test Cases ***
Search and delete program
    Jenkins browser launch
    Login function    testpurpose    testpurpose
    Click Element    xpath=.//a[@ng-click='goCampaign()']
    Input Text    id=search    ${Program_title}
    Click Element    xpath=.//span[@class='sprite-globe icondel']
    Click Element    xpath=.//button[@ng-click='deleteConversation()']
    Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button

Default Lead Time - Verify user can provide lead time below 5 days
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=abtestdays
    Input Text    id=abtestdays    ${below_lead_time}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Please enter above 5 days.
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    
Default Lead Time - Verify user can provide lead time as 5 days or above
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=abtestdays
    Input Text    id=abtestdays    ${lead_time_days}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    Close Browser
    Jenkins browser launch
    Login function    testpurpose    testpurpose
    Campaign creation for a/b testing
    Click Element    xpath=.//table[@class='ds-table']/tbody/tr/td/div/label/span[contains(.,${choose_date})]
    ${output_date}=    Evaluate    ${choose_date}+${lead_time_days}
    ${status}=    Run Keyword And Return Status    Click Element    xpath=.//table[@class='ds-table']/tbody/tr/td/div/label/span[contains(.,${output_date})]
    #Log To Console    Forward date Status is:${status}
    Run Keyword If    'True'=='${status}'    Fail    "Selected date + Lead time days=count date is clickable"
    ${final_date}=    Evaluate    ${output_date}+1
    Element Should Be Enabled    xpath=.//table[@class='ds-table']/tbody/tr/td/div/label/span[contains(.,${final_date})]
    ${previous_date}=    Evaluate    ${choose_date}-1
    ${status}=    Run Keyword And Return Status    Click Element    xpath=.//table[@class='ds-table']/tbody/tr/td/div/label/span[contains(.,${previous_date})]
    #Log To Console    Previous date Status is:${status}
    Run Keyword If    'True'=='${status}'    Fail    "Selected date from previous date is clickable"

User Base Allocation - Verify user can provide base allocation as below 5%
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=abtestconrol
    Input Text    id=abtestconrol    ${base_allocation}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Please enter user base allocation 5% to 50%.
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    
User Base Allocation - Verify user should not provide base allocation as above 50%
    Jenkins browser launch
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=abtestconrol
    Input Text    id=abtestconrol    ${base_allocation_above_val}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Please enter user base allocation 5% to 50%.
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]

User Base Allocation - Verify user can provide base allocation as inbetween 5 to 50%
    Jenkins browser launch
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=abtestconrol
    Input Text    id=abtestconrol    ${base_allocation_btw_val}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    Sleep    20s
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Successfully updated
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    
Number of Variances - Verify user can provide number of variants below 2
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=numberOfVariants
    Input Text    id=numberOfVariants    ${variances_below_val}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Please enter above 2 Variants.
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]



Minimum user base count - Verify user can provide base count as below 10,000
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=user_base_count
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Should Be Equal    ${alert_msg}    Please enter above 10K.
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    
Minimum user base count - Verify user can provide base count as 10,000 or above
    Jenkins browser launch
    #Local Open browser
    Login function    admins    admins@123
    Wait Until Element Is Enabled    id=settingsName    20s
    Click Element    xpath=.//span[@class='prod_icon']
    Scroll Element Into View    xpath=.//div[@id='frequencyVariant']/h3[contains(.,'A/B Testing Settings')]
    Clear Element Text    id=user_base_count
    Input Text    id=user_base_count    ${user_base_count}
    Click Element    xpath=(.//*[@id='frequencyVariant']//button[contains(.,'SAVE')])[2]
    Sleep    20s
    ${alert_msg}=    Get Text    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]//ancestor-or-self::div[@class='modal-content md-bg']/div/div[1]/h4
    Log To Console    Alert msh is 10k above:${alert_msg}
    Should Be Equal    ${alert_msg}    Successfully updated
    Click Element    xpath=(.//div[@class='canrej']//button[contains(.,'Ok')])[2]
    Close Browser
    Jenkins browser launch
    #Local Open browser
    Login function    testpurpose    testpurpose
    Search and delete program
    Ensure Checkcount value more than 10k
    Sleep    10s
    ${check_count_total_val}=    Get Text    xpath=.//span[@ng-show='!isLoadingCount']
    ${replace_str}=    Remove String    ${check_count_total_val}    ,
    ${status_val_}=    Evaluate    ${replace_str}>${user_base_count}
    #Log To Console    Checkcount status is:${status_val_}
    Run Keyword If    'True'=='${status_val}'    Log To Console    Checkcount value is more than 10k
    Run Keyword If    'True'!='${status_val}'    Log To Console    Checkcount value is less than 10k
    Click Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@title='Save and Proceed']
    Sleep    30s
    ${AB_testing_label_status}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='abtestenablebtn']/div/button[1]
    Run Keyword If    '${status_val}'=='${AB_testing_label_status}'    Log To Console    A/B testing is enable in orchestration page
    Run Keyword If    '${status_val}'!='${AB_testing_label_status}'    Fail    A/B testing is not enable in orchestration page

*** Keywords ****** Keywords ***
Local Open browser
    Set Selenium Speed    .5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    60s

Login function
    [Arguments]    ${username}    ${password}
    Clear Element Text    id=form_username
    Input Text    id=form_username    ${username}
    Clear Element Text    id=form_password
    Input Text    id=form_password    ${password}
    Click Button    id=form_login

Search and delete program
    Click Element    xpath=.//a[@ng-click='goCampaign()']
    Input Text    id=search    ${Program_title}
    Click Element    xpath=.//span[@class='sprite-globe icondel']
    Click Element    xpath=.//button[@ng-click='deleteConversation()']
    Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button

Ensure Checkcount value more than 10k
    Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']
    Click Element    xpath=.//li[@ng-click='createNewProgram()']
    Click Element    xpath=.//div[@id='productName'][contains(.,'Money Market Accounts')]
    Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Activation')]
    Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Inactive for 180 or more days')]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    Click Element    xpath=.//input[@name='saveChanges']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    xpath=.//a[@title='Check Count']
    Click Element    xpath=.//a[@title='Check Count']

Campaign creation for a/b testing
    Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']
    Click Element    xpath=.//li[@ng-click='createNewProgram()']
    Click Element    xpath=.//div[@id='productName'][contains(.,'Money Market Accounts')]
    Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Activation')]
    Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Inactive for 180 or more days')]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    Click Element    xpath=.//input[@name='saveChanges']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    xpath=.//a[@title='Check Count']
    Click Element    xpath=.//a[@title='Check Count']
    Wait Until Page Contains Element    xpath=.//div[@ng-show='showRecordCount']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]
    Click Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//a[@title='Save and Proceed']
    Sleep    30s
    Click Element    xpath=.//div[@class='abtestenablebtn']/div/button[1]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Jenkins browser launch
    Set Selenium Speed    .5s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${url}
    Set Browser Implicit Wait    60s

