import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Map<String, String>? languages;
  bool? landlocked;
  List<String>? borders;
  Demonyms? demonyms;
  String? cca3;
  Map<String, Translation>? translations;
  String? flag;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  PostalCode? postalCode;

  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.landlocked,
    this.borders,
    this.demonyms,
    this.cca3,
    this.translations,
    this.flag,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,

    this.postalCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    name: json["name"] == null ? null : Name.fromJson(json["name"]),
    tld: json["tld"] == null ? [] : List<String>.from(json["tld"]!.map((x) => x)),
    cca2: json["cca2"],
    ccn3: json["ccn3"],
    cioc: json["cioc"],
    independent: json["independent"],
    status: json["status"],
    unMember: json["unMember"],
    currencies: json["currencies"] == null ? null : Currencies.fromJson(json["currencies"]),
    idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
    capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
    altSpellings: json["altSpellings"] == null ? [] : List<String>.from(json["altSpellings"]!.map((x) => x)),
    region: json["region"],
    subregion: json["subregion"],
    languages: json["languages"] == null ? null : Map<String, String>.from(json["languages"]),
    landlocked: json["landlocked"],
    borders: json["borders"] == null ? [] : List<String>.from(json["borders"]!.map((x) => x)),
    demonyms: json["demonyms"] == null ? null : Demonyms.fromJson(json["demonyms"]),
    cca3: json["cca3"],
    translations: Map.from(json["translations"]!).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
    flag: json["flag"],
    maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
    population: json["population"],
    gini: json["gini"] == null ? null : Gini.fromJson(json["gini"]),
    fifa: json["fifa"],
    car: json["car"] == null ? null : Car.fromJson(json["car"]),
    timezones: json["timezones"] == null ? [] : List<String>.from(json["timezones"]!.map((x) => x)),
    continents: json["continents"] == null ? [] : List<String>.from(json["continents"]!.map((x) => x)),
    flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
    coatOfArms: json["coatOfArms"] == null ? null : CoatOfArms.fromJson(json["coatOfArms"]),
    startOfWeek: json["startOfWeek"],

    postalCode: json["postalCode"] == null ? null : PostalCode.fromJson(json["postalCode"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name?.toJson(),
    "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
    "cca2": cca2,
    "ccn3": ccn3,
    "cioc": cioc,
    "independent": independent,
    "status": status,
    "unMember": unMember,
    "currencies": currencies?.toJson(),
    "idd": idd?.toJson(),
    "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
    "altSpellings": altSpellings == null ? [] : List<dynamic>.from(altSpellings!.map((x) => x)),
    "region": region,
    "subregion": subregion,
    "languages": languages,
    "landlocked": landlocked,
    "borders": borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
    "demonyms": demonyms?.toJson(),
    "cca3": cca3,
    "translations": Map.from(translations!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "flag": flag,
    "maps": maps?.toJson(),
    "population": population,
    "gini": gini?.toJson(),
    "fifa": fifa,
    "car": car?.toJson(),
    "timezones": timezones == null ? [] : List<dynamic>.from(timezones!.map((x) => x)),
    "continents": continents == null ? [] : List<dynamic>.from(continents!.map((x) => x)),
    "flags": flags?.toJson(),
    "coatOfArms": coatOfArms?.toJson(),
    "startOfWeek": startOfWeek,

    "postalCode": postalCode?.toJson(),
  };
}



class Car {
  List<String>? signs;
  String? side;

  Car({
    this.signs,
    this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    signs: json["signs"] == null ? [] : List<String>.from(json["signs"]!.map((x) => x)),
    side: json["side"],
  );

  Map<String, dynamic> toJson() => {
    "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
    "side": side,
  };
}

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
    png: json["png"],
    svg: json["svg"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
  };
}

class Currencies {
  Eur? eur;

  Currencies({
    this.eur,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
    eur: json["EUR"] == null ? null : Eur.fromJson(json["EUR"]),
  );

  Map<String, dynamic> toJson() => {
    "EUR": eur?.toJson(),
  };
}

class Eur {
  String? symbol;
  String? name;

  Eur({
    this.symbol,
    this.name,
  });

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
    symbol: json["symbol"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
    "name": name,
  };
}

class Demonyms {
  Eng? eng;
  Eng? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
    eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
    fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
  );

  Map<String, dynamic> toJson() => {
    "eng": eng?.toJson(),
    "fra": fra?.toJson(),
  };
}

class Eng {
  String? f;
  String? m;

  Eng({
    this.f,
    this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
    f: json["f"],
    m: json["m"],
  );

  Map<String, dynamic> toJson() => {
    "f": f,
    "m": m,
  };
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({
    this.png,
    this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json["png"],
    svg: json["svg"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "png": png,
    "svg": svg,
    "alt": alt,
  };
}

class Gini {
  double? the2016;

  Gini({
    this.the2016,
  });

  factory Gini.fromJson(Map<String, dynamic> json) => Gini(
    the2016: json["2016"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "2016": the2016,
  };
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
    root: json["root"],
    suffixes: json["suffixes"] == null ? [] : List<String>.from(json["suffixes"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "root": root,
    "suffixes": suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
  };
}


class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
    googleMaps: json["googleMaps"],
    openStreetMaps: json["openStreetMaps"],
  );

  Map<String, dynamic> toJson() => {
    "googleMaps": googleMaps,
    "openStreetMaps": openStreetMaps,
  };
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": nativeName?.toJson(),
  };
}

class NativeName {
  Translation? deu;

  NativeName({
    this.deu,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    deu: json["deu"] == null ? null : Translation.fromJson(json["deu"]),
  );

  Map<String, dynamic> toJson() => {
    "deu": deu?.toJson(),
  };
}

class Translation {
  String? official;
  String? common;

  Translation({
    this.official,
    this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({
    this.format,
    this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
    format: json["format"],
    regex: json["regex"],
  );

  Map<String, dynamic> toJson() => {
    "format": format,
    "regex": regex,
  };
}
