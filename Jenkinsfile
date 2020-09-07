#!groovy

def kubernetes_build_config = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven
    image: maven:3-openjdk-11
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
    image: grianbrcom/theia4cobol:1.0.1
    tty: true
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 1000; done;" ]
    resources:
      limits:
        memory: "2Gi"
        cpu: "1"
      requests:
        memory: "2Gi"
        cpu: "1"
  - name: python
    image: grianbrcom/python-firefox:1.0.1
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

pipeline {
    agent none
    parameters {
        booleanParam(defaultValue: false, description: 'Run integration tests.', name: 'integrationTests')
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
                            dir('server') {
                                sh 'mvn -version'
                                sh 'set MAVEN_OPTS=-Xms1024m'
                                sh 'mvn clean verify --no-transfer-progress'
                                sh 'cp target/server.jar $WORKSPACE/clients/cobol-lsp-vscode-extension/server/'
                            }
                        }
                    }
                }

                stage('SonarCloud') {
                    steps {
                        container('maven') {
                            dir('server') {
                                withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONARCLOUD_TOKEN')]) {
                                    sh "mvn sonar:sonar -Dsonar.projectKey=eclipse_che-che4z-lsp-for-cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN} -Dsonar.branch.name=${env.BRANCH_NAME} --no-transfer-progress"
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

                stage('Client - Unit tests'){
                  environment {
                      npm_config_cache = "$env.WORKSPACE"
                  }
                  steps {
                      container('node') {
                          dir('clients/cobol-lsp-vscode-extension') {
                            sh 'npm t'
                          }
                      }
                  }
                }

                stage('Client - Change version') {
                    environment {
                        buildNumber = "$env.BUILD_NUMBER"
                    }
                    when {
                        expression { branchName != 'master' }
                    }
                    steps {
                        container('node') {
                            dir('clients/cobol-lsp-vscode-extension') {
                                sh 'sed -i "s/\\"version\\": \\"\\(.*\\)\\"/\\"version\\": \\"\\1+$branchName.$buildNumber\\"/g" package.json'
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
                    when {
                        expression { branchName == 'master' || branchName == 'development' }
                    }
                    steps {
                        container('jnlp') {
                            sshagent(['projects-storage.eclipse.org-bot-ssh']) {
                                sh '''
                                ssh $sshChe4z rm -rf $deployPath
                                ssh $sshChe4z mkdir -p $deployPath
                                scp -r $WORKSPACE/clients/cobol-lsp-vscode-extension/*.vsix $sshChe4z:$deployPath
                                '''
                                echo "Deployed to https://$url"
                            }
                        }
                    }
                }
            }
        }
        stage('Integration testing') {
            when {
                expression { params.integrationTests }
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
                        sh 'HOME=`pwd`/robot_home PYTHONPATH=`pwd` robot -i Rally -e NEED_UPDATE -e DEFECT_OPEN --variable HEADLESS:True --outputdir robot_output robot_suites/lsp/local/firefox_lsp_local.robot'
                    }
                }
            }
            post {
                always {
                    container('theia') {
                        dir('tests') {
                            sh './reportCollection.sh'
                            archiveArtifacts "artifacts/**"
                        }
                    }
                }
            }
        }
        stage('Update telemetry key') {
          when {
              //rollback after testing to: expression { branchName == 'master' }
              expression { branchName == '472_telemetry' }
          }
          steps {
            container('node') {

                withCredentials([string(credentialsId: 'TELEMETRY_INSTRUMENTATION_KEY', variable: 'TELEMETRY_INSTRUMENTATION_KEY')]) {
                  dir('clients/cobol-lsp-vscode-extension/resources') {
                    sh 'echo ${TELEMETRY_INSTRUMENTATION_KEY} | base64 > $WORKSPACE/clients/cobol-lsp-vscode-extension/resources/TELEMETRY_KEY'
                  }
                }
            }
        }
      }
    }
}
