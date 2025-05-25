import 'package:flutter/material.dart';
import 'package:whazlansaja/data_saya.dart';

class PesanScreen extends StatelessWidget {
  const PesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 29,
        elevation: 2,
        title: const ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage:
                AssetImage('assets/gambar_dosen/Azlan, S.Kom., M.Kom.jpg'),
            radius: 16,
          ),
          title: Text(
            'Azlan, S.Kom., M.Kom',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('06.30'),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final isDosen = index % 2 == 0;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: isDosen
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDosen)
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/gambar_dosen/Azlan, S.Kom., M.Kom.jpg'),
                          radius: 14,
                        ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.65,
                          ),
                          decoration: BoxDecoration(
                            color: isDosen
                                ? colorScheme.tertiary
                                : colorScheme.primary,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft: Radius.circular(isDosen ? 0 : 12),
                              bottomRight: Radius.circular(isDosen ? 12 : 0),
                            ),
                          ),
                          child: Text(
                            'index ke-$index ini adalah contoh chat. Silahkan ambil data chat dari file json.',
                            style: TextStyle(
                              fontSize: 15,
                              color: isDosen
                                  ? colorScheme.onTertiary
                                  : colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                      if (!isDosen)
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            DataSaya.gambar,
                          ),
                          radius: 14,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.emoji_emotions),
                suffixIcon: Icon(Icons.send),
                hintText: 'Ketikkan pesan',
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
