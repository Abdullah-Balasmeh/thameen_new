import 'package:thameen/generated/l10n.dart';

String mapFirebaseErrorToMessage(String code) {
  switch (code) {
    // Common errors (sign-up + sign-in)
    case 'invalid-email':
      return S.current.errorInvalidEmail;

    case 'user-disabled':
      return S.current.errorUserDisabled;
    case 'invalid-credential':
    case 'user-not-found':
    case 'wrong-password':
      return S.current.errorInvalidCredential;

    case 'email-already-in-use':
      return S.current.errorEmailAlreadyInUse;

    case 'weak-password':
      return S.current.errorWeakPassword;

    case 'operation-not-allowed':
      return S.current.errorOperationNotAllowed;

    case 'network-request-failed':
      return S.current.errorNetworkRequestFailed;

    case 'too-many-requests':
      return S.current.errorTooManyRequests;

    case 'internal-error':
      return S.current.errorInternalError;

    case 'invalid-api-key':
      return S.current.errorInvalidApiKey;

    case 'account-exists-with-different-credential':
      return S.current.errorAccountExistsWithDifferentCredential;

    case 'credential-already-in-use':
      return S.current.errorCredentialAlreadyInUse;

    case 'argument-error':
      return S.current.errorArgumentError;

    case 'popup-closed-by-user':
      return S.current.errorPopupClosedByUser;

    case 'unauthorized-domain':
      return S.current.errorUnauthorizedDomain;

    case 'sign_in_failed':
      return S.current.errorSignInFailed;

    default:
      return S.current.errorUnknown;
  }
}
