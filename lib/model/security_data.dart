import 'dart:convert';

class EncryptData {
  const EncryptData({
    this.id,
    this.serverUrl,
    this.deviceId,
    this.publicKey,
    this.isMobileDevice,
    this.deviceToken,
  });

  factory EncryptData.fromJson(Map json) {
    return EncryptData(
      id: json['id'],
      serverUrl: json['serverUrl'],
      deviceId: json['deviceId'],
      publicKey: json['publicKey'],
      deviceToken: json['deviceToken'],
      isMobileDevice: json['isMobileDevice'] == 1,
    );
  }

  final String? publicKey;
  final String? serverUrl;
  final String? deviceId;
  final String? id;
  final bool? isMobileDevice;
  final String? deviceToken;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['serverUrl'] = serverUrl;
    data['deviceId'] = deviceId;
    data['publicKey'] = publicKey;
    data['isMobileDevice'] = isMobileDevice;
    data['deviceToken'] = deviceToken;

    return data;
  }
}

class SecurityData extends EncryptData {
  const SecurityData({
    this.serverId,
    this.timestamp,
    super.deviceId,
    super.publicKey,
    super.serverUrl,
    super.id, // this is the user id
    super.deviceToken,
    super.isMobileDevice,
  }) : super();

  factory SecurityData.fromJson(Map json) {
    return SecurityData(
      id: json['id'],
      serverUrl: json['serverUrl'],
      deviceId: json['deviceId'],
      publicKey: json['publicKey'],
      serverId: json['serverId'],
      timestamp: json['timestamp'],
      deviceToken: json['deviceToken'],
      isMobileDevice: json['isMobileDevice'] == 1,
    );
  }

  final String? serverId;
  final String? timestamp;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['serverId'] = serverId;
    data['timestamp'] = timestamp;

    return data;
  }

  String serialize() {
    final Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static EncryptData deserialize(String data) {
    final Map decoded = json.decode(data);
    return EncryptData.fromJson(decoded);
  }
}
