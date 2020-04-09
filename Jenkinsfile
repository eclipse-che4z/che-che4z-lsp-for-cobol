#!groovy

def kubernetes_build_config = """
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

def kubernetes_test_config = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: theia
    image: theiaide/theia-java:0.16.1
    tty: true
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 1000; done;" ]
    securityContext:
      runAsUser: 1001140001
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
def kubeLabelPrefix = "${projectName}_pod_${env.BUILD_NUMBER}_${env.BRANCH_NAME}".replaceAll(/[^a-zA-Z0-9._-]+/,"")
def kubeBuildLabel = "${kubeLabelPrefix}_build"
def kubeTestLabel = "${kubeBuildLabel}_test"

boolean isTimeTriggeredBuild() {
    for (currentBuildCause in currentBuild.buildCauses) {
        return currentBuildCause._class == 'hudson.triggers.TimerTrigger$TimerTriggerCause'
    }
    return false
}

pipeline {
    agent none
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
    }
    stages {
        stage('Build a package') {
            agent {
                kubernetes {
                    label kubeBuildLabel
                    yaml kubernetes_build_config
                }
            }
            stages {
                stage('Build LSP server part') {
                    steps {
                        container('maven') {
                            dir('com.ca.lsp.cobol') {
                                sh 'mvn -version'
                                sh 'set MAVEN_OPTS=-Xms1024m'
                                sh 'mvn clean verify'
                                sh 'cp lsp-service-cobol/target/lsp-service-cobol-*.jar $WORKSPACE/clients/cobol-lsp-vscode-extension/server/'
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
            }
        }
        stage('Integration testing') {
            when {
                expression { true }
                beforeAgent true
            }
            agent {
                kubernetes {
                    label kubeTestLabel
                    yaml kubernetes_test_config
                }
            }
            steps {
                container('theia') {
                    dir('tests') {
                        copyArtifacts filter: '*.vsix', projectName: '${JOB_NAME}', selector: specific('${BUILD_NUMBER}')
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
    }
}
