import 'package:flutter/material.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screens/news_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: Text("HESPRESS"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.login)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot){
          if (snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  Article article = snapshot.data![index];
                  return InkWell(
                      splashColor: Colors.red,
                      focusColor: Colors.blueGrey,
                      /*overlayColor: Colors.green,*/

                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsScreen(article: article,)));
                      } ,
                      child: Container(
                        height: 250,
                        width: double.maxFinite,
                        child: Stack(

                          children: [
                            Image(image: NetworkImage(article.urlToImage==null?"https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/624px-No-Image-Placeholder.svg.png":article.urlToImage.toString()),fit: BoxFit.cover,height: 250,width: double.maxFinite,),
                            Container(
                              /*height: 250,*/
                              padding: const EdgeInsets.all(25.0),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                /*border: Border(bottom: BorderSide(width: 8)),*/

                                gradient: LinearGradient(

                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Colors.black.withAlpha(0),
                                    Colors.black12,
                                    Colors.black45
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //ElevatedButton(onPressed: (){}, child: Text("CAT",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),),),
                                  SizedBox(
                                      width: 300,
                                      child: Text(article.title!,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),))
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                  );
                }
                );
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
