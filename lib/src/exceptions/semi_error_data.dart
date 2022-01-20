/*
 Created by Thanh Son on 1/19/2022.
 Copyright (c) 2022 . All rights reserved.
*/

/// Error code
///
class SemiErrorCode {
// unknown
  static const unknown = 'unknown';

// timeout
  static const timeout = 'timeout';

// out of memory
  static const outOfMemory = 'out-of-memory';

// permission denied
  static const permissionDenied = 'permission-denied';

// null data error
  static const nullDataError = 'null-data-error';

// cast data error
  static const castDataError = 'cast-data-error';

// index out of bounds
  static const indexOutOfBounds = 'index-out-of-bounds';

// empty list
  static const emptyList = 'empty-list';

// whitespace
  static const whitespace = 'whitespace';

/* file and network error */

// no internet access
  static const noInternetAccess = 'no-internet-access';

// access denied
  static const accessDenied = 'access-denied';

// connection fail
  static const connectionFail = 'connection-fail';

//400
  static const badRequest = 'bad-request';

//401
  static const unauthorized = 'unauthorized';

//401
  static const forbidden = 'forbidden';

//404
  static const fileNotFound = 'file-not-found';

//405
  static const methodNotAllowed = 'methodNotAllowed';

// 408
  static const requestTimeOut = 'request-timeout';

// 500
  static const serverError = 'server-error';

// 501
  static const badGateway = 'bad-gateway';
}
