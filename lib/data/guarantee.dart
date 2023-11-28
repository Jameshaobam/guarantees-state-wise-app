// To parse this JSON data, do
//
//     final guarantee = guaranteeFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'guarantee.freezed.dart';
part 'guarantee.g.dart';

Guarantee guaranteeFromJson(String str) => Guarantee.fromJson(json.decode(str));

String guaranteeToJson(Guarantee data) => json.encode(data.toJson());

@freezed
class Guarantee with _$Guarantee {
  const factory Guarantee({
    @JsonKey(name: "sr_no_") required String srNo,
    @JsonKey(name: "states_uts") required String statesUts,
    @JsonKey(
        name: "number_of_cumulative_since_inception_in_2000_till_28_02_2023")
    required int numberOfCumulativeSinceInceptionIn2000Till28022023,
    @JsonKey(
        name: "amount_of_cumulative_since_inception_in_2000_till_28_02_2023")
    required int amountOfCumulativeSinceInceptionIn2000Till28022023,
  }) = _Guarantee;

  factory Guarantee.fromJson(Map<String, dynamic> json) =>
      _$GuaranteeFromJson(json);
}
