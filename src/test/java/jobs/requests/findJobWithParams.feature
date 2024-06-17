Feature: Find job

Background: setting variables
* def baseUrl = 'http://localhost:9898'
* def params_ = {}

@findJobParams
Scenario: find job with params
 Given url baseUrl
 And path '/normal/webapi/find'
 And params params_
 And headers {Content-Type:'application/json', Accept: 'application/json'}
 When method GET
 Then status 400
 And print response
 