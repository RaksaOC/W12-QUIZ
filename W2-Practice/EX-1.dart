enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills = [];
  Map<String, String> _address = {};
  int _yearOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._address,
    this._yearOfExperience,
    this._skills,
  );

  void printDetails() {
    print(
      'Employee: $_name, Base Salary: \$${_baseSalary}, Address: $_address, Years of Experience: $_yearOfExperience, Skills: $_skills',
    );
  }

  String get getInfo =>
      'Employee: $_name, Base Salary: \$${_baseSalary}, Address: $_address, Years of Experience: $_yearOfExperience, Skills: $_skills';

  void getSalary(double baseSalary, int yearOfExperience, List<Skill> skills) {
    const double yearExperienceBonus = 2000;
    const Map<Skill, double> skillBonus = {
      Skill.FLUTTER: 3000,
      Skill.DART: 2500,
      Skill.OTHER: 1000,
    };
    double totalSalaryWithoutBonus =
        baseSalary + (yearOfExperience * yearExperienceBonus);
    double totalSkillBonus = 0.00;
    // adding up the skill bonuses
    for (var skill in skills) {
      totalSkillBonus += skillBonus[skill]!;
    }

    print(totalSalaryWithoutBonus + totalSkillBonus);
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    {'city': 'Phnom Penh', 'country': 'Cambodia'},
    5,
    [Skill.FLUTTER, Skill.DART],
  );
  emp1.printDetails();

  print(emp1.getInfo);

  emp1.getSalary(emp1._baseSalary, emp1._yearOfExperience, emp1._skills);

  var emp2 = Employee(
    'Ronan',
    45000,
    {'city': 'Siem Reap', 'country': 'Cambodia'},
    3,
    [Skill.DART, Skill.OTHER],
  );

  emp2.printDetails();

  print(emp2.getInfo);

  emp2.getSalary(emp2._baseSalary, emp2._yearOfExperience, emp2._skills);
}
