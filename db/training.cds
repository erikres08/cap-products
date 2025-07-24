namespace com.training;

using {
    cuid,
    managed
} from '@sap/cds/common';

// ASOCIACIÓN MANY TO MANY
entity Course {
    key ID      : UUID;
        Student : Association to many StudentCourse
                      on Student.Course = $self;
};

entity Student {
    key ID     : UUID;
        Course : Association to many StudentCourse
                     on Course.Student = $self;
};

entity StudentCourse {
    key ID      : UUID;
        Student : Association to Student;
        Course  : Association to Course;
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

// entity Products : cuid, managed {
//     //key ID               : UUID;
//     Name             : localized String null; // RESTRICCIONES
//     Description      : localized String;
//     ImageUrl         : String;
//     ReleaseDate      : DateTime default $now; // VALORES PREDETERMINADOS
//     // CreationDate     : DateTime default CURRENT_DATE;  -- VALORES PREDETERMINADOS
//     DiscontinuedDate : DateTime;
//     Price            : Dec;
//     Height           : type of Price; // TIPOS POR REFERENCIA
//     Width            : Decimal(16, 2);
//     Depth            : Decimal(16, 2);
//     Quantity         : Decimal(16, 2);
//     UnitOfMeasure_Id : String(2);
//     Currency_Id      : String(3);
//     Category_Id      : String(1);
//     Supplier_Id      : UUID;
//     DimensionUnit_Id : String(2);
//     ToSupplier       : Association to one Suppliers
//                            on ToSupplier.ID = Supplier_Id; // ASOCIACIÓN NO ADMIN

//     ToUnitOfMeasure  : Association to UnitOfMeasures
//                            on ToUnitOfMeasure.ID = UnitOfMeasure_Id; // ASOCIACIÓN NO ADMIN

//     ToCurrency       : Association to Currencies
//                            on ToCurrency.ID = Currency_Id;

//     ToDimensionUnit  : Association to DimensionUnits
//                            on ToDimensionUnit.ID = DimensionUnit_Id;

//     ToCategory       : Association to Categories
//                            on ToCategory.ID = Category_Id;

//     SalesData        : Association to many SalesData
//                            on SalesData.ToProduct = $self; // ASOCIACIÓN MANY

//     Reviews          : Association to many ProductReview
//                            on Reviews.ToProduct = $self;
//Suppliers        : Association to Suppliers;            // ASOCIACIÓN ADMIN
//UnitOfMeasures   : Association to UnitOfMeasures;       // ASOCIACIÓN ADMIN
//Currency         : Association to Currencies;           // ASOCIACIÓN ADMIN
//DimensionUnit    : Association to DimensionUnits;       // ASOCIACIÓN ADMIN
//Category         : Association to Categories;           // ASOCIACIÓN ADMIN
// };

// entity Orders : cuid {
//     // key ID       : UUID;
//     Date     : Date;
//     Customer : String;
//     Item     : Composition of many OrdersItems
//                    on Item.Order = $self;
// // Item     : Composition of many {
// //                key Position : Integer;
// //                    Order    : Association to Orders;
// //                    Product  : Association to Products;
// //                    Quantity : Integer;
// //            }
// };

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

