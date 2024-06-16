Feature: Update Details

Background: setting variables
* def baseUrl = 'http://localhost:9798'

@updateDetailsJob
Scenario: partial update a job
 Given url baseUrl
 And path '/normal/webapi/update/details'
 And headers { Content-Type: 'application/json', Accept: 'application/json'}
 And params { id: 32, jobTitle:'partial update job', jobDescription:'jobdescription test'}
 When method patch
 Then status 200
 And print response
 And match response.jobId == 32
 And match response.jobTitle == 'partial update job'
