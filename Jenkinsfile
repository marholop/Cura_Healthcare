pipeline {
    agent any

    environment {
        SONAR_HOST_URL = 'https://f89e37b6f1bc.ngrok-free.app'
        SONAR_LOGIN = credentials('sonar-robotframework-token')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'add_jenkins_sonarqube', url: 'https://github.com/marholop/Cura_Healthcare.git'
            }
        }

        stage('Setup Python & rflint') {
            steps {
                bat """
                  python -m venv venv
                  call venv\\Scripts\\activate
                  pip install --upgrade pip
                  pip install robotframework
                  pip install --upgrade robotframework-seleniumlibrary
                  pip install git+https://github.com/robotframework/SeleniumLibrary.git
                  pip install webdriver-manager
                  pip install robotframework-lint
                """
            }
        }

        stage('Run rflint') {
            steps {
                bat """
                  call venv\\Scripts\\activate
                  MOZ_HEADLESS=1 xvfb-run -a robot --variable BROWSER:firefox --outputdir results tests/
                  rflint tests > rflint.log || exit 0
                """
            }
        }

        stage('Convert rflint log to SonarQube JSON') {
            steps {
                bat """
                  call venv\\Scripts\\activate
                  python convert_rflint_to_sonar.py rflint.log rflint-sonar.json
                """
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    bat """
                      call venv\\Scripts\\activate
                      sonar-scanner ^
                        -Dsonar.projectKey=robotframework-project ^
                        -Dsonar.sources=tests ^
                        -Dsonar.externalIssuesReportPaths=rflint-sonar.json ^
                        -Dsonar.host.url=%SONAR_HOST_URL% ^
                        -Dsonar.login=%SONAR_LOGIN%
                    """
                }
            }
        }
    }
}
