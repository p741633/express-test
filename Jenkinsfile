pipeline {
  agent any
  stages {
    stage('Copy Files') {
      step {
        script {
          sh "cp -v ${WORKSPACE}/* /home/apps/express-test"
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
