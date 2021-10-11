import 'package:flutter/cupertino.dart';

class ItemProvider with ChangeNotifier {
  ItemType _itemType = ItemType.BAG;

  void setItemType(ItemType itemType) => _itemType = itemType;

  ItemType get getItemType => _itemType;
}

enum ItemType { BAG, HOODIE,SHOE }
