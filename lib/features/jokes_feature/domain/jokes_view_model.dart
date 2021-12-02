import 'package:clean_framework/clean_framework_providers.dart';

class JokesViewModel extends ViewModel {
  JokesViewModel({
    required this.isLoading,
    required this.setup,
    required this.delivery,
    required this.fetch,
  });

  final bool isLoading;
  final String setup;
  final String delivery;
  final Future<void> Function() fetch;

  @override
  List<Object?> get props => [isLoading, setup, delivery];
}
