
// product declaration
// mixin of product price 
mixin HasPrice{
  double get price;
  Future<void> priceCondition () async {
    if (price<=0){
      throw Exception('Price cannot be negative or equal to zero');
    } 
  }
}

// use set to show three types of products.
Set<String> productTypes = {'Car','Laptop','Ipad'};
productChoose () {
  for (String pt in productTypes) {
    print(pt);
  }
}
// ignore: constant_identifier_names
class ProductDescription with HasPrice {
  @override
  final double price;
  final String? nameofProduct;
  final int year;

  ProductDescription (this.nameofProduct,
                    this.year,
                    this.price, );
  }

  class CarDescription extends ProductDescription {
        CarDescription(String super.nameofProduct,
                  super.year,
                  super.price,); // super mean initilize from parent class
  }

class LaptopDescription extends ProductDescription {
        LaptopDescription(String super.nameofProduct,
                  super.year,
                  super.price,);
  }

class IpadDecription extends ProductDescription {
  IpadDecription(String super.nameofProduct,
    super.year, super.price, );


}