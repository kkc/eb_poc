pipeline {
  agent any
  stages {
    stage('testing') {
      steps {
        git(url: 'https://github.com/spring-trees/tthouse-chatbot', branch: 'dev', changelog: true, poll: true)
      }
    }
  }
}