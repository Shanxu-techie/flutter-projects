// publisher - who uploads content
// subscriber - who views content
// platform notifies subscriber when new content from publisher

// provider notifies listener(subscriber)
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartList = [];

  void addItem(Map<String, dynamic> item) {
    int itemIndex = _cartList.lastIndexWhere(
      (element) => element['productId'] == item['productId'],
      //&& laga kar check ko bhetar kar sakta hain
      //product ki id match ki jay
    );
    if (itemIndex == -1) {
      item['quantity'] = 1;
      _cartList.add(item);
      notifyListeners();
    } else {
      incrementQuantity(itemIndex);
    }
  }

  void incrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'];
    if (currentQuantity < 10) {
      currentQuantity++;
      _cartList[index]['quantity'] = currentQuantity;
      notifyListeners();
    }
  }

  void decrementQuantity(int index) {
    int currentQuantity = _cartList[index]['quantity'];
    if (currentQuantity > 1) {
      currentQuantity--;
      _cartList[index]['quantity'] = currentQuantity;
      notifyListeners();
    } else {
      deleteItem(index);
    }
  }

  void deleteItem(int index) {
    _cartList.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartList.clear();
    notifyListeners();
  }

  int getCartCount() {
    int count = 0;

    for (var item in _cartList) {
      // count += item['quantity'] as int;
      count += int.parse(item['quantity'].toString());
    }
    return count;
  }

  double getCartTotalAmount() {
    double total = 0;
    for (var item in _cartList) {
      var amount = item['price'] * item['quantity'];
      total += amount;
    }
    return total;
  }

  List<Map<String, dynamic>> getCartList() {
    return _cartList;
  }
}
