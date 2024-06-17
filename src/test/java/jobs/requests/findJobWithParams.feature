Feature: Find job

Background: setting variables
* def baseUrl = 'http://localhost:9898'

@findJob
Scenario: find job with params
 Given url baseUrl
 And path '/normal/webapi/find'
 And params params_
 And headers {Content-Type:'application/json', Accept: 'application/json'}
 When method GET
 Then status 404
 And print response
 