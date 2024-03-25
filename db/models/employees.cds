using { managed } from '@sap/cds/common';
using { db.models } from '.';
namespace db.models;

entity Employees: managed {
    key id: UUID;
    key department: Association to models.Departments;
        name: String(255);
        email: String(255);
}


