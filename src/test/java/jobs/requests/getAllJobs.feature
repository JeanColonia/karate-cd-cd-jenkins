Feature: Get all jobs


Background: setting variables
* def baseUrl = 'http://localhost:9898/normal/webapi'

@jobs
Scenario: Getting all jobs 
 Given url baseUrl
 And path '/all'
 And header Accept = 'application/json'
 When method GET
 Then status 200
 * print response
* def jobTitle_ = karate.jsonPath(response, "$[?(@.jobId==3)].jobTitle")
* def jobDescription_ = karate.jsonPath(response, "$[?(@.jobId==3)].jobDescription")
* def experiencie_ = karate.jsonPath(response, "$[?(@.jobId==3)].experience")
* print jobTitle_
* print jobDescription_
* print experiencie_


