import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/home_cubit.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo(
    int id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: SizedBox(
                width: 255,
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/Free_Sample_By_Wix.jpg")
                  ],
                ),
              ),
              backgroundColor: Color.fromARGB(255, 243, 243, 243),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromARGB(255, 19, 179, 166),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 169, 20, 20)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
