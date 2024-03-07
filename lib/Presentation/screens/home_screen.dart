import 'package:flutter/material.dart';
import 'package:poets_of_bengal/Presentation/Data/data.dart';
import 'package:poets_of_bengal/Presentation/screens/show_screens.dart';
import 'package:poets_of_bengal/Presentation/screens/team.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: const Text("কবি পরিচিতি"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Setting'),
              ),
              const PopupMenuItem(
                child: Text('Copy Link'),
              ),
              const PopupMenuItem(
                child: Text('Shere'),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeamScreen(),
                    ),
                  );
                },
                child: const Text('Developers Info'),
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: poetsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowditailsScreen(
                            name: poetsList[index]["Name"],
                            image: poetsList[index]["Image"],
                            birth: poetsList[index]["Birth"],
                            death: poetsList[index]["death"],
                            ditails: poetsList[index]["Ditails"],
                            airtcial: poetsList[index]["airtcial"],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      poetsList[index]["Name"],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
