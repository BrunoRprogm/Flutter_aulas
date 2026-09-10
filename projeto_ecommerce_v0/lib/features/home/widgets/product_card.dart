import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category_model.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.category, {
    super.key,
    required this.product,
    this.onTap,
  });

  final Product product;
  final Category category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        abrirDetalhesDoProduto(context, product);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Skeleton.replace(
                width: 150,
                height: 150,
                child: Image.network(
                  product.imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(product.brand, style: AppTextStyle.smallGrey),
            Text(product.name, style: AppTextStyle.smallBlack),
            Text(
              '\$${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
              style: AppTextStyle.smallGreen,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> abrirDetalhesDoProduto(
    BuildContext context,
    Product product,
  ) async {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsetsGeometry.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                // Faz com os filhos dessa classe tenham os cantos arredondads.
                borderRadius: BorderRadiusGeometry.all(Radius.circular(18)),
                child: Image.network(
                  product.imageUrl,
                  height: 220,
                  width: 330,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              Text(product.name, style: AppTextStyle.title),
              Text(product.brand, style: AppTextStyle.subtitle),
              SizedBox(height: 4),
              Text(product.description, style: AppTextStyle.descriptionProduct),
              SizedBox(height: 4),
              Text(
                'R\$${product.price.toString()}',
                style: AppTextStyle.priceProduct2,
              ),

              SizedBox(height: 20),

              AppElevatedButton(
                onPressed: () {},
                type: ButtonType.filled,
                label: 'Adicionar ao Carrinho',
              ),
            ],
          ),
        );
      },
    );
  }
}
