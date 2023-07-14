abstract class Failure {
  String message;
  Failure({this.message = 'Failure'});
}

// ignore: must_be_immutable
class ServerFailure extends Failure {
  ServerFailure({message = 'Server Failure'}) : super(message: message);
}

class ClientFailure extends Failure {
  ClientFailure({message = 'Client Failure'}) : super(message: message);
}

// ignore: must_be_immutable
class CacheFailure extends Failure {
  CacheFailure({message = 'Cache Failure'}) : super(message: message);
}

// ignore: must_be_immutable
class TimeOutFailure extends Failure {
  TimeOutFailure({message = "Timeout"}) : super(message: message);
}

// ignore: must_be_immutable
class ApiResponseFailure extends Failure {
  ApiResponseFailure({message = 'Api response Failure'})
      : super(message: message);
}

// ignore: must_be_immutable
class ApiDataFailure extends Failure {
  ApiDataFailure({message = 'Api response Failure'}) : super(message: message);
}
