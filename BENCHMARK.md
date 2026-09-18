# bullmq - Lua SAST benchmark snapshot

Frozen snapshot of an upstream project, republished for Lua static-analysis benchmarking.
**This is not a fork for contribution.** File issues and pull requests upstream.

## Provenance

| | |
|---|---|
| Upstream | <https://github.com/taskforcesh/bullmq> |
| Branch | `master` |
| Commit | `75bb3a059ff214b419553822d41d3e8eaff7e888` |
| Snapshot taken | 2026-09-18 |
| Upstream stars at snapshot | 9395 |
| Deliberately vulnerable (GOAT) | No |

The tree is byte-identical to upstream at that commit, with two exceptions: the `.git` directory
was removed and replaced by a single `initial version` commit, and this `BENCHMARK.md` was added.
No upstream file was modified, so every line number still matches upstream.

## Corpus metadata

**Project type:** Redis-backed job queue - standalone EVAL scripts (host code is TypeScript)

**Lua version:** 5.1 (Redis/Valkey EVAL sandbox)

**Frameworks and libraries:** Redis EVAL scripting sandbox (redis.call, redis.error_reply), cjson, cmsgpack; scripts assembled by BullMQ's own --@include loader and run via ioredis/node-redis

**Size class:** Small (~2848 LOC)

## Scan scope

The whole repository is published for provenance, but the benchmark scope is narrower:

    src/commands/

## Taint sources of interest

Redis / Valkey EVAL script arguments (KEYS[n], ARGV[n], cmsgpack.unpack(ARGV[n]) in addStandardJob/addParentJob/moveToFinished), Shared storage / second-order (cjson.decode of job data read back via redis.call HMGET/HGET in moveToFinished-14.lua), Stored job and opts JSON (cjson.decode of parent and opts fields). Note: os and io do not exist in this sandbox
