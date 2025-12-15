abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.errorMessage);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.errorMessage);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.errorMessage);
}
