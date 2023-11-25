import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:optout_ui/models/status_model.dart';
import '../service/api_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Title'),
      ),
      body: _buildBody(), // Call the function to build the body
    );
  }

  FutureBuilder<StatusModel> _buildBody() {
    final apiService = ApiService(Dio(BaseOptions(contentType:
    "application/json"))); // Create an instance of ApiService

    return FutureBuilder<StatusModel>(
      future: apiService.getStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot);
          if (snapshot.data != null) {

            final StatusModel data = snapshot.data!;

            // Build your UI using the fetched data
            return _posts(data);
          } else {
            // Handle the case where data is null
            return const Text('Error: Data is null');
          }
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Handle other connection states like ConnectionState.waiting
          return const CircularProgressIndicator();
        }
      },
    );
  }
  Widget _posts(StatusModel status) {
    print("chefcking");
    return Text(status.status);
  }
}
