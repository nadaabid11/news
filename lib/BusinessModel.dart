class BusinessModel {
  String title,imageUrl,time,details;

  BusinessModel(this.title,this.imageUrl,this.time,this.details);
  BusinessModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map['description'];

  }
}