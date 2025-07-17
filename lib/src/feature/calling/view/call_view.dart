import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lacumrade_arena/src/core/app_constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallView extends StatelessWidget {
  const CallView({super.key, required this.callID, required this.name});
  final String callID;
  final String name;
  @override
  Widget build(BuildContext context) {
    // Generate a 12-digit random number as user ID
    String userId = (List.generate(
      12,
      (index) => (index == 0
          ? (1 + (DateTime.now().millisecondsSinceEpoch % 9))
          : (DateTime.now().microsecondsSinceEpoch % 10)),
    ).join());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: TextButton.icon(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: callID));
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Meeting code copied')));
        },
        label: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('Copy call code$callID', style: TextStyle()),
        ),
      ),
      body: ZegoUIKitPrebuiltCall(
        appID: AppConstants
            .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: AppConstants
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: name,
        callID: '123456789',
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
      ),
    );
  }
}
