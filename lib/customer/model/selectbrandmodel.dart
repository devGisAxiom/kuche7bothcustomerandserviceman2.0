class SelectBrand {
  String? status;
  int? successCode;
  String? message;
  List<Data>? data;

  SelectBrand({this.status, this.successCode, this.message, this.data});

  SelectBrand.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? idProduct;
  String? name;
  String? colourTheme;
  String? colorTab;
  String? colorIcon;
  String? image;
  String? logo;
  String? banner;

  Data({
    this.idProduct,
    this.name,
    this.colourTheme,
    this.colorTab,
    this.colorIcon,
    this.image,
    this.logo,
    this.banner,
  });

  Data.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    name = json['name'];
    colourTheme = json['colour_theme'];
    colorTab = json['color_tab'];
    colorIcon = json['color_icon'];
    image = json['image'];
    logo = json['logo'];
    banner = json['banner'];
  }
}
