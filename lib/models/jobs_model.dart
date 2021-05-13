// To parse this JSON data, do
//
//     final jobs = jobsFromJson(jsonString);

import 'dart:convert';

Jobs jobsFromJson(String str) => Jobs.fromJson(json.decode(str));

String jobsToJson(Jobs data) => json.encode(data.toJson());

class Jobs {
  Jobs({
    this.aggregators,
    this.offset,
    this.results,
    this.size,
    this.total,
  });

  Aggregators aggregators;
  int offset;
  List<Result> results;
  int size;
  int total;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
    aggregators: Aggregators.fromJson(json["aggregators"]),
    offset: json["offset"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "aggregators": aggregators.toJson(),
    "offset": offset,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "size": size,
    "total": total,
  };
}

class Aggregators {
  Aggregators({
    this.remote,
    this.organization,
    this.skill,
    this.compensationrange,
    this.type,
    this.status,
    this.location,
  });

  List<Compensationrange> remote;
  List<Compensationrange> organization;
  List<Compensationrange> skill;
  List<Compensationrange> compensationrange;
  List<Compensationrange> type;
  List<Compensationrange> status;
  List<Compensationrange> location;

  factory Aggregators.fromJson(Map<String, dynamic> json) => Aggregators(
    remote: List<Compensationrange>.from(json["remote"].map((x) => Compensationrange.fromJson(x))),
    organization: List<Compensationrange>.from(json["organization"].map((x) => Compensationrange.fromJson(x))),
    skill: List<Compensationrange>.from(json["skill"].map((x) => Compensationrange.fromJson(x))),
    compensationrange: List<Compensationrange>.from(json["compensationrange"].map((x) => Compensationrange.fromJson(x))),
    type: List<Compensationrange>.from(json["type"].map((x) => Compensationrange.fromJson(x))),
    status: List<Compensationrange>.from(json["status"].map((x) => Compensationrange.fromJson(x))),
    location: List<Compensationrange>.from(json["location"].map((x) => Compensationrange.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "remote": List<dynamic>.from(remote.map((x) => x.toJson())),
    "organization": List<dynamic>.from(organization.map((x) => x.toJson())),
    "skill": List<dynamic>.from(skill.map((x) => x.toJson())),
    "compensationrange": List<dynamic>.from(compensationrange.map((x) => x.toJson())),
    "type": List<dynamic>.from(type.map((x) => x.toJson())),
    "status": List<dynamic>.from(status.map((x) => x.toJson())),
    "location": List<dynamic>.from(location.map((x) => x.toJson())),
  };
}

class Compensationrange {
  Compensationrange({
    this.total,
    this.value,
  });

  int total;
  String value;

  factory Compensationrange.fromJson(Map<String, dynamic> json) => Compensationrange(
    total: json["total"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "value": value,
  };
}

class Result {
  Result({
    this.id,
    this.objective,
    this.slug,
    this.type,
    this.organizations,
    this.locations,
    this.remote,
    this.resultExternal,
    this.deadline,
    this.created,
    this.status,
    this.compensation,
    this.skills,
    this.members,
    this.questions,
    this.context,
    this.meta,
  });

  String id;
  String objective;
  String slug;
  TypeElement type;
  List<Organization> organizations;
  List<dynamic> locations;
  bool remote;
  bool resultExternal;
  DateTime deadline;
  DateTime created;
  Status status;
  ResultCompensation compensation;
  List<ResultSkill> skills;
  List<ResultMember> members;
  List<Question> questions;
  Context context;
  Meta meta;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    objective: json["objective"],
    slug: json["slug"] == null ? null : json["slug"],
    type: typeElementValues.map[json["type"]],
    organizations: List<Organization>.from(json["organizations"].map((x) => Organization.fromJson(x))),
    locations: List<dynamic>.from(json["locations"].map((x) => x)),
    remote: json["remote"],
    resultExternal: json["external"],
    deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
    created: DateTime.parse(json["created"]),
    status: statusValues.map[json["status"]],
    compensation: ResultCompensation.fromJson(json["compensation"]),
    skills: List<ResultSkill>.from(json["skills"].map((x) => ResultSkill.fromJson(x))),
    members: List<ResultMember>.from(json["members"].map((x) => ResultMember.fromJson(x))),
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    context: Context.fromJson(json["context"]),
    meta: Meta.fromJson(json["_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "objective": objective,
    "slug": slug == null ? null : slug,
    "type": typeElementValues.reverse[type],
    "organizations": List<dynamic>.from(organizations.map((x) => x.toJson())),
    "locations": List<dynamic>.from(locations.map((x) => x)),
    "remote": remote,
    "external": resultExternal,
    "deadline": deadline == null ? null : deadline.toIso8601String(),
    "created": created.toIso8601String(),
    "status": statusValues.reverse[status],
    "compensation": compensation.toJson(),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    "context": context.toJson(),
    "_meta": meta.toJson(),
  };
}

class ResultCompensation {
  ResultCompensation({
    this.data,
    this.visible,
  });

  Data data;
  bool visible;

  factory ResultCompensation.fromJson(Map<String, dynamic> json) => ResultCompensation(
    data: Data.fromJson(json["data"]),
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "visible": visible,
  };
}

class Data {
  Data({
    this.code,
    this.currency,
    this.minAmount,
    this.maxAmount,
    this.periodicity,
  });

  Code code;
  Currency currency;
  double minAmount;
  double maxAmount;
  Periodicity periodicity;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    code: codeValues.map[json["code"]],
    currency: currencyValues.map[json["currency"]],
    minAmount: json["minAmount"] as double,
    maxAmount: json["maxAmount"] == null ? null : json["maxAmount"] as double,
    periodicity: periodicityValues.map[json["periodicity"]],
  );

  Map<String, dynamic> toJson() => {
    "code": codeValues.reverse[code],
    "currency": currencyValues.reverse[currency],
    "minAmount": minAmount,
    "maxAmount": maxAmount == null ? null : maxAmount,
    "periodicity": periodicityValues.reverse[periodicity],
  };
}

enum Code { RANGE, FIXED }

final codeValues = EnumValues({
  "fixed": Code.FIXED,
  "range": Code.RANGE
});

enum Currency { USD, COP, EUR }

final currencyValues = EnumValues({
  "COP\u0024": Currency.COP,
  "EUR€": Currency.EUR,
  "USD\u0024": Currency.USD
});

enum Periodicity { HOURLY, YEARLY, MONTHLY }

final periodicityValues = EnumValues({
  "hourly": Periodicity.HOURLY,
  "monthly": Periodicity.MONTHLY,
  "yearly": Periodicity.YEARLY
});

class Context {
  Context({
    this.signaled,
  });

  List<dynamic> signaled;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    signaled: List<dynamic>.from(json["signaled"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "signaled": List<dynamic>.from(signaled.map((x) => x)),
  };
}

class ResultMember {
  ResultMember({
    this.subjectId,
    this.name,
    this.username,
    this.professionalHeadline,
    this.picture,
    this.member,
    this.manager,
    this.poster,
    this.weight,
  });

  String subjectId;
  String name;
  String username;
  String professionalHeadline;
  String picture;
  bool member;
  bool manager;
  bool poster;
  double weight;

  factory ResultMember.fromJson(Map<String, dynamic> json) => ResultMember(
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
    name: json["name"],
    username: json["username"],
    professionalHeadline: json["professionalHeadline"] == null ? null : json["professionalHeadline"],
    picture: json["picture"] == null ? null : json["picture"],
    member: json["member"],
    manager: json["manager"],
    poster: json["poster"],
    weight: json["weight"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId == null ? null : subjectId,
    "name": name,
    "username": username,
    "professionalHeadline": professionalHeadline == null ? null : professionalHeadline,
    "picture": picture == null ? null : picture,
    "member": member,
    "manager": manager,
    "poster": poster,
    "weight": weight,
  };
}

class Meta {
  Meta({
    this.rank,
    this.scorer,
    this.filter,
    this.boosters,
  });

  Rank rank;
  Scorer scorer;
  Filter filter;
  List<Booster> boosters;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    rank: Rank.fromJson(json["rank"]),
    scorer: Scorer.fromJson(json["scorer"]),
    filter: Filter.fromJson(json["filter"]),
    boosters: List<Booster>.from(json["boosters"].map((x) => boosterValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "rank": rank.toJson(),
    "scorer": scorer.toJson(),
    "filter": filter.toJson(),
    "boosters": List<dynamic>.from(boosters.map((x) => boosterValues.reverse[x])),
  };
}

enum Booster { STATUS, INTERNAL, NATIVE }

final boosterValues = EnumValues({
  "internal": Booster.INTERNAL,
  "native": Booster.NATIVE,
  "status": Booster.STATUS
});

class Filter {
  Filter({
    this.type,
    this.pass,
    this.and,
  });

  Type type;
  bool pass;
  List<FilterAnd> and;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    and: List<FilterAnd>.from(json["and"].map((x) => FilterAnd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "and": List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

class FilterAnd {
  FilterAnd({
    this.type,
    this.pass,
    this.id,
    this.input,
    this.or,
    this.not,
    this.and,
  });

  Type type;
  bool pass;
  FluffyId id;
  FluffyInput input;
  List<PurpleOr> or;
  Not not;
  List<PurpleAnd> and;

  factory FilterAnd.fromJson(Map<String, dynamic> json) => FilterAnd(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    id: json["id"] == null ? null : fluffyIdValues.map[json["id"]],
    input: json["input"] == null ? null : FluffyInput.fromJson(json["input"]),
    or: json["or"] == null ? null : List<PurpleOr>.from(json["or"].map((x) => PurpleOr.fromJson(x))),
    not: json["not"] == null ? null : Not.fromJson(json["not"]),
    and: json["and"] == null ? null : List<PurpleAnd>.from(json["and"].map((x) => PurpleAnd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "id": id == null ? null : fluffyIdValues.reverse[id],
    "input": input == null ? null : input.toJson(),
    "or": or == null ? null : List<dynamic>.from(or.map((x) => x.toJson())),
    "not": not == null ? null : not.toJson(),
    "and": and == null ? null : List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

class PurpleAnd {
  PurpleAnd({
    this.type,
    this.pass,
    this.id,
    this.input,
    this.score,
  });

  Type type;
  bool pass;
  PurpleId id;
  PurpleInput input;
  double score;

  factory PurpleAnd.fromJson(Map<String, dynamic> json) => PurpleAnd(
    type: typeValues.map[json["@type"]],
    pass: json["pass"] == null ? null : json["pass"],
    id: purpleIdValues.map[json["id"]],
    input: PurpleInput.fromJson(json["input"]),
    score: json["score"] == null ? null : json["score"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass == null ? null : pass,
    "id": purpleIdValues.reverse[id],
    "input": input.toJson(),
    "score": score == null ? null : score,
  };
}

enum PurpleId { SKILL, EXPERIENCE }

final purpleIdValues = EnumValues({
  "experience": PurpleId.EXPERIENCE,
  "skill": PurpleId.SKILL
});

class PurpleInput {
  PurpleInput({
    this.criteria,
    this.opportunity,
  });

  PurpleCriteria criteria;
  PurpleOpportunity opportunity;

  factory PurpleInput.fromJson(Map<String, dynamic> json) => PurpleInput(
    criteria: PurpleCriteria.fromJson(json["criteria"]),
    opportunity: PurpleOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class PurpleCriteria {
  PurpleCriteria({
    this.skills,
    this.experiences,
  });

  List<CriteriaSkill> skills;
  Map<String, List<ExperienceElement>> experiences;

  factory PurpleCriteria.fromJson(Map<String, dynamic> json) => PurpleCriteria(
    skills: json["skills"] == null ? null : List<CriteriaSkill>.from(json["skills"].map((x) => CriteriaSkill.fromJson(x))),
    experiences: json["experiences"] == null ? null : Map.from(json["experiences"]).map((k, v) => MapEntry<String, List<ExperienceElement>>(k, List<ExperienceElement>.from(v.map((x) => ExperienceElement.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toJson())),
    "experiences": experiences == null ? null : Map.from(experiences).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class ExperienceElement {
  ExperienceElement({
    this.experienceRef,
    this.category,
    this.name,
    this.months,
  });

  ExperienceRef experienceRef;
  Category category;
  Name name;
  int months;

  factory ExperienceElement.fromJson(Map<String, dynamic> json) => ExperienceElement(
    experienceRef: experienceRefValues.map[json["experienceRef"]],
    category: categoryValues.map[json["category"]],
    name: nameValues.map[json["name"]],
    months: json["months"],
  );

  Map<String, dynamic> toJson() => {
    "experienceRef": experienceRefValues.reverse[experienceRef],
    "category": categoryValues.reverse[category],
    "name": nameValues.reverse[name],
    "months": months,
  };
}

enum Category { JOBS, PROJECTS, EDUCATION, AWARDS }

final categoryValues = EnumValues({
  "AWARDS": Category.AWARDS,
  "EDUCATION": Category.EDUCATION,
  "JOBS": Category.JOBS,
  "PROJECTS": Category.PROJECTS
});

enum ExperienceRef { A_NA_B2_K_OM, PYOLM_OQ_N, THE_7_M2_V6_BAM, BJ_AW7_P_ZN, W_M7_YP_Q_VY, EYNB8_E_LY, PYOL_B9_ZN, BJ_A_WN_KYN, EM3_Z_PV6_N, J_MEZ_E_QGJ, X_MQ0_QVP_N, G_M_RB_QZVM, L_MG_B067_N }

final experienceRefValues = EnumValues({
  "ANaB2kOM": ExperienceRef.A_NA_B2_K_OM,
  "bjAW7pZN": ExperienceRef.BJ_AW7_P_ZN,
  "bjAWnKYN": ExperienceRef.BJ_A_WN_KYN,
  "EM3zPv6N": ExperienceRef.EM3_Z_PV6_N,
  "eynb8ELy": ExperienceRef.EYNB8_E_LY,
  "gMRbQZVM": ExperienceRef.G_M_RB_QZVM,
  "JMezEQgj": ExperienceRef.J_MEZ_E_QGJ,
  "LMgB067N": ExperienceRef.L_MG_B067_N,
  "pyolmOqN": ExperienceRef.PYOLM_OQ_N,
  "pyolB9ZN": ExperienceRef.PYOL_B9_ZN,
  "7M2V6BAM": ExperienceRef.THE_7_M2_V6_BAM,
  "wM7YpQVy": ExperienceRef.W_M7_YP_Q_VY,
  "XMq0QvpN": ExperienceRef.X_MQ0_QVP_N
});

enum Name { CEO_AND_COFOUNDER_AT_I_CREA_XYZ, I_PAGO, SYSTEM_ENGINEERING, CINEMAPP, FLUTTER, CO_FOUNDER, STARTUP_WEEKEND_MRIDA, WINNER_OF_INNOVATION_COMPETITION_WORLD_SEMIFINALS, WINNER_OF_THE_MICROSOFT_IMAGINE_CUP_VENEZUELA, MICROSOFT_STUDENT_PARTNER, WINNER_OF_2015_ONLINE_FINALS_INNOVATION_COMPETITION, APPLICATION_DEVELOPER, SWIFT_PROGRAMMING }

final nameValues = EnumValues({
  "Application Developer": Name.APPLICATION_DEVELOPER,
  "CEO and Cofounder at iCrea.xyz": Name.CEO_AND_COFOUNDER_AT_I_CREA_XYZ,
  "Cinemapp": Name.CINEMAPP,
  "Co-Founder": Name.CO_FOUNDER,
  "Flutter": Name.FLUTTER,
  "iPago": Name.I_PAGO,
  "Microsoft Student Partner": Name.MICROSOFT_STUDENT_PARTNER,
  "Startup weekend Mérida": Name.STARTUP_WEEKEND_MRIDA,
  "Swift Programming": Name.SWIFT_PROGRAMMING,
  "System Engineering": Name.SYSTEM_ENGINEERING,
  "Winner of 2015 Online Finals Innovation Competition": Name.WINNER_OF_2015_ONLINE_FINALS_INNOVATION_COMPETITION,
  "Winner of Innovation Competition: World Semifinals": Name.WINNER_OF_INNOVATION_COMPETITION_WORLD_SEMIFINALS,
  "Winner of the Microsoft Imagine Cup Venezuela": Name.WINNER_OF_THE_MICROSOFT_IMAGINE_CUP_VENEZUELA
});

class CriteriaSkill {
  CriteriaSkill({
    this.name,
    this.interestRef,
    this.skillRef,
  });

  String name;
  InterestRef interestRef;
  String skillRef;

  factory CriteriaSkill.fromJson(Map<String, dynamic> json) => CriteriaSkill(
    name: json["name"],
    interestRef: json["interestRef"] == null ? null : interestRefValues.map[json["interestRef"]],
    skillRef: json["skillRef"] == null ? null : json["skillRef"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "interestRef": interestRef == null ? null : interestRefValues.reverse[interestRef],
    "skillRef": skillRef == null ? null : skillRef,
  };
}

enum InterestRef { EYNRZ1_EY, THE_9_MB5_KM_AN, X_M9_Y899_M }

final interestRefValues = EnumValues({
  "eynrz1Ey": InterestRef.EYNRZ1_EY,
  "9MB5KmAN": InterestRef.THE_9_MB5_KM_AN,
  "xM9Y899M": InterestRef.X_M9_Y899_M
});

class PurpleOpportunity {
  PurpleOpportunity({
    this.skills,
    this.experiences,
  });

  List<OpportunitySkill> skills;
  Map<String, dynamic> experiences;

  factory PurpleOpportunity.fromJson(Map<String, dynamic> json) => PurpleOpportunity(
    skills: json["skills"] == null ? null : List<OpportunitySkill>.from(json["skills"].map((x) => OpportunitySkill.fromJson(x))),
    experiences: json["experiences"] == null ? null : Map.from(json["experiences"]).map((k, v) => MapEntry<String, dynamic>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toJson())),
    "experiences": experiences == null ? null : Map.from(experiences).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class OpportunitySkill {
  OpportunitySkill({
    this.name,
  });

  String name;

  factory OpportunitySkill.fromJson(Map<String, dynamic> json) => OpportunitySkill(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

enum Type { AND, CONCRETE, OR, NOT }

final typeValues = EnumValues({
  "and": Type.AND,
  "concrete": Type.CONCRETE,
  "not": Type.NOT,
  "or": Type.OR
});

enum FluffyId { LANGUAGE, TIMEZONE }

final fluffyIdValues = EnumValues({
  "language": FluffyId.LANGUAGE,
  "timezone": FluffyId.TIMEZONE
});

class FluffyInput {
  FluffyInput({
    this.criteria,
    this.opportunity,
  });

  FluffyCriteria criteria;
  FluffyOpportunity opportunity;

  factory FluffyInput.fromJson(Map<String, dynamic> json) => FluffyInput(
    criteria: FluffyCriteria.fromJson(json["criteria"]),
    opportunity: FluffyOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class FluffyCriteria {
  FluffyCriteria({
    this.languages,
    this.timezone,
  });

  Languages languages;
  CriteriaTimezone timezone;

  factory FluffyCriteria.fromJson(Map<String, dynamic> json) => FluffyCriteria(
    languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
    timezone: json["timezone"] == null ? null : criteriaTimezoneValues.map[json["timezone"]],
  );

  Map<String, dynamic> toJson() => {
    "languages": languages == null ? null : languages.toJson(),
    "timezone": timezone == null ? null : criteriaTimezoneValues.reverse[timezone],
  };
}

class Languages {
  Languages({
    this.es,
    this.en,
  });

  Es es;
  Es en;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
    es: esValues.map[json["es"]],
    en: json["en"] == null ? null : esValues.map[json["en"]],
  );

  Map<String, dynamic> toJson() => {
    "es": esValues.reverse[es],
    "en": en == null ? null : esValues.reverse[en],
  };
}

enum Es { READING, FULLY_FLUENT, CONVERSATIONAL }

final esValues = EnumValues({
  "conversational": Es.CONVERSATIONAL,
  "fully-fluent": Es.FULLY_FLUENT,
  "reading": Es.READING
});

enum CriteriaTimezone { GMT_0500 }

final criteriaTimezoneValues = EnumValues({
  "GMT-05:00": CriteriaTimezone.GMT_0500
});

class FluffyOpportunity {
  FluffyOpportunity({
    this.languages,
    this.timezone,
  });

  Languages languages;
  List<TimezoneElement> timezone;

  factory FluffyOpportunity.fromJson(Map<String, dynamic> json) => FluffyOpportunity(
    languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
    timezone: json["timezone"] == null ? null : List<TimezoneElement>.from(json["timezone"].map((x) => timezoneElementValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "languages": languages == null ? null : languages.toJson(),
    "timezone": timezone == null ? null : List<dynamic>.from(timezone.map((x) => timezoneElementValues.reverse[x])),
  };
}

enum TimezoneElement { GMT_1200, GMT_1400, GMT_0900, GMT_0100 }

final timezoneElementValues = EnumValues({
  "GMT-01:00": TimezoneElement.GMT_0100,
  "GMT-09:00": TimezoneElement.GMT_0900,
  "GMT-12:00": TimezoneElement.GMT_1200,
  "GMT+14:00": TimezoneElement.GMT_1400
});

class Not {
  Not({
    this.type,
    this.pass,
    this.or,
  });

  Type type;
  bool pass;
  List<NotOr> or;

  factory Not.fromJson(Map<String, dynamic> json) => Not(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    or: List<NotOr>.from(json["or"].map((x) => NotOr.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "or": List<dynamic>.from(or.map((x) => x.toJson())),
  };
}

class NotOr {
  NotOr({
    this.type,
    this.pass,
    this.id,
    this.input,
  });

  Type type;
  bool pass;
  TentacledId id;
  TentacledInput input;

  factory NotOr.fromJson(Map<String, dynamic> json) => NotOr(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    id: tentacledIdValues.map[json["id"]],
    input: TentacledInput.fromJson(json["input"]),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "id": tentacledIdValues.reverse[id],
    "input": input.toJson(),
  };
}

enum TentacledId { MEMBERS }

final tentacledIdValues = EnumValues({
  "members": TentacledId.MEMBERS
});

class TentacledInput {
  TentacledInput({
    this.criteria,
    this.opportunity,
  });

  TentacledCriteria criteria;
  TentacledOpportunity opportunity;

  factory TentacledInput.fromJson(Map<String, dynamic> json) => TentacledInput(
    criteria: TentacledCriteria.fromJson(json["criteria"]),
    opportunity: TentacledOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class TentacledCriteria {
  TentacledCriteria({
    this.member,
  });

  CriteriaMember member;

  factory TentacledCriteria.fromJson(Map<String, dynamic> json) => TentacledCriteria(
    member: CriteriaMember.fromJson(json["member"]),
  );

  Map<String, dynamic> toJson() => {
    "member": member.toJson(),
  };
}

class CriteriaMember {
  CriteriaMember({
    this.subjectId,
    this.role,
  });

  String subjectId;
  Role role;

  factory CriteriaMember.fromJson(Map<String, dynamic> json) => CriteriaMember(
    subjectId: json["subjectId"],
    role: roleValues.map[json["role"]],
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "role": roleValues.reverse[role],
  };
}

enum Role { POSTER, MANAGER, MEMBER }

final roleValues = EnumValues({
  "manager": Role.MANAGER,
  "member": Role.MEMBER,
  "poster": Role.POSTER
});

class TentacledOpportunity {
  TentacledOpportunity({
    this.members,
  });

  List<OpportunityMember> members;

  factory TentacledOpportunity.fromJson(Map<String, dynamic> json) => TentacledOpportunity(
    members: List<OpportunityMember>.from(json["members"].map((x) => OpportunityMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class OpportunityMember {
  OpportunityMember({
    this.subjectId,
    this.roles,
  });

  String subjectId;
  List<Role> roles;

  factory OpportunityMember.fromJson(Map<String, dynamic> json) => OpportunityMember(
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
    roles: List<Role>.from(json["roles"].map((x) => roleValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId == null ? null : subjectId,
    "roles": List<dynamic>.from(roles.map((x) => roleValues.reverse[x])),
  };
}

class PurpleOr {
  PurpleOr({
    this.type,
    this.pass,
    this.id,
    this.input,
    this.and,
  });

  Type type;
  bool pass;
  StickyId id;
  IndigoInput input;
  List<OrAnd> and;

  factory PurpleOr.fromJson(Map<String, dynamic> json) => PurpleOr(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    id: json["id"] == null ? null : stickyIdValues.map[json["id"]],
    input: json["input"] == null ? null : IndigoInput.fromJson(json["input"]),
    and: json["and"] == null ? null : List<OrAnd>.from(json["and"].map((x) => OrAnd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "id": id == null ? null : stickyIdValues.reverse[id],
    "input": input == null ? null : input.toJson(),
    "and": and == null ? null : List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

class OrAnd {
  OrAnd({
    this.type,
    this.pass,
    this.id,
    this.input,
  });

  Type type;
  bool pass;
  StickyId id;
  StickyInput input;

  factory OrAnd.fromJson(Map<String, dynamic> json) => OrAnd(
    type: typeValues.map[json["@type"]],
    pass: json["pass"],
    id: stickyIdValues.map[json["id"]],
    input: StickyInput.fromJson(json["input"]),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "pass": pass,
    "id": stickyIdValues.reverse[id],
    "input": input.toJson(),
  };
}

enum StickyId { COMPENSATION, PLACE, TYPE, ORGANIZATIONSIZE }

final stickyIdValues = EnumValues({
  "compensation": StickyId.COMPENSATION,
  "organizationsize": StickyId.ORGANIZATIONSIZE,
  "place": StickyId.PLACE,
  "type": StickyId.TYPE
});

class StickyInput {
  StickyInput({
    this.criteria,
    this.opportunity,
  });

  StickyCriteria criteria;
  StickyOpportunity opportunity;

  factory StickyInput.fromJson(Map<String, dynamic> json) => StickyInput(
    criteria: StickyCriteria.fromJson(json["criteria"]),
    opportunity: StickyOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class StickyCriteria {
  StickyCriteria({
    this.compensation,
    this.location,
    this.type,
    this.organizationSize,
  });

  CriteriaCompensation compensation;
  Location location;
  List<TypeElement> type;
  OrganizationSize organizationSize;

  factory StickyCriteria.fromJson(Map<String, dynamic> json) => StickyCriteria(
    compensation: json["compensation"] == null ? null : CriteriaCompensation.fromJson(json["compensation"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    type: json["type"] == null ? null : List<TypeElement>.from(json["type"].map((x) => typeElementValues.map[x])),
    organizationSize: json["organizationSize"] == null ? null : OrganizationSize.fromJson(json["organizationSize"]),
  );

  Map<String, dynamic> toJson() => {
    "compensation": compensation == null ? null : compensation.toJson(),
    "location": location == null ? null : location.toJson(),
    "type": type == null ? null : List<dynamic>.from(type.map((x) => typeElementValues.reverse[x])),
    "organizationSize": organizationSize == null ? null : organizationSize.toJson(),
  };
}

class CriteriaCompensation {
  CriteriaCompensation({
    this.privacy,
    this.value,
  });

  Privacy privacy;
  Value value;

  factory CriteriaCompensation.fromJson(Map<String, dynamic> json) => CriteriaCompensation(
    privacy: privacyValues.map[json["privacy"]],
    value: Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "privacy": privacyValues.reverse[privacy],
    "value": value.toJson(),
  };
}

enum Privacy { PUBLIC }

final privacyValues = EnumValues({
  "public": Privacy.PUBLIC
});

class Value {
  Value({
    this.amount,
    this.currency,
    this.minimumHourly,
    this.periodicity,
  });

  double amount;
  Currency currency;
  double minimumHourly;
  Periodicity periodicity;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    amount: json["amount"],
    currency: currencyValues.map[json["currency"]],
    minimumHourly: json["minimumHourly"].toDouble(),
    periodicity: periodicityValues.map[json["periodicity"]],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currencyValues.reverse[currency],
    "minimumHourly": minimumHourly,
    "periodicity": periodicityValues.reverse[periodicity],
  };
}

class Location {
  Location({
    this.remoteBased,
    this.locationBased,
    this.locationName,
    this.locationShortName,
  });

  bool remoteBased;
  bool locationBased;
  LocationName locationName;
  LocationName locationShortName;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    remoteBased: json["remoteBased"],
    locationBased: json["locationBased"],
    locationName: locationNameValues.map[json["locationName"]],
    locationShortName: locationNameValues.map[json["locationShortName"]],
  );

  Map<String, dynamic> toJson() => {
    "remoteBased": remoteBased,
    "locationBased": locationBased,
    "locationName": locationNameValues.reverse[locationName],
    "locationShortName": locationNameValues.reverse[locationShortName],
  };
}

enum LocationName { NEW_JERSEY_EE_UU }

final locationNameValues = EnumValues({
  "New Jersey, EE. UU.": LocationName.NEW_JERSEY_EE_UU
});

class OrganizationSize {
  OrganizationSize({
    this.start,
    this.end,
  });

  int start;
  int end;

  factory OrganizationSize.fromJson(Map<String, dynamic> json) => OrganizationSize(
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
  };
}

enum TypeElement { ADVISING, FREELANCE_GIGS, INTERNSHIPS, FULL_TIME_EMPLOYMENT, PART_TIME_EMPLOYMENT, MENTORING }

final typeElementValues = EnumValues({
  "advising": TypeElement.ADVISING,
  "freelance-gigs": TypeElement.FREELANCE_GIGS,
  "full-time-employment": TypeElement.FULL_TIME_EMPLOYMENT,
  "internships": TypeElement.INTERNSHIPS,
  "mentoring": TypeElement.MENTORING,
  "part-time-employment": TypeElement.PART_TIME_EMPLOYMENT
});

class StickyOpportunity {
  StickyOpportunity({
    this.compensation,
    this.location,
    this.type,
    this.opportunityType,
    this.organizations,
  });

  OpportunityCompensation compensation;
  List<dynamic> location;
  TypeElement type;
  TypeElement opportunityType;
  Organizations organizations;

  factory StickyOpportunity.fromJson(Map<String, dynamic> json) => StickyOpportunity(
    compensation: json["compensation"] == null ? null : OpportunityCompensation.fromJson(json["compensation"]),
    location: json["location"] == null ? null : List<dynamic>.from(json["location"].map((x) => x)),
    type: json["type"] == null ? null : typeElementValues.map[json["type"]],
    opportunityType: json["opportunityType"] == null ? null : typeElementValues.map[json["opportunityType"]],
    organizations: json["organizations"] == null ? null : Organizations.fromJson(json["organizations"]),
  );

  Map<String, dynamic> toJson() => {
    "compensation": compensation == null ? null : compensation.toJson(),
    "location": location == null ? null : List<dynamic>.from(location.map((x) => x)),
    "type": type == null ? null : typeElementValues.reverse[type],
    "opportunityType": opportunityType == null ? null : typeElementValues.reverse[opportunityType],
    "organizations": organizations == null ? null : organizations.toJson(),
  };
}

class OpportunityCompensation {
  OpportunityCompensation({
    this.code,
    this.minAmount,
    this.maxAmount,
    this.currency,
    this.maxHourly,
    this.periodicity,
    this.visible,
  });

  Code code;
  double minAmount;
  double maxAmount;
  Currency currency;
  double maxHourly;
  Periodicity periodicity;
  bool visible;

  factory OpportunityCompensation.fromJson(Map<String, dynamic> json) => OpportunityCompensation(
    code: codeValues.map[json["code"]],
    minAmount: json["minAmount"],
    maxAmount: json["maxAmount"] == null ? null : json["maxAmount"],
    currency: currencyValues.map[json["currency"]],
    maxHourly: json["maxHourly"].toDouble(),
    periodicity: periodicityValues.map[json["periodicity"]],
    visible: json["visible"],
  );

  Map<String, dynamic> toJson() => {
    "code": codeValues.reverse[code],
    "minAmount": minAmount,
    "maxAmount": maxAmount == null ? null : maxAmount,
    "currency": currencyValues.reverse[currency],
    "maxHourly": maxHourly,
    "periodicity": periodicityValues.reverse[periodicity],
    "visible": visible,
  };
}

class Organizations {
  Organizations({
    this.holoMeeting,
    this.frubana,
    this.prometeoSoluciones,
    this.payvlida,
    this.catinfog,
    this.fundacinHuellaVital,
  });

  int holoMeeting;
  int frubana;
  int prometeoSoluciones;
  int payvlida;
  int catinfog;
  dynamic fundacinHuellaVital;

  factory Organizations.fromJson(Map<String, dynamic> json) => Organizations(
    holoMeeting: json["HoloMeeting"] == null ? null : json["HoloMeeting"],
    frubana: json["Frubana"] == null ? null : json["Frubana"],
    prometeoSoluciones: json["Prometeo Soluciones"] == null ? null : json["Prometeo Soluciones"],
    payvlida: json["Payválida"] == null ? null : json["Payválida"],
    catinfog: json["Catinfog"] == null ? null : json["Catinfog"],
    fundacinHuellaVital: json["Fundación Huella VITAL"],
  );

  Map<String, dynamic> toJson() => {
    "HoloMeeting": holoMeeting == null ? null : holoMeeting,
    "Frubana": frubana == null ? null : frubana,
    "Prometeo Soluciones": prometeoSoluciones == null ? null : prometeoSoluciones,
    "Payválida": payvlida == null ? null : payvlida,
    "Catinfog": catinfog == null ? null : catinfog,
    "Fundación Huella VITAL": fundacinHuellaVital,
  };
}

class IndigoInput {
  IndigoInput({
    this.criteria,
    this.opportunity,
  });

  IndigoCriteria criteria;
  IndigoOpportunity opportunity;

  factory IndigoInput.fromJson(Map<String, dynamic> json) => IndigoInput(
    criteria: IndigoCriteria.fromJson(json["criteria"]),
    opportunity: IndigoOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class IndigoCriteria {
  IndigoCriteria({
    this.type,
  });

  List<TypeElement> type;

  factory IndigoCriteria.fromJson(Map<String, dynamic> json) => IndigoCriteria(
    type: List<TypeElement>.from(json["type"].map((x) => typeElementValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "type": List<dynamic>.from(type.map((x) => typeElementValues.reverse[x])),
  };
}

class IndigoOpportunity {
  IndigoOpportunity({
    this.type,
  });

  TypeElement type;

  factory IndigoOpportunity.fromJson(Map<String, dynamic> json) => IndigoOpportunity(
    type: typeElementValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "type": typeElementValues.reverse[type],
  };
}

class Rank {
  Rank({
    this.position,
    this.value,
    this.boostedValue,
  });

  dynamic position;
  double value;
  double boostedValue;

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    position: json["position"] ,
    value: json["value"].toDouble(),
    boostedValue: json["boostedValue"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "value": value,
    "boostedValue": boostedValue,
  };
}

class Scorer {
  Scorer({
    this.type,
    this.score,
    this.and,
  });

  Type type;
  double score;
  List<ScorerAnd> and;

  factory Scorer.fromJson(Map<String, dynamic> json) => Scorer(
    type: typeValues.map[json["@type"]],
    score: json["score"].toDouble(),
    and: List<ScorerAnd>.from(json["and"].map((x) => ScorerAnd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "score": score,
    "and": List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

class ScorerAnd {
  ScorerAnd({
    this.type,
    this.score,
    this.and,
    this.id,
    this.input,
  });

  Type type;
  double score;
  List<FluffyAnd> and;
  IndecentId id;
  AmbitiousInput input;

  factory ScorerAnd.fromJson(Map<String, dynamic> json) => ScorerAnd(
    type: typeValues.map[json["@type"]],
    score: json["score"].toDouble(),
    and: json["and"] == null ? null : List<FluffyAnd>.from(json["and"].map((x) => FluffyAnd.fromJson(x))),
    id: json["id"] == null ? null : indecentIdValues.map[json["id"]],
    input: json["input"] == null ? null : AmbitiousInput.fromJson(json["input"]),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "score": score,
    "and": and == null ? null : List<dynamic>.from(and.map((x) => x.toJson())),
    "id": id == null ? null : indecentIdValues.reverse[id],
    "input": input == null ? null : input.toJson(),
  };
}

class FluffyAnd {
  FluffyAnd({
    this.type,
    this.id,
    this.input,
    this.score,
    this.or,
    this.and,
  });

  Type type;
  IndigoId id;
  IndecentInput input;
  double score;
  List<FluffyOr> or;
  List<PurpleAnd> and;

  factory FluffyAnd.fromJson(Map<String, dynamic> json) => FluffyAnd(
    type: typeValues.map[json["@type"]],
    id: json["id"] == null ? null : indigoIdValues.map[json["id"]],
    input: json["input"] == null ? null : IndecentInput.fromJson(json["input"]),
    score: json["score"].toDouble(),
    or: json["or"] == null ? null : List<FluffyOr>.from(json["or"].map((x) => FluffyOr.fromJson(x))),
    and: json["and"] == null ? null : List<PurpleAnd>.from(json["and"].map((x) => PurpleAnd.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "id": id == null ? null : indigoIdValues.reverse[id],
    "input": input == null ? null : input.toJson(),
    "score": score,
    "or": or == null ? null : List<dynamic>.from(or.map((x) => x.toJson())),
    "and": and == null ? null : List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

enum IndigoId { TIMEZONE, INTEREST }

final indigoIdValues = EnumValues({
  "interest": IndigoId.INTEREST,
  "timezone": IndigoId.TIMEZONE
});

class IndecentInput {
  IndecentInput({
    this.criteria,
    this.opportunity,
  });

  IndecentCriteria criteria;
  IndecentOpportunity opportunity;

  factory IndecentInput.fromJson(Map<String, dynamic> json) => IndecentInput(
    criteria: IndecentCriteria.fromJson(json["criteria"]),
    opportunity: IndecentOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class IndecentCriteria {
  IndecentCriteria({
    this.timezone,
    this.skills,
  });

  CriteriaTimezone timezone;
  List<CriteriaSkill> skills;

  factory IndecentCriteria.fromJson(Map<String, dynamic> json) => IndecentCriteria(
    timezone: json["timezone"] == null ? null : criteriaTimezoneValues.map[json["timezone"]],
    skills: json["skills"] == null ? null : List<CriteriaSkill>.from(json["skills"].map((x) => CriteriaSkill.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "timezone": timezone == null ? null : criteriaTimezoneValues.reverse[timezone],
    "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toJson())),
  };
}

class IndecentOpportunity {
  IndecentOpportunity({
    this.timezone,
    this.skills,
  });

  List<TimezoneElement> timezone;
  List<OpportunitySkill> skills;

  factory IndecentOpportunity.fromJson(Map<String, dynamic> json) => IndecentOpportunity(
    timezone: json["timezone"] == null ? null : List<TimezoneElement>.from(json["timezone"].map((x) => timezoneElementValues.map[x])),
    skills: json["skills"] == null ? null : List<OpportunitySkill>.from(json["skills"].map((x) => OpportunitySkill.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "timezone": timezone == null ? null : List<dynamic>.from(timezone.map((x) => timezoneElementValues.reverse[x])),
    "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toJson())),
  };
}

class FluffyOr {
  FluffyOr({
    this.type,
    this.id,
    this.input,
    this.score,
  });

  Type type;
  StickyId id;
  HilariousInput input;
  double score;

  factory FluffyOr.fromJson(Map<String, dynamic> json) => FluffyOr(
    type: typeValues.map[json["@type"]],
    id: stickyIdValues.map[json["id"]],
    input: HilariousInput.fromJson(json["input"]),
    score: json["score"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "@type": typeValues.reverse[type],
    "id": stickyIdValues.reverse[id],
    "input": input.toJson(),
    "score": score,
  };
}

class HilariousInput {
  HilariousInput({
    this.criteria,
    this.opportunity,
  });

  HilariousCriteria criteria;
  HilariousOpportunity opportunity;

  factory HilariousInput.fromJson(Map<String, dynamic> json) => HilariousInput(
    criteria: HilariousCriteria.fromJson(json["criteria"]),
    opportunity: HilariousOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "opportunity": opportunity.toJson(),
  };
}

class HilariousCriteria {
  HilariousCriteria({
    this.compensation,
  });

  CriteriaCompensation compensation;

  factory HilariousCriteria.fromJson(Map<String, dynamic> json) => HilariousCriteria(
    compensation: CriteriaCompensation.fromJson(json["compensation"]),
  );

  Map<String, dynamic> toJson() => {
    "compensation": compensation.toJson(),
  };
}

class HilariousOpportunity {
  HilariousOpportunity({
    this.compensation,
  });

  OpportunityCompensation compensation;

  factory HilariousOpportunity.fromJson(Map<String, dynamic> json) => HilariousOpportunity(
    compensation: OpportunityCompensation.fromJson(json["compensation"]),
  );

  Map<String, dynamic> toJson() => {
    "compensation": compensation.toJson(),
  };
}

enum IndecentId { COMPLETION }

final indecentIdValues = EnumValues({
  "completion": IndecentId.COMPLETION
});

class AmbitiousInput {
  AmbitiousInput({
    this.criteria,
    this.opportunity,
  });

  dynamic criteria;
  AmbitiousOpportunity opportunity;

  factory AmbitiousInput.fromJson(Map<String, dynamic> json) => AmbitiousInput(
    criteria: json["criteria"],
    opportunity: AmbitiousOpportunity.fromJson(json["opportunity"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria,
    "opportunity": opportunity.toJson(),
  };
}

class AmbitiousOpportunity {
  AmbitiousOpportunity({
    this.completion,
  });

  double completion;

  factory AmbitiousOpportunity.fromJson(Map<String, dynamic> json) => AmbitiousOpportunity(
    completion: json["completion"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "completion": completion,
  };
}

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
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "picture": picture,
  };
}

class Question {
  Question({
    this.id,
    this.text,
    this.date,
  });

  String id;
  String text;
  DateTime date;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    text: json["text"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "date": date.toIso8601String(),
  };
}

class ResultSkill {
  ResultSkill({
    this.name,
    this.experience,
  });

  String name;
  ExperienceEnum experience;

  factory ResultSkill.fromJson(Map<String, dynamic> json) => ResultSkill(
    name: json["name"],
    experience: experienceEnumValues.map[json["experience"]],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "experience": experienceEnumValues.reverse[experience],
  };
}

enum ExperienceEnum { THE_3_PLUS_YEARS, THE_2_PLUS_YEARS, THE_1_PLUS_YEAR, THE_5_PLUS_YEARS, POTENTIAL_TO_DEVELOP }

final experienceEnumValues = EnumValues({
  "potential-to-develop": ExperienceEnum.POTENTIAL_TO_DEVELOP,
  "1-plus-year": ExperienceEnum.THE_1_PLUS_YEAR,
  "2-plus-years": ExperienceEnum.THE_2_PLUS_YEARS,
  "3-plus-years": ExperienceEnum.THE_3_PLUS_YEARS,
  "5-plus-years": ExperienceEnum.THE_5_PLUS_YEARS
});

enum Status { CLOSED, OPEN }

final statusValues = EnumValues({
  "closed": Status.CLOSED,
  "open": Status.OPEN
});

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
