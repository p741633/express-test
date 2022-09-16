def apps = "/home/apps/express-test"

pipeline {
  agent any
  stages {
    stage('Copy Files') {
      steps {
        script {
          sh "mkdir -p ${apps}"
          sh "rm -rf ${apps}/*"
          sh "cp -vr ${WORKSPACE}/* ${apps}"
        }
      }
    }
    // stage('SSH transfer') {
    //   steps([$class: 'BapSshPromotionPublisherPlugin']) {
    //     sshPublisher(
    //       continueOnError: false, failOnError: true,
    //         publishers: [
    //           sshPublisherDesc(
    //             configName: "aa43-docker",
    //             verbose: true,
    //             transfers: [
    //               sshTransfer(execCommand: "scp -r ${WORKSPACE} ./express-test"),
    //             ]
    //           )
    //         ]
    //     )
    //   }
    // }
  }
  post {
    failure {
      emailext body: '''${DEFAULT_CONTENT}''',
        recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
        subject: '''${DEFAULT_SUBJECT}'''
    }
  }
}
