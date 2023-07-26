import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/colors.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 var images={
   "hiking.png":"Dağ Yürüyüşü",
   "ballon.png":"Balon",
   "iğ.png":"Dalış",
   "kayak.png":"Kayak",
 };
  @override
  Widget build(BuildContext context) {
    TabController _tabController= TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                Builder(builder: (context) {
                  return IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  );
                }),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Keşfet")),
          SizedBox(height: 30),
          Container(child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: EdgeInsets.only(left:20,right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: [
                Tab(text: "Yerler",),
                Tab(text: "İlhamlar",),
                Tab(text: "Yorumlar",),
              ],
            ),
          ),),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 230,
            width: double.maxFinite,
            child: TabBarView(
            controller: _tabController,
            children: [
              ListView.builder(
                itemCount:3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    margin: EdgeInsets.only(right: 15,top: 10),
                    width: 200,
                    height: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage("assets/dağ.jpg"),fit: BoxFit.cover)
                  ),);

                },
              ),


            ],
          ),),
          SizedBox(height: 25,),
          Container(
            margin:EdgeInsets.only(left: 20,right: 20) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppLargeText(text: "Daha Fazla Keşfet",size: 22,),
              AppText(text:"Hepsini gör",color: AppColors.txtColor1),
            ],),
          ),
          SizedBox(height: 20,),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(

                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/"+images.keys.elementAt(index)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: AppText(
                            text:images.values.elementAt(index),
                          color: AppColors.txtColor2,
                        ),)
                    ],
                  ),
                );
              },
            ),
          ),
          

        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerKullanici().buildHeader(context),
              DrawerKullanici().buildMenuItems(context)
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerKullanici {
  Widget buildHeader(BuildContext context) => Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('Anasayfa'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart_sharp),
            title: const Text('Bar'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Arama'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profilim'),
            onTap: () {},
          ),
        ],
      );
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {

    return _CirclePainter(color:color,radius:radius);
  }
}
class _CirclePainter extends BoxPainter{
   final Color color;
   double radius;
  _CirclePainter({required this.color,required this.radius});

  @override
  void paint(Canvas canvas, Offset offset,
      ImageConfiguration configuration) {
    Paint _paint=Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset=Offset(configuration.size!.width/2-radius/2,configuration.size!.height);

   canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
}
