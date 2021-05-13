// To parse this JSON data, do
//
//     final bio = bioFromJson(jsonString);

import 'dart:convert';

Bio bioFromJson(String str) => Bio.fromJson(json.decode(str));

String bioToJson(Bio data) => json.encode(data.toJson());

class Bio {
  Bio({
    this.person,
    this.stats,
    this.strengths,
    this.interests,
    this.experiences,
    this.awards,
    this.jobs,
    this.projects,
    this.publications,
    this.education,
    this.opportunities,
    this.languages,
    this.personalityTraitsResults,
    this.professionalCultureGenomeResults,
  });

  Person person;
  Stats stats;
  List<Strength> strengths;
  List<Interest> interests;
  List<Award> experiences;
  List<Award> awards;
  List<Award> jobs;
  List<Award> projects;
  List<dynamic> publications;
  List<Education> education;
  List<Opportunity> opportunities;
  List<Language> languages;
  PersonalityTraitsResults personalityTraitsResults;
  ProfessionalCultureGenomeResults professionalCultureGenomeResults;

  factory Bio.fromJson(Map<String, dynamic> json) => Bio(
    person: Person.fromJson(json["person"]),
    stats: Stats.fromJson(json["stats"]),
    strengths: List<Strength>.from(json["strengths"].map((x) => Strength.fromJson(x))),
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromJson(x))),
    experiences: List<Award>.from(json["experiences"].map((x) => Award.fromJson(x))),
    awards: List<Award>.from(json["awards"].map((x) => Award.fromJson(x))),
    jobs: List<Award>.from(json["jobs"].map((x) => Award.fromJson(x))),
    projects: List<Award>.from(json["projects"].map((x) => Award.fromJson(x))),
    publications: List<dynamic>.from(json["publications"].map((x) => x)),
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
    opportunities: List<Opportunity>.from(json["opportunities"].map((x) => Opportunity.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    personalityTraitsResults: PersonalityTraitsResults.fromJson(json["personalityTraitsResults"]),
    professionalCultureGenomeResults: ProfessionalCultureGenomeResults.fromJson(json["professionalCultureGenomeResults"]),
  );

  Map<String, dynamic> toJson() => {
    "person": person.toJson(),
    "stats": stats.toJson(),
    "strengths": List<dynamic>.from(strengths.map((x) => x.toJson())),
    "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
    "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
    "awards": List<dynamic>.from(awards.map((x) => x.toJson())),
    "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
    "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    "publications": List<dynamic>.from(publications.map((x) => x)),
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
    "opportunities": List<dynamic>.from(opportunities.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "personalityTraitsResults": personalityTraitsResults.toJson(),
    "professionalCultureGenomeResults": professionalCultureGenomeResults.toJson(),
  };
}

class Award {
  Award({
    this.id,
    this.category,
    this.name,
    this.contributions,
    this.organizations,
    this.responsibilities,
    this.fromMonth,
    this.fromYear,
    this.toMonth,
    this.toYear,
    this.additionalInfo,
    this.highlighted,
    this.weight,
    this.verifications,
    this.recommendations,
    this.media,
    this.rank,
    this.remote,
  });

  String id;
  Category category;
  String name;
  Contributions contributions;
  List<Organization> organizations;
  List<dynamic> responsibilities;
  String fromMonth;
  String fromYear;
  String toMonth;
  String toYear;
  String additionalInfo;
  bool highlighted;
  double weight;
  int verifications;
  int recommendations;
  List<Media> media;
  int rank;
  bool remote;

  factory Award.fromJson(Map<String, dynamic> json) => Award(
    id: json["id"],
    category: categoryValues.map[json["category"]],
    name: json["name"],
    contributions: json["contributions"] == null ? null : contributionsValues.map[json["contributions"]],
    organizations: List<Organization>.from(json["organizations"].map((x) => Organization.fromJson(x))),
    responsibilities: List<dynamic>.from(json["responsibilities"].map((x) => x)),
    fromMonth: json["fromMonth"] == null ? null : json["fromMonth"],
    fromYear: json["fromYear"] == null ? null : json["fromYear"],
    toMonth: json["toMonth"] == null ? null : json["toMonth"],
    toYear: json["toYear"] == null ? null : json["toYear"],
    additionalInfo: json["additionalInfo"] == null ? null : json["additionalInfo"],
    highlighted: json["highlighted"],
    weight: json["weight"].toDouble(),
    verifications: json["verifications"],
    recommendations: json["recommendations"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    rank: json["rank"],
    remote: json["remote"] == null ? null : json["remote"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": categoryValues.reverse[category],
    "name": name,
    "contributions": contributions == null ? null : contributionsValues.reverse[contributions],
    "organizations": List<dynamic>.from(organizations.map((x) => x.toJson())),
    "responsibilities": List<dynamic>.from(responsibilities.map((x) => x)),
    "fromMonth": fromMonth == null ? null : fromMonth,
    "fromYear": fromYear == null ? null : fromYear,
    "toMonth": toMonth == null ? null : toMonth,
    "toYear": toYear == null ? null : toYear,
    "additionalInfo": additionalInfo == null ? null : additionalInfo,
    "highlighted": highlighted,
    "weight": weight,
    "verifications": verifications,
    "recommendations": recommendations,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "rank": rank,
    "remote": remote == null ? null : remote,
  };
}

enum Category { AWARDS, PROJECTS, EDUCATION, JOBS }

final categoryValues = EnumValues({
  "awards": Category.AWARDS,
  "education": Category.EDUCATION,
  "jobs": Category.JOBS,
  "projects": Category.PROJECTS
});

enum Contributions { EMPTY, EVENT_ORGANIZER }

final contributionsValues = EnumValues({
  "": Contributions.EMPTY,
  "event organizer": Contributions.EVENT_ORGANIZER
});

class Media {
  Media({
    this.group,
    this.mediaType,
    this.description,
    this.mediaItems,
  });

  String group;
  MediaType mediaType;
  Description description;
  List<MediaItem> mediaItems;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    group: json["group"],
    mediaType: mediaTypeValues.map[json["mediaType"]],
    description: descriptionValues.map[json["description"]],
    mediaItems: List<MediaItem>.from(json["mediaItems"].map((x) => MediaItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "group": group,
    "mediaType": mediaTypeValues.reverse[mediaType],
    "description": descriptionValues.reverse[description],
    "mediaItems": List<dynamic>.from(mediaItems.map((x) => x.toJson())),
  };
}

enum Description { EMPTY, I_CREATIVE_TEAM }

final descriptionValues = EnumValues({
  "": Description.EMPTY,
  "iCreative team": Description.I_CREATIVE_TEAM
});

class MediaItem {
  MediaItem({
    this.id,
    this.address,
    this.metadata,
  });

  String id;
  String address;
  String metadata;

  factory MediaItem.fromJson(Map<String, dynamic> json) => MediaItem(
    id: json["id"],
    address: json["address"],
    metadata: json["metadata"] == null ? null : json["metadata"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "metadata": metadata == null ? null : metadata,
  };
}

enum MediaType { MEDIA, LINK }

final mediaTypeValues = EnumValues({
  "link": MediaType.LINK,
  "media": MediaType.MEDIA
});

class Organization {
  Organization({
    this.id,
    this.name,
    this.picture,
  });

  int id;
  String name;
  String picture;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    id: json["id"],
    name: json["name"],
    picture: json["picture"] == null ? null : json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picture": picture == null ? null : picture,
  };
}

class Education {
  Education({
    this.id,
    this.category,
    this.name,
    this.organizations,
    this.responsibilities,
    this.fromMonth,
    this.fromYear,
    this.highlighted,
    this.weight,
    this.verifications,
    this.recommendations,
    this.media,
    this.rank,
    this.toMonth,
    this.toYear,
    this.additionalInfo,
  });

  String id;
  Category category;
  String name;
  List<Organization> organizations;
  List<dynamic> responsibilities;
  String fromMonth;
  String fromYear;
  bool highlighted;
  int weight;
  int verifications;
  int recommendations;
  List<Media> media;
  int rank;
  String toMonth;
  String toYear;
  String additionalInfo;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["id"],
    category: categoryValues.map[json["category"]],
    name: json["name"],
    organizations: List<Organization>.from(json["organizations"].map((x) => Organization.fromJson(x))),
    responsibilities: List<dynamic>.from(json["responsibilities"].map((x) => x)),
    fromMonth: json["fromMonth"],
    fromYear: json["fromYear"],
    highlighted: json["highlighted"],
    weight: json["weight"],
    verifications: json["verifications"],
    recommendations: json["recommendations"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    rank: json["rank"],
    toMonth: json["toMonth"] == null ? null : json["toMonth"],
    toYear: json["toYear"] == null ? null : json["toYear"],
    additionalInfo: json["additionalInfo"] == null ? null : json["additionalInfo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": categoryValues.reverse[category],
    "name": name,
    "organizations": List<dynamic>.from(organizations.map((x) => x.toJson())),
    "responsibilities": List<dynamic>.from(responsibilities.map((x) => x)),
    "fromMonth": fromMonth,
    "fromYear": fromYear,
    "highlighted": highlighted,
    "weight": weight,
    "verifications": verifications,
    "recommendations": recommendations,
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "rank": rank,
    "toMonth": toMonth == null ? null : toMonth,
    "toYear": toYear == null ? null : toYear,
    "additionalInfo": additionalInfo == null ? null : additionalInfo,
  };
}

class Interest {
  Interest({
    this.id,
    this.code,
    this.name,
    this.media,
    this.created,
  });

  String id;
  int code;
  String name;
  List<dynamic> media;
  DateTime created;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    media: List<dynamic>.from(json["media"].map((x) => x)),
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "media": List<dynamic>.from(media.map((x) => x)),
    "created": created.toIso8601String(),
  };
}

class Language {
  Language({
    this.code,
    this.language,
    this.fluency,
  });

  String code;
  String language;
  String fluency;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    code: json["code"],
    language: json["language"],
    fluency: json["fluency"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "language": language,
    "fluency": fluency,
  };
}

class Opportunity {
  Opportunity({
    this.id,
    this.interest,
    this.field,
    this.data,
  });

  String id;
  String interest;
  String field;
  dynamic data;

  factory Opportunity.fromJson(Map<String, dynamic> json) => Opportunity(
    id: json["id"],
    interest: json["interest"],
    field: json["field"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "interest": interest,
    "field": field,
    "data": data,
  };
}

class Datum {
  Datum({
    this.code,
    this.locale,
    this.name,
  });

  int code;
  String locale;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    code: json["code"],
    locale: json["locale"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "locale": locale,
    "name": name,
  };
}

class Person {
  Person({
    this.professionalHeadline,
    this.completion,
    this.showPhone,
    this.created,
    this.verified,
    this.flags,
    this.weight,
    this.locale,
    this.subjectId,
    this.picture,
    this.hasEmail,
    this.isTest,
    this.name,
    this.links,
    this.location,
    this.theme,
    this.id,
    this.pictureThumbnail,
    this.claimant,
    this.weightGraph,
    this.publicId,
  });

  String professionalHeadline;
  int completion;
  bool showPhone;
  DateTime created;
  bool verified;
  Map<String, bool> flags;
  double weight;
  String locale;
  int subjectId;
  String picture;
  bool hasEmail;
  bool isTest;
  String name;
  List<Link> links;
  Location location;
  String theme;
  String id;
  String pictureThumbnail;
  bool claimant;
  String weightGraph;
  String publicId;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    professionalHeadline: json["professionalHeadline"],
    completion: json["completion"],
    showPhone: json["showPhone"],
    created: DateTime.parse(json["created"]),
    verified: json["verified"],
    flags: Map.from(json["flags"]).map((k, v) => MapEntry<String, bool>(k, v)),
    weight: json["weight"].toDouble(),
    locale: json["locale"],
    subjectId: json["subjectId"],
    picture: json["picture"],
    hasEmail: json["hasEmail"],
    isTest: json["isTest"],
    name: json["name"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    location: Location.fromJson(json["location"]),
    theme: json["theme"],
    id: json["id"],
    pictureThumbnail: json["pictureThumbnail"],
    claimant: json["claimant"],
    weightGraph: json["weightGraph"],
    publicId: json["publicId"],
  );

  Map<String, dynamic> toJson() => {
    "professionalHeadline": professionalHeadline,
    "completion": completion,
    "showPhone": showPhone,
    "created": created.toIso8601String(),
    "verified": verified,
    "flags": Map.from(flags).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "weight": weight,
    "locale": locale,
    "subjectId": subjectId,
    "picture": picture,
    "hasEmail": hasEmail,
    "isTest": isTest,
    "name": name,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "location": location.toJson(),
    "theme": theme,
    "id": id,
    "pictureThumbnail": pictureThumbnail,
    "claimant": claimant,
    "weightGraph": weightGraph,
    "publicId": publicId,
  };
}

class Link {
  Link({
    this.id,
    this.name,
    this.address,
  });

  String id;
  String name;
  String address;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    id: json["id"],
    name: json["name"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
  };
}

class Location {
  Location({
    this.name,
    this.shortName,
    this.country,
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezoneOffSet,
  });

  String name;
  String shortName;
  String country;
  double latitude;
  double longitude;
  String timezone;
  int timezoneOffSet;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    shortName: json["shortName"],
    country: json["country"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    timezone: json["timezone"],
    timezoneOffSet: json["timezoneOffSet"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortName": shortName,
    "country": country,
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "timezoneOffSet": timezoneOffSet,
  };
}

class PersonalityTraitsResults {
  PersonalityTraitsResults({
    this.groups,
    this.analyses,
  });

  List<PersonalityTraitsResultsGroup> groups;
  List<PersonalityTraitsResultsAnalysis> analyses;

  factory PersonalityTraitsResults.fromJson(Map<String, dynamic> json) => PersonalityTraitsResults(
    groups: List<PersonalityTraitsResultsGroup>.from(json["groups"].map((x) => PersonalityTraitsResultsGroup.fromJson(x))),
    analyses: List<PersonalityTraitsResultsAnalysis>.from(json["analyses"].map((x) => PersonalityTraitsResultsAnalysis.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
    "analyses": List<dynamic>.from(analyses.map((x) => x.toJson())),
  };
}

class PersonalityTraitsResultsAnalysis {
  PersonalityTraitsResultsAnalysis({
    this.groupId,
    this.analysis,
  });

  String groupId;
  double analysis;

  factory PersonalityTraitsResultsAnalysis.fromJson(Map<String, dynamic> json) => PersonalityTraitsResultsAnalysis(
    groupId: json["groupId"],
    analysis: json["analysis"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
    "analysis": analysis,
  };
}

class PersonalityTraitsResultsGroup {
  PersonalityTraitsResultsGroup({
    this.id,
    this.order,
    this.median,
    this.stddev,
  });

  String id;
  int order;
  double median;
  double stddev;

  factory PersonalityTraitsResultsGroup.fromJson(Map<String, dynamic> json) => PersonalityTraitsResultsGroup(
    id: json["id"],
    order: json["order"],
    median: json["median"].toDouble(),
    stddev: json["stddev"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order": order,
    "median": median,
    "stddev": stddev,
  };
}

class ProfessionalCultureGenomeResults {
  ProfessionalCultureGenomeResults({
    this.groups,
    this.analyses,
  });

  List<ProfessionalCultureGenomeResultsGroup> groups;
  List<ProfessionalCultureGenomeResultsAnalysis> analyses;

  factory ProfessionalCultureGenomeResults.fromJson(Map<String, dynamic> json) => ProfessionalCultureGenomeResults(
    groups: List<ProfessionalCultureGenomeResultsGroup>.from(json["groups"].map((x) => ProfessionalCultureGenomeResultsGroup.fromJson(x))),
    analyses: List<ProfessionalCultureGenomeResultsAnalysis>.from(json["analyses"].map((x) => ProfessionalCultureGenomeResultsAnalysis.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
    "analyses": List<dynamic>.from(analyses.map((x) => x.toJson())),
  };
}

class ProfessionalCultureGenomeResultsAnalysis {
  ProfessionalCultureGenomeResultsAnalysis({
    this.groupId,
    this.section,
    this.analysis,
  });

  String groupId;
  Section section;
  double analysis;

  factory ProfessionalCultureGenomeResultsAnalysis.fromJson(Map<String, dynamic> json) => ProfessionalCultureGenomeResultsAnalysis(
    groupId: json["groupId"],
    section: sectionValues.map[json["section"]],
    analysis: json["analysis"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "groupId": groupId,
    "section": sectionValues.reverse[section],
    "analysis": analysis,
  };
}

enum Section { ADAPTABILITY, INTEGRITY, COLLABORATIVE, RESULTS_ORIENTED, CUSTOMER_ORIENTED, DETAIL_ORIENTED }

final sectionValues = EnumValues({
  "adaptability": Section.ADAPTABILITY,
  "collaborative": Section.COLLABORATIVE,
  "customer-oriented": Section.CUSTOMER_ORIENTED,
  "detail-oriented": Section.DETAIL_ORIENTED,
  "integrity": Section.INTEGRITY,
  "results-oriented": Section.RESULTS_ORIENTED
});

class ProfessionalCultureGenomeResultsGroup {
  ProfessionalCultureGenomeResultsGroup({
    this.id,
    this.text,
    this.answer,
    this.order,
  });

  String id;
  String text;
  Answer answer;
  int order;

  factory ProfessionalCultureGenomeResultsGroup.fromJson(Map<String, dynamic> json) => ProfessionalCultureGenomeResultsGroup(
    id: json["id"],
    text: json["text"],
    answer: answerValues.map[json["answer"]],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "answer": answerValues.reverse[answer],
    "order": order,
  };
}

enum Answer { ALL_THE_TIME, MOST_OF_THE_TIME, SOMETIMES, RARELY, NEVER }

final answerValues = EnumValues({
  "all-the-time": Answer.ALL_THE_TIME,
  "most-of-the-time": Answer.MOST_OF_THE_TIME,
  "never": Answer.NEVER,
  "rarely": Answer.RARELY,
  "sometimes": Answer.SOMETIMES
});

class Stats {
  Stats({
    this.strengths,
    this.awards,
    this.education,
    this.interests,
    this.jobs,
    this.projects,
  });

  int strengths;
  int awards;
  int education;
  int interests;
  int jobs;
  int projects;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    strengths: json["strengths"],
    awards: json["awards"],
    education: json["education"],
    interests: json["interests"],
    jobs: json["jobs"],
    projects: json["projects"],
  );

  Map<String, dynamic> toJson() => {
    "strengths": strengths,
    "awards": awards,
    "education": education,
    "interests": interests,
    "jobs": jobs,
    "projects": projects,
  };
}

class Strength {
  Strength({
    this.id,
    this.code,
    this.name,
    this.additionalInfo,
    this.weight,
    this.recommendations,
    this.media,
    this.created,
  });

  String id;
  int code;
  String name;
  String additionalInfo;
  double weight;
  int recommendations;
  List<dynamic> media;
  DateTime created;

  factory Strength.fromJson(Map<String, dynamic> json) => Strength(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    additionalInfo: json["additionalInfo"] == null ? null : json["additionalInfo"],
    weight: json["weight"].toDouble(),
    recommendations: json["recommendations"],
    media: List<dynamic>.from(json["media"].map((x) => x)),
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "additionalInfo": additionalInfo == null ? null : additionalInfo,
    "weight": weight,
    "recommendations": recommendations,
    "media": List<dynamic>.from(media.map((x) => x)),
    "created": created.toIso8601String(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
