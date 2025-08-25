import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/header.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Header(title: 'Registro'),
                _Form(),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Terminos y condiciones de uso',
                    style: TextStyle(
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity_outlined,
            placeholder: 'Usuario',
            textInputType: TextInputType.text,
            textEditingController: nameController,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo electrónico',
            textInputType: TextInputType.emailAddress,
            textEditingController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textEditingController: passwordController,
            isPassword: true,
          ),
          CustomBotton(
              text: 'Ingresar',
              onPressed: (){
                print(emailController.text);
                print(passwordController.text);
              }
          )
        ],
      ),
    );
  }
}
