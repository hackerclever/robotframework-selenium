*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SELENIUM}          http://localhost:4444/wd/hub
${APPLICATION}       http://demoapp:7272
${BROWSER}           %{BROWSER}
${BCH}               Chrome
${DELAY}             0
${VALID USER}        demo
${VALID PASSWORD}    mode
${LOGIN URL}         ${APPLICATION}/
${WELCOME URL}       ${APPLICATION}/welcome.html
${ERROR URL}         ${APPLICATION}/error.html
@{chrome_arguments_full}    --disable-infobars    --headless    --disable-gpu    --no-sandbox
@{chrome_arguments}    --disable-gpu    --no-sandbox


*** Keywords ***
# Teardown Selenium
# Run Keyword If Test Failed Log Screenshot

Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}

Open Browser To Login Page
    # Open Browser    ${LOGIN URL}    browser=${BROWSER}
    # Maximize Browser Window

    # ${chrome_options}=    Set Chrome Options
    # Create Webdriver    Chrome    chrome_options=${chrome_options}
    # Go To    ${LOGIN URL}
    Open Browser    ${LOGIN URL}    browser=${BCH}
    
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
    # Capture Page Screenshot

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page