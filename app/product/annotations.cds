using CatalogService as service from '../../srv/catalog-service';
annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ProductName',
                Value : ProductName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ImageUrl',
                Value : ImageUrl,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ReleaseDate',
                Value : ReleaseDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DiscontinuedDate',
                Value : DiscontinuedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : Price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Height',
                Value : Height,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Width',
                Value : Width,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Depth',
                Value : Depth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Quantity',
                Value : Quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnitOfMeasure_Id',
                Value : UnitOfMeasure_Id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency_Id',
                Value : Currency_Id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Category_Id',
                Value : Category_Id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DimensionUnit_Id',
                Value : DimensionUnit_Id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CategoryName',
                Value : CategoryName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Rating',
                Value : Rating,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StockAvailability',
                Value : StockAvailability,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ProductName',
            Value : ProductName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ImageUrl',
            Value : ImageUrl,
        },
        {
            $Type : 'UI.DataField',
            Label : 'ReleaseDate',
            Value : ReleaseDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DiscontinuedDate',
            Value : DiscontinuedDate,
        },
    ],
);

