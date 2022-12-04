#!/bin/bash
pg_ctl start -D tpch -l logfile
psql postgres