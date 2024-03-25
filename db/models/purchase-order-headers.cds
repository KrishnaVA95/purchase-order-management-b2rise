using { managed } from '@sap/cds/common';
using { db.models } from '.';

namespace db.models;

entity PurchaseOrderHeaders: managed {
    key id: UUID;
        company: String(4);
        purchasingOrganization: String(4);
        purchasingGroup: String(4);
        items: Composition of many models.PurchaseOrderItems on items.header = $self
}

// NOTAS
// Managed indica que esta entidade é gerenciada pelo SAP CAP, o que significa que os campos createdAt, createdBy, modifiedAt e modifiedBy são tratados automaticamente e não precisam ser declarados na entidade
// No documanto a chave esta como header mas só existe headerId na entidade " items.headerId = $self"
/* Sobre a linha items da entidade:
items: Este é o nome do relacionamento. No contexto de um pedido de compra (purchase order), é comum ter uma lista de itens associados ao cabeçalho do pedido. Este nome items indica essa relação de que cada cabeçalho de pedido pode ter vários itens relacionados a ele.

Composition of many: Isso indica que é uma relação de composição um-para-muitos. Isso significa que cada instância do cabeçalho do pedido pode ter zero ou mais instâncias de itens associados a ele.

models.PurchaseOrderItems: Esta parte especifica a entidade relacionada. Está referenciando a entidade PurchaseOrderItems que está definida no namespace models.

on items.headerId = $self: Esta é a condição de junção da relação. Isso significa que os itens relacionados ao cabeçalho do pedido serão aqueles onde o campo headerId da entidade PurchaseOrderItems é igual ao próprio id da entidade PurchaseOrderHeaders. Isso estabelece a relação entre os cabeçalhos dos pedidos e seus itens correspondentes.
 */
