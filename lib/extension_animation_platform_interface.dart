import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'extension_animation_method_channel.dart';

abstract class ExtensionAnimationPlatform extends PlatformInterface {
  /// Constructs a ExtensionAnimationPlatform.
  ExtensionAnimationPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExtensionAnimationPlatform _instance = MethodChannelExtensionAnimation();

  /// The default instance of [ExtensionAnimationPlatform] to use.
  ///
  /// Defaults to [MethodChannelExtensionAnimation].
  static ExtensionAnimationPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExtensionAnimationPlatform] when
  /// they register themselves.
  static set instance(ExtensionAnimationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
