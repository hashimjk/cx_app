class CurrencyModel {
  String? result;
  String? documentation;
  String? termsOfUse;
  double? timeLastUpdateUnix;
  String? timeLastUpdateUtc;
  double? timeNextUpdateUnix;
  String? timeNextUpdateUtc;
  String? baseCode;
  ConversionRates? conversionRates;

  CurrencyModel({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.timeLastUpdateUnix,
    this.timeLastUpdateUtc,
    this.timeNextUpdateUnix,
    this.timeNextUpdateUtc,
    this.baseCode,
    this.conversionRates,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      result: json['result'],
      documentation: json['documentation'],
      termsOfUse: json['terms_of_use'],
      timeLastUpdateUnix: json['time_last_update_unix']?.toDouble(),
      timeLastUpdateUtc: json['time_last_update_utc'],
      timeNextUpdateUnix: json['time_next_update_unix']?.toDouble(),
      timeNextUpdateUtc: json['time_next_update_utc'],
      baseCode: json['base_code'],
      conversionRates:
          json['conversion_rates'] != null
              ? ConversionRates.fromJson(json['conversion_rates'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['documentation'] = documentation;
    data['terms_of_use'] = termsOfUse;
    data['time_last_update_unix'] = timeLastUpdateUnix;
    data['time_last_update_utc'] = timeLastUpdateUtc;
    data['time_next_update_unix'] = timeNextUpdateUnix;
    data['time_next_update_utc'] = timeNextUpdateUtc;
    data['base_code'] = baseCode;
    if (conversionRates != null) {
      data['conversion_rates'] = conversionRates!.toJson();
    }
    return data;
  }
}

class ConversionRates {
  Map<String, double?> rates;

  ConversionRates({required this.rates});

  factory ConversionRates.fromJson(Map<String, dynamic> json) {
    var ratesMap = <String, double?>{};
    json.forEach((key, value) {
      ratesMap[key] = (value is int) ? value.toDouble() : value;
    });
    return ConversionRates(rates: ratesMap);
  }

  Map<String, dynamic> toJson() {
    return rates;
  }
}
