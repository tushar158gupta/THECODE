#include <bits/stdc++.h>
using namespace std;

class Employee {
public:
    string name;
    double salary;
    string department;
    string role;

    void printDetails() const {
        cout << "Name: " << name 
             << ", Salary: " << salary 
             << ", Department: " << (department.empty() ? "None" : department)
             << ", Role: " << (role.empty() ? "None" : role) << endl;
    }
    
};

class EmployeeBuilder {
private:
    Employee emp; // The object being built

public:
    EmployeeBuilder& setName(const string& n) {
        emp.name = n;
        return *this; // Return reference for chaining
    }

    EmployeeBuilder& setSalary(double s) {
        if (s < 0) throw invalid_argument("Salary cannot be negative");
        emp.salary = s;
        return *this;
    }

    EmployeeBuilder& setDepartment(const string& d) {
        emp.department = d;
        return *this;
    }

    EmployeeBuilder& setRole(const string& r) {
        emp.role = r;
        return *this;
    }

    Employee build() {
        return emp; // Return the constructed object
    }
};

int main() {
    try {
        EmployeeBuilder builder;

        // Build employee with minimal fields
        Employee emp1 = builder.setName("Tushar").setSalary(50000).build();
        emp1.printDetails(); // Output: Name: Tushar, Salary: 50000, Department: None, Role: None

        // Build employee with all fields
        Employee emp2 = builder.setName("Rohan")
                              .setSalary(60000)
                              .setDepartment("IT")
                              .setRole("Developer")
                              .build();
        emp2.printDetails(); // Output: Name: Rohan, Salary: 60000, Department: IT, Role: Developer
    } catch (const invalid_argument& e) {
        cout << "Error: " << e.what() << endl;
    }
    return 0;
}