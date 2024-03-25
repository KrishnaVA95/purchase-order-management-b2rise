using { db.models } from '../../../db/models';

@requires: 'authenticated-user'
service PurchaseOrderManagementService {
    // Se quisermos, por exemplo, restringir o acesso de CRUD completo somente para nosso usuário ROLE_DUMMY_ADMIN, podemos fazer o seguinte:
    // @(restrict: [{ grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_DUMMY_ADMIN' }])
    //Uma outra maneira de restringir os acessos é através da anotação @readonly, com ela somos capazes de permitir o acesso de somente leitura, bloqueando todo o restante do CRUD:
    @readonly entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;

    // Se quisermos, por exemplo, restringir o acesso de CRUD completo, menos leitura, somente para nosso usuário ROLE_DUMMY_ADMIN, podemos fazer o seguinte:
    // @(restrict: [{ grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_DUMMY_ADMIN' }])
    @readonly entity PurchaseOrderItems as projection on models.PurchaseOrderItems;
}

// Nota, sobre a linha 3: Uma prática bem comum para este cenário é criar um serviço de acesso comum que requer somente usuário autenticado (@requires: 'authenticated-user') e um serviço de admin com as mesmas entidades expostas, mas com acesso total ao CRUD:

@requires: 'ROLE_DUMMY_ADMIN'
service PurchaseOrderManagementAdminService {
    entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;
    entity PurchaseOrderItems   as projection on models.PurchaseOrderItems;
}
