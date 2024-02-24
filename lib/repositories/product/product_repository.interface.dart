import 'package:houlala/models/product/product_model.dart';
import 'package:http/http.dart';

abstract class ProductRepositoryInterface{
  Future<List<ProductModel>> fetchProducts();
  Future<Response> bookMarkProduct(int id);
  Future<ProductModel> fetchSingleProduct(String sku);
}