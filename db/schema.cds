namespace com.logali;

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


// TIPO MATRIZ
// type EmailAddresses_01 : array of {
//     kind  : String;
//     email : String;
// };

// type EmailAddresses_02 {
//     kind  : String;
//     email : String;
// };

// entity Emails {
//     email_01 :      EmailAddresses_01;
//     email_02 : many EmailAddresses_02;
//     email_03 : many {
//         kind  : String;
//         email : String;
//     }
// };

// // ENUMERACIONES
// type  Gender: String  enum{
//     male;
//     female;
// };

// entity Order{
//     clientGender : Gender;
//     status: Integer enum{
//         submitted = 1;
//         fulfiller = 2;
//         shopped = 3;
//         cancel = -1;
//     };
//     priority: String @assert.range enum{
//         high;
//         medium;
//         low;
//     }
// }


/*entity Car {
    key     ID         : UUID;
            name       : String;
    virtual discount_1 : Decimal; // VIRTUAL -- SOLO RETORNA EL VALOR NO SE GUARDA EN BD

            @Core.Computed: false
    virtual discount_2 : Decimal;
}*/

entity Products {
    key ID               : UUID;
        Name             : String not null; // RESTRICCIONES
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now; // VALORES PREDETERMINADOS
        // CreationDate     : DateTime default CURRENT_DATE;  -- VALORES PREDETERMINADOS
        DiscontinuedDate : DateTime;
        Price            : Dec;
        Height           : type of Price; // TIPOS POR REFERENCIA
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        //Currency_Id      : String(3);
        //Category_Id      : String(1);
        //DimensionUnit_Id : String(2);
        Supplier_Id      : UUID;
        ToSupplier       : Association to one Suppliers
                               on ToSupplier.ID = Supplier_Id; // ASOCIACIÓN NO ADMIN
        UnitOfMeasure_Id : String(2);
        ToUnitOfMeasure  : Association to UnitOfMeasures
                               on ToUnitOfMeasure.ID = UnitOfMeasure_Id;    // ASOCIACIÓN NO ADMIN


};

entity Suppliers {
    key ID      : UUID;
        Name    : Products : Name; // TIPOS POR REFERENCIA
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};


// USO TIPO ESTRUCTURADO
// entity Suppliers_01 {
//     key ID      : UUID;
//         Name    : String;
//         Address : Address;
//         Email   : String;
//         Phone   : String;
//         Fax     : String;
// };

// // DEFINICIÓN TIPO ESTRUCTURADO DENTRO DEL ENTITY
// entity Suppliers_02 {
//     key ID      : UUID;
//         Name    : String;
//         Address : {
//             Street     : String;
//             City       : String;
//             State      : String(2);
//             PostalCode : String(5);
//             Country    : String(3);
//         };
//         Email   : String;
//         Phone   : String;
//         Fax     : String;
// };

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key ID         : String;
        Product_Id : UUID;
        CreatedAt  : DateTime;
        Name       : String;
        Rating     : Integer;
        Comment    : String;
};

entity SalesData {
    key ID               : UUID;
        DeliveryDate     : DateTime;
        Revenue          : Decimal(16, 2);
        Product_Id       : UUID;
        Currency_Id      : String(3);
        DeliveryMonth_Id : String(2);
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

// ENTIDADES CON PARÁMETROS
/*entity ParamProducts(pName : String)     as
    select
        Name,
        Price,
        Quantity
    from Products
    where
        Name = :pName;
// Opción 2
entity ParamProducts2(pName : String) as
    select from Products {
        Name,
        Price,
        Quantity
    }
    where
        Name = :pName;

entity ProjParamProducts(pName : String) as projection on Products
                                            where
                                                Name = :pName;*/

// ENTIDADES AMPLIACIÓN
extend Products with {
    PriceCondition     : String(2);
    PriceDetermination : String(3);
};
