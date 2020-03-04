// Generated by Cap'n Proto compiler, DO NOT EDIT
// source: sandpiper.capnp

#pragma once

#include <capnp/generated-header-support.h>
#include <kj/windows-sanity.h>

#if CAPNP_VERSION != 7000
#error "Version mismatch between generated code and library headers.  You must use the same version of the Cap'n Proto compiler and library."
#endif


namespace capnp {
namespace schemas {

CAPNP_DECLARE_SCHEMA(e8184430d9e7c364);
enum class Ops_e8184430d9e7c364: uint16_t {
  AUTH,
  JOIN,
  QUIT,
  STAT,
  TWIT,
  POST,
  FDBK,
  OFMG,
  NOOP,
};
CAPNP_DECLARE_ENUM(Ops, e8184430d9e7c364);

}  // namespace schemas
}  // namespace capnp

namespace tmi {
namespace sandpiper {

typedef ::capnp::schemas::Ops_e8184430d9e7c364 Ops;

// =======================================================================================

// =======================================================================================

}  // namespace
}  // namespace
