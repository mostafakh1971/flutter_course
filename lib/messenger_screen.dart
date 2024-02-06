import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.amber,
                )),
            ListView(
              shrinkWrap: true,
              children: List.generate(
                  5,
                  (index) => ListTile(
                        onTap: () {},
                        title: Text("Account"),
                      )),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Chats"),
        // leading: const Icon(Icons.menu),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //     )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15)),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return buildOnline();
                  },
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return buildChat();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildChat() {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {},
      leading: const Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://th.bing.com/th/id/R.d3cfe60bbddb4cb9800ac6626c1d79a8?rik=twQJOS%2b%2bxRCZKA&pid=ImgRaw&r=0"),
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 8,
          )
        ],
      ),
      title: Text(
        "Ahmad Ahmad",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "Hi I'm Ahmad",
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Text("13:00 PM"),
    );
  }

  Widget buildOnline() {
    return const SizedBox(
      width: 80,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.d3cfe60bbddb4cb9800ac6626c1d79a8?rik=twQJOS%2b%2bxRCZKA&pid=ImgRaw&r=0"),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 9,
              )
            ],
          ),
          Text(
            "Ahmad Ahmad Ahmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad Ahmad",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
