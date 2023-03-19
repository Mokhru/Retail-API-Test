@completeTest
Feature: Retail API for Address Service

  Background: 
    Given url appReatilURL
    * def tokenValue = call read("RetailTokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token

  Scenario: Post Address for Retail API
    * path "/address"
    * request
      """
      {
      "country": "United States",
      "fullName": "Marina Lisa",
      "phoneNumber": "6465089564",
      "street": "6544 Saunders street",
      "apartment": "H15",
      "city": "New York",
      "state": "New York",
      "zipCode": "77019"
      }
      """
    * method post
    * print response
    * status 200

  Scenario: Get All Adresses
    * path "/address"
    * method get
    * status 200
    * print response
    * print response[0].id
    * karate.write(response, 'address.json')

  Scenario: Put Update an Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[0].id
    * path "/address/" + id
    * def requestBody = read('request.json')
    * request requestBody
    * method put
    * print response

  Scenario: Delete an Address
    * def addressID = read('file:./target/address.json')
    * def id = addressID[0].id
    * path "/address/" + id
    * method delete
    * print response
