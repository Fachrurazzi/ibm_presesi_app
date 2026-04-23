import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibm_presensi_app/main.dart';

void main() {
  group('IBM Presensi App - Initial Screen Tests', () {
    testWidgets('Should show LoginScreen when not logged in',
        (WidgetTester tester) async {
      // Build app with NOT logged in state
      await tester.pumpWidget(const MyApp(
        isLoggedIn: false,
        isDefaultPass: false,
        isFaceRegistered: false,
      ));

      // Wait for animations
      await tester.pumpAndSettle();

      // Verify LoginScreen is shown
      expect(find.text('Login'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('Should show ChangePasswordScreen when password is default',
        (WidgetTester tester) async {
      // Build app with logged in but default password
      await tester.pumpWidget(const MyApp(
        isLoggedIn: true,
        isDefaultPass: true,
        isFaceRegistered: false,
      ));

      await tester.pumpAndSettle();

      // Verify ChangePasswordScreen is shown
      expect(find.text('Ganti Password'), findsOneWidget);
      expect(find.text('Password Lama'), findsOneWidget);
      expect(find.text('Password Baru'), findsOneWidget);
    });

    testWidgets('Should show RegisterFaceScreen when face not registered',
        (WidgetTester tester) async {
      // Build app with logged in, password changed, but face not registered
      await tester.pumpWidget(const MyApp(
        isLoggedIn: true,
        isDefaultPass: false,
        isFaceRegistered: false,
      ));

      await tester.pumpAndSettle();

      // Verify RegisterFaceScreen is shown
      expect(find.text('Registrasi Wajah'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Should show NavbarScreen when all requirements met',
        (WidgetTester tester) async {
      // Build app with all requirements met
      await tester.pumpWidget(const MyApp(
        isLoggedIn: true,
        isDefaultPass: false,
        isFaceRegistered: true,
      ));

      await tester.pumpAndSettle();

      // Verify NavbarScreen is shown (Home/Dashboard)
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });

  group('IBM Presensi App - Theme Tests', () {
    testWidgets('Should use correct primary color',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp(
        isLoggedIn: false,
        isDefaultPass: false,
        isFaceRegistered: false,
      ));

      await tester.pumpAndSettle();

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      final ThemeData theme = app.theme!;

      expect(theme.useMaterial3, true);
      expect(theme.colorScheme.primary, isNotNull);
      expect(theme.primaryColor, isNotNull);
      expect(theme.brightness, Brightness.light);
    });
  });

  group('IBM Presensi App - Navigation Tests', () {
    testWidgets('Should navigate to ForgotPassword from Login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp(
        isLoggedIn: false,
        isDefaultPass: false,
        isFaceRegistered: false,
      ));

      await tester.pumpAndSettle();

      // Find and tap "Lupa Password?" button
      final forgotPasswordButton = find.text('Lupa Password?');
      expect(forgotPasswordButton, findsOneWidget);

      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();

      // Verify ForgotPasswordScreen is shown
      expect(find.text('Lupa Password'), findsOneWidget);
      expect(find.text('Kirim Link Reset'), findsOneWidget);
    });
  });
}

// ============================================================================
// MOCK SCREENS (Jika screen asli belum dibuat)
// ============================================================================

// Uncomment dan sesuaikan jika screen asli belum ada
/*
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          const TextField(decoration: InputDecoration(labelText: 'Email')),
          const TextField(decoration: InputDecoration(labelText: 'Password')),
          ElevatedButton(onPressed: () {}, child: const Text('Masuk')),
          TextButton(
            onPressed: () {},
            child: const Text('Lupa Password?'),
          ),
        ],
      ),
    );
  }
}

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ganti Password')),
      body: Column(
        children: const [
          TextField(decoration: InputDecoration(labelText: 'Password Lama')),
          TextField(decoration: InputDecoration(labelText: 'Password Baru')),
          TextField(decoration: InputDecoration(labelText: 'Konfirmasi Password')),
        ],
      ),
    );
  }
}

class RegisterFaceScreen extends StatelessWidget {
  const RegisterFaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrasi Wajah')),
      body: const Center(child: Text('Registrasi Wajah')),
    );
  }
}

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: const Center(child: Text('Dashboard')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lupa Password')),
      body: Column(
        children: [
          const TextField(decoration: InputDecoration(labelText: 'Email')),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Kirim Link Reset'),
          ),
        ],
      ),
    );
  }
}
*/