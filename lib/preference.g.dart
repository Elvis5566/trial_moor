// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  return Preference()
    ..receiveEmails = json['receiveEmails'] as bool
    ..selectedTheme = json['selectedTheme'] as String;
}

Map<String, dynamic> _$PreferenceToJson(Preference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('receiveEmails', instance.receiveEmails);
  writeNotNull('selectedTheme', instance.selectedTheme);
  return val;
}
