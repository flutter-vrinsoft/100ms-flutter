import 'package:hmssdk_flutter/hmssdk_flutter.dart';

class HMSSDKInteractor implements HMSActionResultListener {
  late HMSConfig config;
  late List<HMSMessage> messages;
  late HMSMeeting _meeting;

  HMSSDKInteractor() {
    _meeting = HMSMeeting();
    _meeting.build();
  }

  Future<void> joinMeeting({required HMSConfig config}) async {
    this.config = config;
    await _meeting.joinMeeting(config: this.config);
  }

  Future<void> leaveMeeting() async {
    _meeting.leaveMeeting(hmsActionResultListener: this);
  }

  Future<void> switchAudio({bool isOn = false}) async {
    return await _meeting.switchAudio(isOn: isOn);
  }

  Future<void> switchVideo({bool isOn = false}) async {
    return await _meeting.switchVideo(isOn: isOn);
  }

  Future<void> switchCamera() async {
    return await _meeting.switchCamera();
  }

  Future<void> sendMessage(String message) async {
    return await _meeting.sendMessage(message);
  }

  Future<void> sendDirectMessage(String message, String peerId) async {
    return await _meeting.sendDirectMessage(message, peerId);
  }

  Future<void> sendGroupMessage(String message, String roleName) async {
    return await _meeting.sendGroupMessage(message, roleName);
  }

  Future<void> previewVideo({required HMSConfig config}) async {
    this.config = config;
    return _meeting.previewVideo(config: config);
  }

  void startHMSLogger(HMSLogLevel webRtclogLevel, HMSLogLevel logLevel) {
    _meeting.startHMSLogger(webRtclogLevel, logLevel);
  }

  void removeHMSLogger() {
    _meeting.removeHMSLogger();
  }

  void addLogsListener(HMSLogListener hmsLogListener) {
    _meeting.addLogListener(hmsLogListener);
  }

  void removeLogsListener(HMSLogListener hmsLogListener) {
    _meeting.removeLogListener(hmsLogListener);
  }

  void addMeetingListener(HMSUpdateListener listener) {
    _meeting.addMeetingListener(listener);
  }

  void removeMeetingListener(HMSUpdateListener listener) {
    _meeting.removeMeetingListener(listener);
  }

  void addPreviewListener(HMSPreviewListener listener) {
    _meeting.addPreviewListener(listener);
  }

  void removePreviewListener(HMSPreviewListener listener) {
    _meeting.removePreviewListener(listener);
  }

  void acceptRoleChangeRequest() {
    _meeting.acceptRoleChangerequest();
  }

  void stopCapturing() {
    _meeting.stopCapturing();
  }

  Future<HMSPeer?> getLocalPeer() async {
    return await _meeting.getLocalPeer();
  }

  void startCapturing() {
    _meeting.startCapturing();
  }

  void changeTrackRequest(String peerId, bool mute, bool isVideoTrack) {
    _meeting.changeTrackRequest(peerId, mute, isVideoTrack);
  }

  Future<bool> endRoom(bool lock) async {
    bool ended = await _meeting.endRoom(lock);
    return ended;
  }

  void removePeer(String peerId) {
    _meeting.removePeer(peerId);
  }

  void changeRole(
      {required String peerId,
      required String roleName,
      bool forceChange = false}) {
    _meeting.changeRole(
        peerId: peerId, roleName: roleName, forceChange: forceChange);
  }

  Future<List<HMSRole>> getRoles() async {
    return _meeting.getRoles();
  }

  Future<bool> isAudioMute(HMSPeer? peer) async {
    bool isMute = await _meeting.isAudioMute(peer);
    return isMute;
  }

  Future<bool> isVideoMute(HMSPeer? peer) async {
    bool isMute = await _meeting.isVideoMute(peer);
    return isMute;
  }

  void muteAll() {
    _meeting.muteAll();
  }

  void unMuteAll() {
    _meeting.unMuteAll();
  }

  Future<HMSException?> startRtmpOrRecording(
      HMSRecordingConfig hmsRecordingConfig) async {
    return await _meeting.startRtmpOrRecording(hmsRecordingConfig);
  }

  Future<HMSException?> stopRtmpAndRecording() async {
    return await _meeting.stopRtmpAndRecording();
  }

  Future<HMSRoom?> getRoom() async {
    return await _meeting.getRoom();
  }

  @override
  void onError({HMSException? hmsException}) {
    print("HMSSdkInteractor onError");
  }

  @override
  void onSuccess() {
    print("HMSSdkInteractor onSuccess");
  }
}
