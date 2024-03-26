import '../configuration/module-alias';
import { Request, Service } from '@sap/cds/apis/services';

import { db } from '@/common/entities/db/models';
import cds from '@sap/cds';

export default (service: Service) => {
    // service.after('READ', 'PurchaseOrderHeaders', (results: db.models.PurchaseOrderHeaders[], request: Request) => {
    //     results.forEach(poHeader => poHeader.company = 'ABC');
    // });
    // service.before('CREATE', 'PurchaseOrderHeaders', async(request: Request) => {
    //     const swapi = await cds.connect.to('swapi');
    //     const person = await swapi.send({
    //         method: 'GET',
    //         path: 'people/1',
    //         headers: { 'Content-Type': 'application/json' },
    //     });
    //     const items = [
    //         {
    //             material: 'Material_insomnia',
    //             quantity: 10,
    //             uom: 'PC',
    //             netPrice: 30,
    //             center: 'ABCD'
    //         },
    //         {
    //             material: 'Material_insomnia2',
    //             quantity: 5,
    //             uom: 'KG',
    //             netPrice: 500,
    //             center: 'ABCD'
    //         }
    //     ];
    //     request.data.items = items;
    //     request.data.createdBy = person.name;
    //     request.data.modifiedBy = person.name;
    // });
};

/*
Na linha 12 estamos estabelecendo uma conexão com a swapi

Nas linhas de 13 a 16 estamos enviando uma requisição do tipo GET para o endpoint /people/1 no formato application/json

Nas linhas 35 e 36 estamos alterando o nome padrão do criador do pedido para o que buscamos na API
*/
