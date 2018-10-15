
#
## Bloombox: Swift API Client
#

SCHEMA ?= Schema/
VERSION ?= 0.0.9
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
		--github_url https://github.com/bloombox/swift \
		--theme 'apple' \
		--include "Sources/Client/*";

clean: clean-docs
	@echo "Cleaning Swift client for Bloombox..."
	@rm -frv .build $(SCHEMA)/languages

clean-docs:
	@echo "Cleaning docs..."
	@rm -fr docs/

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
	@$(MAKE) -C Schema LANGUAGES="swift swiftgrpc" PROTO_FLAGS="--plugin=$(PWD)/SwiftGRPC/protoc-gen-swift --plugin=$(PWD)/SwiftGRPC/protoc-gen-swiftgrpc --swiftgrpc_out=languages/swiftgrpc" SERVICES=yes TABLES=no INCLUDE_DESCRIPTOR=yes

sync-schema: $(SCHEMA)languages/swift
	@echo "Syncing Swift schemas..."
	@rm -fr Sources/Schema/*.pb.swift
	@rm -fr Sources/Schema/*.grpc.swift
	@cp -fr $(SCHEMA)languages/swift/*.swift Sources/Schema/
	@cp -fr $(SCHEMA)languages/swift/*/*/*.swift Sources/Schema/
	@cp -fr $(SCHEMA)languages/swiftgrpc/*/*/*.swift Sources/Schema/
	@rm -f Sources/Schema/*v1beta2*
	@rm -f Sources/Schema/*.server.pb.swift
	@rm -f Sources/Schema/bq*

swift-grpc: $(SWIFT_GRPC)/.build
	@echo "Cleaning SwiftGRPC."
	@rm -f $(SWIFT_GRPC)/Package.resolved

$(SWIFT_GRPC)/.build:
	@echo "Building SwiftGRPC..."
	@$(MAKE) -C $(SWIFT_GRPC)

$(SWIFT_GRPC):
	@echo "Initializing SwiftGRPC..."
	@git submodule add --force --name SwiftGRPC git@github.com:grpc/grpc-swift.git $(SWIFT_GRPC)

