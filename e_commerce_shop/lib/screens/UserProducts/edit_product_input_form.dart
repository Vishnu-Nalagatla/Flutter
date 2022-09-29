import 'package:e_commerce_shop/providers/product.dart';
import 'package:e_commerce_shop/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductInputForm extends StatefulWidget {
  final Product? product;
  const EditProductInputForm({
    super.key,
    this.product,
  });

  @override
  State<EditProductInputForm> createState() => _EditProductInputFormState();
}

class _EditProductInputFormState extends State<EditProductInputForm> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  late final _imageUrlController =
      TextEditingController(text: widget.product?.imageUrl ?? "");
  final _productForm = GlobalKey<FormState>();
  late var _editedProduct = Product(
    id: widget.product?.id ?? "",
    title: widget.product?.title ?? "",
    description: widget.product?.description ?? "",
    price: widget.product?.price ?? 0.0,
    imageUrl: widget.product?.imageUrl ?? "",
  );
  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void onSavedValues(String newValue, String valueFrom) {
    _editedProduct = Product(
      id: DateTime.now().toString(),
      title: valueFrom == "title" ? newValue : _editedProduct.title,
      description: valueFrom == "desc" ? newValue : _editedProduct.description,
      price:
          valueFrom == "price" ? double.parse(newValue) : _editedProduct.price,
      imageUrl: valueFrom == "image" ? newValue : _editedProduct.imageUrl,
    );
  }

  void _saveForm() {
    final isValid = _productForm.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _productForm.currentState?.save();
    if (widget.product?.id.isEmpty ?? false) {
      Provider.of<ProductsProvider>(context, listen: false)
          .addNewProduct(_editedProduct);
    } else {
      widget.product?.updateProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _productForm,
      child: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Title"),
            initialValue: widget.product?.title ?? "",
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_priceFocusNode);
            },
            onSaved: ((newValue) {
              onSavedValues(newValue ?? "", "title");
            }),
            validator: (value) {
              if (value!.isEmpty) {
                return "Provide a title";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Price"),
            initialValue: widget.product?.price.toString() ?? "",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_descriptionFocusNode);
            },
            onSaved: ((newValue) {
              onSavedValues(newValue ?? "", "price");
            }),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please provide the Price.";
              }
              if (double.tryParse(value) == null) {
                return "Please enter the Valid Number.";
              }
              if (double.parse(value) <= 0) {
                return "Please enter the value greater than zero.";
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Description"),
            initialValue: widget.product?.description ?? "",
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            onSaved: ((newValue) {
              onSavedValues(newValue ?? "", "desc");
            }),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please provide the description.";
              }
              if (value.length <= 10) {
                return "Should be at least 10 characters long.";
              }
              return null;
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(
                  top: 8,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: _imageUrlController.text.isEmpty
                    ? const Center(child: Text("Enter a Url"))
                    : FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(_imageUrlController.text),
                      ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "ImageUrl"),
                  keyboardType: TextInputType.url,
                  controller: _imageUrlController,
                  focusNode: _imageUrlFocusNode,
                  // initialValue: widget.product?.imageUrl ?? "",
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  onSaved: ((newValue) {
                    onSavedValues(newValue ?? "", "image");
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please provide the Image Url.";
                    }
                    if (!value.startsWith("http") &&
                        !value.startsWith("https")) {
                      return "Please enter valid url.";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            child: TextButton(
              onPressed: () {
                _saveForm();
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                elevation: 2,
                backgroundColor: Colors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product?.id.isNotEmpty ?? false
                      ? "Update Product"
                      : "Add Product",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
