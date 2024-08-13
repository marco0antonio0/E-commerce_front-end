import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget loadNetworkImageWithFallback(String imgUrl,
    {String fallbackAsset = 'images/product.png', BoxFit fit = BoxFit.cover}) {
  return CachedNetworkImage(
    imageUrl: imgUrl,
    fit: fit,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => Center(
      child: Image.asset(
        fallbackAsset,
        fit: fit,
      ),
    ),
  );
}
