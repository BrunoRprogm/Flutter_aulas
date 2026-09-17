import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/controller/cart_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});

  final ProductCart item;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, value, child) {
        // Em vez de usar o item passado como parâmetro diretamente
        // busca ele na lista do controller que sempre está atualizada

        final itemAtualizado = value.itemCarrinho.firstWhere(
          (i) => i.name == item.name,
          orElse: () => item,
        );
        return Container(
          margin: EdgeInsets.only(bottom: 18),
          width: 385,
          height: 128,
          padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  itemAtualizado.imageUrl,
                  height: 108,
                  width: 108,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' ${itemAtualizado.name}',
                          style: AppTextStyle.productName,
                        ),
                        Text(
                          'R\$${(itemAtualizado.price * itemAtualizado.quantity).toStringAsFixed(2)}',
                          style: AppTextStyle.priceProduct3,
                        ),
                      ],
                    ),
                    Text(
                      '  ${itemAtualizado.brand}',
                      style: AppTextStyle.smallGrey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppElevatedButton(
                          onPressed: () {
                            value.subtrair(itemAtualizado);
                          },
                          type: ButtonType.filled,
                          label: '-',
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${itemAtualizado.quantity}',
                          style: AppTextStyle.priceProduct2,
                        ),
                        SizedBox(width: 10),
                        AppElevatedButton(
                          onPressed: () {
                            value.adicionar(itemAtualizado);
                          },
                          type: ButtonType.filled,
                          label: '+',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
