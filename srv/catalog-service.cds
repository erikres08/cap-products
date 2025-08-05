using {com.logali as logali} from '../db/schema';
using {com.training as training} from '../db/training';

// service CatalogService {
//     entity Products       as projection on logali.materials.Products;
//     entity Suppliers      as projection on logali.sales.Suppliers;
//     entity UnitOfMeasures as projection on logali.materials.UnitOfMeasures;
//     entity Currency       as projection on logali.materials.Currencies;
//     entity DimensionUnit  as projection on logali.materials.DimensionUnits;
//     entity Category       as projection on logali.materials.Categories;
//     entity SalesData      as projection on logali.sales.SalesData;
//     entity Reviews        as projection on logali.materials.ProductReview;
//     entity Months         as projection on logali.sales.Months;
//     entity Order          as projection on logali.sales.Orders;
//     entity OrderItem      as projection on logali.sales.OrdersItems;
// }

define service CatalogService {

    entity Products          as
                               // select from logali.materials.Products {
                                   select from logali.reports.Products {
        ID,
        Name            as ProductName  @mandatory,
        Description                     @mandatory,
        ImageUrl,
        ReleaseDate,
        DiscontinuedDate,
        Price                           @mandatory,
        Height,
        Width,
        Depth,
        // SELECTOR INTELIGENTE
        // *,
        Quantity                        @(
            mandatory,
            assert.range: [
                0.00,
                20.00
            ]
        ),
        UnitOfMeasure_Id,
        Currency_Id,
        Category_Id,
        DimensionUnit_Id,
        Supplier_Id,
        ToUnitOfMeasure                 @mandatory,
        ToCurrency                      @mandatory,
        ToCategory                      @mandatory,
        ToCategory.Name as CategoryName @readonly,
        ToDimensionUnit,
        ToSupplier,
        SalesData,
        Reviews,
        Rating,
        StockAvailability,
        ToStockAvailability
    };

    @readonly
    entity Suppliers         as
        select from logali.sales.Suppliers {
            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product as ToProduct
        };

    entity Reviews           as
        select from logali.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            createdAt,
            Product_Id,
            ToProduct
        };

    @readonly
    entity SalesData         as
        select from logali.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            // Currency_Id,
            ToCurrency.ID               as CurrencyKey,
            ToDeliveryMonth.ID          as DeliveryMonthID,
            ToDeliveryMonth.Description as DeliveryMonth,
            Product_Id,
            ToProduct
        };

    @readonly
    entity StockAvailability as
        select from logali.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct

        };

    @readonly
    entity VH_Categories     as
        select from logali.materials.Categories {
            ID   as Code,
            Name as Text
        };

    @readonly
    entity VH_Currencies     as
        select from logali.materials.Currencies {
            ID          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMeasures as
        select from logali.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    //PROJECTION CON POSTFIX
    @readonly
    entity VH_DimensionUnits as
        select
            ID          as Code,
            Description as Text
        from logali.materials.DimensionUnits;

}

define service MyService {
    // EXPRESIÓN DE RUTA
    entity SuppliersProducts as
        select from logali.materials.Products[Name = 'Bread']{
            *,
            Name,
            Description,
            ToSupplier.Address
        }
        where
            ToSupplier.Address.PostalCode = 98074;

    entity SuppliersToSales  as
        select
            ToSupplier.Email,
            ToCategory.Name,
            SalesData.Currency_Id,
            SalesData.ToCurrency.Description
        from logali.materials.Products;

    // FILTROS INFIX
    entity EntityInfix       as
        select ToSupplier[Name = 'Exotic Liquids'].Phone from logali.materials.Products
        where
            Products.Name = 'Bread';

    // SIMILAR AL FILTRO INFIX
    entity EntityJoin        as
        select Phone from logali.materials.Products as Pro
        left join logali.sales.Suppliers as Sup
            on  Sup.ID   = Pro.Supplier_Id
            and Sup.Name = 'Exotic Liquids'
        where
            Pro.Name = 'Bread';

}

define service Reports {
    entity AverageRating as projection on logali.reports.AverageRating;

    entity EntityCasting as
        select
            cast(
                Price as Integer
            )     as Price,
            Price as Price2 : Integer
        from logali.materials.Products;

}
