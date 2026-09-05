import 'package:flutter/material.dart';

void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITP107 | Dalde',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF403D88),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFCF3F3),
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _gestureOutput = 'Tap, double tap, or long press "Click Me".';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  // Login button -> validates fields, then shows success or error dialog
  void _handleLogin() {
    debugPrint('[BUTTON EVENT]    : Login button pressed');

    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      debugPrint('LOGIN RESULT      : Failed — one or more fields are empty');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Row(
              children: [
                Icon(Icons.error_outline, color: Colors.redAccent),
                SizedBox(width: 8),
                Text('Error'),
              ],
            ),
            content: const Text('Please fill in all fields before logging in.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    debugPrint('LOGIN RESULT      : Success');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF403D88)),
              SizedBox(width: 8),
              Text('Success'),
            ],
          ),
          content: const Text('You have successfully logged in!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Color(0xFF403D88),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF403D88), width: 3),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/cinnamoroll_logo.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Color(0xFF8B639B),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF403D88),
                ),
              ),
              const SizedBox(height: 28),

              // TextFormField — User Name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF8B639B)),
                  filled: true,
                  fillColor: const Color(0xFFF8B2B2).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // TextFormField — Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF8B639B)),
                  filled: true,
                  fillColor: const Color(0xFFF8B2B2).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // TextFormField — Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF8B639B)),
                  filled: true,
                  fillColor: const Color(0xFFF8B2B2).withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF403D88),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _handleLogin,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  const message = 'Hello World!';
                  debugPrint('=================================================');
                  debugPrint('GESTURE EVENT     : Single Tap');
                  debugPrint('OUTPUT            : $message');
                  debugPrint('=================================================');
                  setState(() {
                    _gestureOutput = 'Single Tap\n$message';
                  });
                },
                onDoubleTap: () {
                  const courseCode = 'ITP107';
                  const description = 'Application Development and '
                      'Emerging Technologies (Mobile Application Development)';
                  debugPrint('=================================================');
                  debugPrint('GESTURE EVENT     : Double Tap');
                  debugPrint('COURSE CODE       : $courseCode');
                  debugPrint('DESCRIPTION       : $description');
                  debugPrint('=================================================');
                  setState(() {
                    _gestureOutput = 'Double Tap\n$courseCode - $description';
                  });
                },
                onLongPress: () {
                  const fullName = 'Leanne Janelle B. Dalde';
                  debugPrint('=================================================');
                  debugPrint('GESTURE           : Long Press');
                  debugPrint('FULL NAME         : $fullName');
                  debugPrint('=================================================');
                  setState(() {
                    _gestureOutput = 'Long Press\n$fullName';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B639B), Color(0xFFAF719D)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF403D88).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF403D88).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF403D88).withOpacity(0.2),
                  ),
                ),
                child: Text(
                  _gestureOutput,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF403D88),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}