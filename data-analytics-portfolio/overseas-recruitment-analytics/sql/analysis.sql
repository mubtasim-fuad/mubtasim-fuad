-- SQLite: Candidates(CandidateID, Country, Status, ApplicationDate, ProcessingDays, Recruiter, RecruitmentFee)
SELECT Country, COUNT(*) AS TotalCandidates
FROM Candidates GROUP BY Country ORDER BY TotalCandidates DESC;

SELECT Country,
  SUM(CASE WHEN Status = 'Deployed' THEN 1 ELSE 0 END) AS Deployed,
  ROUND(100.0 * SUM(CASE WHEN Status = 'Deployed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DeploymentRatePct
FROM Candidates GROUP BY Country ORDER BY DeploymentRatePct DESC;

SELECT Country, ROUND(AVG(ProcessingDays), 2) AS AvgProcessingDays
FROM Candidates GROUP BY Country ORDER BY AvgProcessingDays DESC;

SELECT Status, COUNT(*) AS Applications
FROM Candidates GROUP BY Status ORDER BY Applications DESC;
