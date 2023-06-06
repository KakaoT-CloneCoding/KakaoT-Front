import 'package:flutter/material.dart';
import 'package:kakaotaxi_front/provider/login_provider.dart';
import 'package:kakaotaxi_front/provider/role_provider.dart';
import 'package:provider/provider.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  TextEditingController carNameController = TextEditingController();
  TextEditingController carNumController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('role'),
      ),
      body: Consumer<RoleProvider>(builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: provider.clientChecked,
                    onChanged: (value) {
                      provider.clientRole();
                    }),
                const Text("사용자"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: provider.driverChecked,
                    onChanged: (value) {
                      provider.driverRole();
                    }),
                const Text("드라이버"),
              ],
            ),
            provider.driverChecked
                ? SizedBox(
                    width: 250,
                    height: 100,
                    child: Column(
                      children: [
                        Flexible(
                            child: TextField(
                          controller: carNameController,
                          decoration: const InputDecoration(
                            hintText: '차종',
                          ),
                        )),
                        Flexible(
                            child: TextField(
                          controller: carNumController,
                          decoration: const InputDecoration(
                            hintText: '차량 번호판',
                          ),
                        )),
                      ],
                    ))
                : SizedBox(
                    width: 250,
                    height: 100,
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        hintText: '주소',
                      ),
                    )),
            ElevatedButton(
              onPressed: () {
                var userModel =
                    Provider.of<LoginProvider>(context, listen: false)
                        .userModel;
                provider.apiController(userModel);
              },
              child: const Text("confirm"),
              style: ButtonStyle(),
            )
          ],
        );
      }),
    );
  }
}
