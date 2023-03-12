class PicsumModel {
  
    String? id;
    String? author;
    int? width;
    int? height;
    String? url;
    String? downloadUrl;

    PicsumModel({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    factory PicsumModel.fromJson(Map<String, dynamic> json) => PicsumModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
