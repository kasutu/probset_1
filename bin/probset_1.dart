import 'dart:io';

// Student class definition
class Student {
  String name;
  int age;
  int score;

  // Constructor
  Student(this.name, this.age, this.score);
}

// Product class definition
class Product {
  String name;
  double price;
  int quantity;

  // Constructor
  Product(this.name, this.price, this.quantity);
}

void main() {
  // Lists to store students and products
  List<Student> students = [];
  List<Product> products = [];

  while (true) {
    print("\nWelcome to the Management System!");
    print("1. Manage Students");
    print("2. Manage Products");
    print("3. Exit");
    String? choice = stdin.readLineSync();

    if (choice == "1") {
      studentManagement(students);
    } else if (choice == "2") {
      productManagement(products);
    } else if (choice == "3") {
      print("Exiting the application. Goodbye!");
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}

// Student Management System
void studentManagement(List<Student> students) {
  while (true) {
    print("\nStudent Management:");
    print("1. Add Student");
    print("2. Print All Students");
    print("3. Find Student with Highest Score");
    print("4. Calculate Average Score");
    print("5. Sort Students by Score (Descending)");
    print("6. Return to Main Menu");

    String? choice = stdin.readLineSync();
    if (choice == "1") {
      addStudent(students);
    } else if (choice == "2") {
      printStudents(students);
    } else if (choice == "3") {
      findHighestScoreStudent(students);
    } else if (choice == "4") {
      calculateAverageScore(students);
    } else if (choice == "5") {
      sortStudentsByScore(students);
    } else if (choice == "6") {
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}

void addStudent(List<Student> students) {
  print("Enter student's name:");
  String? name = stdin.readLineSync();

  print("Enter student's age:");
  int age = int.parse(stdin.readLineSync()!);

  print("Enter student's score:");
  int score = int.parse(stdin.readLineSync()!);

  students.add(Student(name!, age, score));
  print("Student added successfully!");
}

void printStudents(List<Student> students) {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }
  for (var student in students) {
    print(
        "Name: ${student.name}, Age: ${student.age}, Score: ${student.score}");
  }
}

void findHighestScoreStudent(List<Student> students) {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }

  Student highestScoreStudent = students[0];
  for (var student in students) {
    if (student.score > highestScoreStudent.score) {
      highestScoreStudent = student;
    }
  }

  print(
      "Student with highest score: ${highestScoreStudent.name} (${highestScoreStudent.score})");
}

void calculateAverageScore(List<Student> students) {
  if (students.isEmpty) {
    print("No students available.");
    return;
  }

  int totalScore = students.fold(0, (sum, student) => sum + student.score);
  double average = totalScore / students.length;
  print("Average score of all students: ${average.toStringAsFixed(2)}");
}

void sortStudentsByScore(List<Student> students) {
  students.sort((a, b) => b.score.compareTo(a.score));
  print("Students sorted by score in descending order.");
}

// Product Management System
void productManagement(List<Product> products) {
  while (true) {
    print("\nProduct Management:");
    print("1. Add Product");
    print("2. Print All Products");
    print("3. Find Most Expensive Product");
    print("4. Calculate Total Inventory Value");
    print("5. Sort Products by Price (Descending)");
    print("6. Return to Main Menu");

    String? choice = stdin.readLineSync();
    if (choice == "1") {
      addProduct(products);
    } else if (choice == "2") {
      printProducts(products);
    } else if (choice == "3") {
      findMostExpensiveProduct(products);
    } else if (choice == "4") {
      calculateTotalInventoryValue(products);
    } else if (choice == "5") {
      sortProductsByPrice(products);
    } else if (choice == "6") {
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}

void addProduct(List<Product> products) {
  print("Enter product's name:");
  String? name = stdin.readLineSync();

  print("Enter product's price:");
  double price = double.parse(stdin.readLineSync()!);

  print("Enter product's quantity:");
  int quantity = int.parse(stdin.readLineSync()!);

  products.add(Product(name!, price, quantity));
  print("Product added successfully!");
}

void printProducts(List<Product> products) {
  if (products.isEmpty) {
    print("No products available.");
    return;
  }
  for (var product in products) {
    print(
        "Name: ${product.name}, Price: \$${product.price}, Quantity: ${product.quantity}");
  }
}

void findMostExpensiveProduct(List<Product> products) {
  if (products.isEmpty) {
    print("No products available.");
    return;
  }

  Product mostExpensive = products[0];
  for (var product in products) {
    if (product.price > mostExpensive.price) {
      mostExpensive = product;
    }
  }

  print(
      "Most expensive product: ${mostExpensive.name} (\$${mostExpensive.price})");
}

void calculateTotalInventoryValue(List<Product> products) {
  if (products.isEmpty) {
    print("No products available.");
    return;
  }

  double totalValue = products.fold(
      0.0, (sum, product) => sum + (product.price * product.quantity));
  print("Total inventory value: \$${totalValue.toStringAsFixed(2)}");
}

void sortProductsByPrice(List<Product> products) {
  products.sort((a, b) => b.price.compareTo(a.price));
  print("Products sorted by price in descending order.");
}
