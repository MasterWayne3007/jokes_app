
import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';

import 'package:jokes_app/features/jokes_feature/domain/jokes_use_case.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_view_model.dart';

import '../../../providers.dart';


class JokesPresenter
    extends Presenter<JokesViewModel, BoredUIOutput, JokesUseCase> {
  JokesPresenter({required PresenterBuilder<JokesViewModel> builder})
      : super(
    builder: builder,
    provider: jokesUseCaseProvider,
  );

  @override
  void onLayoutReady(BuildContext context, JokesUseCase useCase) {
    useCase.fetch();
  }

  @override
  JokesViewModel createViewModel(
      JokesUseCase useCase,
      BoredUIOutput output,
      ) {
    return JokesViewModel(
      isLoading: output.isLoading,
      setup: output.setup,
      delivery: output.delivery,
      fetch: useCase.fetch,
    );
  }
}
