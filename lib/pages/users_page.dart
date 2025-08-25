import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  RefreshController refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(online: true, email: 'maria@gmail.com', nombre: 'maria', uid: '1'),
    Usuario(online: true, email: 'luis@gmail.com', nombre: 'luis', uid: '2'),
    Usuario(online: false, email: 'pedro@gmail.com', nombre: 'pedro', uid: '3'),
    Usuario(online: true, email: 'ana@gmail.com', nombre: 'ana', uid: '4')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: Text('Mi Nombre'),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.exit_to_app)
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400]!,
        ),
        onRefresh: _cargarUsuarios,
        child: _userListView(),
      ),
    );
  }

  ListView _userListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _userListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _userListTile(Usuario user) {
    return ListTile(
        title: Text(user.nombre),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: Text(user.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  _cargarUsuarios() async{
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
