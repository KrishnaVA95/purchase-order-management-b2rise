using { managed } from '@sap/cds/common';
using { db.models } from '.';

namespace db.models;

entity Companies: managed {
    key id: UUID;
        description: String(255);
        document: String(14);
        
}