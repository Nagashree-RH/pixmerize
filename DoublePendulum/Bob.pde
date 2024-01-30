class Bob {

  float r1 =300;
  float r2=300;
  float theta1=PI/2;
  float theta2=PI/4;
  float m1=40;
  float m2=40;
  float x1, y1, x2, y2;
  float a_vel1=0;
  float a_vel2=0;
  float a_acc1=0;
  float a_acc2=0;
  float originX, originY;
  float g=1;
  float damping =0.99;

  Bob() {
  }

  void go() {
    calcBobLoc() ;
    calcAcc();
    update();
    display();
  }

  void calcBobLoc() {

    x1=r1*sin(theta1);
    y1=r1*cos(theta1);

    x2=x1+r2*sin(theta2);
    y2=y1+r2*cos(theta2);
  }

  void update() {

    a_vel1+=a_acc1;
    a_vel2+=a_acc2;

    theta1+=a_vel1;
    theta2+=a_vel2;
  }


  void calcAcc() {

    float num1 = -g*(2*m1+m2)*sin(theta1);
    float num2 = -m2*g*sin(theta1-(2*theta2));
    float num3 = -2*sin(theta1-theta2)*m2;
    float num4 = a_vel2*a_vel2*r2+a_vel1*a_vel1*r1*cos(theta1-theta2);
    float den  = r1*(2*m1+m2-m2*cos(2*theta1-2*theta2));

    a_acc1= (num1+num2+num3*num4)/den;

    num1= 2*sin(theta1-theta2);
    num2= a_vel1*a_vel1*r1*(m1+m2);
    num3= g*(m1+m2)*cos(theta1);
    num4=a_vel2*a_vel2*r2*cos(theta1-theta2);
    den  = r2*(2*m1+m2-m2*cos(2*theta1-2*theta2));

    a_acc2=(num1*(num2+num3+num4))/den;
  }

  void display() {

    stroke(#FF5733);
    strokeWeight(3);
    line(originX, originY, x1, y1);
    noFill();
    stroke(#89CFF0);
    ellipse(x1, y1, m1, m1);
    stroke(#FF5733);
    line(x1, y1, x2, y2);
    noFill();
    stroke(#89CFF0);
    ellipse(x2, y2, m2, m2);
  }
}
