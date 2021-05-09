import 'package:flutter/material.dart';
import 'package:pokedex/components/forms.dart';
import 'package:pokedex/database/dao/user_dao.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserDAO _dao = UserDAO();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(28, 33, 74, 1)),
        backgroundColor: Color.fromRGBO(136, 196, 177, 1),
        title: Text('Login',
            style: TextStyle(color: Color.fromRGBO(28, 33, 74, 1))),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/dashboard_background.jpg',
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(28, 33, 74, 1),
                        ),
                      ),
                    ),
                  ),
                  Forms().textFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                  ),
                  SizedBox(height: 8),
                  Forms().textFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.number,
                    labelText: 'Senha',
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: AlignmentDirectional.bottomCenter,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'images/pokedex_logo.png',
                width: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
