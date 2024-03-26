import '../configuration/module-alias';
import { Request, Service } from '@sap/cds/apis/services';
import { db } from '@/common/entities/db/models';

export default (service: Service) =>{
    service.after('READ', 'Employees', (results: db.models.Employees[], request: Request)=>{
        results.forEach(employee => employee.name = 'Lógica customizada com sucesso')
    })
    service.after('READ', 'Employees', (results: db.models.Employees[], request: Request)=>{
        results.forEach(employee => employee.email = employee.email.split('@')[1]) 
    })
}
