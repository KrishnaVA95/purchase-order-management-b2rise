using { db.models } from '../../../db/models';

// @path:'/v1'
@requires: 'authenticated-user'
service EmployeeManagementService {

     @(restrict: [
        {grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_HR_ADMIN'}, 
        {grant: ['READ'], to: 'ROLE_HR'}
        ])
    @readonly entity Employees as projection on models.Employees;

    //Dê um exemplo de como usar a anotação @readonly em uma entidade para garantir que ela seja apenas de leitura para todos os usuários, exceto para aqueles com a role ROLE_ADMIN.
    @readonly entity Departments as projection on models.Departments;
}

@requires: 'ROLE_DUMMY_ADMIN'
service EmployeeManagementAdminService {
    entity Employees as projection on models.Employees;
    entity Departments as projection on models.Departments;
}
