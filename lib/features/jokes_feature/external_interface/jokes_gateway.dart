
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_use_case.dart';

import '../../../providers.dart';

class JokesGateway
    extends RestGateway<JokesGatewayOutput, JokesRequest, JokesSuccessInput> {
  JokesGateway()
      : super(context: providersContext, provider: jokesUseCaseProvider);

  @override
  JokesRequest buildRequest(JokesGatewayOutput output) {
    return JokesRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: 'test');
  }

  @override
  JokesSuccessInput onSuccess(RestSuccessResponse response) {
    return JokesSuccessInput.fromJson(response.data);
  }
}

class JokesRequest extends GetRestRequest {
  @override
  String get path => '/joke/Any';
}
