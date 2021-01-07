*** Settings ***
Documentation     CaptureFast Demo
Library           RPA.HTTP
Library           CaptureFast
Library           RPA.JSON
Library           OperatingSystem

*** Variables ***
${FILE_PATH} =    #Please write document path
${DOCUMENT_TYPE_ID} =  #Please write CaptureFast document type Id

*** Tasks ***
DocumentGetData
  ${documentid} =  UploadDocument   ${FILE_PATH}  ${DOCUMENT_TYPE_ID} 
    
  ${document_result} =  GetDocumentData   ${documentid}    
  
  ${new_obj}=  Convert JSON To String  ${document_result}

  Create File    ${CURDIR}${/}output${/}result.json    ${new_obj}   UTF-8



