import 'package:flutter/material.dart';
import 'package:partice_project/screens/ChatPage%20.dart';

void main() {
  runApp(const MaterialApp(
    home: NotificationPage(),
  ));
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  String selectedCategory = '';
  String selectedTab = 'notifications';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: notificationCategories.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Notifications'),
                Tab(text: 'Messages'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // First Tab: Notifications
              NotificationTab(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                    selectedTab = 'notifications';
                  });
                },
                selectedCategory: selectedCategory,
                selectedTab: selectedTab,
                tabController: _tabController,
              ),
              // Second Tab: Messages
              MessagesTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTab extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String selectedCategory;
  final String selectedTab;
  final TabController tabController;

  NotificationTab({
    required this.onCategorySelected,
    required this.selectedCategory,
    required this.selectedTab,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: notificationCategories
              .map(
                (category) => CustomTab(
                  text: category,
                  onPressed: () {
                    final categoryIndex =
                        notificationCategories.indexOf(category);
                    onCategorySelected(category);
                    tabController.animateTo(categoryIndex);
                  },
                ),
              )
              .toList(),
          controller: tabController,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: notificationsByCategory[selectedCategory]?.length ?? 0,
            itemBuilder: (context, index) {
              final categoryNotifications =
                  notificationsByCategory[selectedCategory] ?? [];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(
                    categoryNotifications[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: const Text(
                    "Additional information about the notification",
                    style: TextStyle(fontSize: 12),
                  ),
                  onTap: () {
                    // Handle tapping on a notification card
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomTab({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 94,
        height: 47,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17.50),
        decoration: ShapeDecoration(
          color: const Color(0xFF234F68),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFFF5F4F7),
                      fontSize: 10,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        final chatMessage = chatMessages[index];
        return ChatCard(
          profileImageUrl: chatMessage.profileImageUrl,
          senderName: chatMessage.senderName,
          message: chatMessage.message,
          time: chatMessage.time,
          onTap: () {
            // Handle tapping on a chat item
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => ChatPage())));
          },
        );
      },
    );
  }
}

class ChatCard extends StatelessWidget {
  final String profileImageUrl;
  final String senderName;
  final String message;
  final String time;
  final VoidCallback onTap;

  ChatCard({
    required this.profileImageUrl,
    required this.senderName,
    required this.message,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: 80,
        width: 247,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 30, // Adjust the size of the profile image
            backgroundImage: NetworkImage("https://via.placeholder.com/50x50"),
          ),
          title: const Text(
            'Emmett Perry',
            style: TextStyle(
              color: Color(0xFF242B5C),
              fontSize: 12,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.36,
            ),
          ),
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Just messaged you. Check the message in message tab.',
                style: TextStyle(
                  color: Color(0xFF53577A),
                  fontSize: 10,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.30,
                ),
              ),
              Text(
                '10 mins ago',
                style: TextStyle(
                  color: Color(0xFFA1A4C1),
                  fontSize: 8,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.16,
                ),
              ),
            ],
          ),
          onTap: () {
            // Handle tapping on a chat item
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => ChatPage())));
          },
        ),
      ),
    );
  }
}

class ChatMessage {
  final String profileImageUrl;
  final String senderName;
  final String message;
  final String time;

  ChatMessage({
    required this.profileImageUrl,
    required this.senderName,
    required this.message,
    required this.time,
  });
}

final List<ChatMessage> chatMessages = [
  ChatMessage(
    profileImageUrl: 'assets/profile1.jpg', // Replace with your image path
    senderName: 'John Doe',
    message: 'Hello, how are you?',
    time: '10:30 AM',
  ),
  ChatMessage(
    profileImageUrl: 'assets/profile2.jpg', // Replace with your image path
    senderName: 'Jane Smith',
    message: 'I\'m good, thanks!',
    time: '10:45 AM',
  ),
  // Add more chat messages here
];

final notificationCategories = ['Category A', 'Category B', 'Category C'];

final notificationsByCategory = {
  'Category A': ['Notification 1', 'Notification 2'],
  'Category B': ['Notification 3'],
  'Category C': ['Notification 4', 'Notification 5'],
};
