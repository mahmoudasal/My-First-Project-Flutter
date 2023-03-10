import 'package:creativa_app/feautres/home/screen/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/home_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is ShopSuccesHomeDataStata) {
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
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.DataS.data.banners.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 300,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
                          child: InkWell(
                            // Navgator
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductInfo(state.DataS.data.products[index].id),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 180,
                                    decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 255, 255, 255)), borderRadius: BorderRadius.circular(5)),
                                    child: Image.network(
                                      state.DataS.data.products[index].image,
                                      scale: 1.7,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: TweenAnimationBuilder(
                                            tween: Tween(begin: 0.0, end: 1.0),
                                            duration: Duration(milliseconds: 1500),
                                            builder: (context, value, child) {
                                              return ShaderMask(
                                                shaderCallback: (Rect) {
                                                  return RadialGradient(
                                                          radius: value * 5,
                                                          colors: [
                                                            Colors.white,
                                                            Colors.white,
                                                            Colors.transparent,
                                                            Colors.transparent
                                                          ],
                                                          stops: [
                                                            0.0,
                                                            0.55,
                                                            0.6,
                                                            1.0
                                                          ],
                                                          center: FractionalOffset(0.95, 0.90))
                                                      .createShader(Rect);
                                                },
                                                child: child,
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 47,
                                          width: 140,
                                          child: Text(
                                            state.DataS.data.products[index].name,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: Color.fromARGB(255, 255, 255, 255))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 18,
                                            width: 90,
                                            child: Text(
                                              "${state.DataS.data.products[index].price.toString()} EGP",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
