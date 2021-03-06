MATCH
  (message:Message)-[:HAS_CREATOR]->(creator:Person),
  (message)<-[like:LIKES]-(:Person)
WHERE message.creationDate > $date
WITH message, creator, count(like) AS likeCount
WHERE likeCount > $likeThreshold
RETURN
  message.id,
  message.creationDate,
  creator.firstName,
  creator.lastName,
  likeCount
ORDER BY
  likeCount DESC,
  message.id ASC
LIMIT 100
