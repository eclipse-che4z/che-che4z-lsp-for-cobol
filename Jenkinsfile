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
    resources:
      limits:
        memory: "2Gi"
        cpu: "1"
      requests:
        memory: "2Gi"
        cpu: "1"
  - name: theia
    image: theiaide/theia-java
    tty: true
    resources:
      limits:
        memory: "2Gi"
        cpu: "1"
      requests:
        memory: "2Gi"
        cpu: "1"
  - name: python
    image: python
    tty: true
    resources:
      limits:
        memory: "2Gi"
        cpu: "1"
      requests:
        memory: "2Gi"
        cpu: "1"
"""

def projectName = 'lsp-for-cobol'
def targetFiles = 'lsp-core-cobol-parser/target/**'
def kubeLabel = projectName + '_pod_' + env.BUILD_NUMBER + '_' + env.BRANCH_NAME
kubeLabel = kubeLabel.replaceAll(/[^a-zA-Z0-9._-]+/,"")

pipeline {
    agent {
        kubernetes {
            label kubeLabel
            yaml kubernetes_config
        }
    }
    options {
        disableConcurrentBuilds()
        timestamps()
        timeout(time: 3, unit: 'HOURS')
        skipDefaultCheckout(false)
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '3'))
    }
    environment {
        branchName = "$env.BRANCH_NAME"
        workspace = "$env.WORKSPACE"
    }
    stages {
        stage('Build LSP server part') {
            steps {
                container('maven') {
                    dir('com.ca.lsp.cobol') {
                        sh 'mvn -version'
                    }
                }
            }
        }

        stage('Client - Install dependencies') {
            environment {
                npm_config_cache = "$env.WORKSPACE"
            }
            steps {
                container('node') {
                    dir('clients/cobol-lsp-vscode-extension') {
                        sh 'echo depend'
                    }
                }
            }
        }
        stage('Client - Package') {
            environment {
                npm_config_cache = "$env.WORKSPACE"
            }
            steps {
                container('node') {
                    dir('clients/cobol-lsp-vscode-extension') {
                         sh 'echo node compile'
                    }
                }
            }
        }
      stage('Integration test') {
        steps {
          container('theia') {
            dir('tests') {
              sh 'theiaPrepare.sh'
            }
          }
          container('python') {
            dir('tests/theia_automation_lsp') {
              sh 'pip install -r requirements.txt'
              sh 'apt update'
              sh 'apt install firefox-esr -y'
              sh 'PYTHONPATH=`pwd` robot --variable HEADLESS:True --outputdir robot_output robot_suites/lsp/local/firefox_lsp_local.robot'
            }
          }
        }
      }
    }
      post {
        always {
          container('node') {
            archiveArtifacts artifacts: '_logs/*', fingerprint: true
          }
          container('python') {
            archiveArtifacts "tests/theia_automation_lsp/robot_output/*"
          }
        }
      }
}
