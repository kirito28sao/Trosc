// Abstract shape class
abstract class Shape {
  double area();
}

// Circle subclass
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

// Rectangle subclass
class Rectangle extends Shape {
  double length;
  double width;

  Rectangle(this.length, this.width);

  @override
  double area() {
    return length * width;
  }
}

//demonstrate polymorphism
void printArea(Shape shape) {
  print('The area is: ${shape.area()}');
}
