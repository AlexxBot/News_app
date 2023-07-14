import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  String get url;
  String get apiKey;
  set url(String newUrl);
  set apiKey(String newApiKey);
  int get timeOut;

  get isConnected => null;
}

class NetworkInfoImple implements NetworkInfo {
  final Connectivity _connectivity;
  String _url;
  String _apiKey;
  final int _timeOut;
  NetworkInfoImple(this._connectivity, this._url, this._apiKey,
      [this._timeOut = 20]);

  @override
  Future<bool> get isConnected => isConnectedToNetwork();

  @override
  String get url => _url;

  @override
  set url(String newValue) {
    _url = newValue;
  }

  @override
  String get apiKey => _apiKey;

  @override
  set apiKey(String newValue) {
    _apiKey = newValue;
  }

  @override
  int get timeOut => _timeOut;

  Future<bool> isConnectedToNetwork() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
      return _updateConnectionStatus(result);
    } on Exception {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        /* case ConnectivityResult.none: */
        return true;
      default:
        return false;
    }
  }
}
