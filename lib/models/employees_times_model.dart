
class EmployeesTimeModel {
  String? id;
  String? name;
  String? image;
  String? workFrom;
  String? workTo;
  List<String>? availableTimes;
  List? timeWorking;

  EmployeesTimeModel(
      {this.id,
        this.name,
        this.image,
        this.workFrom,
        this.workTo,
        this.availableTimes,
      this.timeWorking});

  EmployeesTimeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    workFrom = json['work_from'];
    workTo = json['work_to'];
    availableTimes = json['available_times'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['work_from'] = this.workFrom;
    data['work_to'] = this.workTo;
    data['available_times'] = this.availableTimes;
    return data;
  }
}
