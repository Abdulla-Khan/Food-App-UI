import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ap/colors.dart';
import 'package:food_ap/detail_page.dart';
import 'package:food_ap/foodCategories.dart';
import 'package:food_ap/popularCategories.dart';

import 'style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<popular> popList = popular.popularList;

class _HomeState extends State<Home> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    List<Categories> foodList = Categories.foodList;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
            padding: EdgeInsets.only(left: 1),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/user.jpg"),
            )),
        actions: [
          IconButton(onPressed: null, icon: SvgPicture.asset("assets/menu.svg"))
        ],
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(left: 20, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryWidget(
                text: 'Food',
                size: 20,
              ),
              PrimaryWidget(
                text: 'Delivery',
                size: 42,
                fontWeight: FontWeight.w600,
                height: 1.1,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              color: AppColors.secondary,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGray),
                  ),
                  hintText: 'Search ',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightGray,
                    fontSize: 18,
                  )),
            )),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: PrimaryWidget(
            text: 'Categories',
            fontWeight: FontWeight.w800,
            size: 22,
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: foodList.length,
              itemBuilder: (BuildContext context, index) => Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                    child: FoodCategoryCard(
                        foodList[index].imagePath, foodList[index].name, index),
                  )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: PrimaryWidget(
            text: 'Popular',
            fontWeight: FontWeight.w800,
            size: 22,
          ),
        ),
        Column(
            children: List.generate(
                popList.length,
                (index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailPage(popList[index]))),
                      child: popularFoodCard(
                          context,
                          popList[index].imagePath,
                          popList[index].name,
                          popList[index].weight,
                          popList[index].star),
                    )))
      ]),
    );
  }

  Widget FoodCategoryCard(String imgPath, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: selected == index ? AppColors.primary : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 10,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imgPath,
              width: 30,
            ),
            PrimaryWidget(
              text: name,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor:
                  selected == index ? AppColors.white : AppColors.tertiary,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color:
                    selected == index ? AppColors.secondary : AppColors.white,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget popularFoodCard(BuildContext context, String imgPath, String name,
    String weight, String star) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 25),
    decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lighterGray,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.primary,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    PrimaryWidget(
                        text: 'top of the week',
                        fontWeight: FontWeight.w500,
                        size: 16),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.only(left: 20, top: 10),
                child: PrimaryWidget(
                  text: name,
                  fontWeight: FontWeight.w800,
                  size: 22,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: PrimaryWidget(
                  text: weight,
                  size: 18,
                  color: AppColors.lightGray,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: AppColors.primary,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      PrimaryWidget(
                          text: star, fontWeight: FontWeight.w500, size: 16)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(30, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: AppColors.lighterGray,
                  blurRadius: 20,
                )
              ]),
          child: Hero(
            tag: imgPath,
            child: Image.asset(
              imgPath,
              width: MediaQuery.of(context).size.width / 2.9,
            ),
          ),
        )
      ],
    ),
  );
}
