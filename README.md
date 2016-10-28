Quick investigation of https://bugzilla.mozilla.org/show_bug.cgi?id=1285264.

Raw data can be downloaded from STMO [here](https://sql.telemetry.mozilla.org/queries/1549/source#table).
It is excluded from this repository because some channel names have very few observations.
Current form of the SQL query follows:

```sql
SELECT t.settings.update.channel as channel, t.submission, count(1) as count
FROM longitudinal
CROSS JOIN UNNEST(submission_date, settings) as t(submission, settings)
WHERE t.submission >= '2016-05-01' 
  AND t.submission <= '2016-10-30'
  AND normalized_channel = 'Other'
GROUP BY 1, 2
ORDER BY 2, 3
```
