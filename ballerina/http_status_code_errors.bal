// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represents the details of an HTTP error.
# 
# + headers - The error response headers
# + body - The error response body
public type ErrorDetail record {
    map<string> headers?;
    anydata body?;
};

# Represents the HTTP status code error.
public type StatusCodeError distinct error<ErrorDetail>;

# Represents 4XX HTTP status code errors.
public type '4XXStatusCodeError distinct StatusCodeError;
# Represents 5XX HTTP status code errors.
public type '5XXStatusCodeError distinct StatusCodeError;
# Represents the default HTTP status code error.
public type DefaultStatusCodeError distinct StatusCodeError;

# Represents the HTTP 400 Bad Request error.
public type BadRequestError distinct '4XXStatusCodeError;
# Represents the HTTP 401 Unauthorized error.
public type UnauthorizedError distinct '4XXStatusCodeError;
# Represents the HTTP 402 Payment Required error.
public type PaymentRequiredError distinct '4XXStatusCodeError;
# Represents the HTTP 403 Forbidden error.
public type ForbiddenError distinct '4XXStatusCodeError;
# Represents the HTTP 404 Not Found error.
public type NotFoundError distinct '4XXStatusCodeError;
# Represents the HTTP 405 Method Not Allowed error.
public type MethodNotAllowedError distinct '4XXStatusCodeError;
# Represents the HTTP 406 Not Acceptable error.
public type NotAcceptableError distinct '4XXStatusCodeError;
# Represents the HTTP 407 Proxy Authentication Required error.
public type ProxyAuthenticationRequiredError distinct '4XXStatusCodeError;
# Represents the HTTP 408 Request Timeout error.
public type RequestTimeoutError distinct '4XXStatusCodeError;
# Represents the HTTP 409 Conflict error.
public type ConflictError distinct '4XXStatusCodeError;
# Represents the HTTP 410 Gone error.
public type GoneError distinct '4XXStatusCodeError;
# Represents the HTTP 411 Length Required error.
public type LengthRequiredError distinct '4XXStatusCodeError;
# Represents the HTTP 412 Precondition Failed error.
public type PreconditionFailedError distinct '4XXStatusCodeError;
# Represents the HTTP 413 Payload Too Large error.
public type PayloadTooLargeError distinct '4XXStatusCodeError;
# Represents the HTTP 414 URI Too Long error.
public type URITooLongError distinct '4XXStatusCodeError;
# Represents the HTTP 415 Unsupported Media Type error.
public type UnsupportedMediaTypeError distinct '4XXStatusCodeError;
# Represents the HTTP 416 Range Not Satisfiable error.
public type RangeNotSatisfiableError distinct '4XXStatusCodeError;
# Represents the HTTP 417 Expectation Failed error.
public type ExpectationFailedError distinct '4XXStatusCodeError;
# Represents the HTTP 421 Misdirected Request error.
public type MisdirectedRequestError distinct '4XXStatusCodeError;
# Represents the HTTP 422 Unprocessable Entity error.
public type UnprocessableEntityError distinct '4XXStatusCodeError;
# Represents the HTTP 423 Locked error.
public type LockedError distinct '4XXStatusCodeError;
# Represents the HTTP 424 Failed Dependency error.
public type FailedDependencyError distinct '4XXStatusCodeError;
# Represents the HTTP 426 Upgrade Required error.
public type UpgradeRequiredError distinct '4XXStatusCodeError;
# Represents the HTTP 428 Precondition Required error.
public type PreconditionRequiredError distinct '4XXStatusCodeError;
# Represents the HTTP 429 Too Many Requests error.
public type TooManyRequestsError distinct '4XXStatusCodeError;
# Represents the HTTP 431 Request Header Fields Too Large error.
public type RequestHeaderFieldsTooLargeError distinct '4XXStatusCodeError;
# Represents the HTTP 451 Unavailable For Legal Reasons error.
public type UnavailableForLegalReasonsError distinct '4XXStatusCodeError;

# Represents the HTTP 500 Internal Server Error error.
public type ServerError distinct '5XXStatusCodeError;
# Represents the HTTP 501 Not Implemented error.
public type NotImplementedError distinct '5XXStatusCodeError;
# Represents the HTTP 502 Bad Gateway error.
public type BadGatewayError distinct '5XXStatusCodeError;
# Represents the HTTP 503 Service Unavailable error.
public type ServiceUnavailableError distinct '5XXStatusCodeError;
# Represents the HTTP 504 Gateway Timeout error.
public type GatewayTimeoutError distinct '5XXStatusCodeError;
# Represents the HTTP 505 HTTP Version Not Supported error.
public type HTTPVersionNotSupportedError distinct '5XXStatusCodeError;
# Represents the HTTP 506 Variant Also Negotiates error.
public type VariantAlsoNegotiatesError distinct '5XXStatusCodeError;
# Represents the HTTP 507 Insufficient Storage error.
public type InsufficientStorageError distinct '5XXStatusCodeError;
# Represents the HTTP 508 Loop Detected error.
public type LoopDetectedError distinct '5XXStatusCodeError;
# Represents the HTTP 510 Not Extended error.
public type NotExtendedError distinct '5XXStatusCodeError;
# Represents the HTTP 511 Network Authentication Required error.
public type NetworkAuthenticationRequiredError distinct '5XXStatusCodeError;


