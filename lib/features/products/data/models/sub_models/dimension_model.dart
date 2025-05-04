/// width : 15.14
/// height : 13.08
/// depth : 22.99

class Dimensions {
  Dimensions({
    this.width,
    this.height,
    this.depth,});

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  num? width;
  num? height;
  num? depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

}