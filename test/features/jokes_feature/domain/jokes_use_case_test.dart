
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_entity.dart';
import 'package:jokes_app/features/jokes_feature/domain/jokes_use_case.dart';
import 'package:jokes_app/providers.dart';


const String setup = "How much did your chimney cost?";
const String delivery = "Nothing, it was on the house.";

void main() {
  JokesUseCase getLyricsUseCase() {
    return jokesUseCaseProvider.getUseCaseFromContext(
      providersContext,
    );
  }

  setUp(() {
    resetProvidersContext();
    restExternalInterface.getExternalInterface(providersContext);
  });

  group('JokesUseCase tests :: ', () {
    test('fetches joke for default setup and delivery successfully', () async {
      final useCase = getLyricsUseCase();

      expect(
        useCase.entity,
       JokesEntity(
            isLoading: false,
         setup: '',
         delivery: ''
        ),
      );

      expectLater(
        useCase.stream,
        emitsInOrder(
          [
            JokesEntity(isLoading: true,setup: '',delivery: ''),
            isA<JokesEntity>()
                .having((e) => e.isLoading, 'isLoading', isFalse).having((e) => e.setup, 'setup', '').having((e )=>e.delivery, 'delivery', '')

          ],
        ),
      );

      await useCase.fetch();
      useCase.dispose();
    });
  });
}