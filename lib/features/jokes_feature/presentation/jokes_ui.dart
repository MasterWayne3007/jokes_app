import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_view_model.dart';

import 'jokes_presenter.dart';

class JokesUI extends UI<JokesViewModel> {
  @override
  Presenter create(builder) => JokesPresenter(builder: builder);

  @override
  Widget build(BuildContext context, JokesViewModel boredViewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        title: const Text('Time for a short joke'),
      ),
      body: _LazyRandomCatWidget(
        isLoading: boredViewModel.isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(boredViewModel.setup, style: const TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
            Text(boredViewModel.delivery, style: const TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),

            Padding(
              padding: const EdgeInsets.all(32),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.white10,
                  side: const BorderSide(color: Colors.white),
                ),
                onPressed:()=> boredViewModel.fetch(),

                child: const Text('Tell me another joke'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LazyRandomCatWidget extends StatelessWidget {
  const _LazyRandomCatWidget({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 1),
            ),
            const SizedBox(width: 10),
            Text(
              'Get ready to laugh it out!',
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      )
          : child,
    );
  }
}
