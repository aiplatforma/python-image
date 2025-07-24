build DOCKERFILE:
  #!/bin/bash
  docker build -f {{DOCKERFILE}} .
  docker build --quiet -f {{DOCKERFILE}} . > .docker-image-sha256
  # Build the Docker image and save the SHA256 of the built image

tag TAGSFILE:
  #!/bin/bash
  DOCKER_SHA256=$(cat .docker-image-sha256)
  for tag in $(jq -r 'to_entries[] | .key as $image | .value[] | "\($image):\(.)"' {{TAGSFILE}})
  do
  docker tag $DOCKER_SHA256 $DOCKER_IMAGE_PREFIX/$tag
  done
  # Create a tags file with the image SHA256 and tags

push TAGSFILE:
  #!/bin/bash
  for tag in $(jq -r 'to_entries[] | .key as $image | .value[] | "\($image):\(.)"' {{TAGSFILE}})
  do
  docker push $DOCKER_IMAGE_PREFIX/$tag
  done
  # Push the image with the SHA256 tag based on the tags file

clean TAGSFILE:
  #!/bin/bash
  for tag in $(jq -r 'to_entries[] | .key as $image | .value[] | "\($image):\(.)"' {{TAGSFILE}})
  do
  docker rmi $DOCKER_IMAGE_PREFIX/$tag || true
  done
  rm -f .docker-image-sha256
  # Clean up the local tags file

image-plain: (build "src/Dockerfile") (tag "src/tags.json") (push "src/tags.json") (clean "src/tags.json")
