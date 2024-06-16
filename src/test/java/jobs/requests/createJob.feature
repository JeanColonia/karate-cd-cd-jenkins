Feature: Create Job


Background: setting variables
* def baseUrl = 'http://localhost:9798/normal/webapi'
* def printLog = function (jobTitle_){ return console.log("Trabajas como: ", jobTitle_) }
* def randomId = function (){ return Math.floor((100) * Math.random())}
* def getRandomId = randomId()
* def requestBody = 
"""
 {
  "jobId": "#(getRandomId)",
  "jobTitle": "Software Engg III",
  "jobDescription": "To develop andriod application",
  "experience": [
    "Microsoft",
    "Apple",
    "Tesla"
  ],
  "project": [
    {
      "projectName": "Movie App",
      "technology": [
        "Kotlin",
        "SQL Lite",
        "Maven"
      ]
    }
  ]
}
"""


@createJob
Scenario: create job
 Given url baseUrl
 And path '/add'
 And headers { 'Content-Type': 'application/json', Accept: 'application/json'}
 And request requestBody
 When method POST
 Then status 201
 And match response.jobId == getRandomId
#  And match response.jobId == 3
#  And match response.jobTitle == 'Software Engg III'
#  And match response.experience[0] == 'Microsoft'
#  And match response.project[0].technology contains 'Maven'
 * print response
#  * print printLog(response.jobTitle)
 
