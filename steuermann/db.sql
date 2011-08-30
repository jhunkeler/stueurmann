-- The table 'status' contains a record for each command in a run.
-- Before we start running anything, we insert a record for every
-- command in the test run.  The initial status is 'S'.

CREATE TABLE status ( 
	run	VARCHAR(100),
		-- name of this run

	host	VARCHAR,
	tablename VARCHAR,
	cmd	VARCHAR,
		-- name of the command (node)

	depth	INTEGER,
		-- depth in the tree of this node (used to create report tables)

	status	VARCHAR(5),
		-- N = not started
		-- S = started, not finished
		-- P = prereq not satisfied, so not attempted
		-- 0-255 = exit code

	start_time	VARCHAR(30),
	end_time	VARCHAR(30),
		-- times initially blank
		-- YYYY-MM-DD HH:MM:SS.SSS
		-- (space for resolution to nanosecond is a bit extreme)

	-- a log file name is implicit in the run/host/tablename/cmd tuple

	notes	VARCHAR(1000),
		-- notes reported by the script

	FOREIGN KEY(run) REFERENCES runs(run)
		-- run name has to be in the run table
	);


create unique index idx_status_1 on status ( run, host, tablename, cmd );


-- table lists all run names in the system
CREATE TABLE runs (
	run	VARCHAR(100)
	);

CREATE UNIQUE INDEX idx_runs_run ON runs(run);

