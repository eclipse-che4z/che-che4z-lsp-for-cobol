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

boolean isTimeTriggeredBuild() {
    for (currentBuildCause in currentBuild.buildCauses) {
        return currentBuildCause._class == 'hudson.triggers.TimerTrigger$TimerTriggerCause'
    }
    return false
}

pipeline {
    agent none
    triggers {
        // Schedule nightly build for development branch or for pull request
        cron(env.BRANCH_NAME == 'development' || env.CHANGE_ID ? '0 0 * * 1-5' : '')
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
                                sh 'mv cobol-language-support*.vsix cobol-language-support_0.11.1-NEXT.vsix'
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
                // Run integration tests only in cases of:
                // - release branch (names like release-x.y.z)
                // - automatic nightly builds for "development" branch
                // - automatic nightly builds for each open Pull Request
                expression { branchName.startsWith("release") || isTimeTriggeredBuild() }
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
                        copyArtifacts filter: '*.vsix', projectName: '${JOB_NAME}'
                        sh './theiaPrepare.sh'
                    }
                }
                container('python') {
                    dir('tests/theia_automation_lsp') {
                        sh 'HOME=`pwd`/robot_home PYTHONPATH=`pwd` robot -i Rally -e Unstable --variable HEADLESS:True --outputdir robot_output robot_suites/lsp/local/firefox_lsp_local.robot'
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
