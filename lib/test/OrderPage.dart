import 'package:flutter/material.dart';
import 'package:flutter_app/test/CountButtonView.dart';
import 'package:flutter_app/test/DishesList.dart';


typedef void IndexSelectCallBack(int index);


void main() {
  runApp(
    new MaterialApp(
      title: '',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new OrderPage(),
    ),
  );
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderPage'),
      ),
      body: OrderPageContent(),
    );
  }
}

class OrderPageContent extends StatefulWidget {
  @override
  OrderPageContentState createState() => new OrderPageContentState();
}

class OrderPageContentState extends State<OrderPageContent> {
  final typeListController = ScrollController();
  final orderListController = ScrollController();
  int selectedIndex;
  bool scrollingOrderList = false;
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    orderListController.addListener(() {
      double offset = orderListController.offset;
      if (scrollingOrderList) {
        return;
      }
      if (selectedIndex > 0 && offset < 260.0 * 3) {
        //菜单列表滚动，更新菜类选中，待定制tableview做好以后，需要优化
        setState(() {
          selectedIndex = 0;
        });
      } else if (selectedIndex == 0 && offset >= 260.0 * 3) {
        setState(() {
          selectedIndex = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    typeListController.dispose();
    orderListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 100.0,
          child: Container(
            color: Colors.blue,
            child: TypeList(
              controller: typeListController,
              selectedIndex: selectedIndex,
              indexSelected: (index) {
                scrollingOrderList = true;
                setState(() {
                  selectedIndex = index;
                  orderListController
                      .animateTo(index * 260.0 * 3,
                          duration: Duration(milliseconds: 200), curve: Curves.easeInOut)
                      .then((a) {
                    scrollingOrderList = false;
                  });
                });
              },
            ),
          ),
        ),
        Expanded(
            child: OrderList(
          controller: orderListController,
        )),
      ],
    );
  }
}

class TypeList extends StatefulWidget {
  TypeList({this.controller, this.indexSelected, this.selectedIndex = 0});
  final controller;
  final selectedIndex;
  final IndexSelectCallBack indexSelected;
  @override
  TypeListState createState() => new TypeListState();
}

class TypeListState extends State<TypeList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      String title = typeAtIndex(index);
      if (title == null) {
        return null;
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60.0,
            color: index == widget.selectedIndex ? Colors.white : Colors.grey,
            child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.indexSelected(index);
                },
                child: Center(
                  child: Text(title),
                )),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          )
        ],
      );
    });
  }
}

class OrderList extends StatefulWidget {
  OrderList({this.controller});
  final controller;
  @override
  OrderListState createState() => new OrderListState();
}

class OrderListState extends State<OrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void cellSelected(BuildContext context, Dish dish) {
    print('selected ${dish.name}');
    showDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: Theme.of(context),
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                  color: Colors.grey.shade100,
                  width: 300.0,
                  height: 350.0,
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Container(
                        width: 300.0,
                        height: 200.0,
                        child: _buildImage(dish),
                      ),
                      _buildPopupFooter(dish)
                    ]),
                  )),
            )),
          );
        });
  }

  Widget _buildPopupFooter(Dish dish) {
    return Container(
//      height: 120.0,
      padding: EdgeInsets.all(10.0),
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleRow(dish),
          Container(
            color: Colors.transparent,
            height: 5.0,
          ),
          Text(
            dish.desc,
            softWrap: true,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(Dish dish) {
    return Stack(
      fit: StackFit.expand,
//      alignment: Alignment.center,
      children: <Widget>[
        Image.network(
          dish.imgUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
            right: 8.0,
            bottom: 8.0,
            child: CountButtonView(
              initialCount: orderedCountForDish(dish),
              onChange: (count) {
                orderDish(dish, count);
              },
            )),
      ],
    );
  }

  Widget _buildTitleRow(Dish dish) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          dish.name,
          style: TextStyle(color: Colors.black, fontSize: 19.0, decoration: TextDecoration.none),
        ),
        Text(
          '¥${dish.price } / ${dish.unit}',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w800,
              fontSize: 19.0,
              decoration: TextDecoration.none),
        )
      ],
    );
  }

  Widget _buildCellFooter(Dish dish) {
    return Container(
      height: 90.0,
      padding: EdgeInsets.all(10.0),
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleRow(dish),
          Text(
            dish.desc,
            maxLines: 2,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCell(BuildContext context, int index) {
    Dish dish = dishAtIndex(index);
    if (dish == null) {
      return null;
    }
    return Center(
      child: FlatButton(
        onPressed: () {
          cellSelected(context, dish);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            width: 250.0,
            height: 250.0,
            child: Column(
              children: <Widget>[
                Container(
                  width: 250.0,
                  height: 160.0,
                  child: _buildImage(dish),
                ),
                _buildCellFooter(dish)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          controller: this.widget.controller,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return _buildCell(context, index ~/ 2);
            } else {
              return Container(
                height: 10.0,
                color: Colors.transparent,
              );
            }
          }),
    );
  }
}
