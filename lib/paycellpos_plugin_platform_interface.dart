import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'paycellpos_plugin_method_channel.dart';

abstract class PaycellposPluginPlatform extends PlatformInterface {
  /// Constructs a PaycellposPluginPlatform.
  PaycellposPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static PaycellposPluginPlatform _instance = MethodChannelPaycellposPlugin();

  /// The default instance of [PaycellposPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelPaycellposPlugin].
  static PaycellposPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PaycellposPluginPlatform] when
  /// they register themselves.
  static set instance(PaycellposPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> startOperation(String data) {
    throw UnimplementedError('startOperation() has not been implemented.');
  }

  Future<String?> completeOperation(String data) {
    throw UnimplementedError('completeOperation() has not been implemented.');
  }
}
