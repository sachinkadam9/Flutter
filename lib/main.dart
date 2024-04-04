import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

enum CardType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    required this.assetName,
    required this.title,
    required this.description,
    required this.city,
    required this.location,
    this.cardType = CardType.standard,
  });

  final String assetName;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardType cardType;
}

const List<TravelDestination> _destinations = [
  TravelDestination(
    assetName: 'images/event_1.jpg',
    title: 'Porsche track experince',
    description: 'Lorem ipsum',
    city: 'Stuttgart',
    location: '',
  ),
  TravelDestination(
    assetName: 'images/event_2.jpg',
    title: '@porsche',
    description: 'some event',
    city: 'Munich',
    location: '',
    //cardType: CardType.tappable,
  ),
  TravelDestination(
    assetName: 'images/event_3.jpg',
    title: 'Another Event',
    description: 'Lorem ipsum',
    city: 'Berlin',
    location: '',
    //cardType: CardType.selectable,
  ),
];

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({
    super.key,
    required this.destination,
    this.shape,
  });

  // Height that allows for all the Card's contents
  // to fit comfortably within the card.
  static const double height = 360;
  final TravelDestination destination;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: Card(
                // Ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: Semantics(
                  label: destination.title,
                  child: TravelDestinationContent(destination: destination),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 37, 175, 67)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MyVehicle(),
    Events(),
    Center(
      child: Text(
        'Index 2: My Account section',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.background,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.


      ),
      body: SingleChildScrollView(
        child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Vehicle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 199, 35, 17),
        onTap: _onItemTapped,
      ),
    
    );
  }
}

class MyVehicle extends StatelessWidget {
  const MyVehicle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ImageSection(            
          image: 'images/porsche.jpg',            
        ),
        VehicleDetailsHeader(),
        ButtonSection(),
        TextSection(            
                       description:            
                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla faucibus nunc libero, ultrices imperdiet turpis cursus sed. Morbi nunc metus, efficitur vitae egestas non, porta vel ligula. Quisque rutrum turpis maximus urna imperdiet tristique. Cras tincidunt massa sit amet varius pharetra. Pellentesque nec diam nisl. Donec pharetra dapibus eros in cursus. Donec posuere hendrerit sem id tempus. Morbi sagittis mauris vitae iaculis consectetur. Phasellus placerat, tortor a tincidunt ullamcorper, turpis nisl faucibus diam, sed volutpat massa nunc vel enim. Aenean ullamcorper tortor at congue ullamcorper. Maecenas non mi id tortor pretium finibus. Proin quis rutrum elit, id dictum augue. Duis et mattis lorem. Morbi congue lectus rhoncus sagittis scelerisque. Vivamus porta justo et venenatis tincidunt.Sed iaculis orci eu nibh semper mollis. Sed tempor pretium urna, non dapibus quam lobortis a. Nam ac lectus in enim mollis ullamcorper. Curabitur consectetur orci vel nibh consectetur, eget porttitor diam posuere. Cras elit leo, ultricies nec elementum et, sollicitudin ac enim. Vivamus placerat mollis leo eget pellentesque. Nulla eget lorem nibh. Aenean hendrerit vulputate mauris vitae aliquet.Mauris eleifend est eget mattis vestibulum. Sed ac placerat ipsum. Praesent laoreet nunc eu velit euismod, id lobortis lorem commodo. Duis a dictum arcu. Aliquam quis dui quis nunc sagittis suscipit at ac velit. Quisque ac dui porta diam euismod faucibus ut ac ante. Vestibulum luctus, mi at porttitor dapibus, velit augue facilisis metus, vel maximus felis lorem ac enim. Fusce laoreet tortor vitae turpis interdum imperdiet. Nullam iaculis tortor sed nulla venenatis, a feugiat urna faucibus. Nulla nec semper velit, eu tincidunt lacus. Cras non ligula id enim viverra tincidunt. Nam ipsum turpis, porttitor ac turpis ut, condimentum ullamcorper lectus. Etiam nec tristique velit, vel porta sapien.',            
                  ),
      ],
    );
  }
}

class VehicleDetailsHeader extends StatelessWidget {
  const VehicleDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
          padding: EdgeInsets.all(32.0),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: ColoredBox(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  Text('Vehicle Details', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWithText(
              color: color,
              icon: Icons.call,
              label: 'CALL',
            ),
            ButtonWithText(
              color: color,
              icon: Icons.near_me,
              label: 'ROUTE',
            ),
            ButtonWithText(
              color: color,
              icon: Icons.share,
              label: 'SHARE',
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 340,
      fit: BoxFit.cover,
    );
  }
}

class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({super.key, required this.destination});

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineSmall!.copyWith(
      color: Colors.white,
    );
    final descriptionStyle = theme.textTheme.titleMedium!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as
                // part of the Material and display ink effects above it.
                // Using a standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(
                    destination.assetName,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Semantics(
                    container: true,
                    header: true,
                    child: Text(
                      destination.title,
                      style: titleStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Description and share/explore buttons.
        Semantics(
          container: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: DefaultTextStyle(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: descriptionStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The three line description on each card demo.
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      destination.description,
                      style: descriptionStyle.copyWith(color: Colors.black54),
                    ),
                  ),
                  Text(destination.city),
                  Text(destination.location),
                ],
              ),
            ),
          ),
        ),
        if (destination.cardType == CardType.standard)
          // share, explore buttons
          Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              alignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Share',
                    semanticsLabel: 'Share ${destination.title}',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Explore',
                    semanticsLabel: 'Explore ${destination.title}',
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {  
    return Column(
      children: [
            for (final destination in _destinations)
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: switch (destination.cardType) {
                  CardType.standard =>
                    TravelDestinationItem(destination: destination),
                  // TODO: Handle this case.
                  CardType.tappable => throw UnimplementedError(),
                  // TODO: Handle this case.
                  CardType.selectable => throw UnimplementedError(),
                },
              ),
          ],
    );
  }
}