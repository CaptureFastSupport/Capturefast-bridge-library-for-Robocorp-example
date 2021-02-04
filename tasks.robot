*** Settings ***
Documentation   Template robot main suite.
Library         RPA.JSON
Library         RPA.FileSystem
Library         RPA.Tables
Variables       variables.py
Library         CaptureFast     username=${USER_NAME}     password=${PASSWORD}      teamid=${TEAMID} 

*** Variables ***
${FILE_PATH} =   ${CURDIR}${/}input${/}invoice-1.jpg  #Please write document path
${DOCUMENT_TYPE_ID} =   11865  #Please write CaptureFast document type Id

*** Tasks ***
Task 1
    ${documentid} =  UploadDocument   ${FILE_PATH}  ${DOCUMENT_TYPE_ID} 
    
    ${document_result} =  GetDocumentData   ${documentid}
    
    ${all_value}=    Get values from JSON    ${document_result}       $.Pages..Fields..Value
   
    ${filename}=    Get value from JSON    ${document_result}       $..DocumentName
    
    ${values}=    Create table     ${all_value}
    
    Write table to CSV    ${values}    ${CURDIR}${/}output${/}${filename}.csv


