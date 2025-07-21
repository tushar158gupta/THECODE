#include <bits/stdc++.h>
using namespace std;

// Abstract Product A: Employee
class Employee {
public:
    virtual void work() const = 0;
    virtual ~Employee() {}
};

// Concrete Product A1: Developer
class Developer : public Employee {
public:
    void work() const override {
        cout << "Developer is coding." << endl;
    }
};

// Concrete Product A2: Manager
class Manager : public Employee {
public:
    void work() const override {
        cout << "Manager is planning." << endl;
    }
};

// Abstract Product B: Tool
class Tool {
public:
    virtual void use() const = 0;
    virtual ~Tool() {}
};

// Concrete Product B1: CodeEditor
class CodeEditor : public Tool {
public:
    void use() const override {
        cout << "Using Code Editor." << endl;
    }
};

// Concrete Product B2: Planner
class Planner : public Tool {
public:
    void use() const override {
        cout << "Using Planner." << endl;
    }
};

// Abstract Factory
class EmployeeFactory {
public:
    virtual Employee* createEmployee() const = 0;
    virtual Tool* createTool() const = 0;
    virtual ~EmployeeFactory() {}
};

// Concrete Factory 1: DeveloperFactory
class DeveloperFactory : public EmployeeFactory {
public:
    Employee* createEmployee() const override {
        return new Developer();
    }
    Tool* createTool() const override {
        return new CodeEditor();
    }
};

// Concrete Factory 2: ManagerFactory
class ManagerFactory : public EmployeeFactory { // Fixed redefinition
public:
    Employee* createEmployee() const override {
        return new Manager();
    }
    Tool* createTool() const override {
        return new Planner();
    }
};

int main() {
    // Create Developer family
    EmployeeFactory* devFactory = new DeveloperFactory();
    Employee* dev = devFactory->createEmployee();
    Tool* devTool = devFactory->createTool();

    dev->work();     // Output: Developer is coding.
    devTool->use();  // Output: Using Code Editor.

    // Create Manager family
    EmployeeFactory* mgrFactory = new ManagerFactory(); // Fixed type
    Employee* mgr = mgrFactory->createEmployee();
    Tool* mgrTool = mgrFactory->createTool();

    mgr->work();     // Output: Manager is planning.
    mgrTool->use();  // Output: Using Planner.

    // Clean up
    delete dev;
    delete devTool;
    delete devFactory;
    delete mgr;
    delete mgrTool;
    delete mgrFactory;

    return 0;
}