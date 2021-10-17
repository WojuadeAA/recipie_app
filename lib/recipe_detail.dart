import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];

                  return Text(
                      '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}');
                },
              ),
            ),
            Flexible(
                child: Slider(
              min: 1,
              max: 10,
              divisions: 10,
              value: _sliderValue.toDouble(),
              activeColor: Colors.green,
              inactiveColor: Colors.black,
              label: "${_sliderValue * widget.recipe.servings} servings",
              onChanged: (value) {
                setState(() {
                  _sliderValue = value.round();
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
