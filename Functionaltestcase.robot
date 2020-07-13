*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary


*** Variables ***
${url}            http://webtest.xerago.com/cvm
${browser}        chrome
${control_val}    15
${Program_title}    Program for Cross-sell Money Market Accounts Customers with multiple products
${Creator_status_rej}    Rejected
${Creator_status_apprv}    Approved
${Creator_status_abrt}    Aborted
${alert_txt}      Program already exists for the given period

*** Test Cases ***
Search and delete program
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=.//a[@ng-click='goCampaign()']
    SeleniumLibrary.Input Text    id=search    ${Program_title}
    SeleniumLibrary.Click Element    xpath=.//span[@class='sprite-globe icondel']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='deleteConversation()']
    SeleniumLibrary.Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button
    SeleniumLibrary.Close Browser
    
To create a new campaign by manual flow	    
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']    
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram()']
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@id='productName'][contains(.,'Money Market Accounts')]    
    SeleniumLibrary.Click Element    xpath=.//div[@id='productName'][contains(.,'Money Market Accounts')]
    SeleniumLibrary.Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Cross-sell')]
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@class='approach-head']/div[contains(.,'Customers with multiple products')]    40s
    SeleniumLibrary.Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Customers with multiple products')]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    SeleniumLibrary.Click Element    xpath=.//input[@name='saveChanges']
    SeleniumLibrary.Click Element    xpath=.//a[@title='Check Count']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Wait Until Page Contains Element    xpath=.//div[@ng-show='showRecordCount']    
    SeleniumLibrary.Wait Until Page Contains Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]    
    SeleniumLibrary.Click Element    xpath=.//div[@ng-repeat='collection in productPercentage'][2]
    SeleniumLibrary.Click Element    xpath=.//a[@title='Save and Proceed']
    SeleniumLibrary.Click Element    xpath=(.//div[@class='btn-group fg col-sm-8']/label)[1]
    SeleniumLibrary.Click Element    xpath=.//table[@class='ds-table']/tbody/tr/td[15]/div
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ds-table']/tbody/tr/td[15]/div/following-sibling::ul/li/label)[1]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ds-table']/tbody/tr/td[15]/div/following-sibling::ul/li/label)[3]
    SeleniumLibrary.Click Button    xpath=.//button[@title='Next']
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//input[@title='Save & Proceed']
    SeleniumLibrary.Click Element    xpath=.//p[@class='sdnptop pfontsize ng-binding']
    SeleniumLibrary.Click Element    xpath=.//div[@class='col-sm-12 sdnmaincontainerforsavedtemplate']/div/div[@class='col-sm-4 ng-scope'][1]
    SeleniumLibrary.Mouse Over    xpath=.//div[@class='templatepopcombo']/div[@class='Emailer']
    SeleniumLibrary.Click Element    xpath=.//div[@class='templatepopcombo']/div[@class='Emailer']
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//button[@ng-click='channelselectfornext()']    
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//button[@title='Save and Continue']    
    SeleniumLibrary.Click Element    xpath=.//button[@title='Save and Continue']
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//p[@class='paddingSummary updatedsummary']    
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approval()']
    SeleniumLibrary.Close Browser

Review and Approve a campaign
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Money Market Accounts Customers with multiple products')]/parent::*/parent::*/parent::*//*[@ng-click='conApproveCamp(x)'])[1]
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approveProgram(0)']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=(.//button[@title='Ok'])[2]
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[2]
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Money Market Accounts Customers with multiple products')]/parent::*/parent::*/parent::*//*[@ng-click='comApproveCamp(x)'])[1]
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approveProgramCom(0)']
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[2]
    SeleniumLibrary.Close Browser

