  
node {

    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'D') {

        def customImage = docker.build("babitham/helloworld")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
