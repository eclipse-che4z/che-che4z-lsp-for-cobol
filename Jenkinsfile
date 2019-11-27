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
  - name: jnlp
    volumeMounts:
    - name: volume-known-hosts
      mountPath: /home/jenkins/.ssh
  volumes:
  - name: volume-known-hosts
    configMap:
      name: known-hosts
"""

def projectName = 'lsp-for-cobol'
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
                        sh 'set MAVEN_OPTS=-Xss10M'
                        sh 'mvn clean verify'
                        sh 'cp lsp-service-cobol/target/lsp-service-cobol-*.jar $workspace/clients/cobol-lsp-vscode-extension/server/'
                    }
                }
            }
        }
        stage('SonarCloud') {
            steps {
                container('maven') {
                    dir('com.ca.lsp.cobol') {
                        withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONARCLOUD_TOKEN')]) {
                            sh "mvn sonar:sonar -Dsonar.projectKey=eclipse_che-che4z-lsp-for-cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN}"
                        }
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
                        sh 'npx vsce package'
                        archiveArtifacts "*.vsix"
                        sh 'mv cobol-language-support*.vsix cobol-language-support_0.9.0.vsix'
                    }
                }
            }
        }
        stage('Deploy') {
            environment {
                sshChe4z = "genie.che4z@projects-storage.eclipse.org"
                project = "download.eclipse.org/che4z/snapshots/$projectName"
                url = "$project/$branchName"
                deployPath = "/home/data/httpd/$url"
            }
            steps {
                script {
                    if (branchName == 'master' || branchName == 'development') {
                        container('jnlp') {
                            sshagent(['projects-storage.eclipse.org-bot-ssh']) {
                                sh '''
                                ssh $sshChe4z rm -rf $deployPath
                                ssh $sshChe4z mkdir -p $deployPath
                                scp -r $workspace/clients/cobol-lsp-vscode-extension/*.vsix $sshChe4z:$deployPath
                                '''
                                echo "Deployed to https://$url"
                            }
                        }
                    } else {
                        echo "Deployment skipped for branch: $branchName"
                    }
                }
            }
        }
    }
}