# Represents Service Not Found error.
public type ServiceNotFoundError NotFoundError & ServiceDispatchingError;
# Represents Bad Matrix Parameter in the request error.
public type BadMatrixParamError BadRequestError & ServiceDispatchingError;

# Represents an error, which occurred when the resource is not found during dispatching.
public type ResourceNotFoundError NotFoundError & ResourceDispatchingError;
# Represents an error, which occurred when the resource method is not allowed during dispatching.
public type ResourceMethodNotAllowedError MethodNotAllowedError & ResourceDispatchingError;
# Represents an error, which occurred when the media type is not supported during dispatching.
public type UnsupportedRequestMediaTypeError UnsupportedMediaTypeError & ResourceDispatchingError;
# Represents an error, which occurred when the payload is not acceptable during dispatching.
public type RequestNotAcceptableError NotAcceptableError & ResourceDispatchingError;
# Represents other internal server errors during dispatching.
public type ResourceDispatchingServerError ServerError & ResourceDispatchingError;

isolated function getErrorStatusCodeResponse(StatusCodeError err) returns StatusCodeResponse {
    if err is BadRequestError {
        return <BadRequest>{};
    } else if err is UnauthorizedError {
        return <Unauthorized>{};
    } else if err is PaymentRequiredError {
        return <PaymentRequired>{};
    } else if err is ForbiddenError {
        return <Forbidden>{};
    } else if err is NotFoundError {
        return <NotFound>{};
    } else if err is MethodNotAllowedError {
        return <MethodNotAllowed>{};
    } else if err is NotAcceptableError {
        return <NotAcceptable>{};
    } else if err is ProxyAuthenticationRequiredError {
        return <ProxyAuthenticationRequired>{};
    } else if err is RequestTimeoutError {
        return <RequestTimeout>{};
    } else if err is ConflictError {
        return <Conflict>{};
    } else if err is GoneError {
        return <Gone>{};
    } else if err is LengthRequiredError {
        return <LengthRequired>{};
    } else if err is PreconditionFailedError {
        return <PreconditionFailed>{};
    } else if err is PayloadTooLargeError {
        return <PayloadTooLarge>{};
    } else if err is URITooLongError {
        return <UriTooLong>{};
    } else if err is UnsupportedMediaTypeError {
        return <UnsupportedMediaType>{};
    } else if err is RangeNotSatisfiableError {
        return <RangeNotSatisfiable>{};
    } else if err is ExpectationFailedError {
        return <ExpectationFailed>{};
    } else if err is MisdirectedRequestError {
        return <MisdirectedRequest>{};
    } else if err is UnprocessableEntityError {
        return <UnprocessableEntity>{};
    } else if err is LockedError {
        return <Locked>{};
    } else if err is FailedDependencyError {
        return <FailedDependency>{};
    } else if err is UpgradeRequiredError {
        return <UpgradeRequired>{};
    } else if err is PreconditionRequiredError {
        return <PreconditionRequired>{};
    } else if err is TooManyRequestsError {
        return <TooManyRequests>{};
    } else if err is RequestHeaderFieldsTooLargeError {
        return <RequestHeaderFieldsTooLarge>{};
    } else if err is UnavailableForLegalReasonsError {
        return <UnavailableForLegalReasons>{};
    } else if err is ServerError {
        return <InternalServerError>{};
    } else if err is NotImplementedError {
        return <NotImplemented>{};
    } else if err is BadGatewayError {
        return <BadGateway>{};
    } else if err is ServiceUnavailableError {
        return <ServiceUnavailable>{};
    } else if err is GatewayTimeoutError {
        return <GatewayTimeout>{};
    } else if err is HTTPVersionNotSupportedError {
        return <HttpVersionNotSupported>{};
    } else if err is VariantAlsoNegotiatesError {
        return <VariantAlsoNegotiates>{};
    } else if err is InsufficientStorageError {
        return <InsufficientStorage>{};
    } else if err is LoopDetectedError {
        return <LoopDetected>{};
    } else if err is NotExtendedError {
        return <NotExtended>{};
    } else if err is NetworkAuthenticationRequiredError {
        return <NetworkAuthenticationRequired>{};
    }
    return <InternalServerError>{};
}
