#!groovy

def kubernetes_config = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven
    image: maven:alpine
    command:
    - cat
    tty: true
    resources:
      limits:
        memory: "2Gi"
        cpu: "1"
      requests:
        memory: "2Gi"
        cpu: "1"
  - name: node
    image: node:12.10.0-alpine
    tty: true
  - name: jnlp
    volumeMounts:
    - name: volume-known-hosts
      mountPath: /home/jenkins/.ssh
  volumes:
  - name: volume-known-hosts
    configMap:
      name: known-hosts
"""

def kubeLabel = 'lsp-for-cobol_pod_' + env.BRANCH_NAME + '_' + env.BUILD_NUMBER

pipeline {
    agent {
        kubernetes {
            label kubeLabel
            yaml kubernetes_config
        }
    }    
    options {
        // disableConcurrentBuilds()
        timestamps()
        timeout(time: 3, unit: 'HOURS')
        // skipDefaultCheckout(false)
        skipDefaultCheckout(true)
    }
    environment {
       branchName = "${env.BRANCH_NAME}"
       buildNumber = "${env.BUILD_NUMBER}"
       workspace = "${env.WORKSPACE}"
    }
    stages {
        // stage('Build LSP server part') {
        //      steps {
        //         container('maven') {
        //             dir('com.ca.lsp.cobol') {
        //                 sh 'mvn -version'
        //                 // sh 'mvn clean verify'
        //                 sh 'mvn clean install'
        //                 sh 'cp lsp-service-cobol/target/lsp-service-cobol-*.jar $workspace/clients/cobol-lsp-vscode-extension/server/'
        //             }
        //         }
        //      }
        // }
        stage('Install & Test Client') {
            environment {
                npm_config_cache = "${env.WORKSPACE}"
            }
            steps {
                script {
                    // def date = new Date()
                    // println date
                }
                container('node') {
                    dir('clients/cobol-lsp-vscode-extension') {
                        // sh '''
                        //     pwd
                        //     npm ci
                        //     npm i vsce
                        //     npx vsce package
                        //     # rename
                        //     export artifact_name=$(basename *.vsix)
                        //     mv -v $artifact_name ${artifact_name/.vsix/_$(TZ='Europe/Prague' date +'%FT%H%M%S').vsix}
                        // '''
                        sh '''
                            date -d "today + 2 hour" +'%FT%H:%M:%S'
                        '''
                    }
                }
            }
        }
        // stage('Package') {
        //     environment {
        //         npm_config_cache = "${env.WORKSPACE}"
        //     }
        //     steps {
        //         container('node') {
        //         }
        //     }
        // }
        // stage('Deploy') {
        //     steps {
        //         script {
        //             if (branchName == 'master' || branchName == 'development') {
        //                 container('jnlp') {
        //                     sshagent ( ['projects-storage.eclipse.org-bot-ssh']) {
                                
        //                     }
        //                 }
        //             } else {
        //                 container('jnlp') {
        //                     sshagent ( ['projects-storage.eclipse.org-bot-ssh']) {
        //                         echo "Deployment skipped for branch: ${branchName}"
        //                         sh '''
        //                         ssh genie.che4z@projects-storage.eclipse.org rm -rf /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
        //                         ssh genie.che4z@projects-storage.eclipse.org mkdir -p /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
        //                         scp -r $workspace/clients/cobol-lsp-vscode-extension/*.vsix genie.che4z@projects-storage.eclipse.org:/home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
        //                         '''
        //                     }
        //                 }
        //             }
        //         }
        //     }
        // }
    }
}
