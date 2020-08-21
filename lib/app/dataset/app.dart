class App {
  static App _instance;
  static App getInstance() {
    if (_instance == null) {
      _instance = App();
    }
    return _instance;
  }
}
