// Book class
class Book {
  String? title;
  String? author;
  int? page_num;

// Constructor

  Book(this.title, this.author, this.page_num);

// setters
  set setTitle(String title) {
    this.title = title;
  }

  set setAuthor(String author) {
    this.author = author;
  }

  set setNum(int page_num) {
    this.page_num = page_num;
  }

// getters
  get getTitle => title;

  get getAuthor => author;

  get getNum => page_num;

  // Display function
  void Display() {
    print("Title : $title");
    print("Author : $author");
    print("Number of Pages : $page_num");
  }
}

void main() {
  Book myBook = Book('Harry Potter', 'J.K. Rowling', 214);

  myBook.Display();
}
