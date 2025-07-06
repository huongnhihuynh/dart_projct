import 'dart:io';

import 'package:project1/project1.dart' as project1;
import 'employee.dart';
import 'product.dart';

void main(List<String> arguments) {
  print('Hello world: ${project1.calculate()}!');

  print(empList[0].employeeID);
  print('Start to calculate the Total sale of product for each employee');
  // Input email
  print('Please input the email');
    String? inputEmail = stdin.readLineSync();

    RegExp emailRegExp= RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegExp.hasMatch(inputEmail ?? "")){
      print('$inputEmail is valid');
    } else {print('Invalid email');}
    
  // Input the employee id
    Set<String> setEmp = { empList[0].employeeID,
    empList[1].employeeID,empList[2].employeeID,empList[3].employeeID};
    print('List of employee ID is $setEmp');
    
    print('Please input the employee ID');
    String? inputEmployeeID = stdin.readLineSync();

    if (inputEmployeeID == null || inputEmployeeID == ''){
        print('please input employeeID.');
    }
    for (String e in setEmp) {
      if (e!=inputEmployeeID){
          continue; 
      } else {break;}
    }
    // this function to input position of employee
    print('Please input the position of employee');
    print('This is positions :$PositionList');
    String? inputPosition = stdin.readLineSync();
    
    switch (inputPosition) {
      case 'manager' || 'Manager':
          print('Please come back after accountant calculating the total sale');
      break;
      case 'seller' || 'Seller':
          print('Please come back after accountant calculating the total sale');
      break;
      case 'accountant' || 'Accountant':
    
// input product information 

    print('Please input type of product: ');
    
    String? inputType = stdin.readLineSync();

    if (inputType == 'car' || inputType == 'Car') {
      final car = CarDescription('Cadillac',2021,700.32);
       // Input the quantity of product
          print('Please input the quantity');
          String? inputQ = stdin.readLineSync();
          int numericQ = int.parse(inputQ.toString());
      // Input the discount of product
          print('Please input the discount');
          String? inputD = stdin.readLineSync();
          int numericD = int.parse(inputD.toString());
          final ts = TotalSale(price: car.price, quantity: numericQ, discount: numericD);
      // print the revenue
          print('The total sell of $inputEmployeeID selling ${car.nameofProduct} is ${ts.revenue.round()} ');

    } else if (inputType == 'laptop'|| inputType == 'Laptop') {
      final laptop = LaptopDescription("Laptop Del", 2000, 19.5);
      // Input the quantity of product
          print('Please input the quantity');
          String? inputQ= stdin.readLineSync();
          int numericQ = int.parse(inputQ.toString());
      // Input the discount of product
          print('Please input the discount');
          String? inputD = stdin.readLineSync();
          int numericD = int.parse(inputD.toString());
          final ts = TotalSale(price: laptop.price, quantity: numericQ, discount: numericD);
      // print the revenue
          print('The total sell of $inputEmployeeID selling ${laptop.nameofProduct} is ${ts.revenue.round()} ');

    } else if (inputType == 'ipad' || inputType =='Ipad') {
      final ipad = IpadDecription('Ipad 16', 2023, 1000.4);
       // Input the quantity of product
          print('Please input the quantity');
          String? inputQ = stdin.readLineSync();
          int numericQ = int.parse(inputQ.toString());
      // Input the discount of product
          print('Please input the discount');
          String? inputD = stdin.readLineSync();
          int numericD = int.parse(inputD.toString());
          final ts = TotalSale(price: ipad.price, quantity: numericQ, discount: numericD);
      // print the revenue
          print('The total sell of $inputEmployeeID selling ${ipad.nameofProduct} is ${ts.revenue.round()} ');
      
    } else {print('Please identify the product selled');}
    break;  
    default: print('Please input the correct position');
    break;
    }

}

// write reward 



// calculate Revenue 

mixin HasProduct {
  int get quantity;
  }

mixin HasDiscount {
  int get discount;
}

double calculateRevenue(int a, double b,int c) => (a * b)*(1-c/100);

// create a mixin of revenue
mixin HasRevenue on HasPrice,HasProduct,HasDiscount {
  double get revenue => calculateRevenue(quantity, price, discount);
}


// ignore: non_constant_identifier_names
class TotalSale with HasPrice,HasProduct,HasDiscount,HasRevenue {
  @override
  int quantity;

  @override
  double price;

  @override
  int discount;

  
  TotalSale ({ required this.price,
            required this.quantity,
            required this.discount,
            });
}


