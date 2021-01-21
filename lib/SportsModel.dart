class SportsModel {
  String title,imageUrl,time,details;

  SportsModel(this.title,this.imageUrl,this.time,this.details);
  SportsModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map['description'];

  }
}