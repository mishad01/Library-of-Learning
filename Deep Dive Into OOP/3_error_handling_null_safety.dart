class Area{
  double? width;
  double? height;

  void calculateRectangleArea(){
    if(width==null){
      print("Width cannot be null");
    }
    try{
      double areaWidth =width??10;
      double areaOfRectangle =areaWidth ! * height!;
      print(areaOfRectangle);
    }catch(e){
      print(e);
    }
    
  }
}

void main(){
  Area object = Area();
  object.height = 20;
  object.calculateRectangleArea();
}