Feature: Delete job

Background: setting variables
 * def baseUrl = 'http://localhost:9898/normal/webapi'
 * def findRequestData = call read('./findJob.feature')
 * def id_ = findRequestData.response.jobId
 * def jobTitle_ = findRequestData.response.jobTitle



@deleteJob
Scenario: delete job by id
Given url baseUrl
And path 'remove/'+id_
And headers { Content-Type: 'application/json', Accept: 'application/json' }
And method DELETE
Then status 200

Given url baseUrl
And path '/find'
And params {id: #(id_), jobTitle:'#(jobTitle_)'}
And headers {Content-Type:'application/json', Accept: 'application/json'}
When method GET
Then status 404
And print response