Create campaign from marketing module
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    CreatorAdmincreator
    SeleniumLibrary.Input Text    id=form_password    CreatorAdmin123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=(.//span[@class='admin-box'])[1]
    SeleniumLibrary.Click Element    xpath=.//label[@id='dsnException']
    SeleniumLibrary.Click Element    xpath=(.//div[@class='btn-group fg col-sm-8']/label)[1]
    SeleniumLibrary.Click Element    xpath=.//table[@class='ds-table resterorchestration']/tbody/tr/td[17]/div
    SeleniumLibrary.Click Element    xpath=.//table[@class='ds-table resterorchestration']/tbody/tr/td[17]//ul/li[1]
    SeleniumLibrary.Click Element    xpath=.//table[@class='ds-table resterorchestration']/tbody/tr/td[17]//ul/li[3]
    SeleniumLibrary.Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    SeleniumLibrary.Click Element    xpath=.//a[@data-ng-click='validationClick1()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='validationClick()']
    SeleniumLibrary.Click Element    xpath=(.//span[@class='admin-box'])[2]
    SeleniumLibrary.Click Element    xpath=.//*[@id='conv-summary1']/div[3]/div/a
    SeleniumLibrary.Click Element    xpath=(.//*[@id='accordionnew']/div/div/ul/li/span[contains(text(),'Cross-sell')])[3]
    SeleniumLibrary.Wait Until Page Contains Element    xpath=(.//*[@id='accordionnew']/div/div/ul/li/span[contains(text(),'Cross-sell')])[3]/parent::li//div[@class='panel-body']/ul/li[contains(.,'Customers with multiple products')]    
    SeleniumLibrary.Click Element    xpath=(.//*[@id='accordionnew']/div/div/ul/li/span[contains(text(),'Cross-sell')])[6]/parent::li//div[@class='panel-body']/ul/li[contains(.,'Customers with multiple products')]
    SeleniumLibrary.Click Element    xpath=.//ul/li[@class='bxslider2']/div[1]/div/div[1]/div
    SeleniumLibrary.Click Element    xpath=.//input[@title='Save']
    SeleniumLibrary.Click Element    xpath=.//p[@class='sdnptop pfontsize ng-binding']
    SeleniumLibrary.Click Element    xpath=.//div[@class='col-sm-12 sdnmaincontainerforsavedtemplate']/div/div[@class='col-sm-4 ng-scope'][1]
    SeleniumLibrary.Mouse Over    xpath=.//div[@class='Emailer']
    SeleniumLibrary.Click Element    xpath=.//div[@ng-click='previewedited()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='channelselectfornext()']
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='saveData(processSaveData);']
    SeleniumLibrary.Click Element    xpath=.//div[@class='btn-group viewswitch btn-toggle']//button[contains(.,'Yes')]
    SeleniumLibrary.Input Text    xpath=.//textarea[@ng-model='mc_Approve_reject_comments']    testing purpose
    SeleniumLibrary.Click Element    xpath=.//button[@type='button'][contains(.,'Submit')]
    SeleniumLibrary.Close Browser
	
Review and Approve a campaign
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Savings Accounts Volatile account balances')]/parent::*/parent::*/parent::*//*[@ng-click='conApproveCamp(x)'])[1]
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approveProgram(0)']
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[2]
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Savings Accounts Volatile account balances')]/parent::*/parent::*/parent::*//*[@ng-click='comApproveCamp(x)'])[1]
    SeleniumLibrary.Click Element    xpath=.//button[@ng-click='approveProgramCom(0)']
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[2]
    SeleniumLibrary.Close Browser

To create successful campaign in Prospect cloud
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//li[@ng-click='createNewProgram()']    
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram()']
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@id='productName'][contains(.,'Prospects')]    
    SeleniumLibrary.Click Element    xpath=.//div[@id='productName'][contains(.,'Prospects')]
    SeleniumLibrary.Click Element    xpath=.//div[@class='objectivelist']/div[contains(.,'Acquisition')]
    SeleniumLibrary.Wait Until Element Is Enabled    xpath=.//div[@class='approach-head']/div[contains(.,'Prospects Campaign')]    
    SeleniumLibrary.Click Element    xpath=.//div[@class='approach-head']/div[contains(.,'Prospects Campaign')]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=.//div[@id='fromDate']//div/a[2]
    SeleniumLibrary.Click Element    xpath=(.//table[@class='ui-datepicker-calendar']/tbody/tr/td[contains(.,'3')])[1]
    SeleniumLibrary.Click Element    xpath=.//input[@name='saveChanges']
    SeleniumLibrary.Click Element    xpath=.//p[@class='upload_btn']
    SeleniumLibrary.Close Browser
	
Review and Abort a campaign
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Money Market Accounts Customers with multiple products')]/parent::*/parent::*/parent::*//*[@class='sprite-globe iconabort'])[1]
    SleniumLibrary.Input Text    xpath=.//*[@id='rejectReasonCamp']    test
    SeleniumLibrary.Click Element    xpath=.//*[@ng-click='abortProgram(abortValue,rejectReasonCamp)']
    SeleniumLibrary.Click Element    xpath=.//*[@title='Abort']
    SeleniumLibrary.Click Element    xpath=(.//*[@title='Ok'])[3]
    SeleniumLibrary.Close Browser

Review and Reject a Campaign
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=(.//*[contains(@class,'cname') and contains(text(),'Program for Cross-sell Savings Accounts Volatile account balances')]/parent::*/parent::*/parent::*//*[@ng-click='conOpenRejectModal(x)'])[1]
    SeleniumLibrary.Input Text    xpath=.//*[@placeholder='Reason']    test reject
    SeleniumLibrary.Click Element    xpath=.//*[@ng-click='rejectConversation()']
    SeleniumLibrary.Click Element    xpath=.//*[@id='commonAlert']/div/div/div/div[2]/div/div/div/div/button
    SeleniumLibrary.Close Browser
   
Review and approve campaign by compliance head   
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    creatorhead
    SeleniumLibrary.Input Text    id=form_password    creatorhead
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=.//*[@ng-click='rejectConversation()']
   
Review and approve campaign by design head    
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    compliancehead
    SeleniumLibrary.Input Text    id=form_password    compliancehead
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=.//*[@ng-click='rejectConversation()']
    
Control group feature
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    admins
    SeleniumLibrary.Input Text    id=form_password    admins@123
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Mouse Over    id=settingsName
    SeleniumLibrary.Wait Until Page Contains Element    xpath=.//*[@title='Application Configuration']    
    SeleniumLibrary.Click Element    xpath=.//*[@title='Application Configuration']
    SeleniumLibrary.Input Text    id=txt_controlGroup    ${control_val}
    SeleniumLibrary.Click Element    id=proCatUpdateBtn_save
    SeleniumLibrary.Click Element    xpath=(.//button[@title='Ok'])[1]
    SeleniumLibrary.Mouse Over    id=loginuser
    SeleniumLibrary.Click Element    xpath=.//li[@class='marginacccanel']/span[@title='Logout']
    SeleniumLibrary.Close Browser
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    SeleniumLibrary.Create WebDriver  Chrome  chrome_options=${chrome_options}
    SeleniumLibrary.Set Window Size    1920    1080
    SeleniumLibrary.Go to    ${url} 
    SeleniumLibrary.Set Selenium Implicit Wait    60s
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram()']
    ${control_value}    SeleniumLibrary.Get Text    id=cgroup
    SeleniumLibrary.Close Browser
    
One click campaign in wheel
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p    
    SeleniumLibrary.Input Text    id=form_username    testpurpose
    SeleniumLibrary.Input Text    id=form_password    testpurpose
    SeleniumLibrary.Click Button    id=form_login
    SeleniumLibrary.Click Element    xpath=.//li[@ng-click='createNewProgram1()']
    
Valid credential
    #Creator Login
	Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Element Text Should Be    //label[@class='loginLabel']    Username
    SeleniumLibrary.Element Text Should Be    //label[@for='form_password']    Password
   
    SeleniumLibrary.Input Text    id=form_username    cvmcreator
    SeleniumLibrary.Input Text    id=form_password    cvmcreator@123
    SeleniumLibrary.Click Button    form_login
    
    #To ensure succesfull login or not for below code
    SeleniumLibrary.Element Should Be Visible    xpath=.//span[@class='logo replacea']/img
    SeleniumLibrary.Close Browser
    
    #Admin Login
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    admins
    SeleniumLibrary.Input Text    id=form_password    admins@123
    SeleniumLibrary.Click Button    form_login
    
    #To ensure succesfull login or not for below code
    SeleniumLibrary.Element Should Be Visible    xpath=.//span[@class='logo replacea']/img
    SeleniumLibrary.Close Browser


    #Rester Login
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    CreatorAdmincreator
    SeleniumLibrary.Input Text    id=form_password    CreatorAdmin123
    SeleniumLibrary.Click Button    form_login
    
    #To ensure succesfull login or not for below code
    SeleniumLibrary.Element Should Be Visible    xpath=.//span[@class='logo replacea']/img
    SeleniumLibrary.Close Browser
    
    #Reviewer Login
    Jenkins browser launch
    SeleniumLibrary.Wait Until Element Is Enabled    //div[@class='login-footertxt']/p
    SeleniumLibrary.Input Text    id=form_username    reviewers
    SeleniumLibrary.Input Text    id=form_password    reviewers@123
    SeleniumLibrary.Click Button    form_login
    
    #To ensure succesfull login or not for below code
    SeleniumLibrary.Element Should Be Visible    xpath=.//span[@class='logo replacea']/img
    SeleniumLibrary.Close Browser

*** Keywords ***
Jenkins browser launch
    Set Selenium Speed    1s
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    SeleniumLibrary.Create WebDriver  Chrome  chrome_options=${chrome_options}
    SeleniumLibrary.Set Window Size    1920    1080
    SeleniumLibrary.Go to    ${url} 
    SeleniumLibrary.Set Selenium Implicit Wait    40s
