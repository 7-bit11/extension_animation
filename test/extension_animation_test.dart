import 'package:flutter_test/flutter_test.dart';
import 'package:extension_animation/extension_animation.dart';
import 'package:extension_animation/extension_animation_platform_interface.dart';
import 'package:extension_animation/extension_animation_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExtensionAnimationPlatform
    with MockPlatformInterfaceMixin
    implements ExtensionAnimationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ExtensionAnimationPlatform initialPlatform = ExtensionAnimationPlatform.instance;

  test('$MethodChannelExtensionAnimation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExtensionAnimation>());
  });

  test('getPlatformVersion', () async {
    ExtensionAnimation extensionAnimationPlugin = ExtensionAnimation();
    MockExtensionAnimationPlatform fakePlatform = MockExtensionAnimationPlatform();
    ExtensionAnimationPlatform.instance = fakePlatform;

    expect(await extensionAnimationPlugin.getPlatformVersion(), '42');
  });
}
