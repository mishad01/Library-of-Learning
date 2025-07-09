class Area {
  double? width;
  double? height;

  void calculateRectangleArea() {
    // Early validation for width
    if (width == null) {
      print("Warning: Width is null. Using default width = 10");
    }

    try {
      // Use null-aware fallback for width, and assert height is non-null
      double areaWidth = width ?? 10;
      double areaHeight = height!;
      double area = areaWidth * areaHeight;

      print("Area of Rectangle: $area");
    } catch (e) {
      print("Error while calculating area: $e");
    }
  }
}

void main() {
  // Creating an Area object
  Area object = Area();

  // Assigning only height
  object.height = 20;

  // width is left null — so fallback will apply
  object.calculateRectangleArea();
}
