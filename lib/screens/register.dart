import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/components/forms.dart';
import 'package:pokedex/controller/forms_controller.dart';
import 'package:pokedex/database/dao/user_dao.dart';
import 'package:pokedex/models/user_model.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final UserDAO _dao = UserDAO();
  final _formsController = FormsController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(28, 33, 74, 1)),
        backgroundColor: Color.fromRGBO(136, 196, 177, 1),
        title: Text('Cadastro',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Forms().textFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        labelText: 'Nome',
                        onChanged: _formsController.setName,
                      ),
                      Forms().textFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'E-mail',
                        onChanged: _formsController.setEmail,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Forms().textFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: 'Telefone',
                        onChanged: _formsController.setPhone,
                      ),
                      Forms().textFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        labelText: 'Senha',
                        obscureText: true,
                        onChanged: _formsController.setPassword,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: 150,
                    child: Observer(
                      builder: (_) {
                        return ElevatedButton(
                          child: Text(
                            'CADASTRAR',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _formsController.registerIsValid
                              ? () {
                                  final String name = _nameController.text;
                                  final String email = _emailController.text;
                                  final int phone =
                                      int.tryParse(_phoneController.text);
                                  final String password =
                                      _passwordController.text;

                                  final User newUser = User(
                                    name: name,
                                    email: email,
                                    phone: phone,
                                    password: password,
                                  );
                                  _dao.save(newUser).then(
                                        (value) => Navigator.pop(context),
                                      );
                                }
                              : null,
                        );
                      },
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
