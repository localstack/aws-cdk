
usage:          ## Show this help
	@fgrep -h " ##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build-base:     ## Build base packages
	(cd packages/cdk-assets; npm run build)
	(cd packages/@aws-cdk; yarn build)
	(cd packages/@aws-cdk/core; yarn build)

publish:        ## Publish the package to npmjs.com
	(cd packages/aws-cdk; npm run build && npm publish)

.PHONY: publish usage
