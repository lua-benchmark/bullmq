CWE-943
Example 1
Source:
[addJobScheduler-11.lua:50](src/commands/addJobScheduler-11.lua#L50)

step 1:
[addJobScheduler-11.lua:197](src/commands/addJobScheduler-11.lua#L197)

step 2:
[addJobFromScheduler.lua:15](src/commands/includes/addJobFromScheduler.lua#L15)

step 3:
[storeAndEnqueueJob.lua:36](src/commands/includes/storeAndEnqueueJob.lua#L36)

Sink:
[addJobInTargetList.lua:11](src/commands/includes/addJobInTargetList.lua#L11)

CWE-943
Example 2
Source:
[addParentJob-6.lua:57](src/commands/addParentJob-6.lua#L57)

step 1:
[addParentJob-6.lua:125](src/commands/addParentJob-6.lua#L125)

Sink:
[addParentJob-6.lua:69](src/commands/addParentJob-6.lua#L69)

CWE-943
Example 3
Source:
[addStandardJob-9.lua:143](src/commands/addStandardJob-9.lua#L143)

step 1:
[addStandardJob-9.lua:130](src/commands/addStandardJob-9.lua#L130)

step 2:
[addStandardJob-9.lua:149](src/commands/addStandardJob-9.lua#L149)

Sink:
[addStandardJob-9.lua:137](src/commands/addStandardJob-9.lua#L137)

CWE-1333
Example 1
Source:
[getState-8.lua:29](src/commands/getState-8.lua#L29)

step 1:
[getState-8.lua:57](src/commands/getState-8.lua#L57)

step 2:
[getState-8.lua:59](src/commands/getState-8.lua#L59)

Sink:
[checkItemInList.lua:10](src/commands/includes/checkItemInList.lua#L10)

Note: engineered host: Engineered a 'match job id as wildcard query' branch into the reachable getState path (getState-8.lua -> includes/checkItemInList.lua). Reachability verified: Queue.getJobState(jobId) -> backend.getState(jobId) -> keys.concat([jobId]) puts jobId first-order in ARGV[1]; jobId is client-controllable via opts.jobId. Tainted value is the PATTERN arg of string.match (subject is a store read but NOT the tainted position). '^'..jobId..'$' anchoring is an ineffective decoy; no plain option, no magic-char escaping.
