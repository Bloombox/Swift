
#
## Bloombox: Swift API Client
#

SCHEMA ?= Schema/
SCHEMA_BRANCH ?= master
SWIFT_PROTOBUF ?= SwiftProtobuf
SWIFT_GRPC ?= SwiftGRPC

SWIFT_PROTOC_OPTIONS ?= --swift_opt=FileNaming=PathToUnderscores --swift_opt=Visibility=Public --swiftgrpc_opt=Visibility=Public

all: build test
	@echo "Swift API client ready."

clean:
	@echo "Cleaning Swift client for Bloombox..."
	@rm -frv .build $(SCHEMA)/languages

build: dependencies
	@echo "Building Swift client for Bloombox..."
	@swift build

dependencies: swift-protobuf swift-grpc

test:
	@echo "Running tests..."
	@swift test

submodules: $(SCHEMA) $(SWIFT_PROTOBUF) $(SWIFT_GRPC)
	@git submodule update --init --remote

schema: $(SCHEMA) $(SCHEMA)/languages/swift

$(SCHEMA):
	@echo "Initializing Schema..."
	@git submodule add --force --name schema git@github.com:bloombox/Schema.git $(SCHEMA)

sync-schema: swift-protobuf swift-grpc $(SCHEMA)/languages/swift
	@echo "Syncing Swift schemas..."
	@rm -fr Sources/Schema/*.pb.swift
	@cp -fr $(SCHEMA)languages/swift/* Sources/Schema/
	@cp -fr $(SCHEMA)languages/swiftgrpc/* Sources/Schema/
	@rm -f Sources/Schema/*v1beta2*
	@rm -f Sources/Schema/*.server.pb.swift
	@rm -f Sources/Schema/*pos*v1beta1*pb.swift
	@rm -f Sources/Schema/bq*

$(SCHEMA)/languages/swift:
	@echo "Building Schema..."
	@$(MAKE) -C $(SCHEMA) LANGUAGES="swift swiftgrpc" PROTO_FLAGS="$(SWIFT_PROTOC_OPTIONS) --plugin=$(PWD)/SwiftGRPC/Plugin/.build/x86_64-apple-macosx10.10/debug/protoc-gen-swiftgrpc --swiftgrpc_out=languages/swiftgrpc" SERVICES=yes TABLES=no

swift-protobuf: $(SWIFT_PROTOBUF)/.build
$(SWIFT_PROTOBUF)/.build:
	@echo "Building SwiftProtobuf..."
	@$(MAKE) -C $(SWIFT_PROTOBUF)

swift-grpc: $(SWIFT_GRPC)/.build $(SWIFT_GRPC)/Plugin/.build
	@echo "Cleaning SwiftGRPC."
	@rm -f $(SWIFT_GRPC)/Package.resolved $(SWIFT_GRPC)/Plugin/Package.resolved

$(SWIFT_GRPC)/.build:
	@echo "Building SwiftGRPC..."
	@$(MAKE) -C $(SWIFT_GRPC)

$(SWIFT_GRPC)/Plugin/.build:
	@echo "Building SwiftGRPC plugin..."
	@$(MAKE) -C $(SWIFT_GRPC)/Plugin

$(SWIFT_PROTOBUF):
	@echo "Initializing SwiftProtobuf..."
	@git submodule add --force --name SwiftProtobuf git@github.com:apple/swift-protobuf.git $(SWIFT_PROTOBUF)

$(SWIFT_GRPC):
	@echo "Initializing SwiftGRPC..."
	@git submodule add --force --name SwiftGRPC git@github.com:grpc/grpc-swift.git $(SWIFT_GRPC)

