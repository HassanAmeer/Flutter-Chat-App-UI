import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataclass.dart';
import 'openchat.dart';
import 'theme.dart';

// import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darktheme = false;
  bool vsearchbar = false;
  final TextEditingController _findtextcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: darktheme ? darkthemef() : lightthemef(),
      home: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(169, 177, 165, 195),
              Color.fromARGB(186, 224, 219, 244),
            ],
          ),
        ),
        child: Scaffold(
          drawer: DrawerFb1(),
          // drawer: Drawer(
          //   child: Column(
          //     children: [
          //       UserAccountsDrawerHeader(
          //         arrowColor: Colors.indigoAccent,
          //         accountName: const Text('Name'),
          //         accountEmail: const Text('Name@gmail.com'),
          //         onDetailsPressed: () {},
          //         currentAccountPicture: const CircleAvatar(
          //           child: Icon(Icons.person),
          //         ),
          //         otherAccountsPictures: [
          //           CircleAvatar(
          //             child: IconButton(
          //                 onPressed: () {},
          //                 icon: const Icon(Icons.person_add_alt_1_outlined)),
          //           ),
          //         ],
          //       ),
          //       const Spacer(),
          //       Center(
          //         child: ElevatedButton.icon(
          //           onPressed: () {},
          //           icon: const Icon(Icons.exit_to_app),
          //           label: const Text('L o g o u t'),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          appBar: AppBar(
            title: vsearchbar
                ? CupertinoSearchTextField(
                    onChanged: ((value) {}),
                    controller: _findtextcont,
                    itemColor: Colors.white,
                    backgroundColor: const Color.fromARGB(195, 196, 142, 255),
                  )
                : const Text("Chat App"),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    darktheme = !darktheme;
                  });
                },
                icon: Icon(darktheme ? Icons.dark_mode : Icons.light_mode),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.airline_stops_sharp),
              ),
            ],
          ),
          //  Openchat(),
          body: const Body(),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                vsearchbar = !vsearchbar;
              });

              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => const UserSetting()));
            },
            elevation: 30,
            mini: true,
            child: const Icon(Icons.person_search),
          ),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime gettime = DateTime.now();
  static List<Getusers> getuserslist = Getusers.list;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            " Recent ",
            // style: TextStyle(color: Colors.indigo),
          ),
        ),
        Container(
          height: height * 0.12,
          margin: const EdgeInsets.all(4),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: getuserslist.length,
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Openchat(
                                getuserslist[index].userid,
                                getuserslist[index].username),
                          ));
                        },
                        child: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(getuserslist[index].username),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // IconButton(
        //   onPressed: () {
        //     var showDialog2 = showBottomSheet(
        //       context: context,
        //       builder: (context) {
        //         return Container(
        //           height: 200,
        //           color: Colors.pinkAccent,
        //           child: Text(
        //               'asfsadg bdgh svjkedfh sdfjsdb fhdfg dfjef asdajd sadkfhsd klsdfc sd,eud afdusfg dmg8ikn dfbgm fv80  fg8sdsdf '),
        //         );
        //       },
        //     );
        //     showDialog2;
        //   },
        //   icon: Icon(Icons.more_horiz_outlined),
        // ),
        // const Spacer(),
        SizedBox(
          height: height * 0.75,
          width: double.infinity,
          child: Card(
            // color: Theme.of(context).colorScheme.background.withOpacity(0.8),
            margin: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: getuserslist.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(
                    getuserslist[index].userid,
                  ),
                  direction: DismissDirection.startToEnd,
                  background: Row(
                    children: const [
                      Icon(Icons.more_vert_outlined),
                      Icon(Icons.delete_forever)
                    ],
                  ),
                  behavior: HitTestBehavior.translucent,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Openchat(
                          getuserslist[index].userid,
                          getuserslist[index].username,
                        ),
                      ));
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(getuserslist[index].username),
                      subtitle: Text(
                          '${Getmsgs.list.where((e) => e.reciveid == index)}'),
                      trailing: Text("${Getmsgs.list[index].gettime}"),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerFb1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.indigoAccent,
              accountName: const Text('Name'),
              accountEmail: const Text('Name@gmail.com'),
              onDetailsPressed: () {},
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/118745053?v=4"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add_alt_1_outlined)),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const SearchFieldDrawer(),
                  const SizedBox(height: 12),
                  ListTile(
                    leading: const Icon(Icons.chat),
                    title: const Text("Chat"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("/chat");
                    },
                  ),
                  MenuItem(
                    text: 'Friends',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Add Friend',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'Contacts',
                    icon: Icons.contact_page,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 5),
                  MenuItem(
                    text: 'history',
                    icon: Icons.update,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 8),
                  MenuItem(
                    text: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  MenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 6),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.exit_to_app),
                label: const Text('L o g o u t'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 2
        ));
        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Colors.white;
    final hoverColor = Color.fromARGB(179, 217, 112, 255);

    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(text, style: TextStyle()),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class SearchFieldDrawer extends StatelessWidget {
  const SearchFieldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Colors.white;

    return TextField(
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}

class ChatDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purpleAccent])),
            child: ListView(children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("User Name"),
                accountEmail: Text("user@email.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/118745053?v=4"),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.purpleAccent])),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/profile");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/settings");
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Logout"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/logout");
                },
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text("Chat with new user"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/newchat");
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: const Text("Add friends"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/friends");
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text("Contacts"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/contacts");
                },
              ),
            ])));
  }
}
