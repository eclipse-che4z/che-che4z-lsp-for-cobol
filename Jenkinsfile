#!groovy

def kubernetes_config = """
apiVersion: v1
kind: Pod
spec:
  containers:
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

def kubeLabel = 'explorer-for-zos-pod_' + env.BRANCH_NAME + '_' + env.BUILD_NUMBER

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
        skipDefaultCheckout(false)
        // skipDefaultCheckout(true)
    }
    environment {
       branchName = "${env.BRANCH_NAME}"
       buildNumber = "${env.BUILD_NUMBER}"
       workspace = "${env.WORKSPACE}"
       HOME="."
    }
    stages {
        stage('Install & Test') {
            environment {
                npm_config_cache = "${env.WORKSPACE}"
            }
            steps {
                container('node') {
                    dir('clients/cobol-lsp-vscode-extension') {
                        sh '''
                            # Test compilation to catch any errors
                            pwd
                            # ls
                            npm ci
                            # npm run vscode:prepublish
                            # Package for prod
                            npm i vsce
                            npx vsce package
                            # rename
                            export artifact_name=$(basename *.vsix)
                            mv -v $artifact_name ${artifact_name/.vsix/_$($buildNumber + '.' + date +'%F-%H%M%S').vsix}
                        '''

                        // Note there must be exactly one .vsix
                        stash includes: '*.vsix', name: 'deployables'
                    }
                }
            }
        }
        stage('Package') {
            environment {
                npm_config_cache = "${env.WORKSPACE}"
            }
            steps {
                container('node') {
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (branchName == 'master' || branchName == 'development') {
                        container('jnlp') {
                            sshagent ( ['projects-storage.eclipse.org-bot-ssh']) {
                                sh '''
                                ssh genie.che4z@projects-storage.eclipse.org rm -rf /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                                ssh genie.che4z@projects-storage.eclipse.org mkdir -p /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                                scp -r /home/jenkins/agent/workspace/*/*.vsix genie.che4z@projects-storage.eclipse.org:/home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                                '''
                            }
                        }
                    } else {
                        echo "Deployment skipped for branch: ${branchName}"
                        sh '''
                        ssh genie.che4z@projects-storage.eclipse.org rm -rf /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                        ssh genie.che4z@projects-storage.eclipse.org mkdir -p /home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                        scp -r /home/jenkins/agent/workspace/*/*.vsix genie.che4z@projects-storage.eclipse.org:/home/data/httpd/download.eclipse.org/che4z/snapshots/lsp-for-cobol/$branchName
                        '''
                    }
                }
            }
        }
    }
}
