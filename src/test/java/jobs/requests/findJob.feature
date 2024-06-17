Feature: Find job

Background: setting variables
* def baseUrl = 'http://localhost:9898'
* def postJob = call read('./createJob.feature')
* def jobId_ = postJob.response.jobId
* def jobTitle_ = postJob.response.jobTitle

@findJob
Scenario: Create and find job
 Given url baseUrl
 And path '/normal/webapi/find'
 And params {id: '#(jobId_)', jobTitle: '#(jobTitle_)' }
 And headers {Content-Type:'application/json', Accept: 'application/json'}
 When method GET
 Then status 200
 And print response
 And match response.jobId == jobId_
 