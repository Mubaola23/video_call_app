import 'package:flutter/material.dart';
import 'package:lacumrade_arena/src/feature/calling/view/call_view.dart';

class JoinCallView extends StatefulWidget {
  const JoinCallView({super.key});

  @override
  State<JoinCallView> createState() => _JoinCallViewState();
}

class _JoinCallViewState extends State<JoinCallView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _callIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _callIdController.dispose();
    super.dispose();
  }

  void _joinCall() {
    if (_formKey.currentState?.validate() ?? false) {
      // Trigger join call logic here
      final name = _nameController.text.trim();
      final callId = _callIdController.text.trim();
      // For now, just show a dialog
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CallView(callID: callId, name: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken, // You can try different blend modes
            ),
            child: Image.asset(
              'assets/bg3.JPG',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Text('Join Call', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Leave him let him cook...',
                    style: TextStyle(color: Colors.green),
                  ),
                  TextFormField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter your name'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _callIdController,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Call ID',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter call ID'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _joinCall,
                      child: const Text(
                        'Join Call',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
