import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_shop/models/user.dart';
import 'package:smart_shop/pages/page6_Product%20list.dart';
import 'package:smart_shop/services/database.dart';

// ignore: camel_case_types
class page5_allset extends StatefulWidget {
  page5_allset({@required this.sName});
  final String sName;
  @override
  State<StatefulWidget> createState() {
    return _page5State();
  }
}

// ignore: camel_case_types
class _page5State extends State<page5_allset> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          final userData = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text(widget.sName),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(70, 30, 70, 30),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('Done'),
                onPressed: () {
                  Get.off(page6_product_list(
                    productCount: userData.noOfProducts,
                    sName: userData.shopName,
                  ));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ),
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done_all_rounded,
                      color: Colors.green,
                      size: 190,
                    ),
                    Text(
                      'All Set!!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Caveat',
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
