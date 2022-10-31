import 'package:movies_app/core/network/error_message_model.dart';

class ExceptionRemoteDateBase implements Exception{

  final ErrorMessageModel errorMessageModel ;

  ExceptionRemoteDateBase({
    required this.errorMessageModel ,
});

}