import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  RefreshController refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(online: true, email: 'maria@gmail.com', name: 'maria', uid: '1'),
    Usuario(online: true, email: 'luis@gmail.com', name: 'luis', uid: '2'),
    Usuario(online: false, email: 'pedro@gmail.com', name: 'pedro', uid: '3'),
    Usuario(online: true, email: 'ana@gmail.com', name: 'ana', uid: '4')
  ];

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        title: Text(authService.user.name),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            AuthService.deleteToken();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: Icon(Icons.exit_to_app)
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            // child: Icon(Icons.offline_bolt, color: Colors.red),
            child: Icon(Icons.check_circle, color: Colors.blue[400]),
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
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: Text(user.name.substring(0,2)),
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
