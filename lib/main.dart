import 'package:flutter/material.dart';
import 'package:news_app1/ArticleView.dart';
import 'package:news_app1/Articles.dart';
import 'package:news_app1/GetArticles.dart';
import 'package:news_app1/ListofCategories.dart';
import 'package:news_app1/NewsView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Categories> getcat =[];
  var getart = [];
  bool loading = false;
  bool tapped = false;
  String tappedbar = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcat = getcategories();
    getNews();
  }

  getNews({String category}) async{
    GetArticles g;
    if(category!=null) {
     g= new GetArticles(category: category);
    }
    else {
       g = new GetArticles();
    }
     await g.getNews();
     getart= g.listofarticles;
     print(getart.length);
     if(loading==false) {
       setState(() {
         loading = true;
       }
       );
     }
    // print('printing indexxxxxxx');
  }

  @override
  Widget build(BuildContext context) {
    print(getart.length);
    print("printed length of getart");

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("News",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),)),
        backgroundColor: Colors.white,
      ),
      body: loading?SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView.builder(
                    itemCount: getcat.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: ()
                        {
                          setState(() {
                            tapped= true;
                            tappedbar =getcat[index].name;
                            loading = false;
                            getNews(category: getcat[index].name);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 7,top: 10,right:7),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: tappedbar==getcat[index].name? Colors.blue:Colors.white,
                            border: Border.all(color: Colors.grey,),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 10,
                          child: Text(getcat[index].name,style: TextStyle(color:tappedbar==getcat[index].name? Colors.white:Colors.black),),
                        ),
                      );
                    }
                ),
              ),

                Container(
                  margin: const EdgeInsets.only(top: 10,),
                  padding: const EdgeInsets.all(4),
                  child: Scrollbar(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: getart.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(url: getart[index].url)));
                                },
                                child: NewsView(imgurl: getart[index].urlToImage,title: getart[index].title));
                          }
                      ),
                  ),
                ),
            ]

          ),
        ),
      ):Center(child: CircularProgressIndicator()), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

