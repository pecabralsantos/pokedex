import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/components/forms.dart';
import 'package:pokedex/controller/forms_controller.dart';
import 'package:pokedex/controller/service_controller.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/screens/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _serviceController = ServiceController();
  final _formsController = FormsController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _serviceController.getListUsers();
    });
  }

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
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (_, index) {
                return SingleChildScrollView(
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
                        onChanged: _formsController.setEmail,
                      ),
                      SizedBox(height: 8),
                      Forms().textFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        labelText: 'Senha',
                        obscureText: true,
                        onChanged: _formsController.setPassword,
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        width: 150,
                        child: Observer(
                          builder: (context) {
                            return ElevatedButton(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: _formsController.loginIsValid
                                  ? () {
                                      final userLogged = _serviceController
                                          .listUsers
                                          .firstWhere(
                                              (e) =>
                                                  e.email ==
                                                      _emailController.text &&
                                                  e.password ==
                                                      _passwordController.text,
                                              orElse: () => null);
                                      if (userLogged == null) {
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Menu(
                                                userLoggedId: userLogged.id),
                                          ),
                                        );
                                      }
                                    }
                                  : null,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
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
