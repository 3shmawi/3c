class CountryModel {
  CountryModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
  });

  CountryModel.fromJson(dynamic json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    tld = json['tld'] != null ? json['tld'].cast<String>() : [];
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    idd = json['idd'] != null ? Idd.fromJson(json['idd']) : null;
    capital = json['capital'] != null ? json['capital'].cast<String>() : [];
    altSpellings =
        json['altSpellings'] != null ? json['altSpellings'].cast<String>() : [];
    region = json['region'];
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
    landlocked = json['landlocked'];
    // area = json['area'];
    demonyms =
        json['demonyms'] != null ? Demonyms.fromJson(json['demonyms']) : null;
    flag = json['flag'];
    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    timezones =
        json['timezones'] != null ? json['timezones'].cast<String>() : [];
    continents =
        json['continents'] != null ? json['continents'].cast<String>() : [];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms = json['coatOfArms'];
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null
        ? CapitalInfo.fromJson(json['capitalInfo'])
        : null;
  }

  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  Languages? languages;
  Translations? translations;
  List<double>? latlng;
  bool? landlocked;
  int? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  dynamic coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['tld'] = tld;
    map['cca2'] = cca2;
    map['ccn3'] = ccn3;
    map['cca3'] = cca3;
    map['independent'] = independent;
    map['status'] = status;
    map['unMember'] = unMember;
    if (currencies != null) {
      map['currencies'] = currencies?.toJson();
    }
    if (idd != null) {
      map['idd'] = idd?.toJson();
    }
    map['capital'] = capital;
    map['altSpellings'] = altSpellings;
    map['region'] = region;
    if (languages != null) {
      map['languages'] = languages?.toJson();
    }
    if (translations != null) {
      map['translations'] = translations?.toJson();
    }
    map['latlng'] = latlng;
    map['landlocked'] = landlocked;
    map['area'] = area;
    if (demonyms != null) {
      map['demonyms'] = demonyms?.toJson();
    }
    map['flag'] = flag;
    if (maps != null) {
      map['maps'] = maps?.toJson();
    }
    map['population'] = population;
    if (car != null) {
      map['car'] = car?.toJson();
    }
    map['timezones'] = timezones;
    map['continents'] = continents;
    if (flags != null) {
      map['flags'] = flags?.toJson();
    }
    map['coatOfArms'] = coatOfArms;
    map['startOfWeek'] = startOfWeek;
    if (capitalInfo != null) {
      map['capitalInfo'] = capitalInfo?.toJson();
    }
    return map;
  }
}

class CapitalInfo {
  CapitalInfo({
    this.latlng,
  });

  CapitalInfo.fromJson(dynamic json) {
    latlng = json['latlng'] != null ? json['latlng'].cast<double>() : [];
  }

  List<double>? latlng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latlng'] = latlng;
    return map;
  }
}

class Flags {
  Flags({
    this.png,
    this.svg,
  });

  Flags.fromJson(dynamic json) {
    png = json['png'];
    svg = json['svg'];
  }

  String? png;
  String? svg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['png'] = png;
    map['svg'] = svg;
    return map;
  }
}

class Car {
  Car({
    this.signs,
    this.side,
  });

  Car.fromJson(dynamic json) {
    signs = json['signs'] != null ? json['signs'].cast<String>() : [];
    side = json['side'];
  }

  List<String>? signs;
  String? side;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['signs'] = signs;
    map['side'] = side;
    return map;
  }
}

class Maps {
  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  Maps.fromJson(dynamic json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }

  String? googleMaps;
  String? openStreetMaps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['googleMaps'] = googleMaps;
    map['openStreetMaps'] = openStreetMaps;
    return map;
  }
}

class Demonyms {
  Demonyms({
    this.eng,
  });

  Demonyms.fromJson(dynamic json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
  }

  Eng? eng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (eng != null) {
      map['eng'] = eng?.toJson();
    }
    return map;
  }
}

