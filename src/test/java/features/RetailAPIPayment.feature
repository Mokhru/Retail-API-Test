@completeTest
Feature: Retail API for Payment Service

  Background: 
    Given url appReatilURL
    * def tokenValue = call read("RetailTokenGenerator.feature")
    * def token = tokenValue.response.accessToken
    * header x-access-token = token

  Scenario: Post Payment for Retail API
    * path "/payment"
    * request
      """
      {
      "cardNumber": "6773222112244553",
      "nameOnCard": "John Morina",
      "expirationMonth": 09,
      "expirationYear": 2024,
      "securityCode": "333"
      }
      """
    * method post
    * print response
    * status 200

  Scenario: Get All Payments
    * path "/payment"
    * method get
    * status 200
    * print response
    * print response[0].id
    * karate.write(response, 'payment.json')

  Scenario: Put Update a Payment
    * def paymentID = read('file:./target/payment.json')
    * def id = paymentID[0].id
    * path "/payment/" + id
    * def requestBody = read('paymentRequest.json')
    * request requestBody
    * method put
    * print response

  Scenario: Delete a Payment
    * def paymentID = read('file:./target/payment.json')
    * def id = paymentID[0].id
    * path "/payment/" + id
    * method delete
    * print response

