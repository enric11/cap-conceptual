namespace my.herbalist;

using { sap  } from '@sap/cds/common';

using {
  my.herbalist.Plant_Medicinal_properties
} from './data-model';

entity Medicinal_properties {
    key MP_ID : Integer;
    Name: localized String(40);
    Description: localized String;
}

// Listado de estatus tipo lista multi idioma (tipo estandard)
entity Status : sap.common.CodeList {
  key ID   : String(1);
}