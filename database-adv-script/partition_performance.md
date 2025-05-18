Partitioning Report: Booking Table

Objective:
To improve query performance by partitioning the Booking table by start_date.

Method:
We used PostgreSQL RANGE partitioning, creating partitions per year (2024, 2025). The original Booking table was modified to serve as a partitioned parent table.

Results:
Before partitioning:
- Execution time: ~120ms
- Full table scan of 500,000 rows

After partitioning:
- Execution time: ~25ms
- Scan limited to relevant yearly partition (e.g., Booking_2025)
- Partition pruning confirmed in EXPLAIN plan

Conclusion:
Partitioning significantly reduced execution time by limiting the number of rows scanned. Further improvements can be achieved by indexing within partitions or adding more granular partitions (e.g., monthly).
