class Dog{
  int id;
  String name;
  int age;

  Dog(this.name, this.age, {this.id = 0});

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }


}