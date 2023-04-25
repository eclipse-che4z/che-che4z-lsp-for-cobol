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
    env:
    - name: "HOME"
      value: "/home/jenkins"
    - name: "MAVEN_OPTS"
      value: "-Xms1024m -Xmx2560m"
    tty: true
    resources:
      limits:
        memory: "3Gi"
        cpu: "1"
      requests:
        memory: "3Gi"
        cpu: "1"
    volumeMounts:
    - name: m2-repo
      mountPath: /home/jenkins/.m2/repository
    - name: sonar
      mountPath: /home/jenkins/.sonar
  - name: node
    image: sonarsource/sonarcloud-scan:1.4.0
    command:
    - cat
    env:
    - name: "HOME"
      value: "/home/jenkins"
    tty: true
    resources:
      limits:
        memory: "1Gi"
        cpu: "1"
      requests:
        memory: "1Gi"
        cpu: "800m"
    volumeMounts:
    - name: sonar
      mountPath: /home/jenkins/.sonar
  volumes:
  - name: m2-repo
    emptyDir: {}
  - name: sonar
    emptyDir: {}
"""
boolean isTimeTriggeredBuild() {
    for (currentBuildCause in currentBuild.buildCauses) {
        return currentBuildCause._class == 'hudson.triggers.TimerTrigger$TimerTriggerCause'
    }
    return false
}

pipeline {
    agent none
    triggers {
        // Only development branch has nightly builds
        cron(env.BRANCH_NAME == 'development' ? '20 22 * * 1-5' : '')
    }
    options {
        disableConcurrentBuilds()
        timestamps()
        timeout(time: 3, unit: 'HOURS')
        skipDefaultCheckout(true)
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '3'))
    }
    environment {
        branchName = "$env.BRANCH_NAME"
    }
    stages {
        stage('Build a package') {
            agent {
                kubernetes {
                    yaml kubernetes_build_config
                }
            }
            stages {
                stage('Checkout'){
                    steps {
                        deleteDir()
                        checkout scm
                    }
                }
                stage('Build LSP server part') {
                    steps {
                        container('maven') {
                            dir('server') {
                                withMaven {
                                    sh 'mvn -version'
                                    sh 'mvn clean verify --no-transfer-progress'
                                    sh 'cp engine/target/server.jar $WORKSPACE/clients/cobol-lsp-vscode-extension/server/jar/'
                                    sh 'cp dialect-idms/target/dialect-idms.jar $WORKSPACE/clients/idms-dialect-support/server/jar/'
                                    sh 'cp dialect-daco/target/dialect-daco.jar $WORKSPACE/clients/daco-dialect-support/server/jar/'
                                }
                            }
                        }
                    }
                }

                /* Disable SonarCloud until issue with project move is not resolved. https://gitlab.eclipse.org/eclipsefdn/helpdesk/-/issues/2849
                stage('SonarCloud analysis-Server') {
                    steps {
                        container('maven') {
                            dir('server') {
                                withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONARCLOUD_TOKEN')]) {
                                    sh 'mvn sonar:sonar -Dsonar.projectKey=eclipse_che-che4z-lsp-for-cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN} -Dsonar.branch.name=${BRANCH_NAME} --no-transfer-progress'
                                }
                            }
                        }
                    }
                }
                */
                stage('Client - Install dependencies') {
                    environment {
                        npm_config_cache = "$env.WORKSPACE"
                    }
                    steps {
                        container('node') {
                            dir('clients/cobol-lsp-vscode-extension') {
                                sh 'npm -v'
                                sh 'node -v'
                                sh 'npm ci'
                                sh 'npm run postinstall'
                            }
                        }
                    }
                }
                stage('Client - Build Dialect API package') {
                    environment {
                        npm_config_cache = "$env.WORKSPACE"
                    }
                    steps {
                        container('node') {
                            dir('clients/cobol-dialect-api') {
                                sh 'npm -v'
                                sh 'node -v'
                                sh 'npm ci'
                                sh 'npm run compile'
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
                            sh 'npm run coverage'
                          }
                      }
                  }
                }

//                 stage('Client - API integration tests'){
//                   environment {
//                       npm_config_cache = "$env.WORKSPACE"
//                   }
//                   steps {
//                       container('node') {
//                           dir('clients/cobol-lsp-vscode-extension') {
//                             sh 'npm run test:integration'
//                           }
//                       }
//                   }
//                 }
                stage('Client - Change version') {
                    environment {
                        // Cleaning the branch name according to https://semver.org/ rules
                        buildIdentifier = "${env.BRANCH_NAME}.${env.BUILD_NUMBER}".replaceAll(/[^a-zA-Z0-9.-]+/,"")
                    }
                    when {
                        expression { branchName != 'master' }
                    }
                    steps {
                        container('node') {
                            dir('clients') {
                                sh 'sed -i "s/\\"version\\": \\"\\(.*\\)\\"/\\"version\\": \\"\\1+$buildIdentifier\\"/g" */package.json'
                            }
                        }
                    }
                }

                stage('Update telemetry key') {
                    when {
                        expression { branchName == 'master' }
                    }

                    steps{
                        container('node') {
                            dir('clients/cobol-lsp-vscode-extension') {
                                //test telemetry key generation
                                withCredentials([string(credentialsId: 'TELEMETRY_INSTRUMENTATION_KEY', variable: 'TELKEY')]) {
                                    sh 'echo ${TELKEY}|base64 > resources/TELEMETRY_KEY'
                                }
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
                                sh 'npm run package'
                                archiveArtifacts "*.vsix"
                            }
                            dir('clients/idms-dialect-support') {
                                sh 'npm ci --ignore-scripts'
                                sh 'npm run postinstall'
                                sh 'npm run package'
                                archiveArtifacts "*.vsix"
                            }
                            dir('clients/daco-dialect-support') {
                                sh 'npm ci --ignore-scripts'
                                sh 'npm run postinstall'
                                sh 'npm run package'
                                archiveArtifacts "*.vsix"
                            }
                        }
                    }
                }
                /* Disable SonarCloud until issue with project move is not resolved. https://gitlab.eclipse.org/eclipsefdn/helpdesk/-/issues/2849
                stage('SonarCloud analysis-Client') {
                    environment {
                        npm_config_cache = "$env.WORKSPACE"
                        SONAR_BINARY_CACHE="$env.WORKSPACE"
                    }
                    steps {
                        container('node') {
                            dir('clients/cobol-lsp-vscode-extension') {
                                sh 'npm i sonarqube-scanner'
                                withCredentials([string(credentialsId: 'sonarcloud-token', variable: 'SONARCLOUD_TOKEN')]) {
                                    sh 'node_modules/sonarqube-scanner/src/bin/sonar-scanner -Dsonar.projectKey=com.ca.lsp:com.ca.lsp.cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN} -Dsonar.branch.name=${BRANCH_NAME}'
                                }
                            }
                        }
                    }
                }
                */

            }
        }        
    }
}
