import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hope_app/Pages/profile_page.dart';
import 'package:health_hope_app/Pages/register_home_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Giaunluca L.';
    final email = 'lapagol@gmail.com';
    final urlImage =
        'https://www.miraflores.gob.pe/wp-content/uploads/2020/11/026564B5-F95A-4AA5-BE10-07FF8CBD60B7-701x1024.jpeg';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(urlImage: urlImage, name: name, email: email),
            const SizedBox(height: 10),
            buildMenuItem(
                text: 'Perfil',
                icon: Icons.account_circle_rounded,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: 'Registrar',
                icon: Icons.create_rounded,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: 'formatos',
                icon: Icons.content_paste_rounded,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: 'Examenes',
                icon: Icons.auto_stories_rounded,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: 'Reportes',
                icon: Icons.bar_chart_rounded,
                onClicked: () => selectedItem(context, 4))
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
  }) =>
      InkWell(
          child: Container(
        padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
        child: Row(children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(urlImage),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ]
          ),
        ]),
      ));

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterHomePage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
    }
  }
}
