using { PurchaseOrderManagementService } from '..';

annotate PurchaseOrderManagementService.PurchaseOrderItems with @(
    UI: {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label: 'Indentificador',
                ![@UI.Importance]: #High,
            },
            {
                $Type: 'UI.DataField',
                Value: header_id,
                Label: 'Indentificador do cabeçalho',
                ![@UI.Importance]: #Low,
            },
            {
                $Type: 'UI.DataField',
                Value: material,
                Label: 'Material',
                ![@UI.Importance]: #Low,
            },
            {
                $Type: 'UI.DataField',
                Value: quantity,
                Label: 'Quantidade',
                ![@UI.Importance]: #Low,
            },
            {
                $Type: 'UI.DataField',
                Value: uom,
                Label: 'Unidade de Medida',
                ![@UI.Importance]: #Low,
            },
            {
                $Type: 'UI.DataField',
                Value: netPrice,
                Label: 'Preço Líquido',
                ![@UI.Importance]: #Low,
            },
            {
                $Type: 'UI.DataField',
                Value: center,
                Label: 'Centro',
                ![@UI.Importance]: #Low,
            },
            // {
            //     $Type: 'UI.DataField',
            //     Value: products_id[],
            //     Label: 'Lista de produtos',
            // },
        ],
        SelectionFields  : [
            id,
            header_id,
            material,
            quantity,
            uom,
            netPrice
        ],
    }
) {
    id @(title: 'Indentificador');

    header @(
        title: 'Indentificador do cabeçalho',
        Common: {
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'PurchaseOrderHeaders',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        ValueListProperty: 'id',
                        LocalDataProperty: 'header_id'
                    },
                    {
                        $Type:'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'company', 
                    },
                    {
                        $Type:'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'purchasingOrganization', 
                    },
                    {
                        $Type:'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'purchasingGroup', 
                    },
                ]
            },
        }   
    );

    material @(title: 'Material');
    quantity @(title: 'Quantidade');
    uom @(title: 'Unidade de Medida');
    netPrice @(title: 'Preço liquido');
}