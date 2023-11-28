// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guarantee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuaranteeImpl _$$GuaranteeImplFromJson(Map<String, dynamic> json) =>
    _$GuaranteeImpl(
      srNo: json['sr_no_'] as String,
      statesUts: json['states_uts'] as String,
      numberOfCumulativeSinceInceptionIn2000Till28022023:
          json['number_of_cumulative_since_inception_in_2000_till_28_02_2023']
              as int,
      amountOfCumulativeSinceInceptionIn2000Till28022023:
          json['amount_of_cumulative_since_inception_in_2000_till_28_02_2023']
              as int,
    );

Map<String, dynamic> _$$GuaranteeImplToJson(_$GuaranteeImpl instance) =>
    <String, dynamic>{
      'sr_no_': instance.srNo,
      'states_uts': instance.statesUts,
      'number_of_cumulative_since_inception_in_2000_till_28_02_2023':
          instance.numberOfCumulativeSinceInceptionIn2000Till28022023,
      'amount_of_cumulative_since_inception_in_2000_till_28_02_2023':
          instance.amountOfCumulativeSinceInceptionIn2000Till28022023,
    };
