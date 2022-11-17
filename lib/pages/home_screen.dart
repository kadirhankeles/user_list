import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserProvider? userProvider;
  @override
  void initState() {
    // TODO: implement initState
    
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider!.getData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("User List App")),
      ),
      body: Consumer(
        builder: (context, UserProvider value, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            children: [
              Container(
                height: 700,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: value.response.data!.length,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.3),
                  itemBuilder: (context, index) {
                    
                    return Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.4)),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, bottom: 10),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${value.response.data![index].avatar}"),fit: BoxFit.cover)),
                              ),
                              
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text("${value.response.data![index].firstName} ${value.response.data![index].lastName}",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text("${value.response.data![index].email}", style: TextStyle(fontSize: 12),),
                          ),
                        ],
                      ) 
                      );
                  },
                ),
              )
            ],
        ),
          );
        },

      ),
    );
  }
}
