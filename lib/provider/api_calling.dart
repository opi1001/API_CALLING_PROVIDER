import 'package:api_calling_provider/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiCalling extends StatefulWidget {
  const ApiCalling({super.key});

  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Get API calling"),
          ),
          body: SafeArea(
            child: userProvider.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, itemIndex) {
                      return ListTile(
                        leading: Text(
                            userProvider.allUserList[itemIndex].id.toString()),
                        title: Text(userProvider.allUserList[itemIndex].name
                            .toString()),
                        subtitle: Text(userProvider.allUserList[itemIndex].email
                            .toString()),
                      );
                    },
                    itemCount: userProvider.allUserList.length,
                  ),
          )),
    );
  }
}
