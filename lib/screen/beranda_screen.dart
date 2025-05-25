import 'package:flutter/material.dart';
import 'package:whazlansaja/screen/pesan_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'WhAzlansaja',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_enhance)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 12, right: 12),
            child: SearchAnchor.bar(
              barElevation: const WidgetStatePropertyAll(2),
              barHintText: 'Cari dosen dan mulai chat',
              suggestionsBuilder: (context, controller) {
                return <Widget>[
                  const Center(
                    child: Text(
                      'Belum ada pencarian',
                    ),
                  ),
                ];
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PesanScreen()));
            },
            leading: const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/gambar_dosen/Azlan, S.Kom., M.Kom.jpg'),
            ),
            title: const Text('Azlan'),
            subtitle: const Text('Belum ada chat'),
            trailing: const Text('Kemaren'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: const Icon(Icons.add_comment),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.sync),
            label: 'Pembaruan',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups),
            label: 'Komunitas',
          ),
          NavigationDestination(
            icon: Icon(Icons.call),
            label: 'Panggilan',
          ),
        ],
      ),
    );
  }
}
