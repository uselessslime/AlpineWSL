if [ -e /root/.new ]; then
	sed -E s'/v[1-9.-]+/edge/' /etc/apk/repositories
	apk add --no-cache ruby
	apk add --no-cache glib cairo pango gdk-pixbuf font-bakoma-ttf -t mathematical
	apk add ruby-dev make musl-dev gcc -t etc-build
	apk add ruby-dev make musl-dev gcc -t json-build
	apk add --no-cache g++ cmake make bison ruby-dev cairo-dev pango-dev flex-dev gdk-pixbuf-dev pkgconf python3 libxml2-dev -t mathematical-build
	gem install --no-user-install etc bundle
	bundle install
	apk del --purge etc-build json-build mathematical-build
	rm -rf /root/.new
fi
