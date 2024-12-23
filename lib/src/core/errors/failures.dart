import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  String error;
  ServerFailure({required this.error});
}
class UnexpectedFailure extends Failure {}
