import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone_app/resources/auth_methods.dart';
import 'package:zoom_clone_app/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = ''
  }) async {
    try {
      String? name;
      if(username.isEmpty) {
        name = _authMethods.user.displayName;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: name,
        userEmail: _authMethods.user.email,
        userAvatarUrl: _authMethods.user.photoURL,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch(e) {
      print("Jitsi error: $e");
    }
  }
}
