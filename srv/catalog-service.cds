using {com.logali as logali} from '../db/schema';

service CatalogService {
    entity Products       as projection on logali.Products;
    entity Suppliers      as projection on logali.Suppliers;
    entity UnitOfMeasures as projection on logali.UnitOfMeasures;
// entity Car       as projection on logali.Car;
//entity Suppliers_01 as projection on logali.Suppliers_01;
}
