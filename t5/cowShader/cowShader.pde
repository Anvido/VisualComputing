import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice joystick;
ControlSlider xPos;
ControlSlider yPos;
ControlSlider zPos;
ControlSlider zRot;
ControlButton triangle;
ControlButton square;
ControlButton cross;
ControlButton circle;
ControlButton left_1;
ControlButton left_2;
ControlButton right_1;
ControlButton right_2;
Shape cow, labyrinth;
boolean zTranslate, zRotate, b_cow;
Frame cam, eye;
Quaternion quat;
Scene scene;
Vector view;
PShader shader, pointVert, pointFrag, specVert, specFrag;

public void setup() {
  zTranslate = false;
  zRotate = false;
  b_cow = false;
  size(1240, 720, P3D);
  initJoistick();
  scene = new Scene(this);
  scene.setRadius(50);
  scene.eye().setPosition(19.04713, -23.634697, 48.64367 );
  scene.eye().rotate(new Vector(1, 0, 0), 0.9);
  eye = scene.eye().get();
  cow = new Shape(scene, loadShape("spot/spot_control_mesh.obj"));
  labyrinth = new Shape(scene, loadShape("Labyrinth/Labyrinth.obj"));
  labyrinth.translate(20, 0, 20);
  labyrinth.scale(2);
  labyrinth.rotate(new Vector(1, 0, 0), PI);
  cow.scale(0.2);
  cow.translate(0, -0.16, 38.7);
  cow.rotate(new Vector(0, 0, 1), PI);
  cow.rotate(new Vector(0, 1, 0), PI/2);
  cam = new Frame(cow) {
    @Override
      public void visit() {
      scene.drawAxes(5);
    }
  };
  cam.rotate(new Vector(0, 0, 1), PI);
  cam.translate(0, 0, 15);
  pointVert = loadShader("lightfrag.glsl", "lightvert.glsl");
  pointFrag = loadShader("pixlightfrag.glsl", "pixlightvert.glsl");
  specVert = loadShader("speclightfrag.glsl", "speclightvert.glsl");
  specFrag = loadShader("specpixlightfrag.glsl", "specpixlightvert.glsl");
  shader = pointVert;
}

public void draw() {
  shader(shader);
  pointLight(255, 255, 255, 17, -40, 17);
  background(0);
  scene.drawAxes();
  if (b_cow) {
    scene.translate(xPos.getValue()/5, 0, -yPos.getValue()/5, cow);
    //cam.rotate(new Vector(1,0,0), -zPos.getValue()/10* PI / width); // especial
    cow.rotate(new Vector(0, 1, 0), zRot.getValue() * PI / width);
  } else {
    if (!left_1.pressed()) {
      scene.translate(-xPos.getValue(), 0, yPos.getValue());
    } else {
      scene.translate(0, yPos.getValue(), 0);
    }
    if (!right_1.pressed()) {
      scene.rotate( -zPos.getValue() * PI / width, -zRot.getValue() * PI / width, 0);
    } else {
      scene.rotate( 0, 0, -zPos.getValue() * PI / width);
    }
  }
  scene.traverse();
}

void keyPressed() {
  if (key == 'v') {

    b_cow = !b_cow;
    if (scene.eye().reference() !=null) {
      scene.eye().resetReference();
      scene.fit(eye);
    } else {
      scene.eye().setReference(cam);
      scene.fit(cam);
    }
  } else  if (key == 'a') {
    shader = pointVert;
  } else if (key == 'b') {
    shader = pointFrag;
  } else if (key == 'c') {
    shader = specVert;
  } else if (key == 'd') {
    shader = specFrag;
  }
}

public void initJoistick() {
  // Initialise the ControlIO
  control = ControlIO.getInstance(this);
  // Find a device that matches the configuration file
  joystick = control.getMatchedDevice("JController");
  if (joystick == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }

  xPos = joystick.getSlider("X");
  yPos = joystick.getSlider("Y");
  zPos = joystick.getSlider("Z");
  zRot = joystick.getSlider("RZ");
  triangle = joystick.getButton("TRIANGLE");
  square = joystick.getButton("SQUARE");
  cross = joystick.getButton("CROSS");
  circle = joystick.getButton("CIRCLE");
  left_1 = joystick.getButton("L1");
  left_2 = joystick.getButton("L2");
  right_1 = joystick.getButton("R1");
  right_2 = joystick.getButton("R2");
}
