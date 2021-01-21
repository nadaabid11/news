class BookMarkModel {
  String title,imageUrl,time,details;

  BookMarkModel(this.title,this.imageUrl,this.time,this.details);

  BookMarkModel.fromJson(Map<String,dynamic>map){
    this.title = map['title'];
    this.imageUrl = map['urlToImage'];
    this.time = map['publishedAt'];
    this.details = map['description'];
  }

  Map<String,String> toJson(){
    return {
      'title': title,
      'urlToImage': imageUrl,
      'publishedAt': time,
      'description': details,
    };
  }
}