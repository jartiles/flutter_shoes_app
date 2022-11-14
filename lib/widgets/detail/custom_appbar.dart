import 'package:flutter/material.dart';

import 'package:flutter_shoes_app/models/shoe_model.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.shoe}) : super(key: key);

  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Hero(
            tag: '${shoe.id}-shoe-img',
            child: ClipRRect(
              child: Transform.rotate(
                angle: -0.4,
                child: Image(
                  image: NetworkImage(shoe.image),
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: _NameBtns(shoe: shoe),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(210);
}

class _NameBtns extends StatelessWidget {
  const _NameBtns({Key? key, required this.shoe}) : super(key: key);
  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left, size: 40),
        ),
        Flexible(
          child: Text(
            shoe.name,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline, size: 30),
        ),
      ],
    );
  }
}
