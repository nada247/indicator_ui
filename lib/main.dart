import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController ;
  int currentPage = 0 ;


  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(padding: EdgeInsets.only(top: 15 , right: 20 ) ,
            child: TextButton(onPressed: (){}, child: Text("Skip" , style: TextStyle(color: Colors.black45 , fontSize: 18),)),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page){
              setState(() {
                currentPage = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: 'assets/images/aaa.png',
                  title: 'Take a test to jump ahead!',
                  text: 'It takes about 5 minutes, and adapts to your level by getting harder or easier based on your answers'
              ),
              makePage(
                  image: 'assets/images/bbb.png',
                  title: 'You started your streak!',
                  text: 'Make it a 2 day streak to form a healthy habit!'
              ),
              makePage(
                  image: 'assets/images/ccc.jpeg',
                  title: 'Time to create a profile!',
                  text: 'Create a profile to save your progress and continue learning for free.'
              ),
            ],
          ),
          //==============================
          Container(
            padding: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),

    );
  }
  Widget makePage ({ image , title , text }){
    return Container(
      padding: EdgeInsets.only(bottom: 60 , right: 50 , left: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20,),
          Text(title ,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black , fontSize: 30 , fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text(text ,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54 , fontSize: 20 , fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
  Widget makeIndicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(microseconds: 300,),
      height: 6,
      width: isActive? 30 : 6,
      margin: EdgeInsets.only(right: 5) ,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentPage == i) {
        indicators.add(makeIndicator(true));
      } else {
        indicators.add(makeIndicator(false));
      }
    }
    return indicators;
  }
}