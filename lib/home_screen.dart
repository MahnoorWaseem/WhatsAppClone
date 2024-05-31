import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title:const  Text('WhatsApp', style: TextStyle(color: Colors.white),),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelPadding: EdgeInsets.only(bottom: 1),
            // indicatorPadding: EdgeInsets.all(10),
            // isScrollable: true,
            //  indicatorSize: TabBarIndicatorSize.label,
             indicatorSize: TabBarIndicatorSize.tab,
    //          indicator: BoxDecoration(
    //           borderRadius: BorderRadius.circular(50), // Creates border
    // color: Colors.greenAccent
    //          ),
            tabs:  [
              // Tab(icon: Icon(Icons.home), text: 'Home'), preferred way
              Icon(Icons.camera_alt, color: Colors.white,),
              Text('Chats', style: TextStyle(color: Colors.white),),
              Text('Status', style: TextStyle(color: Colors.white),),
              Text('Calls', style: TextStyle(color: Colors.white),),
            ],
          ),
          actions: [
            const Icon(Icons.search, color: Colors.white,),
            const SizedBox(width: 10,),
            PopupMenuButton(
            constraints: const BoxConstraints.expand(width: 200,height: 150),
            icon: Icon(Icons.more_vert_outlined, color: Colors.white,),
              itemBuilder: (context) =>
                [
                  const PopupMenuItem(
                  child:Text('New Group'),
                  value: '1',
                  ),

                  const PopupMenuItem(
                  child:Text('Settings'),
                  value: '2',
                  ),

                  const PopupMenuItem(
                  child:Text('Logout'),
                  value: '3',
                  ),
                ]
              ),
            SizedBox(width: 10,)
            
          ],
        ),
        body: TabBarView(
          children: [
            //camera
           Center(
          child: Icon(Icons.camera_alt_outlined),
           ),

            //chats
             ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                  return  ListTile(
                    leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/ss2.jpg') ,),
                    title: const Text('Kate dear'),
                    subtitle: Row(
                      children: [
                       Icon(
                      index % 2 == 0 ? Icons.done_all_outlined : Icons.done,
                      color: index % 2 == 0 ? Colors.blue : Colors.grey,
                    ),

                  const Text('Where is my phone??')
                      ],
                    ),
                    trailing: Text('6:36 PM'),

                  );
              }),

              //status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                margin: EdgeInsets.only(left: 25, top: 15),
                child: Text('New Updates',)),
                  Container
                  (height: 300,
                    child: ListView.builder(
                                  itemCount: 8,
                                  itemBuilder: (context, index){
                    return  ListTile(
                      leading:Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.teal,
                            width: 3,
                          )
                        ),
                        child: const CircleAvatar(
                                        backgroundImage: AssetImage('assets/images/ss1.jpg') ,
                          ),
                      ),
                      title: Text('Sara '),
                      subtitle: Text(index/2 == 0 ?'Missed Call':'Today, 6:36 PM'),
                    
                    );
                                  }),
                  ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text('View all',))
                ],
              ),
              
              //calls
              ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                  return  ListTile(
                    leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/ss1.jpg') ,),
                    title: Text('Mamma'),
                    subtitle: Text(index/2 == 0 ?'Missed Call':'Today, 6:36 PM'),
                    trailing:  Icon(
                      index / 2 == 0 ? Icons.video_call : Icons.phone_outlined,
                      color: index / 2 == 0 ? Colors.teal : Colors.teal,
                    ),

                  );
              }),
          ],) ,
        )
        );
  }
}