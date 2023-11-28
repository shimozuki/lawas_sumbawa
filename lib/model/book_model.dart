class BookModel {
  String name, image, author, price;

  BookModel(this.name, this.image, this.author, this.price);
}

List bookList = <BookModel>[
  BookModel(
      "Ajan aku dadi jangi", "assets/Lawas.png", "Sanopi", "20"),
  BookModel(
      "Saribu bintang leng langit", "assets/Lawas.png", "Zadwi", "25"),
  BookModel(
      "Jangi kami tu salaki", "assets/Lawas.png", "Wahyudi", "18"),
  BookModel(
      "Ngibar piyo kalis Empang", "assets/Lawas.png", "Adel", "38"),
];
