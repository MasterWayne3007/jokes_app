import 'package:clean_framework/clean_framework_providers.dart';

import 'jokes_entity.dart';

class JokesUseCase extends UseCase<JokesEntity> {
  JokesUseCase()
      : super(
          entity: JokesEntity(),
          outputFilters: {
            BoredUIOutput: (JokesEntity e) {
              return BoredUIOutput(
                isLoading: e.isLoading,
                setup: e.setup,
                delivery: e.delivery,
              );
            },
          },
        );

  Future<void> fetch() async {
    entity = entity.merge(isLoading: true);

    return request<JokesGatewayOutput, JokesSuccessInput>(
      JokesGatewayOutput(),
      onSuccess: (successInput) => entity.merge(
        isLoading: false,
        setup: successInput.setup,
        delivery: successInput.delivery,
      ),
      onFailure: (failure) => entity.merge(isLoading: false),
    );
  }
}

class BoredUIOutput extends Output {
  BoredUIOutput({
    required this.isLoading,
    required this.setup,
    required this.delivery,
  });

  final bool isLoading;
  final String setup;
  final String delivery;

  @override
  List<Object?> get props => [isLoading, setup, delivery];
}

class JokesGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class JokesSuccessInput extends SuccessInput {
  final String? setup;
  final String? delivery;

  JokesSuccessInput({
    required this.setup,
    required this.delivery,
  });

  factory JokesSuccessInput.fromJson(Map<String, dynamic> json) {
    return JokesSuccessInput(
      setup: json['setup'],
      delivery: json['delivery'],
    );
  }
}
