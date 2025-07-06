import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _counter = 0;
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("ខ្ញុំបាទ Kaa", style: TextStyle(fontFamily: "FREE Hand")),
      backgroundColor: const Color.fromARGB(255, 226, 13, 145),
      foregroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 500),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              SizedBox(height: 10),
              _buildEmailTextField(),
              SizedBox(height: 10),
              _buildPasswordTextField(), // now fixed
              SizedBox(height: 10),
              _buildLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return CircleAvatar(
      radius: 70,
      backgroundImage: NetworkImage(_img),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.grey.shade800),
        hintText: "Enter email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key, color: Colors.grey.shade800),
        hintText: "Enter password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
          icon: Icon(
            _hidePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      textInputAction: TextInputAction.send,
      obscureText: _hidePassword,
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 226, 13, 145),
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text("Login"),
      ),
    );
  }
}

final _img =
    "https://i.pinimg.com/736x/e3/08/ee/e308eedf0ca6ecacbaae866f2abf81d0.jpg";
