import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';

abstract class BaseUseCase <T , Parameters> {
  Future<Either<ExceptionRemoteDateBase, T >> call(Parameters parameters) ;
}


class NoParameters extends Equatable{
  const NoParameters() ;
  @override
  List<Object?> get props => [
   const NoParameters() ,
  ];
}