pipeline{
    agent any
    
    stages { 
     stage('Clean up stage'){
         steps {
             bat 'echo clean up stage'
             cleanWs notFailBuild: true
         }
     }
     stage('Git checkout '){
         steps{
             
             bat 'echo git checkout'
             checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/JeanColonia/karate-cd-cd-jenkins.git']])
         }
     }
     
     stage('Restore packages'){
         steps {
             bat 'echo restore packages'
         }
     }
     
     stage('Build stage'){
         steps{
             bat 'echo build stage'
             bat 'mvn clean compile'
         }
     }
     
     stage('Test execution stage'){
         steps{
             bat 'echo test execution stage'
             bat 'mvn test'
         }
     }
    }
    post {
        always{
            junit 'target/surefire-reports/*.xml'
            cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
              zip zipFile:'target/test-results.zip', archive:true, dir: 'target/cucumber-html-reports', overwrite:true 
        }
    }
}