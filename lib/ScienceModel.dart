class ScienceModel {
  String title,imageUrl,time,details;

  ScienceModel(this.title,this.imageUrl,this.time,this.details);
  ScienceModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map['description'];
  }
}