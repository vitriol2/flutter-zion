class ImagePathModel {
  List<String> files;
  String folderName;

  ImagePathModel({
    this.files,
    this.folderName,
  });

  factory ImagePathModel.fromJson(Map<String, dynamic> json) => ImagePathModel(
    files: List<String>.from(json["files"].map((x) => x)),
    folderName: json["folderName"],
  );

  Map<String, dynamic> toJson() => {
    "files": List<dynamic>.from(files.map((x) => x)),
    "folderName": folderName,
  };
}