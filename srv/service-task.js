const cds = require('@sap/cds')

module.exports = function (){
    this.before ('CREATE', 'Plant',  async  req => {

        const db = await cds.connect.to ('db')
        const { Plant } = db.entities ('my.herbalist')

        const { ID } = await SELECT.one `max(ID) as ID` .from (Plant)
        req.data.ID = ID + 1

    })
  }
  