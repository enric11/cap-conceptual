namespace my.herbalist;

using { managed, sap  } from '@sap/cds/common';
using { custom.coordinates } from './custom';

using {
  my.herbalist.Medicinal_properties,
  my.herbalist.Status
} from './master-data';


entity Plant : managed {
    // Campo no key auto calculado
    Key ID       : Integer  @Core.Computed; 
    // Texto multi idioma
    Name         : localized String(60);
    Description  : localized String;
    // Fechas
    Blooming_beg : Date;
    Blooming_end : Date; 
    // Campo Virtual, no se reflejaraen base de datos, se usara en el SRV
    virtual Blooming     : String;
    // Campo tipo Foto
    Photo_URL : String      @UI : {IsImageURL : true};
    // Associaciones a otras entidades
    to_Medicinal_properties: Association to many Plant_Medicinal_properties on to_Medicinal_properties.plant = $self ;
    to_Location: Composition of many Location_Plant on to_Location.Plant = $self;
}

// link table entity for many-to-many relationship
entity Plant_Medicinal_properties { 
  plant : Association to Plant;
  to_Medicinal_properties : Association to Medicinal_properties;
}

// Localizaciones de plantas, las coordenadas estan incluidas como tipo custom en custom.cds
entity Location_Plant : coordinates {
    // Associacion simple
    Key Plant : Association to Plant;
    //Status de la coordenada
    status: Association to Status;
}

