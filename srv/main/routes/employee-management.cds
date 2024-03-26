using { db.models } from '../../../db/models';

// @path:'/v1'
@requires: 'authenticated-user'
service EmployeeManagementService {
     @(restrict: [{ grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_DUMMY_ADMIN' }])
    entity Employees as projection on models.Employees;
    entity Departments as projection on models.Departments;
}
