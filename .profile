if [ -e /root/.new ]; then
	sed -E s'/v[1-9.-]+/edge/' /etc/apk/repositories
	apk add --no-cache ruby
	apk add ruby-dev make musl-dev gcc -t etc-build
	gem install --no-user-install etc bundle
	bundle install
	apk del --purge etc-build
	rm -rf /root/.new
fi
