import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  String error;
  Failure({required this.error});
  @override
  List<Object> get props => [error];
}

class ServerFailure extends Failure {
  String error;
  ServerFailure({required this.error}) : super(error: '');
}
class UnexpectedFailure extends Failure {
    String error;
  UnexpectedFailure({required this.error}) : super(error: '');
}
