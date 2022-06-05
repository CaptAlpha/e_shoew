#include <iostream>
#include<math.h>
#include<iomanip>
using namespace std;
class polar
{
  float r,a;
  public:
  void setpolar(float i, float j)
  {
      r=i; 
      a=j;
  }
  void showpolar()
  {
   cout<<r<<"\n"<<a;
  }
  void getresult(){}
  polar operator + (polar ob);
};

polar polar::operator+(polar ob)
{
  float x1,x2,y1,y2,x,y,rad,angle;
  float angle1,angle2,ang;
  polar tempob;

  angle1 = (22 * a) /float(7 * 180);
  angle2 = (22 * ob.a)/ float (7 * 180);

  x1 = r*cos(angle1);
  y1 = r*sin(angle1);
  x2 = ob.r * cos(angle2);
  y2 = ob.r * sin(angle2);

  x = x1 + x2;
  y = y1 + y2;

  rad = sqrt((x*x)+(y*y));
  ang = atan(y/float(x));
  angle = (180*7*ang)/22;
  tempob.setpolar(rad,angle);
  return tempob;
}
// Subtraction
polar polar::operator-(polar ob)
{
  float x1,x2,y1,y2,x,y,rad,angle;
  float angle1,angle2,ang;
  polar tempob;

  angle1 = (22 * a) /float(7 * 180);
  angle2 = (22 * ob.a)/ float (7 * 180);

  x1 = r*cos(angle1);
  y1 = r*sin(angle1);
  x2 = ob.r * cos(angle2);
  y2 = ob.r * sin(angle2);

  x = x1 - x2;
  y = y1 - y2;

  rad = sqrt((x*x)+(y*y));
  ang = atan(y/float(x));
  angle = (180*7*ang)/22;
  tempob.setpolar(rad,angle);
  return tempob;
}

int main()
{
   float r,a;
   int choice;
   polar ob[2],sumob;
   for(int i=0;i<2;i++)
   {
     cin>>r;
     cin>>a;
     ob[i].setpolar(r,a);
   }
   cin>>choice;

   /*for(int i=0;i<2;i++)
   {
     ob[i].showpolar();
   }*/
   if (choice==1){
   sumob = ob[0] + ob[1];
   sumob.showpolar();}
   else if(choice==2){
       //Subtraction
    sumob = ob[0] - ob[1];
    sumob.showpolar();}
    else{
      cout<<"Invalid choice";
    

   }
   
   return 0;
}