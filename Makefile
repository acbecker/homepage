all : gen

gen:
	hyde gen

serve:
	rm -rf deploy 
	hyde gen 
	hyde serve

clean:
	rm -rf deploy

# Publish should be run from my astro account
# /local/acbecker/winter2012/Linux64/external/python/2.7.2+2/bin/hyde
# need to "setup python"
publish:
	rm -rf deploy deploy_production
	hyde gen -c production.yaml
	rsync -e ssh -r deploy_production/ portal:/www/astro/users/becker/html/
