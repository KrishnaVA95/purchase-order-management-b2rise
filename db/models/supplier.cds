using { managed } from '@sap/cds/common';
using { db.models } from '.';

namespace db.models;

entity Supplier : managed {
    key id: UUID;
        name: String(40);
        location: String(50);
        products: Composition of many models.Product on products.supplier = $self
}



