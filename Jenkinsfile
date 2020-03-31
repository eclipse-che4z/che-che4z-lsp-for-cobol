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
    image: theiaide/theia-java:0.16.1
    tty: true
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 1000; done;" ]
    securityContext:
      runAsUser: 0
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
def targetFiles = 'lsp-core-cobol-parser/target/**'
def kubeLabel = projectName + '_pod_' + env.BUILD_NUMBER + '_' + env.BRANCH_NAME
kubeLabel = kubeLabel.replaceAll(/[^a-zA-Z0-9._-]+/,"")

boolean isTimeTriggeredBuild() {
    for (currentBuildCause in currentBuild.buildCauses) {
        return currentBuildCause._class == 'hudson.triggers.TimerTrigger$TimerTriggerCause'
    }
    return false
}

pipeline {
    agent {
        kubernetes {
            label kubeLabel
            yaml kubernetes_config
        }
    }
    triggers {
        cron('0 0 * * 1-5')
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

        stage('SonarCloud') {
            steps {
                container('maven') {
                    dir('com.ca.lsp.cobol') {
                        withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONARCLOUD_TOKEN')]) {
                            sh "mvn sonar:sonar -Dsonar.projectKey=eclipse_che-che4z-lsp-for-cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN} -Dsonar.branch.name=${env.BRANCH_NAME}"
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
                        sh 'mv cobol-language-support*.vsix cobol-language-support_0.10.1.vsix'
                    }
                }
            }
        }
        stage('Integration test') {
            steps {
                script {
                    if (isTimeTriggeredBuild() && (branchName == 'development' || env.CHANGE_ID)) {
                        container('theia') {
                            dir('tests') {
                                sh './theiaPrepare.sh'
                            }
                        }
                        container('python') {
                            dir('tests/theia_automation_lsp') {
                                sh 'pip install -r requirements.txt'
                                sh 'apt update'
                                sh 'apt install firefox-esr -y'
                                sh 'PYTHONPATH=`pwd` robot -i Rally -e Unstable --variable HEADLESS:True --outputdir robot_output robot_suites/lsp/local/firefox_lsp_local.robot'
                            }
                        }
                    } else {
                        echo "Integration test was skipped"
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
    post {
        always {
            container('theia') {
                dir('tests') {
                    sh 'mkdir artifacts'
                    sh 'cp /home/theia/theia.log artifacts'
                    sh 'cp -a theia_automation_lsp/robot_output/. artifacts'
                    sh 'cp -a theia_robot_output/. artifacts'
                    archiveArtifacts "artifacts/**"
                }
            }
        }
    }
}
