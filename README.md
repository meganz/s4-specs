# S4 APIs
This document describes S4 coverage of IAM and S3 APIs.

-   [1. Common Details](#1-common-details)
    -   [1.1. Account Identification](#11-account-identification)
    -   [1.2. Endpoints](#12-endpoints)
    -   [1.3. Errors](#13-errors)
        -   [1.3.1. S3 Error Format](#131-s3-error-format)
        -   [1.3.2. Common Errors](#132-common-errors)
            -   [Service preamble](#service-preamble)
            -   [During whole service lifetime](#during-whole-service-lifetime)
-   [2. S3 API](#2-s3-api)
    -   [2.1. Conventions](#21-conventions)
        -   [2.1.1. Bucket Identification](#211-bucket-identification)
            -   [Path Style](#path-style)
            -   [Virtual-Hosted Style](#virtual-hosted-style)
        -   [2.1.2. Bucket Name Validation](#212-bucket-name-validation)
        -   [2.1.3. Object Identification: key](#213-object-identification-key)
            -   [Path Style](#path-style-1)
            -   [Virtual-Hosted Style](#virtual-hosted-style-1)
        -   [2.1.4. Object Key Validation](#214-object-key-validation)
        -   [2.1.5. Bucket and Object Ownership](#215-bucket-and-object-ownership)
    -   [2.2. Services](#22-services)
        -   [2.2.1. Buckets](#221-buckets)
            -   [ListBuckets](#listbuckets)
                -   [Request](#request)
                -   [Success Response](#success-response)
                -   [Errors](#errors)
            -   [CreateBucket](#createbucket)
                -   [Request](#request-1)
                -   [Success Response](#success-response-1)
                -   [Errors](#errors-1)
                    -   [BucketAlreadyExists and S3 Discrepancies](#bucketalreadyexists-and-s3-discrepancies)
            -   [DeleteBucket](#deletebucket)
                -   [Request](#request-2)
                -   [Success Response](#success-response-2)
                -   [Errors](#errors-2)
            -   [HeadBucket](#headbucket)
                -   [Request](#request-3)
                -   [Success Response](#success-response-3)
                -   [Errors](#errors-3)
            -   [GetBucketLocation](#getbucketlocation)
                -   [Request](#request-4)
                -   [Success Response](#success-response-4)
                -   [Errors](#errors-4)
            -   [PutBucketAcl](#putbucketacl)
            -   [GetBucketAcl](#getbucketacl)
                -   [Request](#request-5)
                -   [Success Response](#success-response-5)
                -   [Errors](#errors-5)
        -   [2.2.2. Objects](#222-objects)
            -   [ListObjects](#listobjects)
                -   [Request](#request-6)
                -   [Success Response](#success-response-6)
                -   [Errors](#errors-6)
            -   [ListObjectsV2](#listobjectsv2)
                -   [Request](#request-7)
                -   [Success Response](#success-response-7)
                -   [Errors](#errors-7)
            -   [PutObject](#putobject)
                -   [Request](#request-8)
                -   [Success Response](#success-response-8)
                -   [Errors](#errors-8)
            -   [CopyObject](#copyobject)
                -   [Request](#request-9)
                -   [Success Response](#success-response-9)
                -   [Errors](#errors-9)
            -   [GetObject](#getobject)
                -   [Request](#request-10)
                -   [Success Response](#success-response-10)
                -   [Errors](#errors-10)
            -   [HeadObject](#headobject)
                -   [Request](#request-11)
                -   [Success Response](#success-response-11)
                -   [Errors](#errors-11)
            -   [DeleteObject](#deleteobject)
                -   [Request](#request-12)
                -   [Success Response](#success-response-12)
                -   [Errors](#errors-12)
            -   [DeleteObjects](#deleteobjects)
                -   [Request](#request-13)
                -   [Success Response](#success-response-13)
                -   [Errors](#errors-13)
            -   [CreateMultipartUpload](#createmultipartupload)
                -   [Request](#request-14)
                -   [Success Response](#success-response-14)
                -   [Errors](#errors-14)
            -   [UploadPart](#uploadpart)
                -   [Request](#request-15)
                -   [Success Response](#success-response-15)
                -   [Errors](#errors-15)
            -   [UploadPartCopy](#uploadpartcopy)
                -   [Request](#request-16)
                -   [Success Response](#success-response-16)
                -   [Errors](#errors-16)
            -   [ListParts](#listparts)
                -   [Request](#request-17)
                -   [Success Response](#success-response-17)
                -   [Errors](#errors-17)
            -   [CompleteMultipartUpload](#completemultipartupload)
                -   [Request](#request-18)
                -   [Success Response](#success-response-18)
                -   [Errors](#errors-18)
            -   [ListMultipartUploads](#listmultipartuploads)
                -   [Request](#request-19)
                -   [Success Response](#success-response-19)
                -   [Errors](#errors-19)
            -   [AbortMultipartUpload](#abortmultipartupload)
                -   [Request](#request-20)
                -   [Success Response](#success-response-20)
                -   [Errors](#errors-20)
            -   [PutObjectAcl](#putobjectacl)
            -   [GetObjectAcl](#getobjectacl)
                -   [Request](#request-21)
                -   [Success Response](#success-response-21)
                -   [Errors](#errors-21)
        -   [2.2.3. Policies (on Buckets)](#223-policies-on-buckets)
            -   [PutBucketPolicy](#putbucketpolicy)
                -   [Request](#request-22)
                -   [Success Response](#success-response-22)
                -   [Errors](#errors-22)
            -   [GetBucketPolicy](#getbucketpolicy)
                -   [Request](#request-23)
                -   [Success Response](#success-response-23)
                -   [Errors](#errors-23)
            -   [DeleteBucketPolicy](#deletebucketpolicy)
                -   [Request](#request-24)
                -   [Success Response](#success-response-24)
                -   [Errors](#errors-24)
    -   [2.3. Presigned URL](#23-presigned-url)
        -   [Authentication](#authentication)
        -   [Signature Version](#signature-version)
        -   [Specific Errors](#specific-errors)
    -   [2.4. Presigned Post](#24-presigned-post)
-   [3. IAM API](#3-iam-api)
    -   [3.1. Conventions](#31-conventions)
        -   [Parameters in Query String](#parameters-in-query-string)
        -   [Parameters in Body](#parameters-in-body)
    -   [3.2 S4 Managed Policies](#32-s4-managed-policies)
    -   [3.3. Services](#33-services)
        -   [3.3.1. Policies](#331-policies)
            -   [GetPolicy](#getpolicy)
                -   [Request](#request-25)
                -   [Success Response](#success-response-25)
                -   [Errors](#errors-25)
            -   [GetPolicyVersion](#getpolicyversion)
                -   [Request](#request-26)
                -   [Success Response](#success-response-26)
                -   [Errors](#errors-26)
            -   [ListPolicies](#listpolicies)
                -   [Request](#request-27)
                -   [Success Response](#success-response-27)
                -   [Errors](#errors-27)
            -   [ListAttachedUserPolicies \| ListAttachedGroupPolicies](#listattacheduserpolicies--listattachedgrouppolicies)
                -   [Request](#request-28)
                -   [Success Response](#success-response-28)
                -   [Errors](#errors-28)
            -   [AttachUserPolicy \| AttachGroupPolicy](#attachuserpolicy--attachgrouppolicy)
                -   [Request](#request-29)
                -   [Success Response](#success-response-29)
                -   [Errors](#errors-29)
            -   [DetachUserPolicy \| DetachGroupPolicy](#detachuserpolicy--detachgrouppolicy)
                -   [Request](#request-30)
                -   [Success Response](#success-response-30)
                -   [Errors](#errors-30)

# **1. Common Details**

This section addresses common details shared among S4 offered APIs: S3 and IAM.

# **1.1. Account Identification**

The account ID is 15 base10 (i.e. 0-9) digit string. It is padded with leading zeros if necessary.

# **1.2. Endpoints**

For object storage (**S3**) requests:

| Endpoint | Location |
| --- | --- |
| **s3.eu-central-1.s4.mega.io** | Amsterdam |
| **s3.eu-central-2.s4.mega.io** | Luxembourg |
| **s3.ca-central-1.s4.mega.io** | Montreal |
| **s3.ca-west-1.s4.mega.io** | Vancouver |

For **IAM** requests:

| Endpoint | Location |
| --- | --- |
| **iam.eu-central-1.s4.mega.io** | Amsterdam |
| **iam.eu-central-2.s4.mega.io** | Luxembourg |
| **iam.ca-central-1.s4.mega.io** | Montreal |
| **iam.ca-west-1.s4.mega.io** | Vancouver |

Unlike S3, S4 allows to retrieve objects in any bucket through any available region.

# **1.3. Errors**
# **1.3.1. S3 Error Format**
S4 meets S3 [error formatting](https://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html). e.g.:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Error>
  <Code>NoSuchKey</Code>
  <Message>The specified key does not exist.</Message>
  <Resource>/myobj</Resource>
  <RequestId>HC0000000000000001</RequestId>
</Error>
```

The value of Code is one of the standard IAM or S3 error codes. The value of Message is a human-readable indication of what the origin of the problem is.

# **1.3.2. Common Errors**

### Service preamble

Errors that may occur in any S4 service during common service initialization (parsing, authorization and policy validation). Note that these errors can also occur due to additional causes specific to the distinct services. Those are listed at each service specs.

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">InvalidURI</td>
<td align="left">It happens due to a wrong domain (i.e. wrong Host header) format.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">NoSuchAccessPoint</td>
<td align="left">The Account Id specified in host header has a correct format but it doesn't match any existing account. There might be additional reasons such as blocked account, etc.</td>
<td align="left">400 Not Found</td>
</tr>
<tr>
<td align="left">InvalidAction</td>
<td align="left">Returned in case URL fails to be parsed.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">InternalError</td>
<td align="left">The Account Id specified in host header has a correct format but due to technical reasons the server was not able to handle the request.</td>
<td align="left">500 Internal Server Error</td>
</tr>
<tr>
<td align="left">AccountProblem</td>
<td align="left">A logical problem in the internal representation of the account is preventing the service to be executed. Technical support is required.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">IncompleteSignature</td>
<td align="left">Missing or unexpected data while (1) building canonical request or (2) parsing credentials.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">InternalFailure</td>
<td align="left">Internal S4 failure</td>
<td align="left">500 Internal Server Error</td>
</tr>
<tr>
<td align="left">InvalidAccessKeyId</td>
<td align="left">The request cannot complete because the supplied Access Key is not valid.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">InvalidRequest</td>
<td align="left">The request cannot be completed because of an error in the expected request format. Possible causes:<br><br>
(1) Authorization header does not start with AWS4-HMAC-SHA256<br>
(2) Unexpected service in authorization header data or authentication string<br>
(3) Issue with chunked header or payload<br>
(4) Invalid format for certain x-amz- headers<br>
(5) Expired URL</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">MissingParameter</td>
<td align="left">Missing parameter expected in (1) request URI or (2) headers.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">MissingSecurityHeader</td>
<td align="left">Missing or wrong header involved in authorization.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">SignatureDoesNotMatch</td>
<td align="left">Declared request signature does not match the computed one.<br><br>
(1) Early detection of signature mismatch (accounting for headers only)<br>
(2) Signature mismatch in presigned URL<br>
(3) Body is signed and some chunk signature mismatches the computed one.<br>
(4) Body is signed and at the end of stream, an error on signature calculation was detected.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">AccessDenied</td>
<td align="left">The request cannot proceed due to an authorization or policy validation problems (i.e. access not allowed by policies).</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">RequestTimeTooSkewed</td>
<td align="left">The difference between the request time and the server's time is too large.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">ValidationError</td>
<td align="left">Input validation failure when processing request such as header parsing for request signature.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">AuthorizationQueryParametersError</td>
<td align="left">Error authentication data when using auth query parameters instead of auth headers, (e.g. the presigned urls).</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">NoSuchBucket</td>
<td align="left">Returned if the specified bucket does not exist.</td>
<td align="left">404 Not Found</td>
</tr>
<tr>
<td align="left">NoSuchKey</td>
<td align="left">Returned if the specified key does not exist.</td>
<td align="left">404 Not Found</td>
</tr>
</table>

### During whole service lifetime

Errors that may occur at any moment in any service.

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">RequestTimeout</td>
<td align="left">The client has been unresponsive for too long.</td>
<td align="left">400 Bad Request</td>
</tr>
</table>

# **2. S3 API**

# **2.1. Conventions**

# **2.1.1. Bucket identification**

Most of S3 services receive a  `<bucket_name>`  argument identifying the bucket that will be target of the operation. The bucket argument can be received in two different ways:

### Path Style

The argument \<bucket_name\> is specified as part of the URL in the HTTP request, e.g.:

`GET /<bucket_name>/ HTTP/1.1.`
`Host: s3.eu-central-1.s4.mega.io`

### Virtual-Hosted Style

The argument \<bucket_name\> is specified as part of the Host in the HTTP request (i.e. as part of the sub-domain), e.g.:

`GET / HTTP/1.1.`
`Host: <bucket_name>.s3.eu-central-1.s4.mega.io`

# **2.1.2. Bucket Name Validation**

* Bucket name must not be  `.`

* Bucket name must not be  `..`

* Bucket names must not contain `/`

* Bucket names must be between  `3`  (min) and  `63`  (max) characters long

* Bucket names can consist only of lowercase letters, numbers, dots  `.`, and hyphens  `-`

* Bucket names must begin and end with a letter or number

* Bucket names must not contain two adjacent periods

* Bucket names must not be formatted as an IP address (for example,  `192.168.5.4`)

* Bucket names must not start with the prefix `xn--`

* Bucket names must not end with the suffix `-s3alias`

If validation fails the above restrictions, an **AccessDenied** or **InvalidBucketName** error is returned (depending on the service being accessed).

# **2.1.3. Object identification: key**

S3 services involving object manipulation or retrieval requires the object to be identified by mean of a string known as  `<key>`. It is specified as part of the URL:

### Path Style

`GET /<bucket_name>/<key> HTTP/1.1.`
`Host: s3.eu-central-1.s4.mega.io`

### Virtual-Hosted Style

`GET /<key> HTTP/1.1.`
`Host: <bucket_name>.s3.eu-central-1.s4.mega.io`

# **2.1.4. Object Key Validation**

* Object keys may contain any UTF-8 characters except the forbidden combinations mentioned below

* Object key must not be  `..`

* Object keys must not begin with  `../`  or end with  `/..`

* Object keys must not contain  `/./`  nor  `/../`

* Object keys must not contain consecutive forward slashes  `//`

* Object keys must be between  `1`  (min) and  `1024`  (max) characters long


If validation fails the above restrictions, the **AccessDenied** or **MethodNotAllowed** error is returned (depending on the service being accessed).

# **2.1.5. Bucket and Object Ownership**

Every bucket and every object, despite who created them, is owned by the canonical user (root account).

# **2.2. Services**

S3 endpoint is s3._\<region\>_.s4.mega.io.

# **2.2.1. Buckets**

## ListBuckets

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left" colspan="2">URL</th>
</tr>
<tr>
<td align="left" colspan="2">/</td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left">Status Code</th>
</tr>
<tr>
<td align="left">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListAllMyBucketsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
  <Buckets>
    <Bucket>
      <CreationDate>2022-01-28T11:44:13Z</CreationDate>
      <Name>bucket1</Name>
    </Bucket>
    <Bucket>
      <CreationDate>2022-02-15T18:22:37Z</CreationDate>
      <Name>bucket2</Name>
    </Bucket>
  </Buckets>
  <Owner>
    <ID>57A54E56B89C54B767F01987C0BC77929B5212C0BF165E3CF2B8DF818C46B66C</ID>
    <DisplayName>158563168473704</DisplayName>
  </Owner>
</ListAllMyBucketsResult>
```

</td>
</tr>
</table>

### Errors

_\<No specific error expected\>_

## CreateBucket

Creates the bucket  `<bucket_name>`  if it is a valid bucket name and it does not exist yet.

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-acl: `ACL`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-full-control: `GrantFullControl`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read: `GrantRead`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read-acp: `GrantReadACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write: `GrantWrite`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write-acp: `GrantWriteACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-bucket-object-lock-enabled: `ObjectLockEnabledForBucket`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-ownership: `ObjectOwnership`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<CreateBucketConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">       🔴 - NOT supported
    <LocationConstraint>string</LocationConstraint>
</CreateBucketConfiguration>
```

</td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Location: Location

</td>
<td>

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

BucketAlreadyOwnedByYou

</td>
<td align="left">

Returned in case there is a bucket with `<bucket_name>` found in place when trying to create a new folder or new folder creation succeeds but the node is then replaced by a different one.

</td>
<td align="left">

409 Conflict

</td>
</tr>
<tr>
<td align="left">

InvalidBucketName

</td>
<td align="left">

Returned in case `<bucket_name>` does not satisfy restrictions.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">InternalError</td>
<td align="left">Returned due to internal technical reasons.</td>
<td align="left">500 Internal Server Error</td>
</tr>
</table>

#### BucketAlreadyExists and S3 Discrepancies

The S3 standard behavior is to only return AlreadyOwnedByYou if the bucket exists but had already been created in a region different from the requested one with the request succeeding otherwise. S4 does not support this behavior as it is considered to be confusing. Moreover, S4 does not have globally shared bucket namespaces like S3 does. In S4, the owner of a bucket corresponds to the owner of an account. Thus, an error indicating a duplicate bucket is _always_ a BucketAlreadyOwnedByYou error. S4 never returns BucketAlreadyExists.

## DeleteBucket

Deletes the bucket  `<bucket_name>`  if it is a valid bucket name and it is not empty.

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">DELETE</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner:  `BucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left">Status Code</th>
</tr>
<tr>
<td align="left">204 No Content</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidBucketName

</td>
<td align="left">

Returned in case `<bucket_name>` does not satisfy restrictions.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">InternalError</td>
<td align="left">

Returned due to internal technical reason.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
<tr>
<td align="left">

BucketNotEmpty

</td>
<td align="left">

Returned if called on a non-empty bucket.

</td>
<td align="left">

409 Conflict

</td>
</tr>
</table>

## HeadBucket

Determines if the bucket  `<bucket_name>`  exists and you have access to it.

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">HEAD</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner:  `BucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left">Status Code</th>
</tr>
<tr>
<td align="left">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidBucketName

</td>
<td align="left">

Returned in case `<bucket_name>` does not satisfy restrictions.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
</table>

## GetBucketLocation

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?location

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?location

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">&emsp;x-amz-expected-bucket-owner</td>
<td align="left">&emsp;&#128308; NO</td>
</tr>
<tr>
<th align="left" colspan=2>Body</th>
</tr>
<tr>
<td align="left" colspan=2><i>&lt;empty&gt;</i></td>
</tr>
</table>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<LocationConstraint xmlns="http://s3.amazonaws.com/doc/2006-03-01/">string</LocationConstraint>   🟠 – Always an empty string
```

</td>
</tr>
</table>

### Errors
None

## PutBucketAcl

This service is currently not supported and will always return `AccessControlListNotSupported` error (400 Bad Request).

## GetBucketAcl

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?acl

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?acl

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/"> 🟠 – Always returns canned response
  <Owner>
    <ID>string</ID>
    <DisplayName>string</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser">
        <ID>string</ID>
        <DisplayName>string</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>   🟠 – Always returns FULL_CONTROL
    </Grant>
  </AccessControlList>
</AccessControlPolicy>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

NoSuchBucket

</td>
<td align="left">

Returned in case  `<bucket_name>`  does not exist.

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

# **2.2.2. Objects**

## ListObjects

List objects in  `<bucket_name>`  .

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">delimiter</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">encoding-type</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">marker</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">max-keys</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">prefix</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left"  colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Location: Location

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <IsTruncated>boolean</IsTruncated>
   <Marker>string</Marker>
   <NextMarker>string</NextMarker>
   <Contents>
      <ChecksumAlgorithm>string</ChecksumAlgorithm>     🔴 - NOT supported
      ...
      <ETag>string</ETag>
      <Key>string</Key>
      <LastModified>timestamp</LastModified>
      <Owner>
         <DisplayName>string</DisplayName>
         <ID>string</ID>
      </Owner>
      <Size>integer</Size>
      <StorageClass>string</StorageClass>   🟠 – Always set to "STANDARD"
   </Contents>
   ...
   <Name>string</Name>
   <Prefix>string</Prefix>
   <Delimiter>string</Delimiter>
   <MaxKeys>integer</MaxKeys>
   <CommonPrefixes>
      <Prefix>string</Prefix>
   </CommonPrefixes>
   ...
   <EncodingType>string</EncodingType>      🔴 - NOT supported
</ListBucketResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in case \<max-keys\> argument has a wrong format.

</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## ListObjectsV2

List objects in  `<bucket_name>` .

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?list-type=2

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?list-type=2

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">continuation-token</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">delimiter</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">encoding-type</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">fetch-owner</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">max-keys</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">prefix</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<td align="left">start-after</td>
<td align="left">&#128994; YES</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left">Status Code</th>
</tr>
<tr>
<td align="left">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <IsTruncated>boolean</IsTruncated>
   <ContinuationToken>string</ContinuationToken>
   <NextContinuationToken>string</NextContinuationToken>
   <Contents>
      <ChecksumAlgorithm>string</ChecksumAlgorithm>     🔴 - NOT supported
      ...
      <ETag>string</ETag>
      <Key>string</Key>
      <LastModified>timestamp</LastModified>
      <Owner>           🟠 – Returned only if fetch-owner=true in URL
         <DisplayName>string</DisplayName>
         <ID>string</ID>
      </Owner>
      <Size>integer</Size>
      <StorageClass>string</StorageClass>       🟠 – Always set to "STANDARD"
   </Contents>
   ...
   <Name>string</Name>
   <Prefix>string</Prefix>
   <Delimiter>string</Delimiter>
   <MaxKeys>integer</MaxKeys>
   <CommonPrefixes>
      <Prefix>string</Prefix>
   </CommonPrefixes>
   ...
   <EncodingType>string</EncodingType>      🔴 - NOT supported

   <KeyCount>integer</KeyCount>
</ListBucketResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in case:

1. \<max-keys\> argument has a wrong format.
1. \<continuation-token\> cannot be decoded or points out of bounds

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## PutObject

Creates a new object with the provided contents

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Cache-Control

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Disposition

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-MD5

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Expires

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-Match

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-None-Match

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-acl:  `ACL`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-full-control: `GrantFullControl`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read: `GrantRead`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read-acp: `GrantReadACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write: `GrantWrite`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write-acp: `GrantWriteACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-meta-*

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-legal-hold

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-mode

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-retain-until-date

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-sdk-checksum-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-storage-class

</td>
<td align="left">

&#128308; NO (Assuming STANDARD)

</td>
</tr>
<tr>
<td align="left">

x-amz-tagging

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-website-redirect-location

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Object data.

</td>
<td align="left">

May be [Chunked Payload](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html)

</td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

ETag

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expiration

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-decoded-content-length

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in cases where there are invalid/missing arguments in the request. Particularly:
1. If using chunked payload, and _`x-amz-decoded-content-length`_ is missing.
1. If using chunked payload, and _`x-amz-decoded-content-length`_  is not valid.

This may happen in case of chunked payload when the provided header does not have a valid value.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

BadDigest

</td>
<td align="left">

Returned if the Content-MD5 does not match the MD5 computed while uploading.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

MethodNotAllowed

</td>
<td align="left">

Returned in case the new object name does not validate constraints (see below)

</td>
<td align="left">

405 Method Not Allowed

</td>
</tr>
<tr>
<td align="left">

InvalidRequest

</td>
<td align="left">

Key of an object containing payload is not allowed to end with `'/'` in S4.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned in case the upload failed to complete

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## CopyObject

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Cache-Control

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Disposition

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Expires

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-acl:  `ACL`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-match

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-modified-since

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-none-match

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-unmodified-since

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-storage-class

</td>
<td align="left">

&#128994; YES (Only STANDARD is allowed)

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-source-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-full-control: `GrantFullControl`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read: `GrantRead`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read-acp: `GrantReadACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write: `GrantWrite`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write-acp: `GrantWriteACP`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-meta-*

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-metadata-directive

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-tagging-directive

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-tagging

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-website-redirect-location

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-legal-hold

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-mode

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-retain-until-date

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expiration

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">InvalidArgument</td>
<td align="left">Returned if x-amz-copy-source-path is empty or does not denote both bucket and resource.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">NoSuchBucket</td>
<td align="left">Returned if the source bucket does not exist.</td>
<td align="left">404 Not Found</td>
</tr>
<tr>
<td align="left">NoSuchKey</td>
<td align="left">Returned if the source key does not exist.</td>
<td align="left">404 Not Found</td>
</tr>
<tr>
<td align="left">InvalidStorageClass</td>
<td align="left">Returned if a storage class other than STANDARD is used in the request.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">AccessDenied</td>
<td align="left">In addition to usual policy validation errors, this is returned if policy validation fails on the copy source.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">Internal Error</td>
<td align="left">Returned in the event of internal API error.</td>
<td align="left">500 Internal Server Error</td>
</tr>
</table>

## GetObject

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

_response-cache-control_

</td>
<td align="left">

&#128994; YES</td>


</tr>
<tr>
<td align="left">

response-content-disposition

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

response-content-encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

response-content-language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

response-content-type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

response-expires

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

versionId

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-mode: `ChecksumMode`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm: `SSECustomerAlgorithm`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key: `SSECustomerKey`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5:  `SSECustomerKeyMD5`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

If-Match:  `IfMatch`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-Modified-Since: `IfModifiedSince`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-None-Match: `IfNoneMatch`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-Unmodified-Since: `IfUnmodifiedSince`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Range: Range

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">206 Partial Content</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Cache-Control

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Disposition

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Range

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

ETag

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Expires

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Last-Modified

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-meta-*

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">NoSuchKey</td>
<td align="left">Returned if the key does not name an object in the bucket or the key is not a file.</td>
<td align="left">404 Not Found</td>
</tr>
<tr>
<td align="left">InvalidRange</td>
<td align="left">Returned if the request has a range header which is not satisfiable for the entity being downloaded. This means a byte range spec (e.g., bytes=50-100) where the starting byte offset is greater than the entity size, or a suffix byte range spec (e.g., bytes=-0) where the suffix byte is zero.</td>
<td align="left">416 Requested Range Not Satisfiable</td>
</tr>
<tr>
<td align="left">PreconditionFailed</td>
<td align="left">

Returned if at least one of the specified preconditions `If-Match` or `If-Unmodified-Since` did not hold. When both headers are present, if the `If-Match` condition evaluates to true, `If-Unmodified-Since` will not be evaluated.

</td>
<td align="left">412 Precondition Failed</td>
</tr>
<tr>
<td align="left">NotModified</td>
<td align="left">

Returned if at least one of the specified preconditions `If-None-Match` or `If-Modified-Since` did not hold. When both headers are present, if the `If-None-Match` condition evaluates to true, `If-Modified-Since` will not be evaluated.

</td>
<td align="left">304 Not Modified</td>
</tr>
</table>

## HeadObject

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">HEAD</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">partNumber</td>
<td align="left">&#128308; NO</td>
</tr>
<tr>
<td align="left">versionId</td>
<td align="left">&#128308; NO</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-mode: `ChecksumMode`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm: `SSECustomerAlgorithm`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key: `SSECustomerKey`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5: `SSECustomerKeyMD5`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

If-Match: `IfMatch`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-Modified-Since: `IfModifiedSince`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-None-Match: `IfNoneMatch`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-Unmodified-Since: `IfUnmodifiedSince`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Range: Range

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Cache-Control

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Disposition

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Length

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

ETag

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Expires

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Last-Modified

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-meta-*

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-storage-class

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">NoSuchKey</td>
<td align="left">Returned if the key does not name an object in the bucket or the key is not a file.</td>
<td align="left">404 Not Found</td>
</tr>
<tr>
<td align="left">InvalidRange</td>
<td align="left">Returned if the request has a range header which is not satisfiable for the entity being downloaded. This means a byte range spec (e.g., bytes=50-100) where the starting byte offset is greater than the entity size, or a suffix byte range spec (e.g., bytes=-0) where the suffix byte is zero.</td>
<td align="left">416 Requested Range Not Satisfiable</td>
</tr>
<tr>
<td align="left">PreconditionFailed</td>
<td align="left">

Returned if at least one of the specified preconditions `If-Match` or `If-Unmodified-Since` did not hold. When both headers are present, if the `If-Match` condition evaluates to true, `If-Unmodified-Since` will not be evaluated.

</td>
<td align="left">412 Precondition Failed</td>
</tr>
<tr>
<td align="left">NotModified</td>
<td align="left">

Returned if at least one of the specified preconditions `If-None-Match` or `If-Modified-Since` did not hold. When both headers are present, if the `If-None-Match` condition evaluates to true, `If-Modified-Since` will not be evaluated.

</td>
<td align="left">304 Not Modified</td>
</tr>
</table>

## DeleteObject

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">DELETE</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

versionId

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-bypass-governance-retention: `boolean`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-mfa: `string`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">204 NoContent</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-delete-marker

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

Note that if the object with the given key does not exist, `DeleteObject` still returns `204 NoContent`.

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">NoSuchBucket</td>
<td align="left">Returned if the bucket which the object is attempted to be deleted from does not exist.</td>
<td align="left">404 Not Found</td>
</tr>
</table>

## DeleteObjects

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">POST</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?delete

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?delete

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Content-MD5: `Base64EncodedMD5`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32: `Base64EncodedCRC32`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c: `Base64EncodedCRC32C`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc64nvme: `Base64EncodedCRC64NVME`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1: `Base64EncodedSHA1`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256: `Base64EncodedSHA256`

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer: `RequestPayer`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-bypass-governance-retention: `BypassGovernanceRetention`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-mfa: `MFA`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-sdk-checksum-algorithm: `ChecksumAlgorithm`

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Delete xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <Object>
      <Key>string</Key>
      <ETag>string</ETag>   🔴 - NOT supported
      <LastModifiedTime>timestamp</LastModifiedTime>    🔴 - NOT supported
      <Size>long</Size>     🔴 - NOT supported
      <VersionId>string</VersionId>     🔴 - NOT supported
   </Object>
   ...
   <Quiet>boolean</Quiet>
</Delete>
```

</td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<DeleteResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <Deleted>
      <Key>string</Key>
   </Deleted>
   ...
   <Error>
      <Code>string</Code>
      <Key>string</Key>
      <Message>string</Message>
   </Error>
   ...
</DeleteResult>
```

</td>
</tr>
</table>

### Errors

Note that even if any of the objects listed in the request do not exist, `DeleteObjects` will consider the operation successful. It will return `200 OK` with the response body indicating such objects having been deleted.

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidRequest

</td>
<td align="left">

Returned if:
1. Neither the  `Content-MD5`  nor  `x-amz-checksum-*`  header is present in the request.
1. More than one  `x-amz-checksum-*`  header is present in the request.
1. The algorithm type specified in the  `x-amz-checksum-*`  header is invalid.
1. The value of the  `x-amz-checksum-*`  header is invalid.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InvalidDigest

</td>
<td align="left">

Returned if the value of the  `Content-MD5`  header is invalid.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

MissingRequestBodyError

</td>
<td align="left">

Returned if the request body is empty.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

MalformedXML

</td>
<td align="left">

Returned if the request body contains invalid XML document.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

UserKeyMustBeSpecified

</td>
<td align="left">

Returned if the request includes an object with an empty key.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

BadDigest

</td>
<td align="left">

Returned if the calculated MD5 digest or checksum does not match the one provided in the  `Content-MD5`  or  `x-amz-checksum-*`  header respectively.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
</table>

## CreateMultipartUpload

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">POST</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploads

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-acl

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

Cache-Control

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Disposition

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Encoding

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Language

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-Type

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Expires

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-full-control

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-read-acp

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-grant-write-acp

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-meta-*

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-website-redirect-location

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-storage-class

</td>
<td align="left">

&#128308; NO (Assuming STANDARD)

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-tagging

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-mode

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-retain-until-date

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-object-lock-legal-hold

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-abort-date

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-abort-rule-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-context

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<InitiateMultipartUploadResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <Bucket>string</Bucket>
    <Key>string</Key>
    <UploadId>string</UploadId>
</InitiateMultipartUploadResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">ServiceUnavailable</td>
<td align="left">Returned in case server is too crowded.</td>
<td align="left">503 Service Unavailable</td>
</tr>
<tr>
<td align="left">AccountProblem</td>
<td align="left">Returned if user has exceed quota.</td>
<td align="left">403 Forbidden</td>
</tr>
<tr>
<td align="left">InternalError</td>
<td align="left">Returned in case the request failed to complete.</td>
<td align="left">500 Internal Server Error</td>
</tr>
</table>

## UploadPart

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploadId

</td>
<td align="left">

&#128994; YES

</td>
</tr>
</tr>
<tr>
<td align="left">

partNumber

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Content-Length

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

Content-MD5

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-sdk-checksum-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

ETag

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

BadDigest

</td>
<td align="left">

Returned if the Content-MD5 does not match the MD5 computed while uploading.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InvalidDigest

</td>
<td align="left">

Returned in case header  `Content-MD5`  is not in a valid MD5 base64 format.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

ServiceUnavailable

</td>
<td align="left">

Returned in case server is too crowded.

</td>
<td align="left">

503 Service Unavailable

</td>
</tr>
<tr>
<td align="left">

InvalidPart

</td>
<td align="left">

***Note:*** although under the S3 standard, InvalidPart is not an expected error for UploadPart operation, S4 applies several checks according to its own part restrictions:
1. The uploaded part have inconsistent size with the rest of uploaded parts. For an N-parts upload, S4 requires parts in the range 1 to N-1 to have the same size, the part N can have a different size but must not be larger than previous parts. This error will cause the entire upload to be aborted.<br>**Note:** the S3 standard does not impose this requirement.
1. The part is empty.<br>**Note:** the S3 standard does not impose this requirement.
1. This part has already been uploaded. S4 does not allow re-uploading parts.<br>**Note:** the S3 standard does not impose this requirement.

</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

EntityTooSmall

</td>
<td align="left">

Returned in case the size of this (or any previously uploaded) part is smaller than 5MB, unless this is the last part, in which case, the smaller than 5MB size is allowed. Please note that:
1. This error is S4 deviaton from the S3 standard. Under the S3 standard, the UploadPart request is not expected to return the EntityTooSmall error but only upon the multipart upload completion.
1. This error will cause the entire upload to be aborted.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

NoSuchUpload

</td>
<td align="left">

Returned if:
- The requested upload ID does not exist or the object key does not belong to the upload with the given ID or
- The upload has been aborted or completed

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned in case the request failed to complete, e.g. storage timeout, etc.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## UploadPartCopy

UploadPartCopy is supported for full object copies only.

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploadId

</td>
<td align="left">

&#128994; YES

</td>
</tr>
</tr>
<tr>
<td align="left">

partNumber

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-copy-source

</td>
<td align="left">

&#128994; YES (non-access-point format only i.e. bucket/object/key)

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-match

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-modified-since

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-none-match

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-if-unmodified-since

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-range

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-copy-source-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-source-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-copy-source-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<CopyPartResult>
   <ETag>string</ETag>          🟠 – ETag is MD5 digest of the complete source object and the part number as the suffix
   <LastModified>timestamp</LastModified>
</CopyPartResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in case of invalid x-amz-copy-source-range.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InvalidRequest

</td>
<td align="left">

Returned in case of invalid x-amz-copy-source-range (the lower range bound is greater than the source file size).

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

NoSuchKey

</td>
<td align="left">

Returned if the copy source specified by x-amz-copy-source does not exist.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

ServiceUnavailable

</td>
<td align="left">

Returned in case server is too crowded.

</td>
<td align="left">

503 Service Unavailable

</td>
</tr>
<tr>
<td align="left">

InvalidPart

</td>
<td align="left">

***Note:*** although under the S3 standard, InvalidPart is not an expected error for UploadPart operation, S4 applies several checks according to its own part restrictions:
1. The uploaded part have inconsistent size with the rest of uploaded parts. For an N-parts upload, S4 requires parts in the range 1 to N-1 to have the same size, the part N can have a different size but must not be larger than previous parts. This error will cause the entire upload to be aborted.<br>**Note:** the S3 standard does not impose this requirement.
1. The part is empty.<br>**Note:** the S3 standard does not impose this requirement.
1. This part has already been uploaded. S4 does not allow re-uploading parts.<br>**Note:** the S3 standard does not impose this requirement.

</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

EntityTooSmall

</td>
<td align="left">

Returned in case the size of this (or any previously uploaded) part is smaller than 5MB, unless this is the last part, in which case, the smaller than 5MB size is allowed. Please note that:
1. This error is S4 deviaton from the S3 standard. Under the S3 standard, the UploadPart request is not expected to return the EntityTooSmall error but only upon the multipart upload completion.
1. This error will cause the entire upload to be aborted.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

NoSuchUpload

</td>
<td align="left">

Returned if:
- The requested upload ID does not exist or the object key does not belong to the upload with the given ID or
- The upload has been aborted or completed

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned in case the request failed to complete, e.g. storage timeout, etc.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## ListParts

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploadId

</td>
<td align="left">

&#128994; YES (Required)

</td>
</tr>
<tr>
<td align="left">

max-parts

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

part-number-marker

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<ListPartsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <Bucket>string</Bucket>
   <Key>string</Key>
   <UploadId>string</UploadId>
   <PartNumberMarker>integer</PartNumberMarker>
   <NextPartNumberMarker>integer</NextPartNumberMarker>
   <MaxParts>integer</MaxParts>
   <IsTruncated>boolean</IsTruncated>
   <Part>
      <PartNumber>integer</PartNumber>
      <LastModified>timestamp</LastModified>
      <ETag>string</ETag>
      <Size>integer</Size>
   </Part>
   ...
   <Initiator>
      <ID>string</ID>
      <DisplayName>string</DisplayName>
   </Initiator>
   <Owner>
      <ID>string</ID>
      <DisplayName>string</DisplayName>
   </Owner>
   <StorageClass>string</StorageClass>       🟠 – Always set to "STANDARD"
   <ChecksumAlgorithm>string</ChecksumAlgorithm>     🔴 - NOT supported
   <ChecksumType>string</ChecksumType>     🔴 - NOT supported
</ListPartsResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned if one of the following conditions is true:
- Required parameter `uploadId` is missing or empty
- Parameter `part-number-marker` is not a non-negative integer
- Parameter `max-parts` is not a non-negative integer

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

NoSuchUpload

</td>
<td align="left">

Returned if one of the following conditions is true:
- The requested upload ID does not exist or is invalid
- The object key specified does not match the key associated with the upload ID
- The upload has been previously aborted
- The upload has been completed and is no longer available for listing

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## CompleteMultipartUpload

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">POST</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploadId

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

If-Match

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

If-None-Match

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-crc32c

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha1

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-checksum-sha256

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-algorithm

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-customer-key-MD5

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<CompleteMultipartUpload xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <Part>
      <PartNumber>integer</PartNumber>
      <ETag>string</ETag>
   </Part>
   ...
</CompleteMultipartUpload>
```

</td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expiration

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-version-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-aws-kms-key-id

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-server-side-encryption-bucket-key-enabled

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<CompleteMultipartUploadResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   <Location>string</Location>
   <Bucket>string</Bucket>
   <Key>string</Key>
   <ETag>string</ETag>
</CompleteMultipartUploadResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">MalformedXML</td>
<td align="left">Returned in case the request body is not a valid xml message, or does not specify a valid ETag or PartNumber.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">InvalidRequest</td>
<td align="left">Returned in case the request body does not specify any valid part info.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">InvalidPartOrder</td>
<td align="left">Returned if in the request body, the part list was not in ascending order. The part list must be ordered by part number.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

NoSuchUpload

</td>
<td align="left">

Returned if one of the following conditions is true:
- The requested upload ID does not exist or the object key does not belong to the upload with the given ID
- The upload has been aborted.
- The upload has been completed. (It is a deviation from the S3 standard. S3 allows to complete a mulipart upload unlimited times as long as the part composition is unchanged.)
- There is another completion request with the same upload Id running underway. (It is a deviation just like explained above)

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InvalidPart

</td>
<td align="left">

Returned for one of the following reasons:
1. The part list in the completion request does not include all the uploaded parts.<br>**Note:** the S3 standard does not impose this requirement.
1. One or more specified parts in the completion request haven't been uploaded.
1. One or more specified parts in the completion request do not match ETag.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned in case the request failed to complete, e.g. failed to retrieve the uploaded object, etc.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## ListMultipartUploads

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?uploads

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?uploads

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">&emsp;delimiter</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<td align="left">&emsp;encoding-type</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<td align="left">&emsp;key-marker</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<td align="left">&emsp;max-uploads</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<td align="left">&emsp;prefix</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<td align="left">&emsp;upload-id-marker</td>
<td align="left">&emsp;&#128994; YES</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">&emsp;x-amz-request-payer</td>
<td align="left">&emsp;&#128308; NO</td>
</tr>
<tr>
<td align="left">&emsp;x-amz-expected-bucket-owner</td>
<td align="left">&emsp;&#128308; NO</td>
</tr>
<tr>
<th align="left" colspan=2>Body</th>
</tr>
<tr>
<td align="left" colspan=2><i>&lt;empty&gt;</i></td>
</tr>
</table>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">&emsp;x-amz-request-charged</td>
<td align="left">&emsp;&#128308; NO</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListMultipartUploadsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <Bucket>string</Bucket>
    <Upload>
        <Key>string</Key>
        <UploadId>string</UploadId>
        <StorageClass>string</StorageClass>   🟠 – Always set to "STANDARD"
        <Initiated>timestamp</Initiated>
    </Upload>
    ...
    <MaxUploads>integer</MaxUploads>
    <IsTruncated>boolean</IsTruncated>
    <KeyMarker>string</KeyMarker>
    <UploadIdMarker>string</UploadIdMarker>
    <NextKeyMarker>string</NextKeyMarker>
    <NextUploadIdMarker>string</NextUploadIdMarker>
</ListMultipartUploadsResult>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in case \<upload-id-marker\> in invalid.

</td>
<td align="left">

400 Bad Request
</td>
</tr>
</table>

## AbortMultipartUpload

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">DELETE</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

uploadId

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-payer

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">204  No Content</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-request-charged

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

NoSuchUpload

</td>
<td align="left">

Returned for one of the following reasons:
- The requested upload ID does not exist or the object key does not belong to the upload with the given ID
- The upload has completed or has already been aborted (Note, the S3 standard always returns 204 in this case)

</td>
<td align="left">

404 Not Found

</td>
</tr>
</table>

## PutObjectAcl

This service is currently not supported and will always return `AccessControlListNotSupported` error (400 Bad Request).

## GetObjectAcl

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/&lt;Key&gt;?acl

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/&lt;Key&gt;?acl

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-request-payer _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<AccessControlPolicy xmlns="http://s3.amazonaws.com/doc/2006-03-01/"> 🟠 – Always returns canned response
  <Owner>
    <ID>string</ID>
    <DisplayName>string</DisplayName>
  </Owner>
  <AccessControlList>
    <Grant>
      <Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="CanonicalUser">
        <ID>string</ID>
        <DisplayName>string</DisplayName>
      </Grantee>
      <Permission>FULL_CONTROL</Permission>   🟠 – Always returns FULL_CONTROL
    </Grant>
  </AccessControlList>
</AccessControlPolicy>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

NoSuchKey

</td>
<td align="left">

Returned if the key does not exist.

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

# **2.2.3. Policies (on Buckets)**

## PutBucketPolicy

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">PUT</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?policy

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?policy

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

Content-MD5: `ContentMD5` _(mandatory)_

</td>
<td align="left">

&#128994; YES

</td>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner` _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-sdk-checksum-algorithm: `ChecksumAlgorithm` _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<td align="left">

x-amz-confirm-remove-self-bucket-access: `ConfirmRemoveSelfBucketAccess` _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">{ Policy in JSON format }</td>
<td align="left">&#128994; YES</td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

MalformedPolicy

</td>
<td align="left">

Returned in case the given policy contains invalid JSON or invalid principal.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InvalidDigest

</td>
<td align="left">

Returned in case header  `Content-MD5`  is missing.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

BadDigest

</td>
<td align="left">

Returned in case  `Content-MD5`  header value does not match computed MD5.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## GetBucketPolicy

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">GET</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?policy

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?policy

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner` _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">{ Policy in JSON format }</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

NoSuchBucketPolicy

</td>
<td align="left">

Returned in case  `<bucket_name>`  does not have an inline policy document.

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

MalformedPolicy

</td>
<td align="left">

Mandatory JSON property is missing.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
</table>

## DeleteBucketPolicy

### Request

<table>
<tr>
<th align="left" colspan="2">Method</th>
</tr>
<tr>
<td align="left" colspan="2">DELETE</td>
</tr>
<tr>
<th align="left">URL (alternatives)</th>
<th align="left">Note</th>
</tr>
<tr>
<td align="left">

/?policy

</td>
<td align="left">

Host header must start with  `<bucket_name>`, e.g.  `test-bucket.s3.eu-central-1.s4.mega.io`

</td>
</tr>
<tr>
<td align="left">

/`<bucket_name>`/?policy

</td>
<td align="left"></td>
</tr>
<tr>
<th align="left">URL Params</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left">

x-amz-expected-bucket-owner: `ExpectedBucketOwner` _(optional)_

</td>
<td align="left">

&#128308; NO

</td>
</tr>
<tr>
<th align="left">Body</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
<td align="left"></td>
</tr>
</table>

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">204 No Content</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2"><i>&lt;empty&gt;</i></td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

NoSuchBucketPolicy

</td>
<td align="left">

Returned in case  `<bucket_name>`  does not have an inline policy document.

</td>
<td align="left">

404 Not Found

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

# **2.3. Presigned URL**

### Authentication

Instead of using [Authorization Header](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html)  in service request, presigned url put authentication data in  [Query Parameters](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-query-string-auth.html).

### Signature Version

Only version 4 is supported by S4. While the S3 standard supports both V1 and V4.

### Specific Errors

| Error Code (see: [1.3.2](#132-common-errors)) | Description | HTTP Status Code
| :--- | :--- | :---
| - [AuthorizationQueryParametersError](#authorizationqueryparameterserror) | 1) Unsupported signature algorithm<br>2) Invalid expiration (e.g. negative, non-integer, or exceed max limit (a default limit is 7 days)) | 400 Bad Request
| - [AccessDenied](#accessdenied) | The request has expired | 403 Forbidden
| - [SignatureDoesNotMatch](#signaturedoesnotmatch) | | 403 Forbidden

# **2.4. Presigned Post**

Presigned Post can only be used for uploading files.

Currently, it is NOT supported by S4.

# **3. IAM Api**

# **3.1. Conventions**

IAM services have the end-point  `iam.<region>.s4.mega.io`, and all of them have a common URL resource:  `/`.
IAM services have an  `Action`  parameter that contains the name of the service. Both the  `Action`  parameter as well as the rest of the service arguments can be received in two different ways:

### Parameters in Query String

<table>
<tr>
<th align="left">Method</th>
</tr>
<tr>
<td align="left">GET</td>
</tr>
<tr>
<th align="left">URL</th>
</tr>
<tr>
<td align="left">/</td>
</tr>
<tr>
<th align="left">URL Params</th>
</tr>
<tr>
<td align="left">

Action: `ActionName`

</td>
</tr>
<tr>
<td align="left">

...

</td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left"><i>&lt;empty&gt;</i></td>
</tr>
<tr>
<th align="left">Example</th>
</tr>
<tr>
<td align="left">

`GET /?Action=ListPolicies&Version=2010-05-08&AUTHPARAMS HTTP/1.1`<br>`Host: iam.eu-central-1.s4.mega.io`

</td>
</tr>
</table>

### Parameters in Body

<table>
<tr>
<th align="left">Method</th>
</tr>
<tr>
<td align="left">POST</td>
</tr>
<tr>
<th align="left">URL</th>
</tr>
<tr>
<td align="left">/</td>
</tr>
<tr>
<th align="left">URL Params</th>
</tr>
<tr>
<td align="left">

Action: `ActionName`

</td>
</tr>
<tr>
<td align="left">

...

</td>
</tr>
<tr>
<th align="left">Body</th>
</tr>
<tr>
<td align="left">

_URL encoded query string_

</td>
</tr>
<tr>
<th align="left">Example</th>
</tr>
<tr>
<td align="left">

`GET / HTTP/1.1`<br>`Host: iam.eu-central-1.s4.mega.io`<br><br>`Action=ListPolicies&Version=2010-05-08&AUTHPARAMS`

</td>
</tr>
</table>

# **3.2 S4 Managed Policies**

S4 provides the following managed policies:

<table>
<tr>
<th align="left">Name</th>
<th align="left">Document</th>
</tr>
<tr>
<td align="left">

`AdministratorAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ListAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:List*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ReadAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:List*",
      "s3:Get*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3WriteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:Put*",
      "s3:Create*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3DeleteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:Delete*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3FullAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3BucketListAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListAllMyBuckets",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3BucketReadAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:ListAllMyBuckets",
      "s3:GetBucket*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3BucketWriteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:CreateBucket",
      "s3:PutBucket*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3BucketDeleteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:DeleteBucket*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3BucketFullAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:ListAllMyBuckets",
      "s3:GetBucket*",
      "s3:CreateBucket",
      "s3:PutBucket*",
      "s3:DeleteBucket*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ObjectListAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListBucket*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ObjectReadAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:GetObject*",
      "s3:ListMultipartUploadParts",
      "s3:ListBucket*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ObjectWriteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:PutObject*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ObjectDeleteAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:DeleteObject*",
      "s3:AbortMultipartUpload"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`S3ObjectFullAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "s3:ListBucket*",
      "s3:GetObject*",
      "s3:ListMultipartUploadParts",
      "s3:PutObject*",
      "s3:DeleteObject*",
      "s3:AbortMultipartUpload"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`IAMListAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "iam:List*",
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`IAMReadAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "iam:Get*",
      "iam:List*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`IAMAttachDetachAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": [
      "iam:Attach*",
      "iam:Detach*"
    ],
    "Resource": "*"
  }
}
```

</td>
</tr>
<tr>
<td align="left">

`IAMFullAccess`

</td>
<td align="left">

```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "iam:*",
    "Resource": "*"
  }
}
```

</td>
</tr>
</table>

# **3.3. Services**

# **3.3.1. Policies**

## GetPolicy

**ActionName**: GetPolicy

### Request

| Params | Supported
| :--- | :---
| PolicyArn (mandatory) |   &#128994; YES

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>

<GetPolicyResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/">
  <GetPolicyResult>
    <Policy>
      <Arn>arn:aws:iam::aws:policy/AdministratorAccess</Arn>
      <AttachmentCount>0</AttachmentCount>
      <CreateDate>2022-07-29T20:05:50.000Z</CreateDate>
      <UpdateDate>2022-07-29T20:05:50.000Z</UpdateDate>
      <PolicyId>ADMINISTRATORACCESS</PolicyId>
      <PolicyName>AdministratorAccess</PolicyName>
      <DefaultVersionId>v1</DefaultVersionId>
      <Path>/</Path>
      <IsAttachable>true</IsAttachable>
      <Description></Description>
    </Policy>
  </GetPolicyResult>
  <ResponseMetadata>
    <RequestId>0000000000000003</RequestId>
  </ResponseMetadata>
</GetPolicyResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">ValidationError</td>
<td align="left">Returned in case of either the parameter PolicyArn missing from the request or its length being less than 20 or greater than 2048 characters.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">InvalidInput</td>
<td align="left">Returned in case the ARN value is not valid.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">NoSuchEntity</td>
<td align="left">Returned in case the policy referenced by the given ARN is not found.</td>
<td align="left">404 Not Found</td>
</tr>
</table>

## GetPolicyVersion

**ActionName**: GetPolicyVersion

### Request

| Params | Supported
| :--- | :---
| PolicyArn (mandatory) | &#128994; YES
| VersionId (mandatory) | &#128994; YES

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<GetPolicyVersionResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/">

  <GetPolicyVersionResult>
    <PolicyVersion>
      <Document>
        %7B%22Version%22%3A%222012-10-17%22%2C%22Statement%22%3A%7B%22Effect%22%3A%22Allow%22%2C%22Action%22%3A%22%2A%22%2C%22Resource%22%3A%22%2A%22%7D%7D
      </Document>
      <IsDefaultVersion>true</IsDefaultVersion>
      <VersionId>v1</VersionId>
      <CreateDate>2022-07-29T20:05:50.000Z</CreateDate>
    </PolicyVersion>
  </GetPolicyVersionResult>
  <ResponseMetadata>
    <RequestId>0000000000000017</RequestId>
  </ResponseMetadata>
</GetPolicyVersionResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

ValidationError

</td>
<td align="left">

Returned in case:
1. The parameter PolicyArn is missing from the request or its length is less than 20 or greater than 2048 characters.
1. The parameter VersionId is missing or does not match the following regex: `v[1-9][0-9]{0,9}(\\.[A-Za-z0-9-]{1,64})?`

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">InvalidInput</td>
<td align="left">Returned in case the ARN value is not valid.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">NoSuchEntity</td>
<td align="left">Returned if the policy version identified by the given ARN and versionId is not found.</td>
<td align="left">404 Not Found</td>
</tr>
</table>

## ListPolicies

**ActionName**: ListPolicies

### Request

| Params | Supported
| :--- | :---
| Marker (optional) | &#128994; YES
| MaxItems  _(optional)_ | &#128994; YES
| OnlyAttached  _(optional)_ | &#128308; NO
| PathPrefix  _(optional)_ | &#128308; NO
| PolicyUsageFilter  _(optional)_ | &#128308; NO
| Scope  _(optional)_ | &#128308; NO

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ListPoliciesResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/">
  <ListPoliciesResult>
    <IsTruncated>false</IsTruncated>
    <Policies>
      <member>
        <Arn>arn:aws:iam::aws:policy/FullAccess</Arn>
        <AttachmentCount>0</AttachmentCount>
        <CreateDate>2017-05-15T02:57:50.000Z</CreateDate>
        <UpdateDate>2017-05-15T02:57:50.000Z</UpdateDate>
        <PolicyId>FULLACCESS</PolicyId>
        <PolicyName>FullAccess</PolicyName>
        <DefaultVersionId>v1</DefaultVersionId>
        <Path>/</Path>
        <IsAttachable>true</IsAttachable>
      </member>
       ...
    </Policies>
  </ListPoliciesResult>
  <ResponseMetadata>
    <RequestId>0000000000000001</RequestId>
  </ResponseMetadata>
</ListPoliciesResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">MalformedInput</td>
<td align="left">Returned in case Marker or MaxItems is specified but it is not an integer value or out of the integer value range.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

ValidationError

</td>
<td align="left">

Returned in case:
1. Marker is specified but is less than zero or greater than the number of available managed policies.
1. MaxItems is specified but it is less than 1 or greater than the max number for MaxItems specified in the configuration.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
</table>

## ListAttachedUserPolicies \| ListAttachedGroupPolicies

**ActionName**: ListAttachedUserPolicies or ListAttachedGroupPolicies

### Request

| Params | Supported
| :--- | :---
| UserName \| GroupName  _(mandatory)_ | &#128994; YES
| Marker _(optional)_ | &#128994; YES
| MaxItems  _(optional)_ | &#128994; YES
| PathPrefix  _(optional)_ | &#128308; NO

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<ListAttachedUserPoliciesResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/"> -- or ListAttachedGroupPoliciesResponse
  <ListAttachedGroupPoliciesResult> -- or ListAttachedGroupPoliciesResponse
    <AttachedPolicies>
      <member>
        <PolicyName>FullAccess</PolicyName>
        <PolicyArn>arn:aws:iam::aws:policy/FullAccess</PolicyArn>
      </member>
    </AttachedPolicies>
    <IsTruncated>false</IsTruncated>
  </ListAttachedGroupPoliciesResult>
  <ResponseMetadata>
    <RequestId>0000000000000001</RequestId>
  </ResponseMetadata>
</ListAttachedGroupPoliciesResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">MalformedInput</td>
<td align="left">Returned in case Marker or MaxItems is specified but it is not an integer value or out of the integer value range.</td>
<td align="left">400 Bad Request</td>
</tr>
<tr>
<td align="left">

ValidationError

</td>
<td align="left">

Returned in case:
1. Marker is specified but is less than zero or greater than the number of available managed policies.
1. MaxItems is specified but it is less than 1 or greater than the max number for MaxItems specified in the configuration.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

NoSuchEntity

</td>
<td align="left">

Returned if \<UserName\>/\<GroupName\> does not exist in the current account.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

AccountProblem

</td>
<td align="left">

Returned due to technical reasons related to the  **internal representation**  of the account information.

</td>
<td align="left">

403 Forbidden

</td>
</tr>
</table>

## AttachUserPolicy \| AttachGroupPolicy

**ActionName**: AttachUserPolicy or AttachGroupPolicy

### Request

| Params | Supported
| :--- | :---
| UserName \| GroupName  _(mandatory)_ | &#128994; YES
| PolicyArn _(mandatory)_ | &#128994; YES

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<AttachUserPolicyResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/"> – or AttachGroupPolicyResponse
  <ResponseMetadata>
    <RequestId>0000000000000001</RequestId>
  </ResponseMetadata>
</AttachUserPolicyResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left"

InvalidArgument

</td>
<td align="left">

Returned in case \<PolicyArn\> does not exist.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>

## DetachUserPolicy \| DetachGroupPolicy

**ActionName**: DetachUserPolicy or DetachGroupPolicy

### Request

| Params | Supported
| :--- | :---
| UserName \| GroupName  _(mandatory)_ | &#128994; YES
| PolicyArn _(mandatory)_ | &#128994; YES

### Success Response

<table>
<tr>
<th align="left" colspan="2">Status Code</th>
</tr>
<tr>
<td align="left" colspan="2">200 OK</td>
</tr>
<tr>
<th align="left">Specific Headers</th>
<th align="left">Supported</th>
</tr>
<tr>
<td align="left"><i>&lt;none&gt;</i></td>
<td align="left"></td>
</tr>
<tr>
<th align="left" colspan="2">Body</th>
</tr>
<tr>
<td align="left" colspan="2">

```xml
<DetachUserPolicyResponse xmlns="https://iam.amazonaws.com/doc/2010-05-08/"> – or DetachGroupPolicyResponse
  <ResponseMetadata>
    <RequestId>0000000000000001</RequestId>
  </ResponseMetadata>
</detachUserPolicyResponse>
```

</td>
</tr>
</table>

### Errors

<table>
<tr>
<th align="left">Error Code</th>
<th align="left">Description</th>
<th align="left">HTTP Status Code</th>
</tr>
<tr>
<td align="left">

InvalidArgument

</td>
<td align="left">

Returned in case \<PolicyArn\> does not exist.

</td>
<td align="left">

400 Bad Request

</td>
</tr>
<tr>
<td align="left">

InternalError

</td>
<td align="left">

Returned due to technical reasons.

</td>
<td align="left">

500 Internal Server Error

</td>
</tr>
</table>
