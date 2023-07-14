class Application {
  static bool debug = false;
  static String title = "News App";

  /// Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
