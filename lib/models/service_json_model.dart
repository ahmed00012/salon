class SalonServices{
  List<ServiceJsonModel> ? services ;
  SalonServices({this.services});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.services != null) {
      data['services'] =
          this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceJsonModel {
  String? id;
  int? priceFrom;
  int? priceTo;
  String? duration;

  ServiceJsonModel({this.id,this.duration,this.priceFrom,this.priceTo});


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price_from'] = this.priceFrom;
    data['price_to'] = this.priceTo;
    data['duration'] = this.duration;

    return data;
  }
}