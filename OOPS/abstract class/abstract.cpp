

#include<bits/stdc++.h>
using namespace std;

class Employee{
   public:
    virtual void getrole()=0;
    virtual ~ Employee() {}    
};
 class Developer : public Employee{
    public :
    void getrole() override{
        cout<< "i am a developer"<<endl;
    }
 };

 class Manager :public Employee{
    public:
     void getrole() override{
        cout<< "i am a manager"<<endl;
     }
 };

 class Tools{
    public:
    virtual void toolinuse()=0;
    virtual ~ Tools(){}
 };
 class Codeeditor: public Tools{
    public:
    void toolinuse() override{
        cout<< "i am using code editor"<<endl;
    }

 };

 class GoogleDoc: public Tools{
    public:
    void toolinuse() override{
        cout<< "i am using google doc"<<endl;
    }
 };

 class EmployeeFactory{
    public:
   virtual  Employee* createEmployee()=0;
    virtual  Tools* createTool()=0;
      virtual ~EmployeeFactory() {}
 };

 class DeveloperFactory:public EmployeeFactory{
   public: 
     Employee* createEmployee() override{
         return new Developer();
      }
     Tools* createTool( ) override{
         return new Codeeditor();
      }
 };

 int main (){
   EmployeeFactory* factory = new DeveloperFactory();
   Employee* dev1 = factory->createEmployee();
   Tools* tool1 = factory->createTool();
   dev1->getrole();
   tool1->toolinuse();


   return 0;
   
 }