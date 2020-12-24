*** Settings ***
Documentation     CaptureFast Demo
Library           RPA.HTTP
Library           CaptureFast
Library           RPA.JSON
Library           OperatingSystem

*** Variables ***
${FILE_PATH} =    ${CURDIR}${/}NOTICE_OF_HEARING_001.pdf
${DOCUMENT_TYPE_ID} =    11790

*** Keywords ***
Document Upload
    [Arguments]    ${filepath}  ${document_type_id}
    
    ${docid}=  Upload Document  ${filepath}   ${document_type_id}
    [Return]  ${docid}

*** Keywords ***
Document Get Data
    [Arguments]    ${documentid}
    
    ${response}=  GetDocumentData  ${documentid}
    
    [Return]  ${response}

*** Tasks ***
DocumentGetData
  ${documentid} =  Document Upload   ${FILE_PATH}  ${DOCUMENT_TYPE_ID} 
    
  ${document_result} =  Document Get Data   ${documentid}    
  
  ${new_obj}=  Convert JSON To String  ${document_result}

  Create File    ${CURDIR}${/}output${/}result.json    ${new_obj}   UTF-8



