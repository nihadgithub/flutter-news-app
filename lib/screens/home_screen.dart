import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu)),
        title: Text("HESPRESS"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.login)),
        ],

      ),

      bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Top Stories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        backgroundColor: Colors.blueGrey[800],
        unselectedItemColor: Colors.blueGrey[300],
        selectedItemColor: Colors.blueGrey[50],
      ),
      
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/news.jpg"),fit: BoxFit.cover),
                color: Colors.red,
                boxShadow: [
                  /*BoxShadow(
                    color: Colors.black,
                    spreadRadius: -10.0,
                    blurRadius: 100.0,
                  ),*/
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Heading or Title of the Breaking News",style: TextStyle(shadows: [BoxShadow()],color: Colors.white,fontSize: 30),)
                ],
              ),
            );
      }),
      
    );
  }
}
