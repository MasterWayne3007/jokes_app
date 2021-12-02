import 'package:clean_framework/clean_framework.dart';

const jokesFeature = Feature(name: 'jokes');

enum FeatureState { hidden, active, forbidden }

class ExampleFeatureMapper extends FeatureMapper<FeatureState> {
  static const Map<String, FeatureState> _jsonStateToFeatureStateMap = {
    'HIDDEN': FeatureState.hidden,
    'ACTIVE': FeatureState.active,
    'FORBIDDEN': FeatureState.forbidden,
  };

  @override
  FeatureState parseState(String state) {
    return _jsonStateToFeatureStateMap[state] ?? defaultState;
  }

  @override
  get defaultState => FeatureState.hidden;
}
