using { managed } from '@sap/cds/common';
using { db.models } from '.';

namespace db.models;

entity Product : managed {
    key id: UUID;
    key supplier: Association to models.Supplier;
    key purchaseOrderItem: Association to models.PurchaseOrderItems;
        name: String(30);
        description: String(255);
        price: Decimal(11, 2);
}