class Eng {
  Eng({
    this.f,
    this.m,
  });

  Eng.fromJson(dynamic json) {
    f = json['f'];
    m = json['m'];
  }

  String? f;
  String? m;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['f'] = f;
    map['m'] = m;
    return map;
  }
}

class Translations {
  Translations({
    this.ara,
    this.bre,
    this.ces,
    this.cym,
    this.deu,
    this.est,
    this.fin,
    this.fra,
    this.hrv,
    this.hun,
    this.ita,
    this.jpn,
    this.kor,
    this.nld,
    this.per,
    this.pol,
    this.por,
    this.rus,
    this.slk,
    this.spa,
    this.srp,
    this.swe,
    this.tur,
    this.urd,
    this.zho,
  });

  Translations.fromJson(dynamic json) {
    ara = json['ara'] != null ? Ara.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? Bre.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? Ces.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Cym.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Deu.fromJson(json['deu']) : null;
    est = json['est'] != null ? Est.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Fin.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Fra.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Hrv.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Hun.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Ita.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Jpn.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Kor.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Nld.fromJson(json['nld']) : null;
    per = json['per'] != null ? Per.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Pol.fromJson(json['pol']) : null;
    por = json['por'] != null ? Por.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Rus.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Slk.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Spa.fromJson(json['spa']) : null;
    srp = json['srp'] != null ? Srp.fromJson(json['srp']) : null;
    swe = json['swe'] != null ? Swe.fromJson(json['swe']) : null;
    tur = json['tur'] != null ? Tur.fromJson(json['tur']) : null;
    urd = json['urd'] != null ? Urd.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Zho.fromJson(json['zho']) : null;
  }

  Ara? ara;
  Bre? bre;
  Ces? ces;
  Cym? cym;
  Deu? deu;
  Est? est;
  Fin? fin;
  Fra? fra;
  Hrv? hrv;
  Hun? hun;
  Ita? ita;
  Jpn? jpn;
  Kor? kor;
  Nld? nld;
  Per? per;
  Pol? pol;
  Por? por;
  Rus? rus;
  Slk? slk;
  Spa? spa;
  Srp? srp;
  Swe? swe;
  Tur? tur;
  Urd? urd;
  Zho? zho;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ara != null) {
      map['ara'] = ara?.toJson();
    }
    if (bre != null) {
      map['bre'] = bre?.toJson();
    }
    if (ces != null) {
      map['ces'] = ces?.toJson();
    }
    if (cym != null) {
      map['cym'] = cym?.toJson();
    }
    if (deu != null) {
      map['deu'] = deu?.toJson();
    }
    if (est != null) {
      map['est'] = est?.toJson();
    }
    if (fin != null) {
      map['fin'] = fin?.toJson();
    }
    if (fra != null) {
      map['fra'] = fra?.toJson();
    }
    if (hrv != null) {
      map['hrv'] = hrv?.toJson();
    }
    if (hun != null) {
      map['hun'] = hun?.toJson();
    }
    if (ita != null) {
      map['ita'] = ita?.toJson();
    }
    if (jpn != null) {
      map['jpn'] = jpn?.toJson();
    }
    if (kor != null) {
      map['kor'] = kor?.toJson();
    }
    if (nld != null) {
      map['nld'] = nld?.toJson();
    }
    if (per != null) {
      map['per'] = per?.toJson();
    }
    if (pol != null) {
      map['pol'] = pol?.toJson();
    }
    if (por != null) {
      map['por'] = por?.toJson();
    }
    if (rus != null) {
      map['rus'] = rus?.toJson();
    }
    if (slk != null) {
      map['slk'] = slk?.toJson();
    }
    if (spa != null) {
      map['spa'] = spa?.toJson();
    }
    if (srp != null) {
      map['srp'] = srp?.toJson();
    }
    if (swe != null) {
      map['swe'] = swe?.toJson();
    }
    if (tur != null) {
      map['tur'] = tur?.toJson();
    }
    if (urd != null) {
      map['urd'] = urd?.toJson();
    }
    if (zho != null) {
      map['zho'] = zho?.toJson();
    }
    return map;
  }
}

