using { managed } from '@sap/cds/common';
using { db.models } from '.';
namespace db.models;

entity Departments: managed {
    key id: UUID;
        departmentName: String(40);
        employees: Composition of many models.Employees on employees.department = $self;
};

