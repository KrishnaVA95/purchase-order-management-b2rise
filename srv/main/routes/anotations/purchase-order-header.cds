using { PurchaseOrderManagementService } from '..';

annotate PurchaseOrderManagementService.Companies {
    // traduzir a coluna 
    id @(title: 'Indentificador');
    description @(title: 'Descrição');
    document @(title: 'CNPJ')
};

annotate PurchaseOrderManagementService.PurchaseOrderHeaders with @(
    // Relacionado as tabelas 
    UI:{
        // linha da tabela 
        LineItem: [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label: 'ID do pedido',
                ![@UI.Importance]: #High, // 
                ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width: '20%',
                },
            },
            {
                $Type: 'UI.DataField',
                Value: company,
                Label: 'Empresa',
                ![@UI.Importance]: #Low,
                ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width: '20%',
                },
            },
            {
                $Type: 'UI.DataField',
                Value: purchasingOrganization,
                Label: 'Grupo de compras',
                ![@UI.Importance]: #Low,                               
                ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width: '20%',
                },
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
                Label: 'Data de criação',
                ![@UI.Importance]: #Low, 
                // ![@UI.Hidden],
                ![@HTML5.CssDefaults] : {
                    $Type : 'HTML5.CssDefaultsType',
                    width: '20%',
                },
            },
            {
                $Type: 'UI.DataFieldForAction',
                Label: 'Deletar Item',
                Action: 'PurchaseOrderManagement.Service.EntityContainer/deleteHeader'
            }
        ],
        SelectionFields  : [
          id, 
          company,
          purchasingGroup  
        ],
    }
) {
    company @(
        title: 'Empresas',
        Common: {
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Companies',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        ValueListProperty: 'id', // campo na entidade original
                        LocalDataProperty: 'company' // campo na entidade header
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description', 
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'document', 
                    },
                ]
            },
        }
    );
    purchasingGroup @(title: 'Grupo de compras')
};