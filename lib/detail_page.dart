import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ap/colors.dart';
import 'package:food_ap/ingred.dart';
import 'package:food_ap/style.dart';

import 'popularCategories.dart';

class DetailPage extends StatefulWidget {
  final popular p;
  DetailPage(this.p);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Ingredients> ingList = Ingredients.ingredients;

    return Scaffold(
        floatingActionButton: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width - 40, minHeight: 56),
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryWidget(
                  text: 'Place an Order',
                  size: 18,
                  fontWeight: FontWeight.w700,
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.secondary,
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                primary: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: [
            customAppBar(context),
            Padding(
                padding: EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryWidget(
                      text: widget.p.name,
                      size: 40,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/dollar.svg',
                          color: AppColors.tertiary,
                          width: 15,
                        ),
                        PrimaryWidget(
                          text: '5.99',
                          size: 45,
                          fontWeight: FontWeight.w700,
                          color: AppColors.tertiary,
                          height: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryWidget(
                                text: 'Size',
                                size: 18,
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w500,
                              ),
                              PrimaryWidget(
                                text: 'Medium 14" ',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              PrimaryWidget(
                                text: 'Crust',
                                size: 18,
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w500,
                              ),
                              PrimaryWidget(
                                text: 'Thin Crust',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              PrimaryWidget(
                                text: 'Delivery In',
                                size: 18,
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w500,
                              ),
                              PrimaryWidget(
                                text: '30 min',
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.lightGray,
                                    blurRadius: 10,
                                  )
                                ]),
                            child: Hero(
                              tag: widget.p.imagePath,
                              child: Image.asset(
                                widget.p.imagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: PrimaryWidget(
                text: "Ingredients",
                fontWeight: FontWeight.w700,
                size: 22,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: ingList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                      child: ingredientsCard(ingList[index].ImagePath),
                    );
                  }
                  // ingredientsCard()

                  ),
            )
          ],
        ));
  }

  Container ingredientsCard(String imgPath) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: EdgeInsets.only(right: 20, top: 15, bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.lighterGray,
              blurRadius: 10,
            ),
          ]),
      child: Image.asset(
        imgPath,
        fit: BoxFit.contain,
        width: 90,
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGray),
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.chevron_left_rounded),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary),
              child: Icon(
                Icons.star,
                color: AppColors.white,
              ),
            ),
          ],
        ));
  }
}
