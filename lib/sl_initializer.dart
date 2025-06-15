import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:code_test/sl_initializer.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$init',
  asExtension: false,
  includeMicroPackages: false,
)
abstract final class SLInitializer {
  static final Completer<void> _initCompleter = Completer<void>();

  static Future<void> get initFuture => _initCompleter.future;

  static Future<void> init(GetIt getIt) async {
    if (_initCompleter.isCompleted) return;
     $init(getIt);

    if (!_initCompleter.isCompleted) {
      _initCompleter.complete();
    }
  }
}
