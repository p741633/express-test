pipeline {
  // environment {
  //   // PATH = "$PATH:/usr/local/bin"
  //   PATH = "$PATH:/snap/bin"
  // }
  agent any
  stages {
    // stage('Verify') {
    //   steps {
    //     dir("Verify tooling") {
    //       sh '''
    //         docker info
    //         docker version
    //         docker-compose version
    //       '''
    //     }
    //   }
    // }
    stage('Build') {
      steps {
        dir("Compose") {
          sh "docker-compose -f docker-compose.dev.yml up -d --build"
        }
      }
    }
  }
  post {
    failure {
      emailext body: '''${DEFAULT_CONTENT}''',
        recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
        subject: '''${DEFAULT_SUBJECT}'''
    }
  }
}
