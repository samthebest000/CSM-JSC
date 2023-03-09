import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'Ng5pR9GLPTfc0MzyPrfTUNrw86TY0dHGTLqFcwOT';
  const keyClientKey = 'glbAMzWEMw6TePiiQnWCVvDqddRDndQx8UUCk6cm';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("init done!");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSM Year Book Assistant"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DataBasePage()));
            },
            icon: const Icon(Icons.data_array),
            tooltip: "Student Database",
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CloudModelTester())));
              },
              icon: const Icon(Icons.mouse))
        ],
      ),
      drawer: const SideBar(),
    );
  }
}

class DataBasePage extends StatefulWidget {
  const DataBasePage({super.key});

  @override
  State<StatefulWidget> createState() => _DataBasePage();
}

class _DataBasePage extends State<DataBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: "Back"),
      ),
      body: Center(
          child: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: getStudentList(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              {
                var documents = snapshot.data ?? List.empty();

                List<DataRow> rows = documents.map((doc) {
                  return DataRow(cells: [
                    DataCell(Text(doc.get("appearances").toString())),
                    DataCell(Text(doc.get("first"))),
                    DataCell(Text(doc.get("middle"))),
                    DataCell(Text(doc.get("last"))),
                    DataCell(Text(doc.get("grade").toString()))
                  ]);
                }).toList();

                return SizedBox.expand(
                  child: DataTable(columns: const [
                    DataColumn(label: Text("Appearances")),
                    DataColumn(label: Text("First")),
                    DataColumn(label: Text("Middle")),
                    DataColumn(label: Text("Last")),
                    DataColumn(label: Text("Grade"))
                  ], rows: rows),
                );
              }

            default:
              return const Text("Nothing lmao");
          }
        },
      )),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('SideBar Menu'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class CloudModelTester extends StatefulWidget {
  const CloudModelTester({super.key});

  @override
  State<StatefulWidget> createState() => _CloudModelTester();
}

class _CloudModelTester extends State<CloudModelTester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cloud Model Tester"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "Back"),
        ),
        body: const Center(
          child: Image(image: AssetImage("assets/person.png")),
        ));
  }
}

Future<List<QueryDocumentSnapshot>> getStudentList() async {
  CollectionReference db = FirebaseFirestore.instance.collection("Students");

  QuerySnapshot snap = await db.get();

  return snap.docs;
}

void runCloud() async {
  final ParseCloudFunction function = ParseCloudFunction('hello');
  final ParseResponse parseResponse = await function.execute();
  if (parseResponse.success && parseResponse.result != null) {
    print(parseResponse.result);
  }
}
