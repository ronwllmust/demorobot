*** Settings ***
Resource    ../resources/common.resource
Test Setup        Open Browser To GSMArena
Test Teardown     Close All Browsers

*** Variables ***
${PHONE1_NAME}    A55
${PHONE2_NAME}    S24

*** Test Cases ***
Compare Phone Displays
    # Get first phone's display information
    Navigate To Samsung Page
    Sort By Popularity
    Find And Click Phone    ${PHONE1_NAME}
    ${display_info1}=    Get Display Information
    ${size1}=    Extract Display Size    ${display_info1}
    
    # Get second phone's display information
    Go To Main Page
    Navigate To Samsung Page
    Sort By Popularity
    Find And Click Phone    ${PHONE2_NAME}
    ${display_info2}=    Get Display Information
    ${size2}=    Extract Display Size    ${display_info2}
    
    # Compare and report results
    ${comparison_result}=    Compare Display Sizes    
    ...    ${size1}    ${PHONE1_NAME}    ${size2}    ${PHONE2_NAME}
    Log    ${comparison_result}
    Log To Console    \n${comparison_result}
