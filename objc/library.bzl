load("//objc:compile.bzl", "objc_grpc_compile", "objc_proto_compile")

def objc_proto_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    objc_proto_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )
    native.objc_library(
        name = name,
        srcs = [name_pb],
        hdrs = [name_pb],
        deps = [
            "@com_google_protobuf//:objectivec",
        ],
        includes = [name_pb],
        visibility = visibility,
    )

def objc_grpc_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    visibility = kwargs.get("visibility")

    name_pb = name + "_pb"
    objc_grpc_compile(
        name = name_pb,
        deps = deps,
        visibility = visibility,
    )
    native.objc_library(
        name = name,
        srcs = [name_pb],
        hdrs = [name_pb],
        deps = [
            "@com_google_protobuf//:objectivec",
            "@com_github_grpc_grpc//:grpc_objc",
        ],
        includes = [name_pb],
        visibility = visibility,
    )
