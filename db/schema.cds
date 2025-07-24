namespace com.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';

// Definir tipo personalizado (No recomentado)
type Name : String(50);
// TIPOS POR REFERENCIA
type Dec  : Decimal(16, 2);

// TIPO ESTRUCTURADO
type Address {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

entity Products : cuid, managed {
    Name             : localized String null; // RESTRICCIONES
    Description      : localized String;
    ImageUrl         : String;
    ReleaseDate      : DateTime default $now; // VALORES PREDETERMINADOS
    DiscontinuedDate : DateTime;
    Price            : Dec;
    Height           : type of Price; // TIPOS POR REFERENCIA
    Width            : Decimal(16, 2);
    Depth            : Decimal(16, 2);
    Quantity         : Decimal(16, 2);
    UnitOfMeasure_Id : String(2);
    Currency_Id      : String(3);
    Category_Id      : String(1);
    Supplier_Id      : UUID;
    DimensionUnit_Id : String(2);
    ToSupplier       : Association to one Suppliers
                           on ToSupplier.ID = Supplier_Id; // ASOCIACIÓN NO ADMIN

    ToUnitOfMeasure  : Association to UnitOfMeasures
                           on ToUnitOfMeasure.ID = UnitOfMeasure_Id; // ASOCIACIÓN NO ADMIN

    ToCurrency       : Association to Currencies
                           on ToCurrency.ID = Currency_Id;

    ToDimensionUnit  : Association to DimensionUnits
                           on ToDimensionUnit.ID = DimensionUnit_Id;

    ToCategory       : Association to Categories
                           on ToCategory.ID = Category_Id;

    SalesData        : Association to many SalesData
                           on SalesData.ToProduct = $self; // ASOCIACIÓN MANY

    Reviews          : Association to many ProductReview
                           on Reviews.ToProduct = $self;
};

entity Suppliers : cuid, managed {
    // key ID      : UUID;
    Name    : Products:Name; // TIPOS POR REFERENCIA
    Address : Address;
    Email   : String;
    Phone   : String;
    Fax     : String;
    Product : Association to many Products
                  on Product.ToSupplier = $self;
};

entity Categories {
    key ID   : String(1);
        Name : localized String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : localized String;
        Product     : Association to Products;
};

entity Currencies {
    key ID          : String(3);
        Description : localized String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : localized String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : localized String;
};

entity Months {
    key ID               : String(2);
        Description      : localized String;
        ShortDescription : localized String(3);
};

entity ProductReview : cuid, managed {
    // key ID         : UUID;
    Product_Id : UUID;
    Name       : String;
    Rating     : Integer;
    Comment    : String;
    ToProduct  : Association to Products
                     on ToProduct.ID = Product_Id;
};

entity SalesData : cuid {
    // key ID               : UUID;
    DeliveryDate     : DateTime;
    Revenue          : Decimal(16, 2);
    Product_Id       : UUID;
    Currency_Id      : String(3);
    DeliveryMonth_Id : String(2);
    ToProduct        : Association to Products
                           on ToProduct.ID = Product_Id;
    ToCurrency       : Association to Currencies
                           on ToCurrency.ID = Currency_Id;
    ToDeliveryMonth_ : Association to Months
                           on ToDeliveryMonth_.ID = DeliveryMonth_Id;
};

entity Orders : cuid {
    // key ID       : UUID;
    Date     : Date;
    Customer : String;
    Item     : Composition of many OrdersItems
                   on Item.Order = $self;
};

entity OrdersItems : cuid {
    // key ID       : UUID;
    Order    : Association to Orders;
    Product  : Association to Products;
    Quantity : Integer;
};

// ENTIDAD SELECT
entity SelProducts   as select from Products;

entity SelProducts1  as
    select from Products {
        *
    };

entity SelProducts2  as
    select from Products {
        Name,
        Price,
        Quantity
    };

entity SelProducts3  as
    select from Products
    left join ProductReview
        on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(Price) as TotalPrice
    }
    group by
        Rating,
        Products.Name
    order by
        Rating;

// ENTIDAD PROJECTION
entity ProjProducts  as projection on Products;

entity ProjProducts2 as
    projection on Products {
        *
    };

entity ProjProducts3 as
    projection on Products {
        ReleaseDate,
        Name
    };

// ENTIDADES AMPLIACIÓN
extend Products with {
    PriceCondition     : String(2);
    PriceDetermination : String(3);
};
