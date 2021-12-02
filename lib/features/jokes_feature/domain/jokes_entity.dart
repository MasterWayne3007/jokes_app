import 'package:clean_framework/clean_framework_providers.dart';

class JokesEntity extends Entity {
  JokesEntity({
    this.isLoading = false,
    this.setup = '',
    this.delivery = '',
  });

  final bool isLoading;
  final String setup;
  final String delivery;

  @override
  List<Object?> get props => [isLoading, setup, delivery];

  JokesEntity merge({
    bool? isLoading,
    String? setup,
    String? delivery,
  }) {
    return JokesEntity(
      isLoading: isLoading ?? this.isLoading,
      setup: setup ?? this.setup,
      delivery: delivery ?? this.delivery,
    );
  }
}
