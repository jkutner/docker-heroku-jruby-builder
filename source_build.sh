#!/bin/sh

cache_dir="/tmp/jruby-cache/"
jruby_src_file=jruby-src-$VERSION.tar.gz

cd $cache_dir
if [ $GIT_URL ]; then
	git clone $GIT_URL release
	cd release
	git checkout $GIT_TREEISH
	MAVEN_OPTS=-XX:MaxPermSize=768m mvn install -Pdist
	cp maven/jruby-dist/target/jruby-dist-$VERSION-src.tar.gz $cache_dir/$jruby_src_file
	cd ..
fi
