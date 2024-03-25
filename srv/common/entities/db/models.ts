export namespace db.models {
    export interface Product extends Managed {
        id: string;
        supplier?: Supplier;
        supplier_id?: string;
        purchaseOrderItem?: PurchaseOrderItems;
        purchaseOrderItem_id?: string;
        purchaseOrderItem_header?: unknown;
        name: string;
        description: string;
        price: number;
    }

    export interface PurchaseOrderHeaders extends Managed {
        id: string;
        company: string;
        purchasingOrganization: string;
        purchasingGroup: string;
        items: PurchaseOrderItems[];
    }

    export interface PurchaseOrderItems extends Managed {
        id: string;
        header?: PurchaseOrderHeaders;
        header_id?: string;
        material: string;
        quantity: number;
        uom: string;
        netPrice: number;
        center: string;
        products: Product[];
    }

    export interface Supplier extends Managed {
        id: string;
        name: string;
        location: string;
        products: Product[];
    }

    export enum Entity {
        Product = "db.models.Product",
        PurchaseOrderHeaders = "db.models.PurchaseOrderHeaders",
        PurchaseOrderItems = "db.models.PurchaseOrderItems",
        Supplier = "db.models.Supplier"
    }

    export enum SanitizedEntity {
        Product = "Product",
        PurchaseOrderHeaders = "PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderItems",
        Supplier = "Supplier"
    }
}

export namespace sap.common {
    export interface CodeList {
        name: string;
        descr: string;
    }

    export interface Countries extends sap.common.CodeList {
        code: string;
    }

    export interface Currencies extends sap.common.CodeList {
        code: string;
        symbol: string;
    }

    export interface Languages extends sap.common.CodeList {
        code: string;
    }

    export enum Entity {
        CodeList = "sap.common.CodeList",
        Countries = "sap.common.Countries",
        Currencies = "sap.common.Currencies",
        Languages = "sap.common.Languages"
    }

    export enum SanitizedEntity {
        CodeList = "CodeList",
        Countries = "Countries",
        Currencies = "Currencies",
        Languages = "Languages"
    }
}

export namespace PurchaseOrderManagementService {
    export interface Product {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        supplier?: db.models.Supplier;
        supplier_id?: string;
        purchaseOrderItem?: PurchaseOrderItems;
        purchaseOrderItem_id?: string;
        purchaseOrderItem_header?: unknown;
        name: string;
        description: string;
        price: number;
    }

    export interface PurchaseOrderHeaders {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        company: string;
        purchasingOrganization: string;
        purchasingGroup: string;
        items: PurchaseOrderItems[];
    }

    export interface PurchaseOrderItems {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        header?: PurchaseOrderHeaders;
        header_id?: string;
        material: string;
        quantity: number;
        uom: string;
        netPrice: number;
        center: string;
        products: Product[];
    }

    export enum Entity {
        Product = "PurchaseOrderManagementService.Product",
        PurchaseOrderHeaders = "PurchaseOrderManagementService.PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderManagementService.PurchaseOrderItems"
    }

    export enum SanitizedEntity {
        Product = "Product",
        PurchaseOrderHeaders = "PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderItems"
    }
}

export type User = string;

export interface Cuid {
    ID: string;
}

export interface Managed {
    createdAt?: Date;
    createdBy?: string;
    modifiedAt?: Date;
    modifiedBy?: string;
}

export interface Temporal {
    validFrom: Date;
    validTo: Date;
}

export enum Entity {
    Cuid = "cuid",
    Managed = "managed",
    Temporal = "temporal"
}

export enum SanitizedEntity {
    Cuid = "Cuid",
    Managed = "Managed",
    Temporal = "Temporal"
}
