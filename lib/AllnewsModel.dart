class AllnewsModel {
  String title,imageUrl,time,details;

  AllnewsModel(this.title,this.imageUrl,this.time,this.details);
  AllnewsModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map["description"];

  }
}