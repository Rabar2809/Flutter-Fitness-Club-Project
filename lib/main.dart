import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forward Fitness Club',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    // made an array for calling each class 'page' by the number of index
    const HomeScreen(),
    const ProfileScreen(),
    const Classes(),
    const NutritionInfoPage(),
    const contactUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Made with Flutter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.cyan,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            backgroundColor: Colors.cyan,
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            backgroundColor: Colors.cyan,
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            backgroundColor: Colors.cyan,
            label: 'Nutrition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            backgroundColor: Colors.cyan,
            label: 'Contact Us',
          ),
        ],
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // First Page when the index is equal to 0, set by default
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: ListView(
          children: const <Widget>[
            HomePageContent(
              txt: 'Welcome to Forward Fitness Club',
              txt2: 'Nutrition Facts',
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                    'Our mission is to help our clients meet their fitness and nutrition goals.'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  child: Text(
                      'We provide a FREE one-week membership so you can experience the benefits of our equipment and facility. This one-week trial gives you complete access to our equipment, training classes, and nutrition planning. Contact us today to start your free trial!')),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                    'If you have struggled with getting healthy and need the motivation and resources to make a healthy lifestyle change, contact us today. Our facility includes state- of-the-art equipment, convenient group training classes, and nutrition tips and information to keep you healthy.'),
              ),
            )
          ],
        ));
  }
}

class HomePageContent extends StatelessWidget {
  // a class made for the first page

  const HomePageContent(
      {super.key, this.txt = "", this.image = "", required String txt2});

  final String txt;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 3),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('homeBanner.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.softLight),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(txt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ))),
            ),
          )),
    );
  }
}

// Second Page

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Weights',
                ),
                Tab(
                  text: 'Cardio',
                ),
                Tab(
                  text: 'Personal Training',
                ),
              ],
            ),
            title: const Text('Equipment'),
            centerTitle: true,
            backgroundColor: Colors.grey,
          ),
          body: const TabBarView(
            children: [
              ListOfExercises(
                  description:
                      'Our facility includes a weight training area with several weight options. Build lean muscle with weights and improve your core with weight training.',
                  image: "equipment1.jpg"),
              ListOfExercises(
                  description:
                      'Burn fat through cardio workouts. If you need to lose 20 lbs or more, include at least 30 minutes of cardio each day. We have several equipment choices for your workout.',
                  image: "equipment2.jpg"),
              ListOfExercises(
                description:
                    'Our certified personal trainers work with you one on one to help you obtain your fitness goals. Our personal trainers keep pushing you farther than you would push yourself. When you feel like you cannot do one more rep, they tell you that you can. Personal training has many benefits.',
                image: "equipment3.jpg",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfExercises extends StatelessWidget {
  // a class that is created for our second page content

  const ListOfExercises({super.key, this.description = "", this.image = ""});

  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: 5,
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Image.asset(
                    image,
                    fit: BoxFit.contain,
                  )
                ],
              )
            ],
          )),
    );
  }
}

// Third Page

class Classes extends StatelessWidget {
  const Classes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey,
          body: ListView(
            children: <Widget>[
              const Center(
                child: Text(
                  'Classes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Class',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Days',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Times',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold))),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Cardio')),
                    DataCell(Text('Mon, Wed, Fri')),
                    DataCell(Text('6am to 6pm')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Kick Boxing')),
                    DataCell(Text('Tue, Thu')),
                    DataCell(Text('9am to 3pm')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Yoga')),
                    DataCell(Text('Mon, Wed, Fri')),
                    DataCell(Text('8am to 11am')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Spinning')),
                    DataCell(Text('Sat, Tue, Wed')),
                    DataCell(Text('10am to 4pm')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Zumba')),
                    DataCell(Text('Fri, Sat')),
                    DataCell(Text('6pm to 9pm')),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}

// Fourth Page

class Nutrition extends StatelessWidget {
  const Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  iconSize: 20.0,
                  onPressed: () {
                    _goBack(context);
                  },
                ),
                centerTitle: true,
                title: const Text('Nutrition')),
            body: GridView.extent(
                maxCrossAxisExtent: 360,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
                children: List.generate(_items.length, (index) {
                  // generates the '_items' in order by index
                  return Center(
                    child: SelectCard(item: _items[index]),
                  );
                }))));
  }
}

class Choice {
  const Choice(
      {required this.title, required this.description, required this.image});
  final String title;
  final String description;
  final String image;
}

const List<Choice> _items = <Choice>[
  Choice(
      title: 'Food for Thought',
      description:
          'Good nutrition is a lifestyle, not a diet, It starts with a new way of thinking about food.',
      image: 'imag1.jpg'),
  Choice(
      title: 'What to Eat?',
      description:
          'Limit the consumption of bread, pasta, white potatoes, and processed food. These foods are carbohydrates.',
      image: 'image2.jpg'),
  Choice(
      title: 'Meal of the Day',
      description:
          'Combine all ingredients in a plastic bag and marinate for at least an hour. Preheat oven to 350 degrees.',
      image: 'image3.jpg'),
  Choice(
      title: 'Variety of Nutrition',
      description:
          'The different types of nutrition carbohydrates, proteins, fats provide energy and support bodily functions.',
      image: 'image6.jpg')
];

class SelectCard extends StatelessWidget {
  // addition to the fourth page
  const SelectCard({Key? key, required this.item}) : super(key: null);
  final Choice item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: InkWell(
      splashColor: Colors.blue,
      onTap: () {},
      child: Card(
        color: Colors.grey,
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(children: [
              Column(
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ]),
          ]),
        ),
      ),
    ));
  }
}

_goBack(BuildContext context) {
  Navigator.pop(context);
}

// Fifth Page

class contactUs extends StatelessWidget {
  // final page 'contact us' page using an imported package called 'contactUs'

  const contactUs(
      {super.key,
      this.image = "",
      this.email = "",
      this.companyName = "",
      this.phoneNumber = "",
      this.website = ""});

  final String email;
  final String companyName;
  final String phoneNumber;
  final String image;
  final String website;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: ContactUs(
          image: Image.asset('NewLogo.png'),
          email: 'ForwardFClub@gmail.com',
          companyName: 'Forward Fitness',
          phoneNumber: '(814) 555-9608',
          website: 'https://google.com',
          dividerThickness: 2,
          textColor: Colors.black,
          cardColor: Colors.white,
          companyColor: Colors.grey,
          taglineColor: Colors.white,
        ),
      ),
    );
  }
}

// Fourth page, when clicked on 'nutrition facts' we go to 'Nutrition' page

class NutritionInfoPage extends StatelessWidget {
  const NutritionInfoPage({super.key});

  final String txt2 = 'Click to See Nutrition Facts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'Nutrition',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 3),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: const AssetImage('nutritionBanner.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.softLight),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                  color: Colors.black.withOpacity(0.6),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Nutrition()),
                    );
                  },
                  child: Text(
                    txt2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
