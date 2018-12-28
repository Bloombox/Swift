
#
## Bloombox: Swift API Client
#

SCHEMA ?= Schema/
VERSION ?= 0.1.9
SCHEMA_BRANCH ?= master
SWIFT_GRPC ?= SwiftGRPC

SWIFT_PROTOC_OPTIONS ?= --swift_opt=FileNaming=PathToUnderscores --swift_opt=Visibility=Public --swiftgrpc_opt=Visibility=Public

all: build test
	@echo "Swift API client ready."

docs: clean-docs docs/

docs/:
	@echo "Generating docs..."
	@mkdir -p docs/ && jazzy \
		--output docs/ \
		-c --sdk iphone \
		-a Bloombox \
		-u "https://bloombox.cloud" \
		-m Bloombox --module-version=$(VERSION) \
		--copyright "&copy; 2016-2018, Momentum Ideas Co." \
		--readme README.md \
		--podspec Bloombox.podspec \
		--min-acl public \
		--swift-version 4.2 \
		--github_url https://github.com/bloombox/swift \
		--theme 'apple' \
		--include "Sources/Client/*";

update-docs: clean-docs docs/
	@echo "Updating docs..."
	@cd docs/ && git init && git add . && git commit -m "Update docs" && \
		git checkout -b gh-pages && \
		git remote add pages git@github.com:bloombox/swift.git && \
		git push pages gh-pages --force;
	@echo "Docs update done."

clean: clean-docs
	@echo "Cleaning Swift client for Bloombox..."
	@-swift package clean

distclean: clean
	@echo "Cleaning distributions..."
	@rm -frv .build $(SCHEMA)/languages
	@echo "Resetting codebase..."
	@git reset --hard

forceclean: distclean
	@echo "Sanitizing codebase..."
	@git clean -xdf

clean-docs:
	@echo "Cleaning docs..."
	@rm -fr docs/

pods: pod-opencannabis pod-services pod-client
	@echo "Pod work done."

check-local:
	@echo "Checking local state for releaseability..."
	@git diff-index --quiet HEAD --

release: check-local release-begin release-package pods-publish update-docs
	@echo "Release complete for version $(VERSION)."

release-begin:
	@echo "Performing release..."

release-package:
	@echo "Releasing Swift package (version: $(VERSION))..."
	@git tag -s -a $(VERSION) -m "Release: $(VERSION)"
	@git push origin --tags
	@echo "Release $(VERSION) is live."

pods-publish:
	@echo "Publishing pods to trunk..."
	@pod trunk push --allow-warnings --verbose OpenCannabis.podspec
	@pod trunk push --allow-warnings --verbose BloomboxServices.podspec
	@pod trunk push --allow-warnings --verbose Bloombox.podspec
	@echo "Pods published as version $VERSION."

pod-opencannabis:
	@echo "Linting OpenCannabis pod..."
	@pod lib lint --allow-warnings --fail-fast --verbose OpenCannabis.podspec

pod-services:
	@echo "Linting Bloombox services pod..."
	@pod lib lint --allow-warnings --fail-fast --verbose BloomboxServices.podspec

pod-client:
	@echo "Linting Bloombox client pod..."
	@pod lib lint --allow-warnings --fail-fast --verbose Bloombox.podspec


build: dependencies
	@echo "Building Swift client for Bloombox..."
	@swift build

dependencies: swift-grpc

test:
	@#echo "Running tests..."
	@#swift test

submodules: $(SWIFT_PROTOBUF) $(SWIFT_GRPC)
	@git submodule update --init --remote SwiftGRPC

schema: $(SCHEMA) $(SCHEMA)/languages/swift

$(SCHEMA):
	@echo "Initializing Schema..."
	@git submodule add --force --name schema git@github.com:bloombox/Schema.git $(SCHEMA)
	@git submodule update --init --remote schema

$(SCHEMA)languages/swift: $(SCHEMA)
	@echo "Building schema..."
	@mkdir -p Schema/languages/swiftgrpc
	@$(MAKE) -C Schema LANGUAGES="swift swiftgrpc" PROTO_FLAGS="--plugin=$(PWD)/SwiftGRPC/protoc-gen-swift --plugin=$(PWD)/SwiftGRPC/protoc-gen-swiftgrpc --swiftgrpc_out=Visibility=Public,Server=false,Client=true:languages/swiftgrpc" SERVICES=yes TABLES=no INCLUDE_DESCRIPTOR=yes build

update-schema:
	@echo "Updating schemas..."
	@git submodule update --init --remote Schema

regen-schema:
	@echo "Removing schema..."
	@rm -fr Schema/languages/*swift*

sync-schema: $(SCHEMA)languages/swift
	@echo "Syncing Swift schemas..."
	@rm -fr Sources/Schema/*.pb.swift
	@rm -fr Sources/Schema/*.grpc.swift
	@rm -fr Sources/Services/*.swift
	@cp -fr $(SCHEMA)languages/swift/*.swift Sources/Schema/
	@cp -fr $(SCHEMA)languages/swiftgrpc/*/*/*.swift Sources/Schema/
	@cp -fr Sources/Schema/*.grpc.swift Sources/Services/
	@rm -f Sources/Schema/*.grpc.swift
	@rm -f Sources/Schema/*.server.pb.swift
	@rm -f Sources/Client/*.grpc.swift
	@rm -f Sources/Client/*.pb.swift
	@rm -f Sources/Schema/bq*
	@rm -f rm -fv Sources/Services/{CheckinService*,DashService*,LedgerService*,MarketingService*,PartnersService*}
	@echo "Sync complete."

swift-grpc: $(SWIFT_GRPC)/.build
	@echo "Cleaning SwiftGRPC."
	@rm -f $(SWIFT_GRPC)/Package.resolved

$(SWIFT_GRPC)/.build:
	@echo "Building SwiftGRPC..."
	@$(MAKE) -C $(SWIFT_GRPC)

grpc: $(SWIFT_GRPC) $(SWIFT_GRPC)/.build
	@echo "gRPC is ready."

$(SWIFT_GRPC):
	@echo "Initializing SwiftGRPC..."
	@git submodule add --force --name SwiftGRPC git@github.com:grpc/grpc-swift.git $(SWIFT_GRPC)

