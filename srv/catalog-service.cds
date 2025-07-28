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
        select from logali.materials.Products {
            ID,
            Name            as ProductName,
            Description,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price,
            Height,
            Width,
            Depth,
            Quantity,
            UnitOfMeasure_Id,
            Currency_Id,
            Category_Id,
            DimensionUnit_Id,
            Supplier_Id,
            ToUnitOfMeasure,
            ToCurrency,
            ToCategory,
            ToCategory.Name as CategoryName,
            ToDimensionUnit,
            ToSupplier,
            SalesData,
            Reviews
        };

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

    entity StockAvailability as
        select from logali.materials.StockAvailability {
            ID,
            Description,
            Product as ToProduct

        };

    entity VH_Categories     as
        select from logali.materials.Categories {
            ID   as Code,
            Name as Text
        };

    entity VH_Currencies     as
        select from logali.materials.Currencies {
            ID          as Code,
            Description as Text
        };

    entity VH_UnitOfMeasures as
        select from logali.materials.UnitOfMeasures {
            ID          as Code,
            Description as Text
        };

    entity VH_DimensionUnits as
        select from logali.materials.DimensionUnits {
            ID          as Code,
            Description as Text
        };

}
