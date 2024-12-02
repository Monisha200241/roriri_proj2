import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Accounts Overview",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Card List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  AccountCard(
                    name: "Rhiannon",
                    avatar: 'assets/images/avatar1.jpg',
                    decemberAmount: "-322 €",
                    januaryAmount: "-10 €",
                    balance: "145 €",
                    cardColor: Colors.pinkAccent,
                  ),
                  AccountCard(
                    name: "Caroline",
                    avatar: 'assets/images/avatar2.jpg',
                    decemberAmount: "+151 €",
                    januaryAmount: "+5 €",
                    balance: "0 €",
                    cardColor: Colors.teal,
                  ),
                  AccountCard(
                    name: "Fillip",
                    avatar: 'assets/images/avatar3.png',
                    decemberAmount: "+171 €",
                    januaryAmount: "+5 €",
                    balance: "22 €",
                    cardColor: Colors.purpleAccent,
                  ),
                ],
              ),
            ),
            // Bottom Navigation Bar
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: 0,
              selectedItemColor: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountCard extends StatelessWidget {
  final String name;
  final String avatar;
  final String decemberAmount;
  final String januaryAmount;
  final String balance;
  final Color cardColor;

  const AccountCard({
    super.key,
    required this.name,
    required this.avatar,
    required this.decemberAmount,
    required this.januaryAmount,
    required this.balance,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // "Trade Down" Button at the top-left corner of the card
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_downward, color: Colors.yellow), // Yellow "trade down" icon
              onPressed: () {
                // Action for the "trade down" button can go here
                debugPrint('Trade down button pressed for $name');
              },
            ),
          ),
          // Plus Button at the top-right corner of the card
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.add_circle_outline, color: Color.fromARGB(255, 8, 241, 59)),
              onPressed: () {
                // Action for the plus button can go here
                debugPrint('Plus button pressed for $name');
              },
            ),
          ),
          // Content of Account Card
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Centered Avatar
              CircleAvatar(
                backgroundImage: AssetImage(avatar),
                radius: 40, // Adjust size as needed
              ),
              const SizedBox(height: 12), // Space between avatar and text
              // Name
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8), // Space between name and details
              // December and January Amounts with Balance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Décembre: $decemberAmount",
                        style: GoogleFonts.poppins(color: Colors.white70),
                      ),
                      Text(
                        "Janvier: $januaryAmount",
                        style: GoogleFonts.poppins(color: Colors.white70),
                      ),
                    ],
                  ),
                  // Balance
                  Text(
                    "Solde: $balance",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
