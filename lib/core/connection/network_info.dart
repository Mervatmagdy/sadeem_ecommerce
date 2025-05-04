//!data_connection_checker_tv
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final connectionChecker = GetIt.instance<DataConnectionChecker>();

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
