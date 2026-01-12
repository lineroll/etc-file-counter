pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Install and Run') {
            steps {
                script {
                    // In a real scenario, we would have the artifacts from the GitHub Action or build them here.
                    // For this task, we'll assume we are building them or they are available.
                    
                    echo "Building packages..."
                    sh '''
                        # Build DEB manually for demonstration in the pipeline
                        mkdir -p deb_build/DEBIAN
                        mkdir -p deb_build/usr/local/bin
                        cp count_files.sh deb_build/usr/local/bin/
                        cp debian/control deb_build/DEBIAN/
                        chmod 755 deb_build/usr/local/bin/count_files.sh
                        dpkg-deb --build deb_build etc-file-counter.deb
                    '''

                    echo "Installing DEB package..."
                    sh "sudo dpkg -i etc-file-counter.deb"

                    echo "Executing script from package..."
                    sh "/usr/local/bin/count_files.sh"
                }
            }
        }
    }
    post {
        always {
            echo "Cleaning up..."
            sh "sudo dpkg -r etc-file-counter || true"
        }
    }
}
