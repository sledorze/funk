#library("funk:funk");

#import("dart:core");

#source("IImmutable.dart");
#source("IProduct.dart");
#source("Product.dart");
#source("ProductIterator.dart");
#source("errors/RangeError.dart");
#source("exceptions/NoSuchElementException.dart");
#source("option/IOption.dart");
#source("option/impl/NoneImpl.dart");
#source("option/impl/SomeImpl.dart");
#source("option/none.dart");
#source("option/some.dart");

main(){
  var option = none();
  print(option);
}