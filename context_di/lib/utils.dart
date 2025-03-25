import 'package:flutter/widgets.dart';

typedef Factory<T> = T Function(BuildContext context);
typedef ParamsFactory<T, P> = T Function(BuildContext context, P params);