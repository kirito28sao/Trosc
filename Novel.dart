import 'Book.dart';

//Novel class
class Novel extends Book {
  String? genre;

// Constructor
  Novel(String title, String author, int pages, this.genre)
      : super(title, author, pages);

//Override
  @override
  void Display() {
    super.Display();
    print('Genre: $genre');
  }
}

void main() {
  Novel myNovel = Novel('Harry Potter', 'J.K. Rowling', 214, 'Magic');
  myNovel.Display();
}
