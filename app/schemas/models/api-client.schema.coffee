c = require './../schemas'

APIClientSchema = {
  description: 'Third parties who can make API calls, usually on behalf of a user.'
  type: 'object'
  properties: {
    creator: {
      type: 'object',
      description: 'Id of user who created this APIClient'
    }
    secret: {
      type: 'string'
      description: 'hashed version of a secret key that is required for API calls'
    }
    permissions: {
      type: 'object'
      description: 'permissions assigned to the API client'
      properties: {
        manageLicensesViaUI: { type: 'boolean', default: true}
        manageLicensesViaAPI: { type: 'boolean', default: true}
        revokeLicensesViaUI: { type: 'boolean', default: false}
        revokeLicensesViaAPI : { type: 'boolean', default: false}
        manageSubscriptionViaAPI : { type: 'boolean', default: false}
        revokeSubscriptionViaAPI : { type: 'boolean', default: false}
      }
    }
    minimumLicenseDays : {
      type: 'integer'
      default: 365
    }
  }
}

c.extendBasicProperties APIClientSchema, 'Client'
c.extendNamedProperties APIClientSchema

module.exports = APIClientSchema