class Zho {
  Zho({
    this.official,
    this.common,
  });

  Zho.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Urd {
  Urd({
    this.official,
    this.common,
  });

  Urd.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Tur {
  Tur({
    this.official,
    this.common,
  });

  Tur.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Swe {
  Swe({
    this.official,
    this.common,
  });

  Swe.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Srp {
  Srp({
    this.official,
    this.common,
  });

  Srp.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Spa {
  Spa({
    this.official,
    this.common,
  });

  Spa.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Slk {
  Slk({
    this.official,
    this.common,
  });

  Slk.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Rus {
  Rus({
    this.official,
    this.common,
  });

  Rus.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Por {
  Por({
    this.official,
    this.common,
  });

  Por.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Pol {
  Pol({
    this.official,
    this.common,
  });

  Pol.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Per {
  Per({
    this.official,
    this.common,
  });

  Per.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Nld {
  Nld({
    this.official,
    this.common,
  });

  Nld.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Kor {
  Kor({
    this.official,
    this.common,
  });

  Kor.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Jpn {
  Jpn({
    this.official,
    this.common,
  });

  Jpn.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Ita {
  Ita({
    this.official,
    this.common,
  });

  Ita.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Hun {
  Hun({
    this.official,
    this.common,
  });

  Hun.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Hrv {
  Hrv({
    this.official,
    this.common,
  });

  Hrv.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Fra {
  Fra({
    this.official,
    this.common,
  });

  Fra.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Fin {
  Fin({
    this.official,
    this.common,
  });

  Fin.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Est {
  Est({
    this.official,
    this.common,
  });

  Est.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Deu {
  Deu({
    this.official,
    this.common,
  });

  Deu.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Cym {
  Cym({
    this.official,
    this.common,
  });

  Cym.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Ces {
  Ces({
    this.official,
    this.common,
  });

  Ces.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Bre {
  Bre({
    this.official,
    this.common,
  });

  Bre.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Ara {
  Ara({
    this.official,
    this.common,
  });

  Ara.fromJson(dynamic json) {
    official = json['official'];
    common = json['common'];
  }

  String? official;
  String? common;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['official'] = official;
    map['common'] = common;
    return map;
  }
}

class Languages {
  Languages({
    this.eng,
  });

  Languages.fromJson(dynamic json) {
    eng = json['eng'];
  }

  String? eng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['eng'] = eng;
    return map;
  }
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  Idd.fromJson(dynamic json) {
    root = json['root'];
    suffixes = json['suffixes'] != null ? json['suffixes'].cast<String>() : [];
  }

  String? root;
  List<String>? suffixes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['root'] = root;
    map['suffixes'] = suffixes;
    return map;
  }
}

class Currencies {
  Currencies({
    this.shp,
  });

  Currencies.fromJson(dynamic json) {
    shp = json['SHP'] != null ? Shp.fromJson(json['SHP']) : null;
  }

  Shp? shp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shp != null) {
      map['SHP'] = shp?.toJson();
    }
    return map;
  }
}

class Shp {
  Shp({
    this.name,
    this.symbol,
  });

  Shp.fromJson(dynamic json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  String? name;
  String? symbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['symbol'] = symbol;
    return map;
  }
}

class Name {
  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  Name.fromJson(dynamic json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  String? common;
  String? official;
  NativeName? nativeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['common'] = common;
    map['official'] = official;
    if (nativeName != null) {
      map['nativeName'] = nativeName?.toJson();
    }
    return map;
  }
}

class NativeName {
  NativeName({
    this.eng,
  });

  NativeName.fromJson(dynamic json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
  }

  Eng? eng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (eng != null) {
      map['eng'] = eng?.toJson();
    }
    return map;
  }
}
