Feature: Update Feature

Background: setting variables
 * def baseUrl = 'http://localhost:9898/normal/webapi'
 * def postRequestData = call read('./createJob.feature')
 * def id = postRequestData.jobId


@updateJob
Scenario: Updating a existing job
 Given url baseUrl
 And path '/update'
 And headers { Content-Type: 'application/json', Accept: 'application/json'}
 And request 
 """
  {
   "jobId": '#(postRequestData.response.jobId)',
   "jobTitle": "Software Engg",
   "jobDescription": "To develop android application",
   "experience": [
     "Google",
     "Apple",
     "Uber Beats"
   ],
   "project": [
     {
       "projectName": "Movie App",
       "technology": [
         "Flutter",
         "SQL Server",
         "Maven"
       ]
     }
   ]
 }
 """
 When method PUT
 Then status 200
 And print response
 And match response.experience[*] contains 'Uber Beats'
 And print postRequestData.response
 And match response.jobId == postRequestData.response.jobId