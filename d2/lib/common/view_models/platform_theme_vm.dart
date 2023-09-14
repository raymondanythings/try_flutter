import 'package:d2/common/models/platform_theme_model.dart';
import 'package:d2/common/repositories/platform_theme_repository.dart';
import 'package:flutter/cupertino.dart';

class PlatformThemeViewModel extends ChangeNotifier {
  final PlatformThemeRepository _repository;
  final bool isSystemDark;

  late final PlatformThemeModel _model = PlatformThemeModel(
    isDarkMode: _repository.getTheme() ?? isSystemDark,
  );

  bool get isDarkMode => _model.isDarkMode;

  void setTheme(bool value) {
    _repository.setTheme(value);
    _model.isDarkMode = value;
    notifyListeners();
  }

  PlatformThemeViewModel(
    this._repository,
    this.isSystemDark,
  );
}
