import 'package:json_annotation/json_annotation.dart';

part 'preference.g.dart';

@JsonSerializable(includeIfNull: false)
class Preference {
  static Preference fromJson(Map<String, dynamic> json) => _$PreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceToJson(this);

  Preference();

  bool receiveEmails;
  String selectedTheme;
}
