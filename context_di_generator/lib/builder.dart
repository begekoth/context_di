import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator/feature_generator.dart';

Builder featureBuilder(BuilderOptions options) => SharedPartBuilder(
      [FeatureGenerator()],
      'feature',
    );
