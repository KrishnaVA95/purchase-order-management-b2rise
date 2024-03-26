import '../configuration/module-alias';
import { Request, Service } from '@sap/cds/apis/services';
import { db } from '@/common/entities/db/models';


export default (service: Service) =>{
    // service.after('READ', 'Employees', (results: db.models.Employees[], request: Request)=>{
    //     if (!request.user.is('ROLE_HR')) {
    //         return request.reject(403, 'Não autorizado')
    //     }
    // })
    service.after('READ', 'Employees', (results: db.models.Employees[], request: Request)=>{
        results.forEach(employee => employee.name = 'Lógica customizada com sucesso')
    })
    service.after('READ', 'Employees', (results: db.models.Employees[], request: Request)=>{
        results.forEach(employee => employee.email = employee.email.split('@')[1]) 
    })
    // service.after('CREATE', 'Departments', (results: db.models.Departments[], request: Request)=>{
    //     if (!request.user.is('ROLE_DUMMY_ADMIN')) {
    //         return request.reject(403, 'Não autorizado')
    //     }
    // })
}