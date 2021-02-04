# CaptureFast Library

This library has been created for data parse operation over documents via CaptureFast using Robot Framework.

## Installation

CaptureFastLibrary can be found on PyPI: https://pypi.org/project/robotframework-capturefast/

To install, simply use pip:

```dos
pip install robotframework-capturefast
```

Dependencies are automatically installed.


## Importing in Robot Framework
As soon as installation has succeeded, you can import the library in Robot Framework:

```robot
*** Settings ***
Library  CaptureFast	username=${USER_NAME}     password=${PASSWORD}      teamid=${TEAMID}
```

## Vault File Usage

In order to use the Robocorp cloud a json file should be created by using the vault mechanism offered by Robocorp to provide authorization information.To use the vault mechanism in the lab environment, a vault file and a secret file must be created. (https://robocorp.com/docs/development-howtos/variables-and-secrets/vault)
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
  "CaptureFastCredentials": {
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
 ${documentid} =  UploadDocument   ${FILE_PATH}  ${DOCUMENT_TYPE_ID} 
```

To use the Upload Document function, the path of your file should be given as the 1st parameter and the ${document_type_id}  as the 2nd parameter.
By doing this, we ensure to get the results of the document that we defined in CaptureFast.

## Using Get Document Data Function

Results can be retrieved with the help of using ${documentid} (that has been supplied in Upload Document function) as a parameter. 

```upload
${document_result} =  GetDocumentData   ${documentid}   
```

Result

```
	{
	   "DocumentName":string,
	   "DocReferenceKey":string,
	   "DocumentId":int,
	   "TeamId":int,
	   "TemplateId":int,
	   "TemplateName":string,
	   "DocumentTypeId":int,
	   "DocumentTypeName":string,
	   "CapturedUserId":int,
	   "CapturedDate":string,
	   "CapturedUser":string,
	   "VerifiedUserId":int,
	   "VerifiedDate":string,
	   "VerifiedUser":string,
	   "AdditionalData":,
	   "Pages":[
		  {
			 "PageId":int,
			 "PageName":string,
			 "PageOrder":int,
			 "OrginalFileName":string,
			 "Fields":[
				{
				   "FieldName":string,
				   "Value":string,
				   "ConfidenceLevel":int,
				   "Coordinate":string
				}
			 ]
		  }
	   ],
	   "ResultCode":int,
	   "ResultMessage":string
	}
```