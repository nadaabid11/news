class TechModel {
  String title,imageUrl,time,details;

  TechModel(this.title,this.imageUrl,this.time,this.details);
  TechModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map['description'];

  }
}