import 'package:bemet/model/Medico.dart';
import 'package:bemet/service/StreamSearch.dart';
import 'package:bemet/service/bemetService.dart';
import 'package:flutter/material.dart';

class ViewSearch extends StatefulWidget {
  const ViewSearch({super.key});

  @override
  State<ViewSearch> createState() => _ViewSearchState();
}

class _ViewSearchState extends State<ViewSearch> {
  TextEditingController query = TextEditingController();
  SearchStream searchStream = SearchStream();
  String value = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Medical"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        backgroundColor: const Color(0xffF7F8FA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.08,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSearch(size: size, query: query,searchStream: searchStream),
                  ],
                ),
              ),
              SizedBox(
                  width: size.width,
                  height: size.height * 0.8,
                  child: StreamBuilder<List<Medico>>(
                    stream: searchStream.getStream,
                    builder: (context, snapshot) {

                      if (snapshot.connectionState==ConnectionState.waiting) {
                        return const Center(child:Text("search something product"));
                      }

                      if (snapshot.data!.isEmpty) {
                        return const Center(child: Text("not found"));
                      }
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data!.length,
                          padding: const EdgeInsets.all(0.0),
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].name),
                              leading: FadeInImage(placeholder: const AssetImage("assets/loading-img.gif"), image: NetworkImage(snapshot.data![index].img)),
                              subtitle: Row(
                                children: [
                                  const Text("Available: ",style: TextStyle(color: Colors.green),),
                                  Text(snapshot.data![index].piezas),

                                ],
                              ),
                            );
                          },
                        );
                      }

                      return const Center(child:  CircularProgressIndicator());
                    },
                  ))
            ],
          ),
        ));
  }
}

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    Key? key,
    required this.size,
    required this.query,
    required this.searchStream
  }) : super(key: key);

  final Size size;
  final TextEditingController query;
  final SearchStream  searchStream;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: const Color(0xffF7F8FA),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: query,
        onChanged: (value) {
          searchStream.addQueryResult(value);
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: 'Search medical or insumos'),
      ),
    );
  }
}
