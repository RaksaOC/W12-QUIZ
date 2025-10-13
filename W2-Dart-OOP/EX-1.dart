enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipcode;

  String get street => _street;
  String get city => _city;
  String get zipcode => _zipcode;

}

class Employee {
  String name;
  double baseSalary;
  Skill skills;
  int yearsOfExperience;
  Address address;

  Employee(this.name, this.baseSalary, this.skills, this.yearsOfExperience);

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}');
  }
}





void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
}