class ReportResponse {
  List<Report>? data;
  String? status;
  String? message;
  int? statusCode;

  ReportResponse({this.data, this.status, this.message, this.statusCode});

  ReportResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Report>[];
      json['data'].forEach((v) {
        data!.add(new Report.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    data['status'] = this.status;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Report {
  int? id;
  String? propertyName;
  String? propertyLocation;
  String? description;
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
