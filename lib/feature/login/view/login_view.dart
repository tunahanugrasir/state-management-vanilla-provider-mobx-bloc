import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../product/constant/image_enums.dart';
import '../../../product/padding/page_padding.dart';
import '../../../product/utilities/input_decorations.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String data = 'Remember me!';
  final String data2 = 'LOGIN';
  final String hint = 'e-mail';
  final String hint2 = 'password';
  bool isCheck = false;

  late final LoginViewModel _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  void changeIsCheckBox() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Scaffold _bodyView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allLow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: context.durationLow,
                height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.4),
                child: SizedBox(
                  height: context.dynamicHeight(0.4),
                  width: context.dynamicWidth(1),
                  child: Images.login.toImage,
                ),
              ),
              Text(data2, style: context.textTheme.headline3),
              TextField(decoration: ProjectInputs(hint, hint)),
              SizedBox(height: context.dynamicHeight(0.01)),
              TextField(decoration: ProjectInputs(hint2, hint2)),
              ElevatedButton(
                  onPressed: context.watch<LoginViewModel>().isLoading
                      ? null
                      : () {
                          context.read<LoginViewModel>().controlTextValue();
                        },
                  child: const Center(child: Text('Login'))),
              CheckboxListTile(
                value: _loginViewModel.isChekBoxOkey,
                onChanged: (value) {
                  context.read<LoginViewModel>().checkBoxChange(value ?? false);
                },
                title: Text(data),
              ),
              _loadingBar()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _loadingBar() {
  return Consumer<LoginViewModel>(
    builder: (context, value, child) {
      return value.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox();
    },
  );
}
