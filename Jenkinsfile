def app_name = "express-test"
def app_location = "/home/apps/express-test"

pipeline {
  agent any
  stages {
    stage('Copy Files') {
      steps {
        script {
          sh "mkdir -p ${app_location}"
          sh "rm -rf ${app_location}/*"
          sh "cp -vr ${WORKSPACE}/* ${app_location}"
        }
      }
    }
    stage('SSH transfer') {
      steps([$class: 'BapSshPromotionPublisherPlugin']) {
        sshPublisher(
          continueOnError: false, failOnError: true,
            publishers: [
              sshPublisherDesc(
                configName: "aa43-docker",
                verbose: true,
                transfers: [
                  sshTransfer(execCommand: "cd ${app_name}"),
                ]
              )
            ]
        )
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
