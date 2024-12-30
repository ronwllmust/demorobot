*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}               chrome
${GSMARENA_URL}         https://www.gsmarena.com
${SAMSUNG_BRAND_LINK}    css=a[href*='samsung-phones-9.php']
${POPULARITY_BUTTON}     xpath=/html/body/div[2]/div[1]/div[3]/div/div[1]/div/div/div[3]/ul/li[1]/a
${DISPLAY_SECTION}       xpath=/html/body/div[2]/div[1]/div[3]/div/div[1]/div/div[2]/ul/li[4]/strong/span

*** Keywords ***
Open Browser To GSMArena
    Open Browser    ${GSMARENA_URL}    ${BROWSER}
    Maximize Browser Window

Navigate To Samsung Page
    Wait Until Element Is Visible    ${SAMSUNG_BRAND_LINK}
    Click Element    ${SAMSUNG_BRAND_LINK}

Sort By Popularity
    Wait Until Element Is Visible    ${POPULARITY_BUTTON}
    Click Element    ${POPULARITY_BUTTON}

Find And Click Phone
    [Arguments]    ${phone_name}
    ${phone_link}=    Set Variable    xpath=//div[contains(@class, 'makers')]//span[contains(text(), '${phone_name}') or contains(text(), '${phone_name} 5G')]//ancestor::a
    Wait Until Element Is Visible    ${phone_link}
    Click Element    ${phone_link}

Get Display Information
    Wait Until Element Is Visible    ${DISPLAY_SECTION}
    ${display_info}=    Get Text    ${DISPLAY_SECTION}
    [RETURN]    ${display_info}

Extract Display Size
    [Arguments]    ${display_info}
    ${size}=    Get Regexp Matches    ${display_info}    (\\d+\\.\\d+)"    1
    [RETURN]    ${size}[0]

Compare Display Sizes
    [Arguments]    ${size1}    ${phone1}    ${size2}    ${phone2}
    ${size1_float}=    Convert To Number    ${size1}
    ${size2_float}=    Convert To Number    ${size2}
    
    IF    ${size1_float} > ${size2_float}
        ${result}=    Set Variable    ${phone1} has a larger display (${size1}" vs ${size2}")
    ELSE IF    ${size1_float} < ${size2_float}
        ${result}=    Set Variable    ${phone2} has a larger display (${size2}" vs ${size1}")
    ELSE
        ${result}=    Set Variable    Both phones have the same display size (${size1}")
    END
    
    [RETURN]    ${result}

Go To Main Page
    Go To    ${GSMARENA_URL}
