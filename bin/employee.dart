// Sale person information
// create mixin of firstname of employees
mixin HasFirstName {
  String get firstName;
}
// create mixin of lastname of employees
mixin HasLastName {
  String get lastName;
}
// create mixin of fullname of employees:
mixin HasFullName on HasFirstName,HasLastName {
  String get fullName => '$firstName $lastName';
}
// create mixin of position of employees
mixin HasPosition {
  String get position;
}
// create mixin of email of employees
mixin HasEmail {
  String get email;
}

// create mixin to check email validation
mixin ValidationEmail {
  // this mixin check the validation of email
  bool  isvalidEmail (String email) {
    final RegExp emailRegExp= RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(email);
}
}



//create class of employees with fullname and position
class Employees with HasFirstName,HasLastName,HasFullName,HasPosition,HasEmail,ValidationEmail {
  @override
  final String firstName;

  @override
  final String lastName;

  @override
  final String position;
  
  @override
  final String email;

  String employeeID;
  
  Employees ({required this.employeeID,
  required this.firstName,
    required this.lastName,
    required this.position,
    required this.email,});
}


  List<Employees> empList = <Employees>[
   Employees(employeeID: 'E001', 
        firstName: 'Michael', 
        lastName: 'Doe', 
        position: 'Manager', email: 'MDoe@gmail.com'),
  Employees(employeeID: 'E002', 
        firstName: 'Linda', 
        lastName: 'Anova', 
        position: 'Account', email: 'LAnova@gmail.com'),
  Employees(employeeID: 'E003', 
        firstName: 'Anna', 
        lastName: 'Franky', 
        position: 'Seller', email: 'AFranky@gmail.com'),
  Employees(employeeID: 'E004', 
        firstName: 'David', 
        lastName: 'Franky', 
        position: 'Seller', email: 'DNguyen@gmail.com')];

enum PositionList {manager, account, seller}