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
    image: sonarsource/sonarcloud-scan:1.2.1
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

def kubernetes_test_config = """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: theia
    image: theiaide/theia-full:1.15.0
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
  - name: cypress
    image: cypress/included:8.5.0
    tty: true
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 1000; done;" ]
    resources:
      limits:
        memory: "2Gi"
        cpu: "800m"
      requests:
        memory: "2Gi"
        cpu: "800m"
"""

def projectName = 'lsp-for-cobol'
def kubeLabelPrefix = "${projectName}_pod_${env.BUILD_NUMBER}_${env.BRANCH_NAME}"
        // cleaning the branch name according K8s restrictions
        .replaceAll(/[^a-zA-Z0-9._-]+/,"").take(52)
def kubeBuildLabel = "${kubeLabelPrefix}_build"
def kubeTestLabel = "${kubeLabelPrefix}_test"

boolean isTimeTriggeredBuild() {
    for (currentBuildCause in currentBuild.buildCauses) {
        return currentBuildCause._class == 'hudson.triggers.TimerTrigger$TimerTriggerCause'
    }
    return false
}

pipeline {
    agent none
    parameters {
        booleanParam(defaultValue: false, description: 'Run integration tests.', name: 'integrationTests')
    }
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
                    label kubeBuildLabel
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
                                    sh 'cp target/server.jar $WORKSPACE/clients/cobol-lsp-vscode-extension/server/'
                                }
                            }
                        }
                    }
                }

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
                            sh 'npm run coverage'
                          }
                      }
                  }
                }

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
                                    sh 'node_modules/sonarqube-scanner/dist/bin/sonar-scanner -Dsonar.projectKey=com.ca.lsp:com.ca.lsp.cobol -Dsonar.organization=eclipse -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=${SONARCLOUD_TOKEN} -Dsonar.branch.name=${BRANCH_NAME}'
                                }
                            }
                        }
                    }
                }

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
                            dir('clients/cobol-lsp-vscode-extension') {
                                sh 'sed -i "s/\\"version\\": \\"\\(.*\\)\\"/\\"version\\": \\"\\1+$buildIdentifier\\"/g" package.json'
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
                        }
                    }
                }
            }
        }
        stage('Integration testing') {
            when {
                // Integration testing runs on each PR from "nalmabrcom" user.
                expression { params.integrationTests || isTimeTriggeredBuild() || env.CHANGE_AUTHOR == "nalmabrcom" }
                beforeAgent true
            }
            agent {
                kubernetes {
                    label kubeTestLabel
                    yaml kubernetes_test_config
                }
            }
            environment {
                THEIA_HOME = "$env.WORKSPACE/tests/theia/home"
                THEIA_PLUGINS = "$env.WORKSPACE/tests/theia/plugins"
                PROJECT_FOLDER = "$env.WORKSPACE/tests/test_files/project"
                CYPRESS_HOME = "$env.WORKSPACE/tests/cypress/home"
            }
            steps {
                checkout scm
                container('theia') {
                    dir('tests') {
                        copyArtifacts filter: '*.vsix', projectName: '${JOB_NAME}', selector: specific('${BUILD_NUMBER}')
                        sh 'mkdir -p $THEIA_HOME'
                        sh 'cp -r test_files/zowe theia/home/.zowe'
                        sh 'mkdir -p $THEIA_PLUGINS'
                        sh 'mv *.vsix $THEIA_PLUGINS'
                        sh '''#!/bin/bash
                            cd /home/theia
                            # Set user HOME for theia.
                            export HOME=$THEIA_HOME
                            # Set user HOME for LSP server. Is not work with just $HOME for some reason.
                            export _JAVA_OPTIONS=-Duser.home=$THEIA_HOME
                            node /home/theia/src-gen/backend/main.js $PROJECT_FOLDER --hostname=0.0.0.0 --plugins=local-dir:$THEIA_PLUGINS > $THEIA_HOME/theia.log 2>&1 &
                        '''
                    }
                }
                container('cypress') {
                    dir('tests') {
                        sh '''#!/bin/bash
                            export HOME=$CYPRESS_HOME
                            export CYPRESS_CACHE_FOLDER=$CYPRESS_HOME/.cache/Cypress
                            mkdir -p $CYPRESS_HOME 
                            cp -r /root/.cache $CYPRESS_HOME 
                            cp -r /root/.local $CYPRESS_HOME 
                            cp -r /root/.npm $CYPRESS_HOME 
                            rm -rf node_modules/ yarn.lock
                            yarn cache clean
                            yarn install --frozen-lockfile
                            npm run ts:build
                            # To enable debug add this: DEBUG=*
                            NO_COLOR=1 npm run cy:run:ci -- --env ide=theia
                            TEST_STATUS=$?
                            npm run merge-reports
                            exit $TEST_STATUS
                        '''
                    }
                }
            }
            post {
                always {
                    container('cypress') {
                        dir('tests') {
                            archiveArtifacts artifacts: "ui_tests_complete_logs.xml", allowEmptyArchive: true
                        }
                    }
                }
                failure {
                    container('theia') {
                        dir('tests') {
                            archiveArtifacts artifacts: "theia/home/theia.log", allowEmptyArchive: true
                            archiveArtifacts artifacts: "theia/home/LSPCobol/**/*.*", allowEmptyArchive: true
                        }
                    }
                    container('cypress') {
                        dir('tests') {
                            archiveArtifacts artifacts: "cypress/screenshots/**/*.*", allowEmptyArchive: true
                            archiveArtifacts artifacts: "cypress/videos/**/*.*", allowEmptyArchive: true
                            archiveArtifacts artifacts: "logs/*.*", allowEmptyArchive: true
                        }
                    }
                }
            }
        }
    }
}
