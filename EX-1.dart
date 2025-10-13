enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  String _name;
  double _baseSalary;
  Skill _skill;
  Address _address;
  int _yearOfExperience;

  Employee(
    String name,
    double baseSalary,
    Skill skill,
    Address address,
    int yearOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skill = skill,
      _address = address,
      _yearOfExperience = yearOfExperience;

  Employee.flutterSkill(
    String name,
    double baseSalary,
    Skill skill,
    Address address,
    int yearOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skill = Skill.FLUTTER,
      _address = address,
      _yearOfExperience = yearOfExperience;

  Employee.dartSkill(
    String name,
    double baseSalary,
    Skill skill,
    Address address,
    int yearOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skill = Skill.DART,
      _address = address,
      _yearOfExperience = yearOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  Skill get skill => _skill;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  void printDetails() {
    print(
      'Employee: $name\n'
      'Base Salary: \$${baseSalary}\n'
      'Skill: ${skill.name}\n'
      'Address: ${address.street}, ${address.city}, ${address.zipCode}\n'
      'Years of Experience: $yearOfExperience\n'
      'Total Salary: \$${computeSalary()}\n', 
    );
  }

  double computeSalary() {
    double skillBonus = 0;
    switch (_skill) {
      case Skill.FLUTTER:
        skillBonus = 500;
        break;
      case Skill.DART:
        skillBonus = 400;
        break;
      case Skill.OTHER:
        skillBonus = 100;
        break;
    }
    double experienceBonus = _yearOfExperience * 2000;
    return _baseSalary + experienceBonus + skillBonus;
  }

}

void main() {
  var add1 = Address('123 Main St', 'Phnom Penh', '111');

  var emp1 = Employee('Sokea', 40000, Skill.DART, add1, 3);
  emp1.printDetails();

  var emp2 = Employee.flutterSkill('Ronan', 45000, Skill.FLUTTER, add1, 5);
  emp2.printDetails();
}