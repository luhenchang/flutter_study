class Dish {
  String imgUrl;
  String name;
  double price;
  String unit;
  String desc;
  Dish({this.imgUrl, this.name, this.price, this.unit, this.desc});
}

final Map<String, List<Dish>> _dishes = {
  '热菜': [
    Dish(
        imgUrl:
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1518412925400&di=a4052bd2a342477effd73969ef88dc5d&imgtype=0&src=http%3A%2F%2Fpic29.photophoto.cn%2F20131221%2F0042040249766610_b.jpg',
        name: '宫保鸡丁',
        price: 45.0,
        unit: '例',
        desc:
            '川菜中的保留家常菜，由鸡丁、干辣椒、花生米等炒制而成。由于其入口鲜辣，鸡肉的鲜嫩配合花生的香脆，深受大众喜欢。川菜中的保留家常菜，由鸡丁、干辣椒、花生米等炒制而成。由于其入口鲜辣，鸡肉的鲜嫩配合花生的香脆，深受大众喜欢。川菜中的保留家常菜，由鸡丁、干辣椒、花生米等炒制而成。由于其入口鲜辣，鸡肉的鲜嫩配合花生的香脆，深受大众喜欢。'),
    Dish(
        imgUrl: 'http://images.meishij.net/p/20111202/13c8d3aede342b8e02d0dbf1bb389519.jpg',
        name: '番茄牛腩',
        price: 35.6,
        unit: '碗',
        desc: '很暖和的一道菜'),
    Dish(
        imgUrl: 'http://recipe0.hoto.cn/pic/recipe/l/1c/d3/250652_a7373c.jpg',
        name: '油焖大虾',
        price: 70.5,
        unit: '例',
        desc: '油焖大虾，经典鲁菜，菜色泽枣红亮丽，味香飘逸，鲜嫩微甜，油润适口。'),
  ],
  '凉菜': [
    Dish(
        imgUrl:
            'http://c.hiphotos.baidu.com/baike/s%3D235/sign=4e9e519417950a7b713549c73fd0625c/6a600c338744ebf818da6e9dd3f9d72a6159a7ec.jpg',
        name: '爆肚',
        price: 25.0,
        unit: '盘',
        desc: '天津和北京风味小吃中著名的回族小吃'),
    Dish(
        imgUrl:
            'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=f9eaa3f4bf3eb13544c7b0bd9e25cfee/58ee3d6d55fbb2fb3af6d70e4c4a20a44723dcc9.jpg',
        name: '鸡丝拉皮',
        price: 15.0,
        unit: '碟',
        desc: '鸡丝拉皮是一道色香味俱全的地方名肴，属于豫菜系'),
    Dish(
        imgUrl:
            'http://c.hiphotos.baidu.com/baike/s%3D235/sign=4e9e519417950a7b713549c73fd0625c/6a600c338744ebf818da6e9dd3f9d72a6159a7ec.jpg',
        name: '爆肚',
        price: 25.5,
        unit: '盘',
        desc: '天津和北京风味小吃中著名的回族小吃'),
    Dish(
        imgUrl:
            'http://c.hiphotos.baidu.com/baike/s%3D235/sign=4e9e519417950a7b713549c73fd0625c/6a600c338744ebf818da6e9dd3f9d72a6159a7ec.jpg',
        name: '爆肚',
        price: 25.6,
        unit: '盘',
        desc: '天津和北京风味小吃中著名的回族小吃'),
  ],
};

Dish dishAtIndex(int index) {
  int keyNum = _dishes.keys.length;
  int totalNum = 0;
  for (int i = 0; i < keyNum; i++) {
    String key = _dishes.keys.toList()[i];
    List dishesInCurrentKey = _dishes[key];
    if (index >= totalNum && index < totalNum + dishesInCurrentKey.length) {
      return dishesInCurrentKey[index - totalNum];
    }
    totalNum += dishesInCurrentKey.length;
  }
  return null;
}

String typeAtIndex(int index) {
  if (index < _dishes.keys.length) {
    return _dishes.keys.toList()[index];
  }
  return null;
}

Map<String, Map<String, dynamic>> orderedDishes = {};

int orderedCountForDish(Dish dish) {
  final result = orderedDishes[dish.name];
  if (result == null) {
    return 0;
  }
  final count = result['count'];
  return count;
}

void orderDish(Dish dish, count) {
  if (count < 0) {
    return;
  }
  final result = orderedDishes[dish.name];
  if (result == null) {
    orderedDishes[dish.name] = {'count': 1, 'dish': dish};
  } else {
    result['count'] = count;
  }
}
