class OfficerResponse {
  User? user;
  List<Report>? reports;

  OfficerResponse({this.user, this.reports});

  OfficerResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['reports'] != null) {
      reports = <Report>[];
      json['reports'].forEach((v) {
        reports!.add(new Report.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.reports != null) {
      data['reports'] = this.reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;

  User({this.id, this.name, this.email, this.phone, this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    return data;
  }
}

class Report {
  int? id;
  String? propertyName;
  String? propertyLocation;
  String? description;
  // String? serialNumber;
  String? reportedOn;
  String? status;

  Report(
      {this.id,
      this.propertyName,
      this.propertyLocation,
      this.description,
      this.reportedOn,
      this.status});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyName = json['property_name'];
    propertyLocation = json['property_location'];
    description = json['description'];
    reportedOn = json['reported_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_name'] = this.propertyName;
    data['property_location'] = this.propertyLocation;
    data['description'] = this.description;
    data['reported_on'] = this.reportedOn;
    data['status'] = this.status;
    return data;
  }
}
