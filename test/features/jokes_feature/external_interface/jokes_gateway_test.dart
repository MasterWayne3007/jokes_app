import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_entity.dart';
import 'package:jokes_app/providers.dart';

import '../domain/jokes_use_case_test.dart';

void main() {
  group('JokesGateway tests :: ', () {
    test('fetches jokes with setup and delivery', () async {
      final useCase = jokesUseCaseProvider.getUseCaseFromContext(
        providersContext,
      );
      final gateway = jokesGatewayProvider.getGateway(providersContext);

      gateway.transport = (request) async {
        return Right(
          RestSuccessResponse(
            data: const {"delivery": delivery, "setup": setup},
          ),
        );
      };

      await useCase.fetch();

      expect(
        useCase.entity,
        JokesEntity( setup: setup, delivery: delivery),
      );
    });
  });
}