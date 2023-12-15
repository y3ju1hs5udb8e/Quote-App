import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/providers/quote_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(quoteProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'moviVated.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: data.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 2500), () {
                ref.refresh(quoteProvider);
              });
            },
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  height: MediaQuery.of(context).size.height * 0.80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data[0].content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Text(
                          'by -${data[0].author}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text('$error'),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
