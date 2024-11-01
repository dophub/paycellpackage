import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'paycellpos_plugin_platform_interface.dart';

/// An implementation of [PaycellposPluginPlatform] that uses method channels.
class MethodChannelPaycellposPlugin extends PaycellposPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('paycellpos_plugin');

  @override
  Future<String?> startOperation(String data) async {
    return await methodChannel.invokeMethod<String>('startOperation', data);
  }

  @override
  Future<String?> completeOperation(String data) async {
    return await methodChannel.invokeMethod<String>('completeOperation', data);
  }

  @override
  Future<String?> getPaymentDetail(String data) async {
    return await methodChannel.invokeMethod<String>('getPaymentDetail', data);
  }
}
