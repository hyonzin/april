
export BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

if [ $BRANCH == 'main' ]; then
  export APP_PORT=80
  export PULLER_PORT=9990
elif [ $BRANCH == 'dev' ]; then
  export APP_PORT=3000
  export PULLER_PORT=9999
fi
