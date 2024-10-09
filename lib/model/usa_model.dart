class UsaPopulationModel {
  UsaPopulationModel({
    this.data,
    this.source,
  });

  UsaPopulationModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['source'] != null) {
      source = [];
      json['source'].forEach((v) {
        source?.add(Source.fromJson(v));
      });
    }
  }

  List<Data>? data;
  List<Source>? source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (source != null) {
      map['source'] = source?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Source {
  Source({
    this.measures,
    this.annotations,
    this.name,
    this.substitutions,
  });

  Source.fromJson(dynamic json) {
    measures = json['measures'] != null ? json['measures'].cast<String>() : [];
    annotations = json['annotations'] != null
        ? Annotations.fromJson(json['annotations'])
        : null;
    name = json['name'];
  }

  List<String>? measures;
  Annotations? annotations;
  String? name;
  List<dynamic>? substitutions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['measures'] = measures;
    if (annotations != null) {
      map['annotations'] = annotations?.toJson();
    }
    map['name'] = name;
    if (substitutions != null) {
      map['substitutions'] = substitutions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Annotations {
  Annotations({
    this.sourceName,
    this.sourceDescription,
    this.datasetName,
    this.datasetLink,
    this.tableId,
    this.topic,
    this.subtopic,
  });

  Annotations.fromJson(dynamic json) {
    sourceName = json['source_name'];
    sourceDescription = json['source_description'];
    datasetName = json['dataset_name'];
    datasetLink = json['dataset_link'];
    tableId = json['table_id'];
    topic = json['topic'];
    subtopic = json['subtopic'];
  }

  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['source_name'] = sourceName;
    map['source_description'] = sourceDescription;
    map['dataset_name'] = datasetName;
    map['dataset_link'] = datasetLink;
    map['table_id'] = tableId;
    map['topic'] = topic;
    map['subtopic'] = subtopic;
    return map;
  }
}

class Data {
  Data({
    this.iDNation,
    this.nation,
    this.iDYear,
    this.year,
    this.population,
    this.slugNation,
  });

  Data.fromJson(dynamic json) {
    iDNation = json['ID Nation'];
    nation = json['Nation'];
    iDYear = json['ID Year'];
    year = json['Year'];
    population = json['Population'];
    slugNation = json['Slug Nation'];
  }

  String? iDNation;
  String? nation;
  int? iDYear;
  String? year;
  int? population;
  String? slugNation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ID Nation'] = iDNation;
    map['Nation'] = nation;
    map['ID Year'] = iDYear;
    map['Year'] = year;
    map['Population'] = population;
    map['Slug Nation'] = slugNation;
    return map;
  }
}
