#!/usr/bin/env bash

RC=0

echo "GraalVM build information"
echo ""
cat $JAVA_HOME/release
echo ""

/bin/start-docker.sh
if [[ -n $DOCKER_HUB_USERNAME ]]; then
  echo "$DOCKER_HUB_PASSWORD" | docker login -u $DOCKER_HUB_USERNAME --password-stdin
fi
cd git-repo
if ! (./build.sh); then
    RC=1
fi
if [ "$AOT_ONLY" = false ] ; then
  if ! (./build-samples-with-native-tests.sh); then
    RC=1
  fi
else
  if ! (./build-samples-aot-only.sh); then
      RC=1
  fi
fi
exit $RC