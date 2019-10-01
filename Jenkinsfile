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

pipeline {
    agent {
        kubernetes {
            label 'lsp-for-cobol_pod_' + env.BRANCH_NAME + '_' + env.BUILD_NUMBER
            yaml kubernetes_config
        }
    }    
    options {
        timestamps()
        timeout(time: 3, unit: 'HOURS')
        skipDefaultCheckout(false)
        // skipDefaultCheckout(true)
    }
    environment {
       branchName = "${env.BRANCH_NAME}"
    }
    stages {
        stage('Install & Test') {
            environment {
                npm_config_cache = "${env.WORKSPACE}"
                // npm_config_cache = "${env.WORKSPACE}/clients/cobol-lsp-vscode-extension"
            }
            steps {
                container('node') {
                    script {
                        for(e in env){
                            echo e + " is: "
                            echo ${e}
                        }
                    }
                    sh "echo ${env.WORKSPACE}"
                    sh "echo ${env}"
                    sh "pwd"
                    sh "ls"
                    sh "cd $HOME/agent/workspace/*/clients/cobol-lsp-vscode-extension"
                    sh "pwd"
                    // sh "cd ./clients/cobol-lsp-vscode-extension"
                    sh "ls"
                    sh "npm ci"
                    sh "ls"
                    // sh "npm ci -prefix $HOME/agent/workspace/*/clients/cobol-lsp-vscode-extension"
                    sh "npm test"
                }
            }
        }
        stage('Package') {
            environment {
                npm_config_cache = "${env.WORKSPACE}"
            }
            steps {
                container('node') {
                    sh "npm run webpack-production"
                    sh "npm i vsce -prefix $HOME/agent/workspace/*/tools -g"
                    sh "$HOME/agent/workspace/*/tools/lib/node_modules/vsce/out/vsce package"
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
                    }
                }
            }
        }
    }
}
