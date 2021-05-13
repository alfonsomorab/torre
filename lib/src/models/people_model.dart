// To parse this JSON data, do
//
//     final people = peopleFromJson(jsonString);

import 'dart:convert';

People peopleFromJson(String str) => People.fromJson(json.decode(str));

String peopleToJson(People data) => json.encode(data.toJson());

class People {
  People({
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

  factory People.fromJson(Map<String, dynamic> json) => People(
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
  Aggregators();

  factory Aggregators.fromJson(Map<String, dynamic> json) => Aggregators(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Result {
  Result({
    this.context,
    this.meta,
    this.compensations,
    this.locationName,
    this.name,
    this.openTo,
    this.picture,
    this.professionalHeadline,
    this.remoter,
    this.skills,
    this.subjectId,
    this.username,
    this.verified,
    this.weight,
  });

  Context context;
  Meta meta;
  Compensations compensations;
  String locationName;
  String name;
  List<String> openTo;
  String picture;
  String professionalHeadline;
  bool remoter;
  List<Skill> skills;
  String subjectId;
  String username;
  bool verified;
  double weight;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    context: Context.fromJson(json["context"]),
    meta: Meta.fromJson(json["_meta"]),
    compensations: Compensations.fromJson(json["compensations"]),
    locationName: json["locationName"],
    name: json["name"],
    openTo: List<String>.from(json["openTo"].map((x) => x)),
    picture: json["picture"] == null ? null : json["picture"],
    professionalHeadline: json["professionalHeadline"],
    remoter: json["remoter"],
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    subjectId: json["subjectId"],
    username: json["username"],
    verified: json["verified"],
    weight: json["weight"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "context": context.toJson(),
    "_meta": meta.toJson(),
    "compensations": compensations.toJson(),
    "locationName": locationName,
    "name": name,
    "openTo": List<dynamic>.from(openTo.map((x) => x)),
    "picture": picture == null ? null : picture,
    "professionalHeadline": professionalHeadline,
    "remoter": remoter,
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "subjectId": subjectId,
    "username": username,
    "verified": verified,
    "weight": weight,
  };
}

class Compensations {
  Compensations({
    this.freelancer,
    this.intern,
    this.employee,
  });

  Employee freelancer;
  Employee intern;
  Employee employee;

  factory Compensations.fromJson(Map<String, dynamic> json) => Compensations(
    freelancer: json["freelancer"] == null ? null : Employee.fromJson(json["freelancer"]),
    intern: json["intern"] == null ? null : Employee.fromJson(json["intern"]),
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
  );

  Map<String, dynamic> toJson() => {
    "freelancer": freelancer == null ? null : freelancer.toJson(),
    "intern": intern == null ? null : intern.toJson(),
    "employee": employee == null ? null : employee.toJson(),
  };
}

class Employee {
  Employee({
    this.amount,
    this.currency,
    this.periodicity,
  });

  double amount;
  String currency;
  String periodicity;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    amount: json["amount"],
    currency: json["currency"],
    periodicity: json["periodicity"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "currency": currency,
    "periodicity": periodicity,
  };
}

class Context {
  Context({
    this.signaled,
  });

  dynamic signaled;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    signaled: json["signaled"],
  );

  Map<String, dynamic> toJson() => {
    "signaled": signaled,
  };
}

class Meta {
  Meta({
    this.ranker,
    this.filter,
  });

  Ranker ranker;
  Filter filter;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    ranker: Ranker.fromJson(json["ranker"]),
    filter: Filter.fromJson(json["filter"]),
  );

  Map<String, dynamic> toJson() => {
    "ranker": ranker.toJson(),
    "filter": filter.toJson(),
  };
}

class Filter {
  Filter({
    this.type,
    this.pass,
    this.id,
    this.input,
  });

  String type;
  bool pass;
  String id;
  FilterInput input;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    type: json["@type"],
    pass: json["pass"],
    id: json["id"],
    input: FilterInput.fromJson(json["input"]),
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "pass": pass,
    "id": id,
    "input": input.toJson(),
  };
}

class FilterInput {
  FilterInput({
    this.criteria,
    this.person,
  });

  PersonClass criteria;
  PersonClass person;

  factory FilterInput.fromJson(Map<String, dynamic> json) => FilterInput(
    criteria: PersonClass.fromJson(json["criteria"]),
    person: PersonClass.fromJson(json["person"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria.toJson(),
    "person": person.toJson(),
  };
}

class PersonClass {
  PersonClass({
    this.name,
  });

  String name;

  factory PersonClass.fromJson(Map<String, dynamic> json) => PersonClass(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Ranker {
  Ranker({
    this.type,
    this.rank,
    this.score,
    this.and,
  });

  String type;
  dynamic rank;
  dynamic score;
  List<And> and;

  factory Ranker.fromJson(Map<String, dynamic> json) => Ranker(
    type: json["@type"],
    rank: json["rank"],
    score: json["score"],
    and: List<And>.from(json["and"].map((x) => And.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "rank": rank,
    "score": score,
    "and": List<dynamic>.from(and.map((x) => x.toJson())),
  };
}

class And {
  And({
    this.type,
    this.rank,
    this.scorer,
    this.score,
    this.input,
  });

  String type;
  dynamic rank;
  String scorer;
  dynamic score;
  AndInput input;

  factory And.fromJson(Map<String, dynamic> json) => And(
    type: json["@type"],
    rank: json["rank"],
    scorer: json["scorer"],
    score: json["score"],
    input: AndInput.fromJson(json["input"]),
  );

  Map<String, dynamic> toJson() => {
    "@type": type,
    "rank": rank,
    "scorer": scorer,
    "score": score,
    "input": input.toJson(),
  };
}

class AndInput {
  AndInput({
    this.criteria,
    this.person,
  });

  PurpleCriteria criteria;
  Person person;

  factory AndInput.fromJson(Map<String, dynamic> json) => AndInput(
    criteria: json["criteria"] == null ? null : PurpleCriteria.fromJson(json["criteria"]),
    person: Person.fromJson(json["person"]),
  );

  Map<String, dynamic> toJson() => {
    "criteria": criteria == null ? null : criteria.toJson(),
    "person": person.toJson(),
  };
}

class PurpleCriteria {
  PurpleCriteria({
    this.names,
  });

  List<String> names;

  factory PurpleCriteria.fromJson(Map<String, dynamic> json) => PurpleCriteria(
    names: List<String>.from(json["names"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "names": List<dynamic>.from(names.map((x) => x)),
  };
}

class Person {
  Person({
    this.name,
    this.weight,
    this.completion,
    this.grammar,
  });

  String name;
  double weight;
  double completion;
  double grammar;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    name: json["name"] == null ? null : json["name"],
    weight: json["weight"] == null ? null : json["weight"].toDouble(),
    completion: json["completion"] == null ? null : json["completion"].toDouble(),
    grammar: json["grammar"] == null ? null : json["grammar"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "weight": weight == null ? null : weight,
    "completion": completion == null ? null : completion,
    "grammar": grammar == null ? null : grammar,
  };
}

class Skill {
  Skill({
    this.name,
    this.weight,
  });

  String name;
  double weight;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    name: json["name"],
    weight: json["weight"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "weight": weight,
  };
}
