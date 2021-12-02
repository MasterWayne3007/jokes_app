import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart'
    hide FeatureState;

import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';

import 'features.dart';
import 'features/jokes_feature/domain/jokes_entity.dart';
import 'features/jokes_feature/domain/jokes_use_case.dart';
import 'features/jokes_feature/external_interface/jokes_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

@visibleForTesting
void resetProvidersContext([ProvidersContext? context]) {
  _providersContext = context ?? ProvidersContext();
}

final featureStatesProvider =
    FeatureStateProvider<FeatureState, ExampleFeatureMapper>(
  (_) => ExampleFeatureMapper(),
);

final jokesUseCaseProvider = UseCaseProvider<JokesEntity, JokesUseCase>(
  (_) => JokesUseCase(),
);

final jokesGatewayProvider = GatewayProvider<JokesGateway>(
  (_) => JokesGateway(),
);

final restExternalInterface = ExternalInterfaceProvider(
  (_) => RestExternalInterface(
    baseUrl: 'https://v2.jokeapi.dev',
    gatewayConnections: [
      () => jokesGatewayProvider.getGateway(providersContext),
    ],
  ),
);

void loadProviders() {
  jokesUseCaseProvider.getUseCaseFromContext(providersContext);
  jokesGatewayProvider.getGateway(providersContext);
  restExternalInterface.getExternalInterface(providersContext);
}
