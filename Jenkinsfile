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
                        sh 'set MAVEN_OPTS=-Xms1024m'
                        sh 'mvn clean verify'
                        sh 'cp lsp-service-cobol/target/lsp-service-cobol-*.jar $workspace/clients/cobol-lsp-vscode-extension/server/'
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
                        sh 'npm ci'
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
                        sh 'npx package'
                        archiveArtifacts "*.vsix"
                        sh 'mv cobol-language-support*.vsix cobol-language-support_0.10.1.vsix'
                    }
                }
            }
        }
    }
}
