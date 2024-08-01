import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'extension_animation_platform_interface.dart';

/// An implementation of [ExtensionAnimationPlatform] that uses method channels.
class MethodChannelExtensionAnimation extends ExtensionAnimationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('extension_animation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
