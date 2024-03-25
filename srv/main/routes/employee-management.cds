using { db.models } from '../../../db/models';

// @path:'/v1'
service EmployeeManagementService {
    entity Employees as projection on models.Employees;
    entity Departments as projection on models.Departments;
}
