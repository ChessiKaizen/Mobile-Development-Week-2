enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;
  const Address({required this.street,required this.city,required this.zipCode,});
}
class Employee {
  // Q3 - private attributes
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;
  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience): _name = name, _baseSalary = 40000, _skills = [Skill.FLUTTER, Skill.DART], _address = address,_yearsOfExperience = yearsOfExperience;
  Employee.backendDeveloper(String name, Address address, int yearsOfExperience): _name = name, _baseSalary = 40000, _skills = [Skill.DART, Skill.OTHER], _address = address,_yearsOfExperience = yearsOfExperience;
  // Q3 - getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;
  // Q4 - compute salary
  double computeSalary() {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;
    for (final skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }
  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$$_baseSalary');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Skills: ${skills}');
    print('Experience: $_yearsOfExperience years');
    print('Computed Salary: ${computeSalary()}');
  }
}
void main() {
  var emp1 = Employee('Sokea',40000,[Skill.DART, Skill.OTHER],Address(street: '123', city: 'Phnom Penh', zipCode: '12000'),2,);
  emp1.printDetails();

  var emp2 = Employee('Ronan',45000,[Skill.FLUTTER, Skill.DART],Address(street: '456', city: 'Siem Reap', zipCode: '17000'),5,);
  emp2.printDetails();

  var emp3 = Employee.mobileDeveloper('Dara',Address(street: '789', city: 'Battambang', zipCode: '02000'),3,);
  emp3.printDetails();
}