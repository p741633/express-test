def host_location = "/home/p741633/sdb1/apps/express-test"
def bind_location = "/home/apps/express-test"

pipeline {
  agent any
  stages {
    stage('Copy Files') {
      steps {
        script {
          sh "mkdir -p ${bind_location}"
          sh "rm -rf ${bind_location}/*"
          sh "cp -vr ${WORKSPACE}/* ${bind_location}"
        }
      }
    }
    stage('Build') {
      steps([$class: 'BapSshPromotionPublisherPlugin']) {
        sshPublisher(
          continueOnError: false, failOnError: true,
            publishers: [
              sshPublisherDesc(
                configName: "aa43-docker",
                verbose: true,
                transfers: [
                  sshTransfer(
                    execCommand: "docker-compose -f ${host_location}/docker-compose.yml up -d --build"
                  ),
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
