// Package imports:
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'context_manager.dart';

final getIt = GetIt.instance;

///InjectionManager: Clase que se encarga de manejar la inyección de dependencias
class InjectionManager {
  static void setupInjections() {
    getIt.registerSingleton<ContextManager>(ContextManager());

  }
}
