import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _jenisKelamin;
  int _groupValue1 = 0;

  bool _secureText = true;
  bool _isLoading = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  FocusNode _nameNode = FocusNode();
  FocusNode _emailNode = FocusNode();
  FocusNode _passwordNode = FocusNode();
  FocusNode _rePasswordNode = FocusNode();
  FocusNode _alamatNode = FocusNode();

  void showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void check() {
    final form = _key.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        _isLoading = true;
      });
      submitDataRegister();
    }
  }

  submitDataRegister() async {
    _jenisKelamin = _groupValue1 == 0 ? 'laki-laki' : 'perempuan';
    final responseData =
        await http.post("http://10.0.2.2:8000/api/register-mobile", body: {
      "name": _nameController.text.trim(),
      "email": _emailController.text.toLowerCase().trim(),
      "password": _passwordController.text.trim(),
      "alamat": _alamatController.text.trim(),
      "jenis_kelamin": _jenisKelamin,
    });

    final data = jsonDecode(responseData.body);
    int value = data["value"];
    String msg = data["msg"];
    print(data);

    if (value == 1) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('$msg Silahkan login menggunakan akun Anda.')));
      setState(() {
        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();
        _rePasswordController.clear();
        _alamatController.clear();
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(data['error']['email'][0]),
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 200,
                  style: FlutterLogoStyle.horizontal,
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        focusNode: _nameNode,
                        validator: (e) {
                          return e.isEmpty ? 'please insert your name' : null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailNode,
                        validator: (e) {
                          return e.isEmpty ? 'please insert email' : null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordNode,
                        validator: (e) {
                          return e.isEmpty ? 'please insert password' : null;
                        },
                        obscureText: _secureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      TextFormField(
                        controller: _rePasswordController,
                        focusNode: _rePasswordNode,
                        validator: (e) {
                          if (e.isEmpty) {
                            return 'please insert confirm password';
                          } else if (e != _passwordController.text) {
                            return 'confirm password must be same with password';
                          }
                          return e.isEmpty
                              ? 'please insert confirm password'
                              : null;
                        },
                        obscureText: _secureText,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _alamatController,
                        focusNode: _alamatNode,
                        validator: (e) {
                          return e.isEmpty ? 'please insert address' : null;
                        },
                        minLines: 3,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Alamat',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 0,
                              groupValue: _groupValue1,
                              onChanged: (int i) {
                                print(i);
                                setState(() {
                                  _groupValue1 = i;
                                });
                              }),
                          Text('Laki-Laki'),
                          Radio(
                              value: 1,
                              groupValue: _groupValue1,
                              onChanged: (int i) {
                                print(i);
                                setState(() {
                                  _groupValue1 = i;
                                });
                              }),
                          Text('Perempuan')
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: check,
                          child: _isLoading
                              ? CircularProgressIndicator()
                              : Text('Register'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account ? "),
                      Container(
                        child: InkWell(
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
