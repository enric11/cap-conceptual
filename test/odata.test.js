const cds = require('@sap/cds/lib')
const { GET, POST, PATCH, DELETE, axios, expect } = cds.test(__dirname+'/..', '--in-memory') // --> In memory
//const { GET, POST, PATCH, DELETE, axios, expect } = cds.test(__dirname+'/..') // --> Directe

axios.defaults.headers['content-type'] = 'application/json'


describe('Basic CRUD OData V4', () => {

    it('serves $metadata documents in v4', async () => {
        const { headers, status } = await GET `/catalog/$metadata`
        expect(status).to.equal(200)
        expect(headers).to.contain({
          'content-type': 'application/xml',
          'odata-version': '4.0',
        })
      })

      it('Basic get with title (spanish)', async () => {
        const { data } = await GET(`/catalog/Plant?&sap-language=es`, {
            params: { 
                $select: `Name`,
            }
          })
        expect(data.value).to.containSubset([{
            Name: 'test'
        }])
      })

      /*
      it('Basic get with title (english)', async () => {
        const { data } = await GET(`/catalog/Plant?&sap-language=en`, {
            params: { 
                $select: `Name`,
            }
          })
        expect(data.value).to.containSubset([{
            Name: 'test_en'
        }])
      })
*/
      it('Test Create Location', async () => {
        const { status } = await POST(`/catalog/Location`, {
            Plant_ID:1,
            status_ID:"C",
            Latitude:3.248392,
            Logitud:4.524950
        })
        expect(status).to.equal(201)
       })

       it('Test Modify Location Status', async () => {
        const { status } = await PATCH(`/catalog/Location(Plant_ID=1,Latitude=3.248392,Logitud=4.524950)`, {
            status_ID:"V"
        })
        expect(status).to.equal(200)
       })      

      it('Test Delete Location', async () => {
            const { status } = await DELETE(`/catalog/Location(Plant_ID=1,Latitude=3.248392,Logitud=4.524950)`)
            expect(status).to.equal(204)

      })

    
})