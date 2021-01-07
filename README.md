# CaptureFast Library

This library has been created for data parse operation over documents via CaptureFast using Robot Framework.

## Installation

CaptureFastLibrary can be found on PyPI: https://pypi.org/project/robotframework-capturefast/

Please create a new terminal in Robocorp Lab.

To install, simply use pip:

```dos
pip install robotframework-capturefast
```

Dependencies are automatically installed.


## Importing in Robot Framework
As soon as installation has succeeded, you can import the library in Robot Framework:

```robot
*** Settings ***
Library  CaptureFast
```

## Vault File Usage

In order to use the Robocorp cloud a json file should be created by using the vault mechanism offered by Robocorp to provide authorization information. (https://robocorp.com/docs/development-howtos/variables-and-secrets/vault)
In project, you need to create a folder named “devdata” and create a “env.json”. You should write the comment below into this json file.

```vault
{
  "RPA_SECRET_MANAGER": "RPA.Robocloud.Secrets.FileSecrets",
  "RPA_SECRET_FILE": "/Users/CurrentUser/vault.json"
}
```

## Create Secret File

Go to the "RPA_SECRET_FILE" file, Its content should be as follows:

```secret
{
  "credentials": {
    "username": "Please enter your CaptureFast user mail",
    "password": "Please enter your CaptureFast password",
    "teamid": "Please write CaptureFast Team ID"
  }
}
```

## Using Upload Document Function

The next process continues by using the "Upload Document" and "Get Document Data" functions in the library.
"Upload Document" returns a "Document ID" to send your document to CaptureFast and to track the status of your document.

```upload
*** Keywords ***
Document Upload
    [Arguments]    ${filepath}  ${document_type_id}
    
    ${docid}=  Upload Document  ${filepath}   ${document_type_id}
    [Return]  ${docid}
```

To use the Upload Document function, the path of your file should be given as the 1st parameter and the ${document_type_id}  as the 2nd parameter.
By doing this, we ensure to get the results of the document that we defined in CaptureFast.

## Using Get Document Data Function

Results can be retrieved with the help of using ${documentid} (that has been supplied in Upload Document function) as a parameter. 

```upload
*** Keywords ***
Document Get Data
    [Arguments]    ${documentid}
    
    ${response}=  GetDocumentData  ${documentid}
    
    [Return]  ${response}
```

