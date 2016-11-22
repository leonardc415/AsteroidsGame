Stars [] space;
SpaceShip one = new SpaceShip();
//Asteroids [] rocks;
public void setup() 
{
  //your code here
  size(500,500);
  space = new Stars[100];
  for(int i=0; i<space.length; i++)   //make stars
  {
      space[i] = new Stars();
  }
 /* for(int i=0; i<rocks.length; i++){
      rocks[i] = new Asteroids();
  }*/
}


public void draw() 
{
  //your code here
  background(1);
  one.show();
  one.move();

  for(int i=0; i<space.length; i++){      //shows stars
    space[i].show();
  }
}



class Stars 
{
  double theX, theY;
  int myColor;
  Stars()
    {
      myColor = int(255);
      theX = (int)(Math.random()*500);
      theY = (int)(Math.random()*500);
    }
  public void show()
  {
    fill(myColor);
    ellipse((float)theX, (float)theY, 2, 2);
  }
}

class Asteroids extends Floater
{
  private int turn;

  public Asteroids(){
    corners = 8;
    turn = (int)(Math.random()*5)-5;                               //left off here(turning asteroids);sets asteroid turn speed
    myColor = int(50);
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
    myDirectionX = (int)(Math.random()*10-5);
    myDirectionY = (int)(Math.random()*10-5);
    myPointDirection = (int)(Math.random()*360);
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 0;    //asteroid
    yCorners[0] = 7;
    xCorners[1] = 5;
    yCorners[1] = 4;
    xCorners[2] = 9;
    yCorners[2] = 4;
    xCorners[3] = 12;
    yCorners[3] = 0;
    xCorners[4] = 4;
    yCorners[4] = -6;
    xCorners[5] = -5;
    yCorners[5] = -8;
    xCorners[6] = -12;
    yCorners[6] = -1;
    xCorners[7] = -10;
    yCorners[7] = 6;
  }

  public void setTurn(int x){turn = x;}      
  public int getTurn(){return (int)turn;}
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public int getPointDirection(){return (int)myPointDirection;}

  public void move(){
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;

    //wrap around screen    
    if(myCenterX >width) {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    } 
    //add turning   
  }

}




class SpaceShip extends Floater  
{   
  public SpaceShip(){
    corners= 4;
    myColor = int(255);  //initialize var
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 360;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;    //Spaceship
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] =  0;
    xCorners[2] = -8;
    yCorners[2] =  8;
    xCorners[3] = -2;
    yCorners[3] =  0;
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;} 
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public int getPointDirection(){return (int)myPointDirection;}
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;   
  protected int[] xCorners; 
  protected int[] yCorners;   
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public int getPointDirection(); 







  public void keyPressed()
{
  if(key == 'a'){
    one.rotate(-10);
    }
  if(key == 'd'){
   one.rotate(10);
    }
  if(key == 'w'){
    one.accelerate(0.08);
    }
  if(key == 's'){
    one.accelerate(-0.08);
   }
   /*if(key == 'e'){
     one.rotate(Math.random()*20-10);

   }*/
} 


  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  { 
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   


  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   



//move the floater in the current direction of travel
  public void move ()   
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
  myCenterX += myDirectionX;
  myCenterY += myDirectionY;

    //wrap around screen    
    if(myCenterX >width) {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   


//Draws the floater at the current position 
  public void show ()   
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   

}
