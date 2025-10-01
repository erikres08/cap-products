using CatalogService as service from '../../srv/catalog-service';

annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'ProductName',
                Value: ProductName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: Description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ImageUrl',
                Value: ImageUrl,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ReleaseDate',
                Value: ReleaseDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DiscontinuedDate',
                Value: DiscontinuedDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Height',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Width',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Depth',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Quantity',
                Value: Quantity,
            },
            {
                $Type: 'UI.DataField',
                Label: 'UnitOfMeasure_Id',
                Value: UnitOfMeasure_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Currency_Id',
                Value: Currency_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category_Id',
                Value: Category_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DimensionUnit_Id',
                Value: DimensionUnit_Id,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CategoryName',
                Value: CategoryName,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Rating',
                Value: Rating,
            },
            {
                $Type: 'UI.DataField',
                Label: 'StockAvailability',
                Value: StockAvailability,
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],

    // Campos de selección
    UI.SelectionFields           : [
        //ProductName,
        Category_Id,
        Currency_Id,
        StockAvailability
    ],

    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'ProductName',
            Value: ProductName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
        {
            $Type: 'UI.DataField',
            Label: 'ImageUrl',
            Value: ImageUrl,
        },
        {
            $Type: 'UI.DataField',
            Label: 'ReleaseDate',
            Value: ReleaseDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'DiscontinuedDate',
            Value: DiscontinuedDate,
        },
    ],

);

/*
* Annotatiosn for SH
*/
annotate service.Products with {
    // Category
    Category_Id       @(Common: {
        Text     : {
            $value             : Category_Id,
            @UI.TextArrangement: #TextOnly,
        },
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Categories',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Category_Id,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: CategoryName,
                    ValueListProperty: 'Text'
                }
            ]
        },
    });

    // Curency
    Currency_Id       @(Common: {
        ValueListWithFixedValues: false,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Currencies',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: Currency_Id,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Text'
                }
            ]
        },
    }, );

    //
    StockAvailability @(Common: {
        ValueListWithFixedValues: true,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StockAvailability',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: StockAvailability,
                    ValueListProperty: 'ID'
                },
/*                 {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: StockAvailability,
                    ValueListProperty: 'Description'
                } */
            ]
        },
    }, );
};

/*
* Anotatiosn for VH_Categories Entity
*/
annotate service.VH_Categories with {
    Code @(
        UI    : {Hidden: true},
        Common: {Text: {
            $value             : Text,
            @UI.TextArrangement: #TextOnly,
        }}
    );
    Text @(UI: {HiddenFilter: true});
};

/*
* Anotatiosn for VH_Currencies Entity
*/
annotate service.VH_Currencies with {
    Code @(UI: {HiddenFilter: true}, );
    Text @(UI: {HiddenFilter: true});
};

/*
* Anotatiosn for StockAvailability Entity
*/
annotate service.StockAvailability with {
    ID          @(Common: {Text: {
        $value             : Description,
        @UI.TextArrangement: #TextOnly,
    }, }, );
};

/*
* Anotatiosn for VH_UnitOfMeasures Entity
*/
annotate service.VH_UnitOfMeasures with {
    Code @(UI: {HiddenFilter: true}, );
    Text @(UI: {HiddenFilter: true});
};

/*
* Anotatiosn for VH_DimensionUnits Entity
*/
annotate service.VH_DimensionUnits with {
    Code @(UI: {HiddenFilter: true}, );
    Text @(UI: {HiddenFilter: true});
};