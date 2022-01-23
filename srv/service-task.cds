using my.herbalist as my from '../db/data-model';


service CatalogService { // @(requires:'system-user'){

  entity Plant @(restrict: [
    { grant: ['READ','WRITE'], to: 'user' }//,
    //{ grant: 'READ', where: 'buyer = $user' }
  ]) as projection on my.Plant;

     @readonly entity Status as projection on my.Status;
     @readonly entity Medicinal_property as projection on my.Medicinal_properties;
    entity Location as projection on my.Location_Plant;
    entity Plant_Medicinal_properties as projection on my.Plant_Medicinal_properties;
}

service CustomerService @(requires: 'authenticated-user'){
  entity Planta @(restrict: [
    { grant: ['READ','WRITE'], to: 'Admin' }//,
    //{ grant: 'READ', where: 'buyer = $user' }
  ]) as projection on my.Plant;
}

/*
// Access control restrictions
annotate CatalogService.Plant with @restrict:[
  { grant:'READ',   to:'any' }
];

annotate CatalogService with @restrict:[
  { grant:'READ', to:'admin' }
];

/*

service CustomerService @(requires: 'authenticated-user'){
  entity Orders @(restrict: [ 
    { grant: ['READ','WRITE'], to: 'admin' },
  ]){//.../}
  entity Approval @(restrict: [
    { grant: 'WRITE', where: '$user.level > 2' } 
  ]){//.../}
}

*/