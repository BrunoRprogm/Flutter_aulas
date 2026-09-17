import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/pages/products_by_categorypage.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductsByCategoryPage.route,
          arguments: category.name,
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 76,
            width: 76,
            child: Skeleton.replace(
              replacement: Bone.circle(size: 76),
              width: 76,
              height: 76,
              child: ClipOval(
                // Deixa as imagens redondas
                child: Image.network(
                  category.imageUrl,
                  width: 76,
                  height: 76,
                  fit: BoxFit.cover, //preenche o circluo
                ),
              ),
            ),
          ),
          Text(category.name, style: AppTextStyle.smallBlack),
        ],
      ),
    );
  }
}
