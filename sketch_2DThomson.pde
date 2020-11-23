int w = 600;
int h = 600;
Stage stage;
void settings() {
  size(w, h);
  stage = new Stage();
}

void setup() {
   frameRate(1000);
}

void draw() {
  stage.display();
 
 println("framrate",frameRate);
}
