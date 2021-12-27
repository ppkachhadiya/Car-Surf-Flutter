
import 'package:flutter/material.dart';

class ContainerDesign extends StatelessWidget {
  const ContainerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(

            elevation: 0,
            title: Text('Tab Bar',style: TextStyle(color: Colors.teal,fontSize: 25,fontWeight: FontWeight.bold),),

            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: TabBar(
              unselectedLabelColor: Colors.teal,
              indicatorPadding: EdgeInsets.only(left: 10,right: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: ShapeDecoration(
                  color: Colors.teal,
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.teal))
              ),
              tabs: [
                Tab(

                  child: Align(
                    child: Text('APPS',style: TextStyle(fontSize: 15),),
                  ),
                ),

                Tab(
                  child: Align(
                    child: Text('MOVIES'),
                  ),
                ),
                Tab(
                  child: Align(
                    child: Text('GAMES'),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(100))),
                  child: Container(
                    child: Icon(
                      Icons.apps,
                      color: Colors.white,
                      size: 100,
                    ),
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(100))),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(100))),
                  child: Container(
                    child: Icon(
                      Icons.movie,
                      color: Colors.white,
                      size: 100,
                    ),
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200))),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 200,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(100))),
                  child: Container(
                    child: Icon(
                      Icons.games,
                      color: Colors.white,
                      size: 100,
                    ),
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.pinkAccent, Colors.greenAccent]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white24,
                            offset: Offset(5, 2),
                            blurRadius: 2,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(300),
                            bottomRight: Radius.circular(300))),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}